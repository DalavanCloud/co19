/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The public namespace of library L is the mapping that maps the simple
 * name of each public top level member m of L to m. The scope of a library L
 * consists of the names introduced by all top level declarations declared in L, and
 * the names added by L's imports (12.2).
 * @description Checks that the scope of a library L consist of the names introduced
 * by all top level declaration in L, and the names added by L's import.
 * @author vasya
 * @reviewer rodionov
 * @reviewer msyabro
 */

#import("12_Libraries_and_Scripts_A06_t01_lib.dart");

main() {
  test();
}
