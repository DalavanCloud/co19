/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsKey(Object key)
 * Returns whether this map contains the given [key].
 * @description Checks that [null] key is not allowed
 * @author msyabro
 */
library containsKey_A01_t02;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  Expect.throws(() { map[null] = "not null"; });
}
