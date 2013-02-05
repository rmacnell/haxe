// getClass
Type.getClass("foo") == String;
Type.getClass(new haxe.Template("")) == haxe.Template;
Type.getClass([]) == Array;
Type.getClass(Float) == null;
Type.getClass(null) == null;
Type.getClass(Int) == null;
Type.getClass(Bool) == null;
//Type.getClass(haxe.macro.Expr.ExprDef.EBreak) == null;
Type.getClass( { } ) == null;

// getEnum
Type.getEnum(haxe.macro.Expr.ExprDef.EBreak) == haxe.macro.Expr.ExprDef;
Type.getEnum(null) == null;

// getSuperClass
Type.getSuperClass(String) == null;
Type.getSuperClass(ClassWithToStringChild) == ClassWithToString;
//Type.getSuperClass(null) == null;

// getClassName
Type.getClassName(String) == "String";
Type.getClassName(haxe.Template) == "haxe.Template";
//Type.getClassName(null) == null;
Type.getClassName(Type.getClass([])) == "Array";

// getEnumName
//Type.getEnumName(null) == null;
Type.getEnumName(haxe.macro.Expr.ExprDef) == "haxe.macro.ExprDef";

// resolveClass
Type.resolveClass("String") == String;
Type.resolveClass("haxe.Template") == haxe.Template;
//Type.resolveClass("Float") == null;
//Type.resolveClass(null) == null;
Type.resolveClass("MyNonExistingClass") == null;

// resolveEnum
//Type.resolveEnum(null) == null;
Type.resolveEnum("haxe.macro.ExprDef") == haxe.macro.Expr.ExprDef;
Type.resolveEnum("String") == null;

// createInstance
Type.createInstance(String, ["foo"]) == "foo";
//Type.createInstance(null, []) == null;
Type.createInstance(C, []).v == "var";
//var t = Type.createInstance(ClassWithCtorDefaultValues, []);
//t.a == 1;
//t.b == "foo";
//var t = Type.createInstance(ClassWithCtorDefaultValues, [2]);
//t.a == 2;
//t.b == "foo";
var c = Type.createInstance(ClassWithCtorDefaultValues, [2, "bar"]);
c.a == 2;
c.b == "bar";
//var t = Type.createInstance(ClassWithCtorDefaultValuesChild, [2, "bar"]);
//t.a == 2;
//t.b == "bar";

// createEmptyInstance
//Type.createEmptyInstance(String) == "foo";
//Type.createEmptyInstance(null, []) == null;
var c = Type.createEmptyInstance(ClassWithCtorDefaultValues);
c.a == null;
c.b == null;
var c = Type.createEmptyInstance(ClassWithCtorDefaultValuesChild);
c.a == null;
c.b == null;

// createEnum
var e = Type.createEnum(E, "NoArgs");
e == NoArgs;
Type.createEnum(E, "NoArgs", []) == NoArgs;
Type.enumEq(Type.createEnum(E, "OneArg", [1]), OneArg(1)) == true;
Type.enumEq(Type.createEnum(E, "RecArg", [e]), RecArg(e)) == true;
Type.enumEq(Type.createEnum(E, "MultipleArgs", [1, "foo"]), MultipleArgs(1, "foo")) == true;

// createEnumIndex
var e = Type.createEnumIndex(E, 0);
e == NoArgs;
Type.createEnumIndex(E, 0, []) == NoArgs;
Type.createEnumIndex(E, 0, null) == NoArgs;
Type.enumEq(Type.createEnumIndex(E, 1, [1]), OneArg(1)) == true;
Type.enumEq(Type.createEnumIndex(E, 2, [e]), RecArg(e)) == true;
Type.enumEq(Type.createEnumIndex(E, 3, [1, "foo"]), MultipleArgs(1, "foo")) == true;

// getInstanceFields
var fields = Type.getInstanceFields(C);
var requiredFields = ["func", "v", "prop"];
for (f in fields)
	t(requiredFields.remove(f));
requiredFields == [];
var fields = Type.getInstanceFields(CChild);
var requiredFields = ["func", "v", "prop"];
for (f in fields)
	t(requiredFields.remove(f));
requiredFields == [];
var cdyn = new CDyn();
cdyn.foo = "1";
Reflect.setField(cdyn, "bar", 1);
var fields = Type.getInstanceFields(Type.getClass(cdyn));
var requiredFields = ["func", "v", "prop"];
for (f in fields)
	t(requiredFields.remove(f));
requiredFields == [];
var fields = Type.getClassFields(C);
var requiredFields = ["staticFunc", "staticVar", "staticProp"];
for (f in fields)
	t(requiredFields.remove(f));
requiredFields == [];
var fields = Type.getClassFields(CChild);
var requiredFields = [];
for (f in fields)
	t(requiredFields.remove(f));
requiredFields == [];

// getEnumConstructs
Type.getEnumConstructs(E) == ["NoArgs", "OneArg", "RecArg", "MultipleArgs"];

// typeof
// not much to test here?

// enumEq
Type.enumEq(NoArgs, NoArgs) == true;
Type.enumEq(OneArg(1), OneArg(1)) == true;
Type.enumEq(RecArg(OneArg(1)), RecArg(OneArg(1))) == true;
Type.enumEq(MultipleArgs(1, "foo"), MultipleArgs(1, "foo")) == true;
Type.enumEq(NoArgs, OneArg(1)) == false;
Type.enumEq(NoArgs, RecArg(NoArgs)) == false;
Type.enumEq(NoArgs, MultipleArgs(1, "foo")) == false;
Type.enumEq(OneArg(1), OneArg(2)) == false;
Type.enumEq(RecArg(OneArg(1)), RecArg(OneArg(2))) == false;

// enumConstructor
Type.enumConstructor(NoArgs) == "NoArgs";
Type.enumConstructor(OneArg(1)) == "OneArg";
Type.enumConstructor(RecArg(OneArg(1))) == "RecArg";
Type.enumConstructor(MultipleArgs(1, "foo")) == "MultipleArgs";

// enumParameters
Type.enumParameters(NoArgs) == [];
Type.enumParameters(OneArg(1)) == [1];
Type.enumParameters(RecArg(NoArgs)) == [NoArgs];
Type.enumParameters(MultipleArgs(1, "foo")) == [1, "foo"];

// enumIndex
Type.enumIndex(NoArgs) == 0;
Type.enumIndex(OneArg(1)) == 1;
Type.enumIndex(RecArg(OneArg(1))) == 2;
Type.enumIndex(MultipleArgs(1, "foo")) == 3;

// allEnums
Type.allEnums(E) == [NoArgs];
Type.allEnums(haxe.macro.Expr.ExprDef) == [EBreak, EContinue];