# QuickJS API Coverage Checklist

This document tracks which QuickJS C API functions have Swift bindings in the QuickJavaScript library.

Legend:
- ✅ Implemented
- ⚠️ Partially implemented
- ❌ Not implemented
- 🚫 Internal/Not needed for Swift bindings

## Runtime Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_NewRuntime` | ✅ | `QJSRuntime.init()` | |
| `JS_NewRuntime2` | ❌ | - | Custom malloc functions |
| `JS_FreeRuntime` | ✅ | `QJSRuntime.deinit` | Automatic via deinit |
| `JS_SetRuntimeInfo` | ✅ | `QJSRuntime.setRuntimeInfo(_:)` | |
| `JS_SetMemoryLimit` | ✅ | `QJSRuntime.setMemoryLimit(_:)` | |
| `JS_SetDumpFlags` | ✅ | `QJSRuntime.dumpFlags` | Property |
| `JS_GetDumpFlags` | ✅ | `QJSRuntime.dumpFlags` | Property |
| `JS_GetGCThreshold` | ✅ | `QJSRuntime.gcThreshold` | Property |
| `JS_SetGCThreshold` | ✅ | `QJSRuntime.gcThreshold` | Property |
| `JS_SetMaxStackSize` | ✅ | `QJSRuntime.setMaxStackSize(_:)` | |
| `JS_UpdateStackTop` | ✅ | `QJSRuntime.updateStackTop()` | |
| `JS_GetRuntimeOpaque` | 🚫 | - | Used internally for bridge |
| `JS_SetRuntimeOpaque` | 🚫 | - | Used internally for bridge |
| `JS_AddRuntimeFinalizer` | ❌ | - | |
| `JS_MarkValue` | ❌ | - | GC internals |
| `JS_RunGC` | ✅ | `QJSRuntime.runGC()` | |
| `JS_IsLiveObject` | ❌ | - | |
| `JS_ComputeMemoryUsage` | ❌ | - | |
| `JS_DumpMemoryUsage` | ❌ | - | |

## Context Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_NewContext` | ✅ | `QJSRuntime.newContext()` | |
| `JS_NewContextRaw` | 🚫 | - | Used internally |
| `JS_FreeContext` | ✅ | `QJSContext.deinit` | Automatic via deinit |
| `JS_DupContext` | ❌ | - | |
| `JS_GetContextOpaque` | 🚫 | - | Used internally for bridge |
| `JS_SetContextOpaque` | 🚫 | - | Used internally for bridge |
| `JS_GetRuntime` | 🚫 | - | Available via `context.runtime` |
| `JS_SetClassProto` | ❌ | - | |
| `JS_GetClassProto` | ❌ | - | |
| `JS_GetFunctionProto` | ❌ | - | |

## Intrinsic Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_AddIntrinsicBaseObjects` | ❌ | - | |
| `JS_AddIntrinsicDate` | ❌ | - | |
| `JS_AddIntrinsicEval` | ❌ | - | |
| `JS_AddIntrinsicRegExpCompiler` | ❌ | - | |
| `JS_AddIntrinsicRegExp` | ❌ | - | |
| `JS_AddIntrinsicJSON` | ❌ | - | |
| `JS_AddIntrinsicProxy` | ❌ | - | |
| `JS_AddIntrinsicMapSet` | ❌ | - | |
| `JS_AddIntrinsicTypedArrays` | ❌ | - | |
| `JS_AddIntrinsicPromise` | ❌ | - | |
| `JS_AddIntrinsicBigInt` | ❌ | - | |
| `JS_AddIntrinsicWeakRef` | ❌ | - | |
| `JS_AddPerformance` | ❌ | - | |
| `JS_AddIntrinsicDOMException` | ❌ | - | |

## Value Creation Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_NewBool` | ✅ | `QJSContext.value(bool:)` | Inline function |
| `JS_NewInt32` | ✅ | `QJSContext.value(int32:)` | Inline function |
| `JS_NewInt64` | ✅ | - | Inline function, converts to int32 or float64 |
| `JS_NewUint32` | ✅ | - | Inline function, converts to int32 or float64 |
| `JS_NewFloat64` | ✅ | `QJSContext.value(float64:)` | Inline function |
| `JS_NewNumber` | ✅ | - | |
| `JS_NewBigInt64` | ✅ | - | |
| `JS_NewBigUint64` | ✅ | - | |
| `JS_NewStringLen` | ✅ | `QJSContext.value(string:)` | |
| `JS_NewString` | ✅ | `QJSContext.value(string:)` | Inline function |
| `JS_NewTwoByteString` | ❌ | - | UTF-16 support |
| `JS_NewAtomString` | ❌ | - | |
| `JS_NewObject` | ❌ | - | |
| `JS_NewObjectProto` | ❌ | - | |
| `JS_NewObjectClass` | ❌ | - | |
| `JS_NewObjectProtoClass` | ❌ | - | |
| `JS_NewObjectFrom` | ❌ | - | |
| `JS_NewObjectFromStr` | ❌ | - | |
| `JS_NewArray` | ❌ | - | |
| `JS_NewArrayFrom` | ❌ | - | |
| `JS_NewDate` | ❌ | - | |
| `JS_NewError` | ❌ | - | |
| `JS_NewInternalError` | ❌ | - | Printf-style |
| `JS_NewPlainError` | ❌ | - | Printf-style |
| `JS_NewRangeError` | ❌ | - | Printf-style |
| `JS_NewReferenceError` | ❌ | - | Printf-style |
| `JS_NewSyntaxError` | ❌ | - | Printf-style |
| `JS_NewTypeError` | ❌ | - | Printf-style |
| `JS_NewPromiseCapability` | ❌ | - | |
| `JS_NewSymbol` | ❌ | - | |

## Value Type Checking (Static Inline)

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_IsNumber` | ✅ | `QJSValue.tag == .int \|\| .float64` | Inline function |
| `JS_IsBigInt` | ✅ | `QJSValue.tag == .bigint \|\| .shortBigint` | Inline function |
| `JS_IsBool` | ✅ | `QJSValue.tag == .bool` | Inline function |
| `JS_IsNull` | ✅ | `QJSValue.isNull` | Property |
| `JS_IsUndefined` | ✅ | `QJSValue.isUndefined` | Property |
| `JS_IsException` | ✅ | `QJSValue.tag == .exception` | Inline function |
| `JS_IsUninitialized` | ✅ | `QJSValue.tag == .uninitialized` | Inline function |
| `JS_IsString` | ✅ | `QJSValue.tag == .string` | Inline function |
| `JS_IsSymbol` | ✅ | `QJSValue.tag == .symbol` | Inline function |
| `JS_IsObject` | ✅ | `QJSValue.isObject` | Property |
| `JS_IsModule` | ✅ | `QJSValue.tag == .module` | Inline function |

## Value Type Checking (Extern)

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_IsFunction` | ✅ | `QJSValue.isFunction()` | |
| `JS_IsConstructor` | ✅ | `QJSValue.isConstructor` | Property |
| `JS_IsRegExp` | ✅ | `QJSValue.isRegExp` | Property |
| `JS_IsMap` | ✅ | `QJSValue.isMap` | Property |
| `JS_IsSet` | ✅ | `QJSValue.isSet` | Property |
| `JS_IsWeakRef` | ✅ | `QJSValue.isWeakRef` | Property |
| `JS_IsWeakSet` | ✅ | `QJSValue.isWeakSet` | Property |
| `JS_IsWeakMap` | ✅ | `QJSValue.isWeakMap` | Property |
| `JS_IsDataView` | ✅ | `QJSValue.isDataView` | Property |
| `JS_IsArray` | ✅ | `QJSValue.isArray` | Property |
| `JS_IsProxy` | ✅ | `QJSValue.isProxy` | Property |
| `JS_IsDate` | ✅ | `QJSValue.isDate` | Property |
| `JS_IsError` | ❌ | - | |
| `JS_IsPromise` | ❌ | - | |
| `JS_IsArrayBuffer` | ❌ | - | |

## Value Management

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_FreeValue` | ✅ | `QJSValue.deinit` | Automatic via deinit |
| `JS_FreeValueRT` | ❌ | - | |
| `JS_DupValue` | 🚫 | - | Used internally |
| `JS_DupValueRT` | ❌ | - | |

## Exception Handling

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_Throw` | ❌ | - | |
| `JS_GetException` | ❌ | - | |
| `JS_HasException` | ❌ | - | |
| `JS_IsUncatchableError` | ❌ | - | |
| `JS_SetUncatchableError` | ❌ | - | |
| `JS_ClearUncatchableError` | ❌ | - | |
| `JS_ResetUncatchableError` | ❌ | - | |
| `JS_ThrowInternalError` | ❌ | - | Printf-style |
| `JS_ThrowPlainError` | ❌ | - | Printf-style |
| `JS_ThrowRangeError` | ❌ | - | Printf-style |
| `JS_ThrowReferenceError` | ❌ | - | Printf-style |
| `JS_ThrowSyntaxError` | ❌ | - | Printf-style |
| `JS_ThrowTypeError` | ❌ | - | Printf-style |
| `JS_ThrowDOMException` | ❌ | - | Printf-style |
| `JS_ThrowOutOfMemory` | ❌ | - | |

## Value Conversion

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_ToBool` | ❌ | - | |
| `JS_ToBoolean` | ❌ | - | Inline function |
| `JS_ToNumber` | ❌ | - | |
| `JS_ToInt32` | ❌ | - | |
| `JS_ToUint32` | ❌ | - | Inline function |
| `JS_ToInt64` | ❌ | - | |
| `JS_ToIndex` | ❌ | - | |
| `JS_ToFloat64` | ❌ | - | |
| `JS_ToBigInt64` | ❌ | - | |
| `JS_ToBigUint64` | ❌ | - | |
| `JS_ToInt64Ext` | ❌ | - | |
| `JS_ToString` | ❌ | - | |
| `JS_ToPropertyKey` | ❌ | - | |
| `JS_ToCStringLen` | ✅ | `QJSValue.description` | Inline function |
| `JS_ToCStringLen2` | ✅ | `QJSValue.description` | |
| `JS_ToCString` | ✅ | `QJSValue.description` | Inline function |
| `JS_FreeCString` | ✅ | `QJSValue.description` | Used internally |
| `JS_ToObject` | ❌ | - | |
| `JS_ToObjectString` | ❌ | - | |

## Comparison Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_IsEqual` | ❌ | - | |
| `JS_IsStrictEqual` | ❌ | - | |
| `JS_IsSameValue` | ❌ | - | |
| `JS_IsSameValueZero` | ❌ | - | |

## Property Access

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_GetProperty` | ✅ | `QJSValue.getProperty(atom:)` | |
| `JS_GetPropertyUint32` | ✅ | `QJSValue.getProperty(uint32:)` | |
| `JS_GetPropertyInt64` | ✅ | `QJSValue.getProperty(int64:)` | |
| `JS_GetPropertyStr` | ✅ | `QJSValue.getProperty(str:)` | |
| `JS_SetProperty` | ✅ | `QJSValue.setProperty(atom:value:)` | |
| `JS_SetPropertyUint32` | ✅ | `QJSValue.setProperty(uint32:value:)` | |
| `JS_SetPropertyInt64` | ✅ | `QJSValue.setProperty(int64:value:)` | |
| `JS_SetPropertyStr` | ✅ | `QJSValue.setProperty(str:value:)` | |
| `JS_HasProperty` | ✅ | `QJSValue.hasProperty(_:)` | |
| `JS_DeleteProperty` | ✅ | `QJSValue.deleteProperty(_:flags:)` | |
| `JS_GetPrototype` | ✅ | `QJSValue.prototype` | Property |
| `JS_SetPrototype` | ✅ | `QJSValue.prototype` | Property |
| `JS_GetLength` | ✅ | `QJSValue.length` | Property |
| `JS_SetLength` | ✅ | `QJSValue.length` | Property |
| `JS_GetOwnPropertyNames` | ❌ | - | |
| `JS_GetOwnProperty` | ❌ | - | |
| `JS_FreePropertyEnum` | ❌ | - | |

## Object Manipulation

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_IsExtensible` | ✅ | `QJSValue.extensible` | Property |
| `JS_PreventExtensions` | ✅ | `QJSValue.preventExtensions()` | |
| `JS_SealObject` | ✅ | `QJSValue.sealObject()` | |
| `JS_FreezeObject` | ✅ | `QJSValue.freezeObject()` | |
| `JS_DefineProperty` | ❌ | - | |
| `JS_DefinePropertyValue` | ❌ | - | |
| `JS_DefinePropertyValueUint32` | ❌ | - | |
| `JS_DefinePropertyValueStr` | ❌ | - | |
| `JS_DefinePropertyGetSet` | ❌ | - | |
| `JS_SetOpaque` | ❌ | - | |
| `JS_GetOpaque` | ❌ | - | |
| `JS_GetOpaque2` | ❌ | - | |
| `JS_GetAnyOpaque` | ❌ | - | |
| `JS_SetConstructorBit` | ✅ | `QJSValue.isConstructor` | Property |

## Proxy Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_GetProxyTarget` | ✅ | `QJSValue.proxyTarget` | Property |
| `JS_GetProxyHandler` | ✅ | `QJSValue.proxyHandler` | Property |

## Function Calls

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_Call` | ❌ | - | |
| `JS_Invoke` | ❌ | - | |
| `JS_CallConstructor` | ❌ | - | |
| `JS_CallConstructor2` | ❌ | - | |

## Evaluation

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_DetectModule` | ❌ | - | |
| `JS_Eval` | ✅ | `QJSContext.eval(code:filename:flags:)` | |
| `JS_Eval2` | ❌ | - | |
| `JS_EvalThis` | ❌ | - | |
| `JS_EvalThis2` | ❌ | - | |
| `JS_EvalFunction` | ❌ | - | |
| `JS_GetGlobalObject` | ✅ | `QJSContext.globalThis` | Property |
| `JS_IsInstanceOf` | ❌ | - | |

## Atom Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_NewAtomLen` | ✅ | `QJSContext.newAtom(string:)` | |
| `JS_NewAtom` | ✅ | `QJSContext.newAtom(string:)` | Inline function |
| `JS_NewAtomUInt32` | ❌ | - | |
| `JS_DupAtom` | ❌ | - | |
| `JS_FreeAtom` | ❌ | - | |
| `JS_FreeAtomRT` | ❌ | - | |
| `JS_AtomToValue` | ❌ | - | |
| `JS_AtomToString` | ❌ | - | |
| `JS_AtomToCStringLen` | ❌ | - | |
| `JS_AtomToCString` | ❌ | - | Inline function |
| `JS_ValueToAtom` | ❌ | - | |

## JSON Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_ParseJSON` | ❌ | - | |
| `JS_JSONStringify` | ❌ | - | |

## ArrayBuffer/TypedArray Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_NewArrayBuffer` | ❌ | - | |
| `JS_NewArrayBufferCopy` | ❌ | - | |
| `JS_DetachArrayBuffer` | ❌ | - | |
| `JS_GetArrayBuffer` | ❌ | - | |
| `JS_GetUint8Array` | ❌ | - | |
| `JS_NewTypedArray` | ❌ | - | |
| `JS_GetTypedArrayBuffer` | ❌ | - | |
| `JS_NewUint8Array` | ❌ | - | |
| `JS_GetTypedArrayType` | ❌ | - | |
| `JS_NewUint8ArrayCopy` | ❌ | - | |
| `JS_SetSharedArrayBufferFunctions` | ❌ | - | |

## Promise Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_PromiseState` | ❌ | - | |
| `JS_PromiseResult` | ❌ | - | |
| `JS_SetPromiseHook` | ❌ | - | |
| `JS_SetHostPromiseRejectionTracker` | ❌ | - | |

## Module Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_SetModuleLoaderFunc` | ❌ | - | |
| `JS_GetImportMeta` | ❌ | - | |
| `JS_GetModuleName` | ❌ | - | |
| `JS_GetModuleNamespace` | ❌ | - | |
| `JS_ResolveModule` | ❌ | - | |
| `JS_GetScriptOrModuleName` | ❌ | - | |
| `JS_LoadModule` | ❌ | - | |

## C Module Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_NewCModule` | ❌ | - | |
| `JS_AddModuleExport` | ❌ | - | |
| `JS_AddModuleExportList` | ❌ | - | |
| `JS_SetModuleExport` | ❌ | - | |
| `JS_SetModuleExportList` | ❌ | - | |

## C Function Creation

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_NewCFunction` | ❌ | - | Inline function |
| `JS_NewCFunction2` | ❌ | - | |
| `JS_NewCFunction3` | ❌ | - | |
| `JS_NewCFunctionMagic` | ❌ | - | Inline function |
| `JS_NewCFunctionData` | ❌ | - | |
| `JS_NewCFunctionData2` | ❌ | - | |
| `JS_SetConstructor` | ❌ | - | |
| `JS_SetPropertyFunctionList` | ❌ | - | |

## Class Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_NewClassID` | ❌ | - | |
| `JS_GetClassID` | ❌ | - | |
| `JS_NewClass` | ❌ | - | |
| `JS_IsRegisteredClass` | ❌ | - | |

## Job Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_EnqueueJob` | ❌ | - | |
| `JS_IsJobPending` | ❌ | - | |
| `JS_ExecutePendingJob` | ❌ | - | |

## Serialization Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_WriteObject` | ❌ | - | |
| `JS_WriteObject2` | ❌ | - | |
| `JS_ReadObject` | ❌ | - | |
| `JS_ReadObject2` | ❌ | - | |

## Memory Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `js_calloc_rt` | ❌ | - | |
| `js_malloc_rt` | ❌ | - | |
| `js_free_rt` | ❌ | - | |
| `js_realloc_rt` | ❌ | - | |
| `js_malloc_usable_size_rt` | ❌ | - | |
| `js_mallocz_rt` | ❌ | - | |
| `js_calloc` | ❌ | - | |
| `js_malloc` | ❌ | - | |
| `js_free` | ❌ | - | |
| `js_realloc` | ❌ | - | |
| `js_malloc_usable_size` | ❌ | - | |
| `js_realloc2` | ❌ | - | |
| `js_mallocz` | ❌ | - | |
| `js_strdup` | ❌ | - | |
| `js_strndup` | ❌ | - | |

## Miscellaneous Functions

| C Function | Status | Swift Binding | Notes |
|------------|--------|---------------|-------|
| `JS_SetInterruptHandler` | ❌ | - | |
| `JS_SetCanBlock` | ❌ | - | |
| `JS_SetIsHTMLDDA` | ❌ | - | |
| `JS_GetVersion` | ❌ | - | |
| `js_std_cmd` | 🚫 | - | Internal use only |
| `js_string_codePointRange` | 🚫 | - | Test262 only |

## Summary Statistics

### By Category:
- **Runtime**: 9/19 implemented (47%)
- **Context**: 2/10 implemented (20%)
- **Intrinsics**: 0/14 implemented (0%)
- **Value Creation**: 6/31 implemented (19%)
- **Type Checking (Inline)**: 11/11 implemented (100%)
- **Type Checking (Extern)**: 12/15 implemented (80%)
- **Value Management**: 1/4 implemented (25%)
- **Exception Handling**: 0/16 implemented (0%)
- **Value Conversion**: 4/19 implemented (21%)
- **Comparison**: 0/4 implemented (0%)
- **Property Access**: 12/16 implemented (75%)
- **Object Manipulation**: 7/14 implemented (50%)
- **Proxy**: 2/2 implemented (100%)
- **Function Calls**: 0/4 implemented (0%)
- **Evaluation**: 2/7 implemented (29%)
- **Atoms**: 2/11 implemented (18%)
- **JSON**: 0/2 implemented (0%)
- **ArrayBuffer/TypedArray**: 0/12 implemented (0%)
- **Promise**: 0/4 implemented (0%)
- **Modules**: 0/7 implemented (0%)
- **C Modules**: 0/5 implemented (0%)
- **C Functions**: 0/8 implemented (0%)
- **Classes**: 0/4 implemented (0%)
- **Jobs**: 0/3 implemented (0%)
- **Serialization**: 0/4 implemented (0%)
- **Memory**: 0/17 implemented (0%)
- **Miscellaneous**: 0/5 implemented (0%)

### Overall:
- ✅ Implemented: ~70 functions
- ❌ Not implemented: ~180 functions
- 🚫 Internal/Not needed: ~5 functions
- **Total Coverage: ~27%**

## Priority for Implementation

### High Priority (Core Functionality):
1. Exception handling (`JS_Throw`, `JS_GetException`, `JS_HasException`)
2. Function calls (`JS_Call`, `JS_CallConstructor`)
3. Object creation (`JS_NewObject`, `JS_NewArray`)
4. Type conversion (`JS_ToInt32`, `JS_ToFloat64`, `JS_ToString`)
5. JSON support (`JS_ParseJSON`, `JS_JSONStringify`)
6. Comparison functions (`JS_IsEqual`, `JS_IsStrictEqual`)

### Medium Priority (Extended Functionality):
1. Promise support (`JS_PromiseState`, `JS_PromiseResult`, `JS_IsPromise`)
2. ArrayBuffer/TypedArray support
3. Module system (`JS_SetModuleLoaderFunc`, `JS_LoadModule`)
4. Property descriptors (`JS_DefineProperty`, `JS_GetOwnProperty`)
5. BigInt support (`JS_NewBigInt64`, `JS_ToBigInt64`)
6. Job queue (`JS_EnqueueJob`, `JS_ExecutePendingJob`)

### Low Priority (Advanced/Special Use):
1. Custom class support (`JS_NewClass`, `JS_NewClassID`)
2. C function creation (`JS_NewCFunction`, `JS_NewCFunctionData`)
3. Intrinsics (can use standard context)
4. Serialization (`JS_WriteObject`, `JS_ReadObject`)
5. Memory functions (use Swift's memory management)
6. Opaque data management (internal use)
