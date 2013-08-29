/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Duration elapsed
 * Returns the elapsedTicks counter converted to a Duration.
 * @description Checks that the elapsed tick count does not change between
 *              invocations of stop() and start().
 * @author rodionov
 * @reviewer pagolubev
 */
import "../../../Utils/expect.dart";
 
main() {
  Stopwatch sw = new Stopwatch();
  final int LOTS_OF_REPS  = 1000000000; // long enough for the elapsed count to change
  final int FEWER_REPS    = 1000000; 
  int i, elapsed, e0;
  
  sw.start();
  for(i = 0; i < LOTS_OF_REPS; i++) {
    elapsed = sw.elapsed.inMicroseconds;
    if(sw.elapsed.inMicroseconds > 0) break;
  }
  sw.stop();
  Expect.isTrue(i < LOTS_OF_REPS, "Elapsed count of a started StopWatch didn't increase soon enough, last value: $elapsed");
  
  e0 = sw.elapsed.inMicroseconds;
  for(i = 0; i < FEWER_REPS; i++) {
    if(i % 100 == 0) {
      Expect.equals(e0, sw.elapsed.inMicroseconds);
    }
  }
}
