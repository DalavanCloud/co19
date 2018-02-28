/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<T> lastWhere (
 *     bool test(T element), {
 *     dynamic defaultValue(),
 *     T orElse()
 * })
 * Finds the last element in this stream matching test.
 *
 * As firstWhere, except that the last matching element is found. That means
 * that the result cannot be provided before this stream is done.
 *
 * @description Checks that method [lastWhere] returns Future that is completed
 * with the first element of this stream that test returns true for and this
 * stream is closed.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(test, expected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Future fValue = bcs.lastWhere(test);
      fValue.then((value) {
        Expect.equals(expected, value);
      }).whenComplete(() {
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        receiver.receive();
        receiver.close();
      });
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.WRITE, RawSocketEvent.WRITE);
  check((e) => e != RawSocketEvent.READ, RawSocketEvent.CLOSED);
  check((e) => e != RawSocketEvent.CLOSED, RawSocketEvent.WRITE);
  check((e) => e != RawSocketEvent.WRITE, RawSocketEvent.CLOSED);
  check((e) => e is RawSocketEvent, RawSocketEvent.CLOSED);
  check((e) => true, RawSocketEvent.CLOSED);
}
