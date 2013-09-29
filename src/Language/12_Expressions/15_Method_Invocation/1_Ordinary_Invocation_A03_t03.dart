/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The result of a lookup of method m in class C with respect to library L is:
 * If C declares a concreate instance method named m that is accessible to L, then that
 * method is the result of the lookup. Otherwise, if C has a superclass S, then
 * the result of the lookup is the result of looking up m in S with respect to L.
 * Otherwise, we say that the method lookup has failed.
 * @description Checks that if C declares an abstract instance method named m
 * and has no superclass, the lookup has failed.
 * @author ilya
 */

class S {
  int m();
}

main()  {
  Expect.throws(() => new S().m());
}