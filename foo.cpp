#include "docopt.h"

#include <iostream>
#include <map>

static const char USAGE[] =
R"(prog.

    Usage:
      naval_fate (-h | --help)

    Options:
      -h --help     Show this screen.
)";

extern "C" void foo(int argc, const char** argv) {
  std::map<std::string, docopt::value> args
      = docopt::docopt(USAGE,
                       { argv + 1, argv + argc },
                       true);

  for(auto const& arg : args) {
      std::cout << arg.first <<  arg.second << std::endl;
  }
}
