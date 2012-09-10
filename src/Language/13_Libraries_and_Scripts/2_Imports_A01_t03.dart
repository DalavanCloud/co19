/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a library to be used in the scope of another library.
 * libraryImport:
 *   metadata import uri (as identifier)? combinator* (`&` export)? `;'
 * ;
 * combinator:
 *   show identifierList |
 *   hide identifierList
 * ;
 * identifierList:
 *   identifier (, identifier)*
 * @description Checks that it is a compile-time error when there's no whitespace
 * between the import keyword and the URI.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

import"2_Imports_lib.dart";

main() {
  try {
    someVar = 0;
  } catch(e) {}
}