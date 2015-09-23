#include "bindcpp.h"

void foo(int argc, const char** argv);

void bar(int argc, const char** argv) {
  foo(argc, argv);
}
