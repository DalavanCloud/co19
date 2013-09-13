/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream()
 * Returns a multi-subscription stream that produces the same events as this.
 * If this stream is single-subscription, return a new stream that allows multiple subscribers.
 * It will subscribe to this stream when its first subscriber is added,
 * and unsubscribe again when the last subscription is canceled.
 * @description Checks that if this stream is single-subscription,
 * returned stream is ideed a broadcast stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

main() {
  Stream s0=new Stream.fromIterable([]);
  MyTransformer t=new MyTransformer();
  EventTransformStream s1=new EventTransformStream(s0, t);
  Stream s2=s1.asBroadcastStream();
  Stream s3=s2.asBroadcastStream();
  
  Expect.isFalse(s1.isBroadcast);
  Expect.isTrue(s2.isBroadcast);
  Expect.isTrue(s3.isBroadcast);
}

