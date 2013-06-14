/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Timer.periodic(Duration duration, void callback(Timer timer))
 * A negative duration is treated similar to a duration of 0.
 * @description Checks that negative duration is treated similar to a duration of 0.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(int delay) {
  int times=5;
  int count=0;
  asyncStart();
  Timer timer=new Timer.periodic(durationMs(delay), (Timer timer) {
    count++;
    if (count==times) {
      timer.cancel();
      asyncEnd();
    }
  });
  
  asyncStart();
  new Timer(durationMs(10), () {
    Expect.equals(count, times);
    asyncEnd();
  });

}
main() {
  check(0);
  check(-1);
  check(-10);
}

