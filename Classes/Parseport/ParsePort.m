//
//  ParsePort.m
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Stevie Graham
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "ParsePort.h"
#import <objc/runtime.h>

@implementation ParsePort

+(void)useURL:(NSURL *)url {
  Class  class          = NSClassFromString(@"PF_AFHTTPClient");
  SEL    selector       = NSSelectorFromString(@"initWithBaseURL:");
  Method method         = class_getInstanceMethod(class, selector);
  IMP    implementation = method_getImplementation(method);

  id (^block)(id, NSURL *) = ^(id _self, NSURL * _) {
    return implementation(_self, selector, url);
  };

  IMP initializer = imp_implementationWithBlock(block);
  method_setImplementation(method, initializer);
}
@end

