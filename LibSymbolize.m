#include <dlfcn.h>
#include <mach/mach.h>
#import "CoreSymbolication.h"
#import "Public/LibSymbolize.h"

FOUNDATION_EXPORT NSArray * symbolicatedCallStacks() {
  NSArray *callStackSymbols = [NSThread callStackSymbols];
  NSArray *callStackReturnAddresses = [NSThread callStackReturnAddresses];

  NSArray *symbolicatedCallStacks = symbolicatedStackSymbols(callStackSymbols, callStackReturnAddresses);

  return symbolicatedCallStacks;
}