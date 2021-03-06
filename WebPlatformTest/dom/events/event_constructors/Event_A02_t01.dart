/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/dom/events/Event-constructors.html
 */

import 'dart:html';
import "../../../../Utils/expect.dart";

void check(String t, bool canBubble, bool cancelable) {
  Event ev=new Event(t, canBubble: canBubble, cancelable: cancelable);
  Expect.equals(ev.bubbles, canBubble);
  Expect.equals(ev.cancelable, cancelable);
}

void main() {
  check("ff", false, false);
  check("ft", false, true);
  check("tf", true, false);
  check("tt", true, true);
}
