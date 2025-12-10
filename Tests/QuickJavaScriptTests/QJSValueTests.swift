import Testing

@testable import QuickJavaScript

@Suite struct QJSValueTests {
  @Test func tagFromInt32() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(int32: 42)
    #expect(value.tag == .int)
    #expect(context.currentException == nil)
  }

  @Test func tagFromFloat64() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(float64: 3.14)
    #expect(value.tag == .float64)
    #expect(context.currentException == nil)
  }

  @Test func tagFromString() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(string: "test")
    #expect(value.tag == .string)
    #expect(context.currentException == nil)
  }

  @Test func tagFromNull() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.null
    #expect(value.tag == .null)
    #expect(context.currentException == nil)
  }

  @Test func tagFromUndefined() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.undefined
    #expect(value.tag == .undefined)
    #expect(context.currentException == nil)
  }

  @Test func tagFromBool() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.jsTrue
    #expect(value.tag == .bool)
    #expect(context.currentException == nil)
  }

  @Test func int32ReturnsNilForNonInt() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(string: "test")
    #expect(value.int32() == nil)
    #expect(context.currentException == nil)
  }

  @Test func float64ReturnsNilForNonFloat() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(int32: 42)
    #expect(value.float64() == nil)
    #expect(context.currentException == nil)
  }

  @Test func shortBigIntReturnsNilForNonBigInt() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(int32: 42)
    #expect(value.shortBigInt() == nil)
    #expect(context.currentException == nil)
  }

  @Test func stringReturnsNilForNonString() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(int32: 42)
    #expect(value.string() == nil)
    #expect(context.currentException == nil)
  }

  @Test func descriptionForInt() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(int32: 123)
    #expect(value.description == "123")
    #expect(context.currentException == nil)
  }

  @Test func descriptionForFloat() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(float64: 3.5)
    #expect(value.description == "3.5")
    #expect(context.currentException == nil)
  }

  @Test func descriptionForString() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(string: "test string")
    #expect(value.description == "test string")
    #expect(context.currentException == nil)
  }

  @Test func descriptionForNull() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.null
    #expect(value.description == "null")
    #expect(context.currentException == nil)
  }

  @Test func descriptionForUndefined() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.undefined
    #expect(value.description == "undefined")
    #expect(context.currentException == nil)
  }

  @Test func descriptionForBool() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let trueValue = context.jsTrue
    let falseValue = context.jsFalse
    #expect(trueValue.description == "true")
    #expect(falseValue.description == "false")
    #expect(context.currentException == nil)
  }

  @Test func isFunctionDetectsFunction() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let function = context.eval(code: "(function() {})")
    #expect(function.isFunction())
    #expect(context.currentException == nil)
  }

  @Test func isFunctionReturnsFalseForNonFunction() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(int32: 42)
    #expect(!value.isFunction())
    #expect(context.currentException == nil)
  }

  @Test func isConstructorDetectsConstructor() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let constructor = context.eval(code: "(class MyClass {})")
    #expect(constructor.isConstructor)
    #expect(context.currentException == nil)
  }

  @Test func canSetConstructorBit() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let function = context.eval(code: "(function() {})")
    function.isConstructor = true
    #expect(function.isConstructor)
    #expect(context.currentException == nil)
  }

  @Test func isArrayDetectsArray() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let array = context.eval(code: "[1, 2, 3]")
    #expect(array.isArray)
    #expect(context.currentException == nil)
  }

  @Test func isArrayReturnsFalseForNonArray() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let object = context.eval(code: "({a: 1})")
    #expect(!object.isArray)
    #expect(context.currentException == nil)
  }

  @Test func isRegExpDetectsRegExp() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let regex = context.eval(code: "/test/")
    #expect(regex.isRegExp)
    #expect(context.currentException == nil)
  }

  @Test func isMapDetectsMap() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let map = context.eval(code: "new Map()")
    #expect(map.isMap)
    #expect(context.currentException == nil)
  }

  @Test func isSetDetectsSet() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let set = context.eval(code: "new Set()")
    #expect(set.isSet)
    #expect(context.currentException == nil)
  }

  @Test func isWeakMapDetectsWeakMap() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let weakMap = context.eval(code: "new WeakMap()")
    #expect(weakMap.isWeakMap)
    #expect(context.currentException == nil)
  }

  @Test func isWeakSetDetectsWeakSet() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let weakSet = context.eval(code: "new WeakSet()")
    #expect(weakSet.isWeakSet)
    #expect(context.currentException == nil)
  }

  @Test func isWeakRefDetectsWeakRef() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let weakRef = context.eval(code: "new WeakRef({})")
    #expect(weakRef.isWeakRef)
    #expect(context.currentException == nil)
  }

  @Test func isDataViewDetectsDataView() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let dataView = context.eval(code: "new DataView(new ArrayBuffer(8))")
    #expect(dataView.isDataView)
    #expect(context.currentException == nil)
  }

  @Test func isDateDetectsDate() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let date = context.eval(code: "new Date()")
    #expect(date.isDate)
    #expect(context.currentException == nil)
  }

  @Test func isProxyDetectsProxy() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let proxy = context.eval(code: "new Proxy({}, {})")
    #expect(proxy.isProxy)
    #expect(context.currentException == nil)
  }

  @Test func canGetProxyTarget() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let proxy = context.eval(code: "new Proxy({x: 42}, {})")
    let target = proxy.proxyTarget
    #expect(target.getProperty(str: "x").int32() == 42)
    #expect(context.currentException == nil)
  }

  @Test func canGetProxyHandler() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let proxy = context.eval(code: "new Proxy({}, {get: function() { return 'handler'; }})")
    let handler = proxy.proxyHandler
    #expect(handler.tag == .object)
    #expect(context.currentException == nil)
  }

  @Test func canGetPropertyWithString() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({name: 'test', value: 42})")
    #expect(obj.getProperty(str: "name").string() == "test")
    #expect(obj.getProperty(str: "value").int32() == 42)
    #expect(context.currentException == nil)
  }

  @Test func canSetPropertyWithString() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({})")
    obj.setProperty(str: "name", value: context.value(string: "test"))
    #expect(obj.getProperty(str: "name").string() == "test")
    #expect(context.currentException == nil)
  }

  @Test func canGetPropertyWithUInt32() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let array = context.eval(code: "[10, 20, 30]")
    #expect(array.getProperty(uint32: 0).int32() == 10)
    #expect(array.getProperty(uint32: 1).int32() == 20)
    #expect(array.getProperty(uint32: 2).int32() == 30)
    #expect(context.currentException == nil)
  }

  @Test func canSetPropertyWithUInt32() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let array = context.eval(code: "[]")
    array.setProperty(uint32: 0, value: context.value(int32: 100))
    #expect(array.getProperty(uint32: 0).int32() == 100)
    #expect(context.currentException == nil)
  }

  @Test func canGetPropertyWithInt64() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({})")
    obj.setProperty(int64: 12345, value: context.value(string: "test"))
    #expect(obj.getProperty(int64: 12345).string() == "test")
    #expect(context.currentException == nil)
  }

  @Test func canSetPropertyWithInt64() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({})")
    obj.setProperty(int64: 99999, value: context.value(int32: 777))
    #expect(obj.getProperty(int64: 99999).int32() == 777)
    #expect(context.currentException == nil)
  }

  @Test func canCheckIfPropertyExists() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({name: 'test'})")
    // We can verify property existence by getting it and checking the result
    let existingProp = obj.getProperty(str: "name")
    #expect(existingProp.string() == "test")

    let missingProp = obj.getProperty(str: "nonexistent")
    #expect(missingProp.tag == .undefined)
    #expect(context.currentException == nil)
  }

  @Test func extensibleDetectsExtensibleObject() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({})")
    #expect(obj.extensible)
    #expect(context.currentException == nil)
  }

  @Test func canPreventExtensions() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({})")
    obj.preventExtensions()
    #expect(!obj.extensible)
    #expect(context.currentException == nil)
  }

  @Test func canDeleteProperty() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    // Use JavaScript to test property deletion
    _ = context.eval(code: "globalThis.testObj = {name: 'test', age: 30}")
    #expect(context.globalThis.getProperty(str: "testObj").isObject)
    context.globalThis.deleteProperty(str: "testObj")
    #expect(context.globalThis.getProperty(str: "testObj").isUndefined)
    #expect(context.currentException == nil)
  }

  @Test func canGetPrototype() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({})")
    let proto = obj.prototype
    #expect(proto.tag == .object)
    #expect(context.currentException == nil)
  }

  @Test func canSetPrototype() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({})")
    let newProto = context.eval(code: "({custom: true})")
    obj.prototype = newProto
    let customProp = obj.getProperty(str: "custom")
    #expect(customProp.description == "true")
    #expect(context.currentException == nil)
  }

  @Test func canGetLength() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let array = context.eval(code: "[1, 2, 3, 4, 5]")
    #expect(array.length == 5)
    #expect(context.currentException == nil)
  }

  @Test func canSetLength() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let array = context.eval(code: "[1, 2, 3, 4, 5]")
    array.length = 3
    #expect(array.length == 3)
    #expect(context.currentException == nil)
  }

  @Test func canSealObject() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({a: 1})")
    obj.sealObject()
    #expect(!obj.extensible)
    #expect(context.currentException == nil)
  }

  @Test func canFreezeObject() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let obj = context.eval(code: "({a: 1})")
    obj.freezeObject()
    #expect(!obj.extensible)
    #expect(context.currentException == nil)
  }

  @Test func isNaNDetectsNaN() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let nanValue = context.eval(code: "NaN")
    #expect(nanValue.isNaN)
    #expect(context.currentException == nil)
  }

  @Test func isNaNReturnsFalseForNumber() {
    let runtime = QJSRuntime()
    let context = runtime.newContext()
    let value = context.value(int32: 42)
    #expect(!value.isNaN)
    #expect(context.currentException == nil)
  }
}
