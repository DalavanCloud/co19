/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests intrinsic width values on flex-items.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../resources/check-layout.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      @import "$root/resources/width-keyword-classes.css";

      .container {
          border: 5px solid blue;
          width: 250px;
          height: 250px;
          display: -webkit-flex;
          display: flex;
      }
      .child {
          border: 5px solid pink;
          -webkit-flex: none;
          flex: none;
          display: -webkit-flex;
          display: flex;
      }
      .content {
          display: inline-block;
          width: 100px;
          height: 100px;
          background-color: salmon;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <!-- width tests -->
      <div class="container">
          <div class="child max-content" data-expected-width="210">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container">
          <div class="child min-content" data-expected-width="110">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container">
          <div class="child fit-content" data-expected-width="210">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container" style="width: 50px">
          <div class="child fit-content" data-expected-width="110">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container">
          <div class="child fill-available" data-expected-width="250">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <!-- min-width tests -->
      <div class="container">
          <div class="child min-width-max-content" style="width: 10px;" data-expected-width="210">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>
      <div class="container">
          <div class="child min-width-min-content" style="width: 10px;" data-expected-width="110">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container">
          <div class="child min-width-fit-content" style="width: 10px;" data-expected-width="210">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container" style="width: 50px">
          <div class="child min-width-fit-content" style="width: 10px;" data-expected-width="110">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container">
          <div class="child min-width-fill-available" style="width: 10px;" data-expected-width="250">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <!-- max-width tests -->
      <div class="container">
          <div class="child max-width-max-content" style="width: 1000px; min-width: 0;" data-expected-width="210">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container">
          <div class="child max-width-min-content" style="width: 1000px; min-width: 0;" data-expected-width="110">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container">
          <div class="child max-width-fit-content" style="width: 1000px; min-width: 0;" data-expected-width="210">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container" style="width: 50px">
          <div class="child max-width-fit-content" style="width: 1000px; min-width: 0;" data-expected-width="110">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>

      <div class="container">
          <div class="child max-width-fill-available" style="width: 1000px; min-width: 0;" data-expected-width="250">
              <div><div class="content"></div><div class="content"></div></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.container');
    asyncEnd();
  });
}
