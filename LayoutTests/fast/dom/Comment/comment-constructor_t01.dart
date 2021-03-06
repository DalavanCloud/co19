/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that Comment is constructable.
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  Expect.equals("one", new Comment("one").data);
  Expect.equals("", new Comment().data);
  Expect.equals(document, new Comment("two").ownerDocument);
}
