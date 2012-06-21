/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for statement of the form for (finalConstVarOrType? id in e) s is equivalent to
 * the the following code:
 * var n0 = e.iterator(); while (n0.hasNext()) { finalConstVarOrType? id = n0.next();
 * s } where n0 is an identifier that does not occur anywhere in the program.
 * @description Checks that [NullPointerException] is thrown when e is null. 
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  List l;
  try {
    for ( var id in l ) {
    }
    Expect.fail("NullPointerException expected when calling for statement");
  } catch(NullPointerException ok) {}   

  try {
    for ( final id in l ) {
    }
    Expect.fail("NullPointerException expected when calling for statement");
  } catch(NullPointerException ok) {}   

  try {
    for ( Dynamic id in l ) {
    }
    Expect.fail("NullPointerException expected when calling for statement");
  } catch(NullPointerException ok) {}   

  try {
    for ( const id in l ) {
    }
    Expect.fail("NullPointerException expected when calling for statement");
  } catch(NullPointerException ok) {}   

  try {
    var id;
    for ( id in l ) {
    }
    Expect.fail("NullPointerException expected when calling for statement");
  } catch(NullPointerException ok) {}   
}
