# Build gtest only when executing "make check"
check_LTLIBRARIES = \
  libgtest.la \
  libgtest_main.la

libgtest_la_SOURCES = \
  gtest/gtest.h \
  gtest/gtest-all.cc
libgtest_la_CPPFLAGS = $(GTEST_CPPFLAGS)
libgtest_la_CXXFLAGS = $(GTEST_CXXFLAGS)
libgtest_la_LDFLAGS = $(GTEST_LDFLAGS)
libgtest_la_LIBADD = $(GTEST_LIBS)

libgtest_main_la_SOURCES = \
  gtest/gtest.h \
  gtest/gtest_main.cc
libgtest_main_la_CPPFLAGS = $(GTEST_CPPFLAGS)
libgtest_main_la_CXXFLAGS = $(GTEST_CXXFLAGS)
libgtest_main_la_LDFLAGS = $(GTEST_LDFLAGS)
libgtest_main_la_LIBADD = \
  $(GTEST_LIBS) \
  libgtest.la
