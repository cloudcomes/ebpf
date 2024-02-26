  int gfunc(int a, int b) {
    return a * b;
  }
  int lfunc(int a, int b) {
    return a + b;
  }
  int test(int a, int b) {
    return gfunc(a, b) +  lfunc(a, b);
  }
