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

FOUNDATION_EXPORT void logCallStacksToFile(NSString *filepath) {
  NSArray *stacks = symbolicatedCallStacks();

  NSString* contents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];
  contents = (contents) ? [contents stringByAppendingString:[stacks description]] : [stacks description];

  [contents writeToFile:filepath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}