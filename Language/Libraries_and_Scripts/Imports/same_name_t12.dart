/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a name N is referenced by a library L and N is introduced into
 * the top level scope L by more than one import, and not all the imports denote
 * the same declaration, then:
 * - A static warning occurs.
 * - If N is referenced as a function, getter or setter, a NoSuchMethodError is raised.
 * - If N is referenced as a type, it is treated as a malformed type.
 * It is neither an error nor a warning if N is introduced by two or more imports
 * but never referred to.
 * @static-warning
 * @description Checks that it is a static type warning 
 * if two different libraries imported with empty prefixes introduce the same name 
 * to the top-level scope of L (one of them via re-export) and L uses it in an explicit type test.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "same_name_t11_p1_lib.dart";
import "same_name_t11_p2_lib.dart";

main() {
  try {
    1 is foo;
  } catch (anything) {
  }
}
