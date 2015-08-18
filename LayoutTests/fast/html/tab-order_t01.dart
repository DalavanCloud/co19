/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that the HTML4 tabbing order is respected properly.
 * @note tbd keyboard events
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  /*
  var body = document.body;

  body.setInnerHtml('''
    <p>This page tests that the <a href="http://www.w3.org/TR/html4/interact/forms.html#h-17.11.1" title="HTML4 tabbing order spec">HTML4 tabbing order</a> is respected properly.</p>
    <p>To test, put focus in &quot;a&quot;. Pressing Tab should focus &quot;a&quot; through &quot;k&quot; in order, and pressing Shift-Tab should reverse the order.</p>

    <input tabindex="6" value="g"><br>
    <input tabindex="1" value="a"><br>
    <input tabindex="-5" value="not in tab order (negative tabindex)"><br>
    <input tabindex="1" value="b"><br>
    <input tabindex="0" value="i"><br>
    <input tabindex="6" value="h"><br>
    <input tabindex="1" value="c"><br>
    <input tabindex="1" value="d"><br>
    <input tabindex="0" value="j"><br>
    <input tabindex="-1" value="not in tab order (negative tabindex)"><br>
    <input tabindex="0" value="k"><br>
    <input tabindex="4" value="f"><br>
    <input tabindex="3" value="e"><br>

    <pre id="log"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  function log(msg)
  {
    document.getElementById('log').append(new Text(msg + '\n'));
  }

  function description(element)
  {
    if (element.tagName && element.tagName.contains(new RegExp('input',  caseSensitive: false))) {
      return '<input value="' + element.value + '" tabindex="' + element.tabIndex + '">';
    } else {
      return element.toString();
    }
  }

  function dispatchTabPress(element, shiftKey)
  { /*
    var event = document.createEvent('KeyboardEvents');
    var tabKeyIdentifier = 'U+0009';
    event.initKeyboardEvent('keydown', true, true, document.defaultView, tabKeyIdentifier, 0, false, false, shiftKey, false, false);
    element.dispatchEvent(event);
    */
  }

  var lastFocusedElement = null;
  function focusListener(event)
  {
    log('<input value="' + event.target.value + '" tabindex="' + event.target.tabIndex + '"> focused');
    lastFocusedElement = event.target;
  }

  function addEventListenersToInputs(inputs)
  {
    for (var i = 0; i < inputs.length; ++i) {
      inputs[i].addEventListener('focus', focusListener, false);
    }
  }

  function test()
  {
    var inputs = document.getElementsByTagName('input');

    // Put focus in the page
    inputs[0].focus();
    inputs[0].blur();

    addEventListenersToInputs(inputs);

    log('Tabbing forward....\n');
    for (var i = 0; i < inputs.length; ++i) {
      if (inputs[i].tabIndex >= 0)
        dispatchTabPress(document, false);
    }

    lastFocusedElement.blur();

    log('\nTabbing backward....\n');
    for (var i = 0; i < inputs.length; ++i) {
      if (inputs[i].tabIndex >= 0)
        dispatchTabPress(document, true);
    }

    log('\nTest finished\n');
  }

  test();
  */
}
