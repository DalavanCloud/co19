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
 * after web-platform-tests/html/dom/elements/global-attributes/id-name.html
 * @assertion http://www.whatwg.org/html5/#the-id-attribute
 * @description id and name attributes and getElementById
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<div name="abcd"></div>
<p name="abcd" id="abcd"></p>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  assert_equals(document.getElementById("abcd").nodeName, "P");
  assert_equals(document.getElementById("abcd").localName, "p");
}
