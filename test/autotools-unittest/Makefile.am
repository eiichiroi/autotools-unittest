# Define programs built by "make check" but not necessarily run
check_PROGRAMS =

# Declare libraries to test
libsample = $(top_builddir)/src/autotools-unittest/libsample.la

# Define tests
check_PROGRAMS += sample_test
sample_test_SOURCES = sample_test.cpp
sample_test_CPPFLAGS = -I$(top_srcdir)/src/ $(GTEST_CPPFLAGS)
sample_test_CXXFLAGS = $(GTEST_CXXFLAGS)
sample_test_LDFLAGS = $(GTEST_LDFLAGS)
sample_test_LDADD = $(libsample) $(GTEST_LIBS) -lgtest_main

# Declare libraries and define tests here...

# Define programs run automatically by "make check"
TESTS = $(check_PROGRAMS)
