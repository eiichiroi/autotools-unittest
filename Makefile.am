# For using custom m4 macros.
ACLOCAL_AMFLAGS = -I m4

# Nonstandard package files for distribution.
EXTRA_DIST = \
  autogen.sh \
  scripts/change_package_name.sh

# Build rules for testing framework.
check_LTLIBRARIES = \
  lib/gmock/libgmock.la \
  lib/gmock/libgmock_main.la

lib_gmock_libgmock_la_SOURCES = \
  lib/gmock/gmock/gmock.h \
  lib/gmock/gtest/gtest.h \
  lib/gmock/gmock-gtest-all.cc
lib_gmock_libgmock_la_CPPFLAGS = $(GTEST_CPPFLAGS)
lib_gmock_libgmock_la_CXXFLAGS = $(GTEST_CXXFLAGS)
lib_gmock_libgmock_la_LDFLAGS = $(GTEST_LDFLAGS)
lib_gmock_libgmock_la_LIBADD = $(GTEST_LIBS)

lib_gmock_libgmock_main_la_SOURCES = \
  lib/gmock/gmock/gmock.h \
  lib/gmock/gtest/gtest.h \
  lib/gmock/gmock_main.cc
lib_gmock_libgmock_main_la_CPPFLAGS = $(GTEST_CPPFLAGS)
lib_gmock_libgmock_main_la_CXXFLAGS = $(GTEST_CXXFLAGS)
lib_gmock_libgmock_main_la_LDFLAGS = $(GTEST_LDFLAGS)
lib_gmock_libgmock_main_la_LIBADD = \
  $(GTEST_LIBS) \
  lib/gmock/libgmock.la

# Build rules for libraries.
pkginclude_HEADERS = \
  src/autotools-unittest/sample.hpp

lib_LTLIBRARIES = \
  src/autotools-unittest/libsample.la

src_autotools_unittest_libsample_la_SOURCES = \
  src/autotools-unittest/sample.hpp \
  src/autotools-unittest/sample.cpp

# Build rules for tests.
# TESTS_ENVIRONMENT: Set environment variables for the test run
# TESTS: Define programs run automatically by "make check"
# check_PROGRAMS: Define programs built by "make check" but not necessarily run
TESTS_ENVIRONMENT=
TESTS=
check_PROGRAMS=

# Define tests with gtest
TESTS += test/sample_test
check_PROGRAMS += test/sample_test
test_sample_test_SOURCES = test/sample_test.cpp
test_sample_test_CPPFLAGS = -I$(top_srcdir)/src/ $(GTEST_CPPFLAGS)
test_sample_test_CXXFLAGS = $(GTEST_CXXFLAGS)
test_sample_test_LDFLAGS = $(GTEST_LDFLAGS)
test_sample_test_LDADD = src/autotools-unittest/libsample.la \
                         $(GTEST_LIBS) \
                         lib/gmock/libgmock_main.la \
                         lib/gmock/libgmock.la
