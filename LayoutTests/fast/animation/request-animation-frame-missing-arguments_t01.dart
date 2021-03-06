/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test how animation methods react to too few arguments
 * @compile-error
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  shouldThrow(() => window.requestAnimationFrame());
  shouldThrow(() => window.cancelAnimationFrame());
}
