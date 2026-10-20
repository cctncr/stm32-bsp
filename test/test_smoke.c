#include "unity.h"

void setUp(void) {}
void tearDown(void) {}

static void test_two_plus_two_is_four(void)
{
    TEST_ASSERT_EQUAL_INT(4, 2 + 2);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_two_plus_two_is_four);
    return UNITY_END();
}
