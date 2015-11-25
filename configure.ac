# Initialize Autoconf.
# Specify package's name, version number and bug-report address.
AC_INIT([autotools-unittest], [0.3.0], [bug-report@address])

# For using custom m4 macros.
AC_CONFIG_MACRO_DIR([m4])

# Auxiliary scripts such as install-sh and depcomp should be in following directory.
AC_CONFIG_AUX_DIR([build-aux])

# Initialize Automake.
# There are useful options.
#   -Werror: Report warnings as errors.
#   foreign: ignores some GNU Coding Standards.
#   subdirs-objects: Create objects in sub-direcotories
AM_INIT_AUTOMAKE([-Werror foreign subdir-objects])

# AM_PROG_AR is a new feature since automake 1.12,
# make AM_PROG_AR work before automake 1.12
# Libtool(LT_INIT) should use AM_PROG_AR internally,
# newer libtool may not need to enable AM_PROG_AR explicitly.
m4_ifdef([AM_PROG_AR], [AM_PROG_AR])

# Initialize Libtool.
LT_INIT

# Check for programs.
# * Check for a C compiler.
AC_PROG_CC

# * Check for a C++ compiler.
AC_PROG_CXX

AC_LANG([C++], [C])

# Check for libraries.
# * Check for pthreads library.
ACX_PTHREAD([have_pthread=yes], [heve_pthread=no])

# Define variables for unit test using gtest
GTEST_VERSION="1.7.0"
if test "x$have_pthread" = "xyes"; then
  GTEST_CPPFLAGS="-DGTEST_HAS_PTHREAD=1 -I\$(top_srcdir)/lib/gmock"
  GTEST_CXXFLAGS="$PTHREAD_CFLAGS"
  GTEST_LDFLAGS="-L\$(top_builddir)/lib/gmock"
  GTEST_LIBS="$PTHREAD_LIBS"
else
  GTEST_CPPFLAGS="-DGTEST_HAS_PTHREAD=0 -I\$(top_srcdir)/lib/gmock"
  GTEST_CXXFLAGS=
  GTEST_LDFLAGS="-L\$(top_builddir)/lib/gmock"
  GTEST_LIBS=
fi
AC_SUBST([GTEST_VERSION])
AC_SUBST([GTEST_CPPFLAGS])
AC_SUBST([GTEST_CXXFLAGS])
AC_SUBST([GTEST_LDFLAGS])
AC_SUBST([GTEST_LIBS])

# * Check for Doxygen.
# DX_???_FEATURE(ON|OFF) - control the default setting fo a Doxygen feature.
DX_DOXYGEN_FEATURE(ON)
DX_HTML_FEATURE(ON)
DX_MAN_FEATURE(OFF)
DX_PDF_FEATURE(OFF)
DX_PS_FEATURE(OFF)
# DX_INIT_DOXYGEN(PROJECT, [CONFIG-FILE], [OUTPUT-DOC-DIR])
DX_INIT_DOXYGEN($PACKAGE_NAME, [Doxyfile], [doc])

# Check python for the script checking coding style
AC_CHECK_PROG(HAVE_PYTHON, python, yes, no)

# Checks for existence of coverage tools and define variables for reporting coverage
AC_CHECK_COVERAGE

# Check for C++11 supports
#   ext: use extended mode (e.g. -std=gnu++11)
#   noext: use non-extended mode (e.g. -std=c++11)
# AX_CXX_COMPILE_STDCXX_11([noext])

# Check for header files.

# Check for typedefs, structures, and compiler characteristics.

# Check for library functions.

# Check for the existance of a file in the source directory.
AC_CONFIG_SRCDIR([src/autotools-unittest])

# Output files.
# AC_CONFIG_HEADERS(HEADERS...)
# Create Header for all HEADER.in Use only one such header unless you know what you are doing.
# Declare config.h as output header.
AC_CONFIG_HEADERS([config.h])

# Declare output files.
AC_CONFIG_FILES([Makefile
                 Doxyfile])

# Actually output all declared files.
AC_OUTPUT

AC_MSG_RESULT([
Configure Information:
  C Compiler        : $CC
    DEFS            :   $DEFS
    CPPFLAGS        :   $CPPFLAGS
    CFLAGS          :   $CFLAGS

  C++ Compiler      : $CXX
    DEFS            :   $DEFS
    CPPFLAGS        :   $CPPFLAGS
    CXXFLAGS        :   $CXXFLAGS

  Linker            : $LD
    LDFLAGS         :   $LDFLAGS
    LIBS            :   $LIBS

Supported Build Features:
  Documents             : $(if test "x$DX_FLAG_doc" = "x1"; then echo yes; else echo no; fi)
    html                :   $(if test "x$DX_FLAG_html" = "x1"; then echo yes; else echo no; fi)
    man                 :   $(if test "x$DX_FLAG_man" = "x1"; then echo yes; else echo no; fi)
    pdf                 :   $(if test "x$DX_FLAG_pdf" = "x1"; then echo yes; else echo no; fi)
    ps                  :   $(if test "x$DX_FLAG_ps" = "x1"; then echo yes; else echo no; fi)

  Coding Style Checks   : $HAVE_PYTHON

  Coverage Reports      : $ENABLE_COVERAGE
])
