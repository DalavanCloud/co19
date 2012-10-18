/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the square root of a double value.
 * @description Checks special values.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.sqrt(double.NAN).isNaN());
  Expect.equals(double.INFINITY, Math.sqrt(double.INFINITY));
  Expect.isTrue(Math.sqrt(double.NEGATIVE_INFINITY).isNaN());
  Expect.equals(.0, Math.sqrt(0.0));
  Expect.equals(.0, Math.sqrt(-0.0));
}