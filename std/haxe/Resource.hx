/*
 * Copyright (C)2005-2012 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
package haxe;

class Resource {
	
	#if (java || cs)
	static var content : Array<String>;
	#else
	static var content : Array<{ name : String, data : String, str : String }>;
	#end
	
	#if cs
	static var paths : Hash<String>;
	
	#if cs @:keep #end private static function getPaths():Hash<String>
	{
		if (paths != null)
			return paths;
		var p = new Hash();
		var all:cs.NativeArray<String> = untyped __cs__("typeof(haxe.Resource).Assembly.GetManifestResourceNames()");
		for (i in 0...all.Length)
		{
			var path = all[i];
			var name = path.substr(path.indexOf("Resources.") + 10);
			p.set(name, path);
		}
		
		return paths = p;
	}
	#end

	public static function listNames() : Array<String> {
		var names = new Array();
		#if (java || cs)
		for ( x in content )
			names.push(x);
		#else
		for ( x in content )
			names.push(x.name);
		#end
		return names;
	}

	public static function getString( name : String ) : String {
		#if java
		var stream = cast(Resource, java.lang.Class<Dynamic>).getResourceAsStream("/" + name);
		if (stream == null)
			return null;
		var stream = new java.io.NativeInput(stream);
		return stream.readAll().toString();
		#elseif cs
		var str:cs.system.io.Stream = untyped __cs__("typeof(haxe.Resource).Assembly.GetManifestResourceStream((string)getPaths().get(name).@value)");
		if (str != null)
			return new cs.io.NativeInput(str).readAll().toString();
		return null;
		#else
		for( x in content )
			if( x.name == name ) {
				#if neko
				return new String(x.data);
				#else
				if( x.str != null ) return x.str;
				var b : haxe.io.Bytes = haxe.Unserializer.run(x.data);
				return b.toString();
				#end
			}
		return null;
		#end
	}

	public static function getBytes( name : String ) : haxe.io.Bytes {
		#if java
		var stream = cast(Resource, java.lang.Class<Dynamic>).getResourceAsStream("/" + name);
		if (stream == null)
			return null;
		var stream = new java.io.NativeInput(stream);
		return stream.readAll();
		#elseif cs
		var str:cs.system.io.Stream = untyped __cs__("typeof(haxe.Resource).Assembly.GetManifestResourceStream((string)getPaths().get(name).@value)");
		if (str != null)
			return new cs.io.NativeInput(str).readAll();
		return null;
		#else
		for( x in content )
			if( x.name == name ) {
				#if neko
				return haxe.io.Bytes.ofData(cast x.data);
				#else
				if( x.str != null ) return haxe.io.Bytes.ofString(x.str);
				return haxe.Unserializer.run(x.data);
				#end
			}
		return null;
		#end
	}

	static function __init__() {
		#if neko
		var tmp = untyped __resources__();
		content = untyped Array.new1(tmp,__dollar__asize(tmp));
		#elseif php
		content = null;
		#elseif as3
		null;
		#elseif (java || cs)
		//do nothing
		#else
		content = untyped __resources__();
		#end
	}

}
