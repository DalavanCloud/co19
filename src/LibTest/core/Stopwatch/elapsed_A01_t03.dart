/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Duration elapsed
 * Returns the elapsedTicks counter converted to a Duration.
 * @description Checks that this method returns 0 if the stopwatch has never been started.
 * @author rodionov
 * @reviewer pagolubev
 */
import "../../../Utils/expect.dart";
 
main() {
  Stopwatch sw = new Stopwatch();
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      Expect.equals(0, sw.elapsed. inMicroseconds);
    }
  }
}
