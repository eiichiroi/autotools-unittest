# Initialize Autoconf.
# Specify package's name, version number and bug-report address.
AC_INIT([autotools-unittest], [0.1.0], [bug-report@address])

# For using custom m4 macros.
AC_CONFIG_MACRO_DIR([m4])

# Auxiliary scripts such as install-sh and depcomp should be in following directory.
AC_CONFIG_AUX_DIR([build-aux])

# Initialize Automake.
# There are useful options.
#   -Wall: Turn all warnings on.
#   -Werror: Report warnings as errors.
#   foreign: ignores some GNU Coding Standards.
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

# Initialize Libtool.
LT_INIT

# Check for programs.
# * Check for a C++ compiler.
AC_PROG_CXX

# Check for libraries.
# * Check for pthreads library.
ACX_PTHREAD([have_pthread=yes], [heve_pthread=no])

# Define variables for unit test using gtest
# TODO: extract GTEST_VERSION from gtest's directory
AC_SUBST([GTEST_VERSION], ["1.6.0"])
if test "x$have_pthread" = "xyes"; then
  GTEST_CPPFLAGS="-DGTEST_HAS_PTHREAD=1 -I\$(top_srcdir)/lib/gtest-$GTEST_VERSION"
  GTEST_CXXFLAGS="$PTHREAD_CFLAGS"
  GTEST_LDFLAGS="-L\$(top_builddir)/lib/gtest-$GTEST_VERSION"
  GTEST_LIBS="$PTHREAD_LIBS"
else
  GTEST_CPPFLAGS="-DGTEST_HAS_PTHREAD=0 -I\$(top_srcdir)/lib/gtest-$GTEST_VERSION"
  GTEST_CXXFLAGS=
  GTEST_LDFLAGS="-L\$(top_builddir)/lib/gtest-$GTEST_VERSION"
  GTEST_LIBS=
fi
AC_SUBST([GTEST_CPPFLAGS])
AC_SUBST([GTEST_CXXFLAGS])
AC_SUBST([GTEST_LDFLAGS])
AC_SUBST([GTEST_LIBS])

AC_ARG_ENABLE([gmock],
              [AS_HELP_STRING([--disable-gmock],
                              [Disables use of built-in gmock. If you don't use gmock,
                               you can avoid unnecessary gmock's build by using this option.
                               (Default is enabled.)])],
              [],
              [enable_gmock=yes])
AM_CONDITIONAL([ENABLE_GMOCK], [test "x$enable_gmock" = "xyes"])

if test "x$enable_gmock" = "xyes"; then
  # Define variables for unit test using gtest and gmock
  # TODO: extract GMOCK_VERSION from gmock's directory
  AC_SUBST([GMOCK_VERSION], ["1.6.0"])
  if test "x$have_pthread" = "xyes"; then
    GMOCK_CPPFLAGS="-DGTEST_HAS_PTHREAD=1 -I\$(top_srcdir)/lib/gmock-$GMOCK_VERSION"
    GMOCK_CXXFLAGS="$PTHREAD_CFLAGS"
    GMOCK_LDFLAGS="-L\$(top_builddir)/lib/gmock-$GMOCK_VERSION"
    GMOCK_LIBS="$PTHREAD_LIBS"
  else
    GMOCK_CPPFLAGS="-DGTEST_HAS_PTHREAD=0 -I\$(top_srcdir)/lib/gmock-$GMOCK_VERSION"
    GMOCK_CXXFLAGS=
    GMOCK_LDFLAGS="-L\$(top_builddir)/lib/gmock-$GMOCK_VERSION"
    GMOCK_LIBS=
  fi
  AC_SUBST([GMOCK_CPPFLAGS])
  AC_SUBST([GMOCK_CXXFLAGS])
  AC_SUBST([GMOCK_LDFLAGS])
  AC_SUBST([GMOCK_LIBS])
fi

# Check for header files.

# Check for typedefs, structures, and compiler characteristics.

# Check for library functions.

# Check for the existance of a file in the source directory.
AC_CONFIG_SRCDIR([src/Makefile.am])

# Output files.
# AC_CONFIG_HEADERS(HEADERS...)
# Create Header for all HEADER.in Use only one such header unless you know what you are doing.
# Declare config.h as output header.
AC_CONFIG_HEADERS([config.h])

# Declare output files.
AC_CONFIG_FILES([Makefile
                 lib/Makefile lib/gtest-1.6.0/Makefile lib/gmock-1.6.0/Makefile
                 src/Makefile src/autotools-unittest/Makefile
                 test/Makefile test/autotools-unittest/Makefile])

# Actually output all declared files.
AC_OUTPUT
