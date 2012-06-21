/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a lexically visible declaration named assert is in scope, an assert statement
 * assert(e); is interpreted as an expression statement (assert(e));.
 * @description Checks that a function declaration named assert with fewer or more than 1 required
 * parameter still shadows the assert statement, even when the latter is used with no arguments.
 * @author rodionov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    {
      bool flag = false;
      void assert() {flag = true;}

      assert();
      Expect.isTrue(flag);
    }
   
    print("ok!");
  }
}
