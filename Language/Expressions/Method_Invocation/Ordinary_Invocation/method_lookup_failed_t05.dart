/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the method lookup has failed, then let g be the result of
 * looking up getter m in vo with respect to L.
 * If the getter lookup succeeded, let vg be the value of the getter invocation o.m.
 * Then the value of i is the result of invoking the static method Function.apply()
 * with arguments v.g, [o1, ..., on], {xn+1:on+1, ..., xn+k:on+k }.
 * If getter lookup has also failed, then a new instance im of the predefined
 * class Invocation is created, such that :
 * - im.isMethod evaluates to true.
 * - im.memberName evaluates to ’m’.
 * - im.positionalArguments evaluates to an immutable list with the same values as [o1, ..., on].
 * - im.namedArguments evaluates to an immutable map with the same keys
 * and values as {xn+1: on+1, ..., xn+k:on+k}.
 * Then the method noSuchMethod() is looked up in o and invoked with argument im,
 * and the result of this invocation is the result of evaluating i.
 * @description Checks that noSuchMethod() is invoked if the method and getter lookup has failed.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

class TestException {
  const TestException();
}

class C {
  var te=const TestException();
  noSuchMethod(var im) {
    throw te;
  }
}

main()  {
  var o = new C();
  try {
    o.nonExistingMethod();
    Expect.fail("Exception is expected");
  } on TestException catch(e) {
    Expect.equals(o.te, e);
  }
}