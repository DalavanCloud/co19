/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a fixed size list of the given length.
 * @description Checks that created list does not allow operations affecting list size.
 * @author varlax
 * @reviewer msyabro
 */

check(List l) {
  try {
    l.clear();
    Expect.fail("UnsupportedError expected");
  } on UnsupportedError catch(ok) {}

  try {
    l.length = 123;
    Expect.fail("UnsupportedError expected");
  } on UnsupportedError catch(ok) {}

  try {
    l.add(null);
    Expect.fail("UnsupportedError expected");
  } on UnsupportedError catch(ok) {}

  try {
    l.removeLast();
    Expect.fail("UnsupportedError expected");
  } on UnsupportedError catch(ok) {}

  try {
    l.insertRange(0,1);
    Expect.fail("UnsupportedError expected");
  } on UnsupportedError catch(ok) {}

  try {
    l.removeRange(0,1);
    Expect.fail("UnsupportedError expected");
  } on UnsupportedError catch(ok) {}

}

main() {
  check(new List<String>(0));
  check(new List(10));
}
