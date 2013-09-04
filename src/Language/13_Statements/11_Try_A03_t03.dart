/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if T is a malformed type.
 * @description Checks that it is a static warning when type of the exception
 * parameter in a catch clause does not denote a type available in the lexical 
 * scope of the catch clause.
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 * @issue 7291
 */
import "../../Utils/expect.dart";

import "11_Try_lib.dart" as p; // class Foo declared here

main() {
  try {
    throw new p.Foo();
    Expect.fail("This code shouldn't be executed");
  } on p.Foo catch(ok) {
  } on Foo catch (p1, p2) { /// static type warning no such type
    Expect.fail("This code shouldn't be executed");
  }
}
