/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Interface Compositionality: T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui
 * @description Check that if type T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui then instance of
 * T0 can be assigned to the T1 variable.
 * @author sgrekhov@unipro.ru
 */

import "../utils/common.dart";

abstract class U0 {}
abstract class U1 {}
abstract class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends U1 {}
abstract class S2 extends U2 {}

class C0<X, Y, Z> {}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();
C0<U0, U1, U2> t1Instance = new C0<U0, U1, U2>();




class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = forgetType(t0Instance);
  }

  foo() {
    t1Instance = forgetType(t0Instance);
  }

  static test() {
    t1Instance = forgetType(t0Instance);
  }
}

main() {
  bar () {
    t1Instance = forgetType(t0Instance);
  }

  t1Instance = forgetType(t0Instance);
  bar();
  GlobalVariableTest t = new GlobalVariableTest();
  t.foo();
  GlobalVariableTest.test();
}