/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future firstWhere(bool test(T element), {Object defaultValue()})
 * If an error occurs, or if this stream ends without finding a match and with
 * no defaultValue function provided, the future will receive an error.
 * @description Checks that if an [test] throws error,  the future
 * will be completed with that error.
 * @author kaigorodov
 */
library firstWhere_A03_t03;
import "dart:async";
import "../../../Utils/async_utils.dart";

void test(CreateStreamFunction create) {
  Error expected = new Error();
  Stream s = create([1,2,3,4,5]);
  AsyncExpect.error(expected, s.firstWhere((v) => throw expected));
}