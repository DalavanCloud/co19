/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(AsyncError asyncError)})
 * If the invoked callback returns a Future f2 then f and f2 are chained.
 * That is, f is completed with the completion value of f2.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  
  Completer completer2 = new Completer();
  Future f2 = completer.future;

  Future f1=f.then((fValue) {
    return f2;
  });

  completer.complete(2);
  
  int res=null;
  AsyncError err=null;
  f2.then(     (int fValue) {res = fValue;}, 
     onError: (AsyncError e){err = e;});
     
  runLater((){
    Expect.equals(2, res);
    Expect.equals(null, err);
  });
}
