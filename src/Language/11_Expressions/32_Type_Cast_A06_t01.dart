/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a cast expression e as T is the static type of e.
 * @description Checks that the static type of a cast expression e as T is 
 * the static type of e.
 * @author rodionov 
 * @reviewer iefremov
 */

main() {
  int x = 1 as num;
}