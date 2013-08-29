/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSubscription<T> listen(void onData(T event), {void onError(error), void onDone(), bool cancelOnError})
 * On errors from this stream, the onError handler is given a object describing the error.
 * @description Checks that the onError handler is given a object describing the error.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer {
  void handleData(var event, EventSink<int> sink) {
     throw new ArgumentError(event);
  }
}

void check(List data) {
  Stream s1=new Stream.fromIterable(data);

  // make a Stream with only error events
  EventTransformStream s2=new EventTransformStream(s1, new MyTransformer());

  List sink=new List();
  asyncStart();
  s2.listen((var event) {
      Expect.fail("unexpected call to onData($event)");
    },
    onError:(Object error) {
       sink.add(error.message);
    },
    onDone:() {
      Expect.listEquals(data, sink);
      asyncEnd();
    }
  );
}

main() {
  check([]);
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
