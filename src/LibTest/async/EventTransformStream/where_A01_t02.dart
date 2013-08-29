/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> where(bool test(T event))
 * Creates a new stream from this stream that discards some data events.
 * The new stream sends the same error and done events as this stream, but it only
 * sends the data events that satisfy the test. 
 * @description Checks that the new stream sends the same error and done events as this stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
  void handleData(int event, EventSink<int> sink) {
    sink.add(event);
  }
}

void check(Iterable data, bool test(event)) {
  Stream s = new Stream.fromIterable(data)
    .map( (x) => x%2==0?x:throw new ArgumentError(x) );
  Stream ets=new EventTransformStream(s, new MyTransformer())
    .asBroadcastStream();
  List err1=new List();
  List err2=new List();

  Sync2 sync=new Sync2((err1, err2) {
    Expect.listEquals(err1, err2);
  });

  asyncStart();
  ets.listen((int value){},
    onError: (error) {
      sync.put1(error);
    },
    onDone:() {
      asyncEnd();
    }
  );
  asyncStart();
  ets.where(test).listen((int value){},
    onError: (error) {
      sync.put1(error);
    },
    onDone:() {
      asyncEnd();
    }
  );
}

main() {
  check(new Iterable.generate(10, (int index)=>index),
    (event)=>true
  );
}
