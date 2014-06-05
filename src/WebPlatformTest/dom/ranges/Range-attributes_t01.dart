/*
 * after web-platform-tests/dom/ranges/Range-attributes.html
 *
 * @assertion Range attributes
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var r = new Range();
  assert_equals(r.startContainer, document);
  assert_equals(r.endContainer, document);
  assert_equals(r.startOffset, 0);
  assert_equals(r.endOffset, 0);
  assert_true(r.collapsed);
}