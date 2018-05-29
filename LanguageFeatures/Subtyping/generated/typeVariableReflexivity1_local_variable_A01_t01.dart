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
 * @description Check that if a type T0 is a type variable X0 and and T1 is X0,
 * then a type T0 is a subtype of a type T1.
 * @author ngl@unipro.ru
 */

import "../utils/common.dart";


class X0 {}
class S0 extends X0 {}
class C<T> {}


C<X0> t0Instance = new C<X0>();
C<X0> t1Instance = new C<X0>();





class LocalVariableTest {

  LocalVariableTest() {
    C<X0> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    C<X0> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    C<X0> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    C<X0> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  C<X0> t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
