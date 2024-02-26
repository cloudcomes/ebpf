  static __attribute__((noinline)) __attribute__((section("sec1")))
  int gfunc(int a, int b) {
    return a * b;
  }
  static __attribute__((noinline)) __attribute__((section("sec1")))
  int lfunc(int a, int b) {
    return a + b;
  }
  int test(int a, int b) {
    return gfunc(a, b) +  lfunc(a, b);
  }
