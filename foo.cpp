#include <iostream>

extern "C" void foo(void) {
  std::cout << "FOO!" << std::endl;
}
