autotools-unittest
==================

The autotools-unittest is a minimal starter kit when writing C++ library
with autotools, google test(gtest) and google mock(gmock).
This include gtest-1.6.0 and gmock-1.6.0,
so you can use those testing framework without installation.

Requirements
------------

* Autoconf
* Automake
* Libtool

Example
-------

0. Download autotools-unittest package and extract it

```
$ wget http://github.com/downloads/eiichiroi/autotools-unittest/autotools-unittest-0.1.0.tar.gz
$ tar xzf autotools-unittest-0.1.0.tar.gz
$ cd autotools-unittest-0.1.0
```

1. Change package name from 'autotools-unittest' to your library name(ex. mylib)

```
$ ./scripts/change_package_name.sh mylib
Changing package name from 'autotools-unittest' to 'mylib' ... Are you sure? [yes/NO]: yes
===========================================================================
Following directory names will be changed.

* ./test/autotools-unittest
* ./src/autotools-unittest

Are you sure? [yes/NO]: yes

* ./test/autotools-unittest ... done.
* ./src/autotools-unittest ... done.

===========================================================================
Following file contents will be changed.

* ./configure.ac
* ./test/mylib/Makefile.am
* ./test/mylib/sample_test.cpp
* ./test/Makefile.am
* ./src/Makefile.am

Are you sure? [yes/NO]: yes

* ./configure.ac ... done.
* ./test/mylib/Makefile.am ... done.
* ./test/mylib/sample_test.cpp ... done.
* ./test/Makefile.am ... done.
* ./src/Makefile.am ... done.

```

2. Change top directory name yourself.

```
$ cd ..
$ mv autotools-unittest mylib
$ cd mylib
```

3. Build sample codes

```
$ ./autogen.sh
$ ./configure
$ make
```

4. Build gtest, gmock and unit tests for sample codes, and run them

```
$ make check
```

5. Write your library

Tips
----

* Disable gmock

If you don't use gmock, you can avoid unnecessary gmock's build by using --disable-gmock option.

```
$ ./configure --disable-gmock
$ make
$ make check
```

* Use advanced gtest options

You can use advanced gtest options(GTEST_xxx) via environment variables for automake(TESTS_ENVIRONMENT).

For example, you can filter test cases as follows.

```
$ TESTS_ENVIRONMENT="GTEST_FILTER='square.*'" make check
```

For more information about advanced options, please see the following page.

http://code.google.com/p/googletest/wiki/V1_6_AdvancedGuide#Running_Test_Programs:_Advanced_Options

TODO
----

* Support various tests such as *make check-integration* or *make check-fuzzing*

