/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The instance getters of a class C are those instance getters
 * declared by C, either implicitly or explicitly, and the instance getters
 * inherited by C from its superclass. The static getters of a class C are those
 * static getters declared by C.
 * A getter declaration may conflict with other declarations (10.11).
 * Let C be a class. It is a compile-time error if C declares a
 * • constructor named C.n and a static member with basename n.
 * • getter or a setter with basename n, and has a method named n.
 * • method named n, and has a getter or a setter with basename n.
 * • static member with basename n, and has an instance member with basename n.
 *
 * @description Checks that a compile error is arisen if a class has a declared
 * static setter and an inherited implicitly declared instance setter with the
 * same name.
 * @compile-error
 * @author ngl@unipro.ru
 */

class A {
  int v = 5;
}

class C extends A {
  static int n;
  static set v(int v1) {
    n = v1;
  }
}

main() {
  new C().v;
}
