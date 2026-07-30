# The necessity of patches

## `binexport-macro_IDA_SDK_VERSION.patch`

BinExport once used the `IDA_SDK_VERSION` macro. Now `FindIdaSdk.cmake` has been removed, the macro is not defined anymore. As the project deprecated support for IDA versions below 9.4, the version comparison makes no sense.

IDA 9.0 and above only have `ida.exe` but no `ida64.exe`. If the condition falls under the previous branch, it tries to find an `ida64.exe` when the database is a `.i64`, resulting in file not found error.

This code is only called by BinDiff and does not affect BinExport.
