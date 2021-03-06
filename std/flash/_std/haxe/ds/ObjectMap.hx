package haxe.ds;

@:coreApi
class ObjectMap<K,V> extends flash.utils.Dictionary {

	public inline function get( key : K ) : Null<V> {
		return untyped this[key];
	}

	public inline function set( key : K, value : V ):Void {
		untyped this[key] = value;
	}

	public inline function exists( key : K ) : Bool {
		return untyped this[key] != null;
	}

	public function remove( key : K ):Bool {
		var has = exists(key);
		untyped __delete__(this, key);
		return has;
	}

	public function keys() : Iterator<K> {
		return untyped __keys__(this).iterator();
	}

	public function iterator() : Iterator<V> {
		var ret = [];
		for (i in keys())
			ret.push(get(i));
		return ret.iterator();
	}

	public function toString() : String {
		var s = "";
		var it = keys();
		for( i in it ) {
			s += (s == "" ? "" : ",") + i;
			s += " => ";
			s += Std.string(get(i));
		}
		return s + "}";
	}
}