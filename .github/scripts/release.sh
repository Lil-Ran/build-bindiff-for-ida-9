set -euo pipefail

FILES=(*)
if [[ ${#FILES[@]} -eq 0 || ${FILES[0]} == '*' ]]; then
  echo "No release assets found in artifacts/" >&2
  exit 1
fi

COMMIT_MSG=$(git log -1 --pretty=%B)
COMMIT_MSG_ONELINE=$(printf '%s' "$COMMIT_MSG" | tr '\n' ' ')

NOTES=$(cat <<EOF
From GitHub Actions run: [${RUN_ID}](https://github.com/${REPO}/actions/runs/${RUN_ID})

BinDiff: [\`${REF_BINDIFF}\`](https://github.com/google/bindiff/commit/${REF_BINDIFF})

BinExport: [\`${REF_BINEXPORT}\`](https://github.com/google/binexport/commit/${REF_BINEXPORT})

Refer to README.md for guidance on selecting and installing the version.
EOF
)

# If COMMIT_MSG contains an HTML details block, extract summary as title and the rest as extra notes
if printf '%s' "$COMMIT_MSG" | grep -q '<details>'; then
  TITLE=$(printf '%s' "$COMMIT_MSG" | perl -0777 -ne 'print $1 if /<summary>(.*?)<\/summary>/s')
  BODY=$(printf '%s' "$COMMIT_MSG" | perl -0777 -ne 'print $1 if /<summary>.*?<\/summary>\s*(.*?)<\/details>/s')
  TITLE=$(printf '%s' "$TITLE" | tr '\n' ' ' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
  BODY=$(printf '%s' "$BODY" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
  if [[ -n "$TITLE" ]]; then
    ANNOUNCEMENT_TITLE="$TITLE"
  fi
  if [[ -n "$BODY" ]]; then
    NOTES=$(printf '%s\n\n---\n\n%s' "$BODY" "$NOTES")
  fi
fi

# Parse commit-message flags like "prerelease=0 latest=1 draft=0" and map to release flags
parse_flag() {
  key=$1
  printf '%s' "$COMMIT_MSG_ONELINE" | grep -oP "${key}=\K[01]" | head -n1 || true
}

PRERELEASE_VAL=$(parse_flag prerelease)
LATEST_VAL=$(parse_flag latest)
DRAFT_VAL=$(parse_flag draft)

if [[ "$PRERELEASE_VAL" == "1" ]]; then
  PRERELEASE_FLAG='--prerelease'
else
  PRERELEASE_FLAG=''
fi

if [[ "$LATEST_VAL" == "0" ]]; then
  LATEST_FLAG='--latest=false'
else
  LATEST_FLAG='--latest'
fi

if [[ "$DRAFT_VAL" == "1" ]]; then
  DRAFT_FLAG='--draft'
else
  DRAFT_FLAG=''
fi

gh release create "${TAG_NAME}" "${FILES[@]}" \
  --repo "${REPO}" \
  --title "${ANNOUNCEMENT_TITLE}" \
  --notes "$NOTES" \
  ${DRAFT_FLAG} \
  ${PRERELEASE_FLAG} \
  ${LATEST_FLAG}
