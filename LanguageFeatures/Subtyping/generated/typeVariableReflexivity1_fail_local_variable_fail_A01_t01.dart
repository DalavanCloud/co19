/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Type Variable Reflexivity 1: T0 is a type variable X0 or a promoted type
 * variables X0 & S0 and T1 is X0.
 * @description Check that if a type T0 is a type variable X0 and and T1 is a
 * promoted type variables S0, then a type T0 is not a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "../utils/common.dart";
import "../../../Utils/expect.dart";


class X0 {}
class S0 extends X0 {}
class C<T> {}


C<X0> t0Instance = new C<X0>();
C<S0> t1Instance = new C<S0>();





class LocalVariableTest {

  LocalVariableTest() {
    C<S0> t1 = null;
    t1 = forgetType(t0Instance);
  }

  LocalVariableTest.valid() {}

  static staticTest() {
    C<S0> t1 = null;
    t1 = forgetType(t0Instance);
  }

  test() {
    C<S0> t1 = null;
    t1 = forgetType(t0Instance);
  }
}

main() {
  bar () {
    C<S0> t1 = null;
    t1 = forgetType(t0Instance);
  }

  Expect.throws(() {
    C<S0> t1 = null;
    t1 = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    bar();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new LocalVariableTest();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new LocalVariableTest.valid().test();
  }, (e) => e is TypeError);

  Expect.throws(() {
    LocalVariableTest.staticTest();
  }, (e) => e is TypeError);
}
