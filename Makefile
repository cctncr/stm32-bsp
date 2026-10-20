# Host build for P1-H: Unity tests and static analysis.
# CC is left at make's default `cc`: Apple clang on macOS, gcc on Ubuntu (CI).

CFLAGS   = -std=c11 -Wall -Wextra -Werror
CPPFLAGS = -I vendor/unity
BUILD    = build

.PHONY: test lint clean

test: $(BUILD)/test_smoke
	./$(BUILD)/test_smoke

$(BUILD)/test_smoke: test/test_smoke.c vendor/unity/unity.c
	mkdir -p $(BUILD)
	$(CC) $(CPPFLAGS) $(CFLAGS) $^ -o $@

# Only our own code; vendor/ is third-party and not ours to fix.
lint:
	cppcheck --std=c11 --enable=warning,style,performance,portability --error-exitcode=1 -q test

clean:
	rm -rf $(BUILD)
