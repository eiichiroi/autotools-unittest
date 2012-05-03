#include <gtest/gtest.h>

#include "autotools-unittest/sample.hpp"

TEST(square, seven)
{
  EXPECT_EQ(49, square(7));
}

