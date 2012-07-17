Haxe
====

This git repository is a mirror of the source code and dependencies of
[Haxe](http://www.haxe.org/). **It is completely unofficial.**

It incorporates:

* A complete history of the [Haxe SVN repository][1].
* A complete history of the [ocamllibs SVN repository][2] (in the `libs`
  subdirectory), which contains source and binary dependencies that are needed
  to compile Haxe.
* A modified copy of [install.ml][3], the Haxe build script, which is for some
  strange reason maintained outside the Haxe SVN repository (modified to work
  with this git mirror, since the original script is dependent on SVN).


Building on Linux/Unix
----------------------

To build you need the [OCaml compiler][4], camlp4 (usually included with
OCaml), [Findlib][5], and [zlib][6] (including development header files).

To install these on Debian/Ubuntu systems, just run:

```
sudo apt-get install ocaml camlp4 ocaml-findlib zlib1g-dev
```

Then, to build, run:

```
ocaml install.ml
```

If all goes well, you will end up with a `bin` directory containing the
`haxe` executable, and the standard library `std`.


Building on Windows
-------------------

To build you need a Microsoft compiler toolchain, and an OCaml compiler that
is based on the Microsoft toolchain.

To obtain a Microsoft compiler toolchain you can do one of the following:

* Install a copy of Microsoft Visual Studio Professional or above.
* Install the [Windows 7 SDK][7].

[OCaml Microsoft-based native Win32 port (3.09.0)][8] is known to successfully
compile Haxe on Windows, although it is not the latest version.

If you wish, you can check [the latest release of OCaml][9],
[the previous release][10], and [other older releases][11], but note that not
every version has a Microsoft-based port available, and that MinGW- or
Cygwin-based ports are **not** equivalent.

To build, you need to open a “Visual Studio Command Prompt” or “Windows 7 SDK
Command Prompt”. **This is not the same as an ordinary command prompt**. You
can find it in your Start Menu after installing Visual Studio or the Windows
7 SDK.

Then, to build, run:

```
ocaml install.ml
```

If all goes well, you will end up with a `bin` directory containing
`haxe.exe`, and the standard library `std`.


Install
-------

Despite the name, `install.ml` doesn’t actually install Haxe, it just compiles
it. You need to manually copy the binary and standard library to wherever
you want them.


Branches
--------

**[haxe/master][18]** tracks the [official Haxe SVN trunk][19], without any
additional changes (and also without any SVN externals).

**[ocamllibs/master][20]** tracks [ocamllibs trunk][21], without any
additional changes.

**[upstream-install-ml][22]** tracks the [official install.ml][3],
without any additional changes.

**[master][23]** tracks all of the above, and includes this README and some
changes to `install.ml` so that everything compiles out of the box.
**haxe/master**, **ocamllibs/master** and **upstream-install-ml** are all
merged into the **master** branch.


Patches and Pull Requests
-------------------------

If you’re developing improvements to Haxe against this repository that’s
great, that’s what it’s for, but there’s not much point in filing a pull
request unless you’ve made changes to this README or `install.ml`.

To submit patches back to the Haxe compiler team you’ll need to create a patch
and submit it to the [mailing list][12] or as an attachment to the [Haxe
issue tracker][13].

If there *is* something wrong with something specific to this mirror, then
pull requests are of course very welcome.


Updates
-------

This repository is updated automatically once per hour: changes from both
upstream SVN repositories are synced and merged in, and even changes to
`install.ml` should be handled automatically for the most part. Occasionally
manual intervention is required and it takes a bit longer.


Contact
-------

This repository is maintained by [Daniel Cassidy][14].

If there’s something wrong with it, for example `install.ml` doesn’t work for
you, or the repository isn’t up to date with respect to the Haxe SVN
repository (and hasn’t been for several hours), then the best thing to do
is probably to [report an issue][15].


Acknowledgements
----------------

[Philipp Klose][16] created a [similar Haxe mirror on GitHub][17] before I
did. Although he did a fine job of it, it didn’t work well for me on Windows,
and I spent quite a bit of time figuring out the most sensible sequence of
changes to make it work, before giving up and starting again. That’s more my
fault than his, although I’m happier with the way things are set up here.
This README is largely based on the one in his repository.

Haxe itself is developed by many people, very few of whom are me.


  [1]: http://code.google.com/p/haxe/ "Haxe SVN repository"
  [2]: http://code.google.com/p/ocamllibs/ "ocamllibs SVN repository"
  [3]: http://www.haxe.org/file/install.ml "Official Haxe build script"
  [4]: http://caml.inria.fr/ "The Caml language"
  [5]: http://projects.camlcity.org/projects/findlib.html/ "Findlib"
  [6]: http://zlib.net/ "zlib"
  [7]: http://www.microsoft.com/en-us/download/details.aspx?id=3138 "Windows 7 SDK"
  [8]: http://caml.inria.fr/pub/distrib/ocaml-3.09/ocaml-3.09.0-win-msvc.exe "OCaml Microsoft-based native Win32 port (3.09.0)"
  [9]: http://caml.inria.fr/ocaml/release.en.html "Latest OCaml release"
  [10]: http://caml.inria.fr/ocaml/release-prev.en.html "Previous OCaml release"
  [11]: http://caml.inria.fr/pub/distrib/ "All OCaml releases"
  [12]: https://groups.google.com/forum/#!forum/haxelang "Haxe mailing list"
  [13]: http://code.google.com/p/haxe/issues/list "Haxe issue tracker"
  [14]: mailto:mail@danielcassidy.me.uk "Daniel Cassidy"
  [15]: https://github.com/haxe-mirrors/haxe/issues "Issues"
  [16]: https://github.com/TheHippo "TheHippo (Philipp Klose) on GitHub"
  [17]: https://github.com/TheHippo/haxe "TheHippo/haxe on GitHub"
  [18]: https://github.com/haxe-mirrors/haxe/tree/haxe/master "haxe/master branch"
  [19]: http://code.google.com/p/haxe/source/browse/trunk/ "Browse Haxe SVN trunk"
  [20]: https://github.com/haxe-mirrors/haxe/tree/ocamllibs/master "ocamllibs/master branch"
  [21]: http://code.google.com/p/ocamllibs/source/browse/trunk/ "Browse ocamllibs SVN trunk"
  [22]: https://github.com/haxe-mirrors/haxe/tree/upstream-install-ml "upstream-install-ml branch"
  [23]: https://github.com/haxe-mirrors/haxe/tree/master "master branch"
