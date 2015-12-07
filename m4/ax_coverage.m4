AC_DEFUN([AX_COVERAGE],
[
  AC_ARG_VAR([GCOV], [Coverage testing command])
  if test "x$GCOV" = "x"; then
    AC_PATH_PROG(GCOV, gcov, no)
  else
    AC_PATH_PROG(GCOV, $GCOV, no)
  fi

  AC_PATH_PROG(LCOV, lcov, no)
  AC_PATH_PROG(GENHTML, genhtml)
  AC_CHECK_PROG(HAVE_CPPFILT, c++filt, yes, no)
  if test "x$HAVE_CPPFILT" = "xyes"; then
    GENHTML_OPTIONS="--demangle-cpp"
  else
    GENHTML_OPTIONS=""
  fi

  COVERAGE_CFLAGS="-fprofile-arcs -ftest-coverage"
  COVERAGE_CXXFLAGS="-fprofile-arcs -ftest-coverage"
  COVERAGE_OPTIMIZATION_FLAGS="-O0"
  COVERAGE_LDFLAGS="--coverage"

  if test "x$GCOV" != "xno" -a "x$LCOV" != "xno"; then
    COVERAGE_SUPPORT="yes"
  else
    COVERAGE_SUPPORT="no"
  fi

  AC_SUBST([COVERAGE_SUPPORT])
  AC_SUBST([GCOV])
  AC_SUBST([LCOV])
  AC_SUBST([GENHTML])
  AC_SUBST([GENHTML_OPTIONS])
  AC_SUBST([COVERAGE_CFLAGS])
  AC_SUBST([COVERAGE_CXXFLAGS])
  AC_SUBST([COVERAGE_OPTIMIZATION_FLAGS])
  AC_SUBST([COVERAGE_LDFLAGS])
])
