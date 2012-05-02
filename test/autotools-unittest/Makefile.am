# Define programs built by "make check" but not necessarily run
check_PROGRAMS =

# Declare libraries to test
libsample = $(top_builddir)/src/autotools-unittest/libsample.la

# Define tests with gtest
check_PROGRAMS += sample_test
sample_test_SOURCES = sample_test.cpp
sample_test_CPPFLAGS = -I$(top_srcdir)/src/ $(GTEST_CPPFLAGS)
sample_test_CXXFLAGS = $(GTEST_CXXFLAGS)
sample_test_LDFLAGS = $(GTEST_LDFLAGS)
sample_test_LDADD = $(libsample) $(GTEST_LIBS) -lgtest_main

# Define tests with gtest and gmock
check_PROGRAMS += sample_with_mock_test
sample_with_mock_test_SOURCES = sample_with_mock_test.cpp
sample_with_mock_test_CPPFLAGS = -I$(top_srcdir)/src/ $(GMOCK_CPPFLAGS)
sample_with_mock_test_CXXFLAGS = $(GMOCK_CXXFLAGS)
sample_with_mock_test_LDFLAGS = $(GMOCK_LDFLAGS)
sample_with_mock_test_LDADD = $(libsample) $(GMOCK_LIBS) -lgmock_main

# Declare libraries and define tests here...

# Define programs run automatically by "make check"
TESTS = $(check_PROGRAMS)
