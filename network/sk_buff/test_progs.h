/* SPDX-License-Identifier: GPL-2.0 */

#define PRINT_FAIL(format...)                                                  \
	({                                                                     \
		test__fail();                                                  \
		fprintf(stdout, "%s:FAIL:%d ", __func__, __LINE__);            \
		fprintf(stdout, ##format);                                     \
	})

#define _CHECK(condition, tag, duration, format...) ({			\
	int __ret = !!(condition);					\
	int __save_errno = errno;					\
	if (__ret) {							\
		fprintf(stdout, "%s:FAIL:%s ", __func__, tag);		\
		fprintf(stdout, ##format);				\
	} else {							\
		fprintf(stdout, "%s:PASS:%s %d nsec\n",			\
		       __func__, tag, duration);			\
	}								\
	errno = __save_errno;						\
	__ret;								\
})

#define CHECK_FAIL(condition) ({					\
	int __ret = !!(condition);					\
	int __save_errno = errno;					\
	if (__ret) {							\
		fprintf(stdout, "%s:FAIL:%d\n", __func__, __LINE__);	\
	}								\
	errno = __save_errno;						\
	__ret;								\
})

#define CHECK(condition, tag, format...) \
	_CHECK(condition, tag, duration, format)
#define CHECK_ATTR(condition, tag, format...) \
	_CHECK(condition, tag, tattr.duration, format)

#define ASSERT_TRUE(actual, name) ({					\
	static int duration = 0;					\
	bool ___ok = (actual);						\
	CHECK(!___ok, (name), "unexpected %s: got FALSE\n", (name));	\
	___ok;								\
})

#define ASSERT_FALSE(actual, name) ({					\
	static int duration = 0;					\
	bool ___ok = !(actual);						\
	CHECK(!___ok, (name), "unexpected %s: got TRUE\n", (name));	\
	___ok;								\
})

#define ASSERT_EQ(actual, expected, name) ({				\
	static int duration = 0;					\
	typeof(actual) ___act = (actual);				\
	typeof(expected) ___exp = (expected);				\
	bool ___ok = ___act == ___exp;					\
	CHECK(!___ok, (name),						\
	      "unexpected %s: actual %lld != expected %lld\n",		\
	      (name), (long long)(___act), (long long)(___exp));	\
	___ok;								\
})

#define ASSERT_NEQ(actual, expected, name) ({				\
	static int duration = 0;					\
	typeof(actual) ___act = (actual);				\
	typeof(expected) ___exp = (expected);				\
	bool ___ok = ___act != ___exp;					\
	CHECK(!___ok, (name),						\
	      "unexpected %s: actual %lld == expected %lld\n",		\
	      (name), (long long)(___act), (long long)(___exp));	\
	___ok;								\
})

#define ASSERT_LT(actual, expected, name) ({				\
	static int duration = 0;					\
	typeof(actual) ___act = (actual);				\
	typeof(expected) ___exp = (expected);				\
	bool ___ok = ___act < ___exp;					\
	CHECK(!___ok, (name),						\
	      "unexpected %s: actual %lld >= expected %lld\n",		\
	      (name), (long long)(___act), (long long)(___exp));	\
	___ok;								\
})

#define ASSERT_LE(actual, expected, name) ({				\
	static int duration = 0;					\
	typeof(actual) ___act = (actual);				\
	typeof(expected) ___exp = (expected);				\
	bool ___ok = ___act <= ___exp;					\
	CHECK(!___ok, (name),						\
	      "unexpected %s: actual %lld > expected %lld\n",		\
	      (name), (long long)(___act), (long long)(___exp));	\
	___ok;								\
})

#define ASSERT_GT(actual, expected, name) ({				\
	static int duration = 0;					\
	typeof(actual) ___act = (actual);				\
	typeof(expected) ___exp = (expected);				\
	bool ___ok = ___act > ___exp;					\
	CHECK(!___ok, (name),						\
	      "unexpected %s: actual %lld <= expected %lld\n",		\
	      (name), (long long)(___act), (long long)(___exp));	\
	___ok;								\
})

#define ASSERT_GE(actual, expected, name) ({				\
	static int duration = 0;					\
	typeof(actual) ___act = (actual);				\
	typeof(expected) ___exp = (expected);				\
	bool ___ok = ___act >= ___exp;					\
	CHECK(!___ok, (name),						\
	      "unexpected %s: actual %lld < expected %lld\n",		\
	      (name), (long long)(___act), (long long)(___exp));	\
	___ok;								\
})

#define ASSERT_STREQ(actual, expected, name) ({				\
	static int duration = 0;					\
	const char *___act = actual;					\
	const char *___exp = expected;					\
	bool ___ok = strcmp(___act, ___exp) == 0;			\
	CHECK(!___ok, (name),						\
	      "unexpected %s: actual '%s' != expected '%s'\n",		\
	      (name), ___act, ___exp);					\
	___ok;								\
})

#define ASSERT_STRNEQ(actual, expected, len, name) ({			\
	static int duration = 0;					\
	const char *___act = actual;					\
	const char *___exp = expected;					\
	int ___len = len;						\
	bool ___ok = strncmp(___act, ___exp, ___len) == 0;		\
	CHECK(!___ok, (name),						\
	      "unexpected %s: actual '%.*s' != expected '%.*s'\n",	\
	      (name), ___len, ___act, ___len, ___exp);			\
	___ok;								\
})

#define ASSERT_HAS_SUBSTR(str, substr, name) ({				\
	static int duration = 0;					\
	const char *___str = str;					\
	const char *___substr = substr;					\
	bool ___ok = strstr(___str, ___substr) != NULL;			\
	CHECK(!___ok, (name),						\
	      "unexpected %s: '%s' is not a substring of '%s'\n",	\
	      (name), ___substr, ___str);				\
	___ok;								\
})

#define ASSERT_OK(res, name) ({						\
	static int duration = 0;					\
	long long ___res = (res);					\
	bool ___ok = ___res == 0;					\
	CHECK(!___ok, (name), "unexpected error: %lld (errno %d)\n",	\
	      ___res, errno);						\
	___ok;								\
})

#define ASSERT_ERR(res, name) ({					\
	static int duration = 0;					\
	long long ___res = (res);					\
	bool ___ok = ___res < 0;					\
	CHECK(!___ok, (name), "unexpected success: %lld\n", ___res);	\
	___ok;								\
})

#define ASSERT_NULL(ptr, name) ({					\
	static int duration = 0;					\
	const void *___res = (ptr);					\
	bool ___ok = !___res;						\
	CHECK(!___ok, (name), "unexpected pointer: %p\n", ___res);	\
	___ok;								\
})

#define ASSERT_OK_PTR(ptr, name) ({					\
	static int duration = 0;					\
	const void *___res = (ptr);					\
	int ___err = libbpf_get_error(___res);				\
	bool ___ok = ___err == 0;					\
	CHECK(!___ok, (name), "unexpected error: %d\n", ___err);	\
	___ok;								\
})

#define ASSERT_ERR_PTR(ptr, name) ({					\
	static int duration = 0;					\
	const void *___res = (ptr);					\
	int ___err = libbpf_get_error(___res);				\
	bool ___ok = ___err != 0;					\
	CHECK(!___ok, (name), "unexpected pointer: %p\n", ___res);	\
	___ok;								\
})

#ifdef __x86_64__
#define SYS_NANOSLEEP_KPROBE_NAME "__x64_sys_nanosleep"
#elif defined(__s390x__)
#define SYS_NANOSLEEP_KPROBE_NAME "__s390x_sys_nanosleep"
#elif defined(__aarch64__)
#define SYS_NANOSLEEP_KPROBE_NAME "__arm64_sys_nanosleep"
#else
#define SYS_NANOSLEEP_KPROBE_NAME "sys_nanosleep"
#endif

#define BPF_TESTMOD_TEST_FILE "/sys/kernel/bpf_testmod"
