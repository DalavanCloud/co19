/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a library to be used in the scope of another library.
 * libraryImport:
 *   `#import' `(' stringLiteral
 *     (`, ' `export:' (true | false))? 
 *     (`, ' combinator)* 
 *     (`, ' `prefix:' stringLiteral)? `)' `;'
 * ;
 * combinator:
 *   `show:' listLiteral |
 *   `hide:' listLiteral
 * ;
 * @description Checks that it is not a compile-time error if there's more than one show 
 * or hide combinator in an import directive.
 * @author rodionov
 * @needsreview issue 3350
 */

#import("2_Imports_lib.dart", show: [], hide: ["foo"], show: ["foo"], prefix: "lib");

main() {
  Expect.equals(1, lib.foo);
}
