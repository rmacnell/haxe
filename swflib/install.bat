@ocamake -a *.ml *.mli -o swfLib.cma -clean
@ocamake -a *.ml *.mli -o swfLib.cmxa -clean
@ocamake -a *.ml *.mli -o swfLib.cma
@ocamake -a *.ml *.mli -o swfLib.cmxa
@cp -f as3parse.cmi as3code.cmi as3.cmi swf.cmi png.cmi swfPic.cmi swfParser.cmi swfZip.cmi actionScript.cmi swfLib.lib swfLib.cma swfLib.cmxa c:\ocaml\lib
@ocamake -a *.ml *.mli -o swfLib.cma -clean
@ocamake -a *.ml *.mli -o swfLib.cmxa -clean
@pause
