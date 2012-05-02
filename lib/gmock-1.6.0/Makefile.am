# Build gmock only when executing "make check"
check_LTLIBRARIES = \
  libgmock.la \
  libgmock_main.la

libgmock_la_SOURCES = \
  gmock/gmock.h \
  gtest/gtest.h \
  gmock-gtest-all.cc
libgmock_la_CPPFLAGS = $(GMOCK_CPPFLAGS)
libgmock_la_CXXFLAGS = $(GMOCK_CXXFLAGS)
libgmock_la_LDFLAGS = $(GMOCK_LDFLAGS)
libgmock_la_LIBADD = $(GMOCK_LIBS)

libgmock_main_la_SOURCES = \
  gmock/gmock.h \
  gtest/gtest.h \
  gmock_main.cc
libgmock_main_la_CPPFLAGS = $(GMOCK_CPPFLAGS)
libgmock_main_la_CXXFLAGS = $(GMOCK_CXXFLAGS)
libgmock_main_la_LDFLAGS = $(GMOCK_LDFLAGS)
libgmock_main_la_LIBADD = \
  $(GMOCK_LIBS) \
  libgmock.la
