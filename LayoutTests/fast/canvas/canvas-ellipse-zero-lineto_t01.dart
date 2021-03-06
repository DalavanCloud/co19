/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests checks that ellipse can draw lines correctly in edge
 * cases.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="mycanvas" width="400" height="400"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');

  var zero = 0;
  ctx.lineWidth = 5;
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.strokeStyle = 'rgb(0, 0, 0)';
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  var imageData = ctx.getImageData(1, 1, 1, 1);
  shouldBe(imageData.data[1], 255);

  ctx.save();
  debug("moveTo + empty ellipse (swing == 0)");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.moveTo(20, 0);
  ctx.ellipse(80, 0, 10, 20, Math.pi / 6, -Math.pi / 2, -Math.pi / 2 + zero, false);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(23, 29, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(85, 14, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug("moveTo + empty ellipse (radiusX == 0)");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.moveTo(20, 0);
  ctx.ellipse(80, 0, zero, 20, Math.pi / 6, -Math.pi / 2, Math.pi / 2, false);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(22, 60, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(86, 43, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(71, 73, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug("moveTo + empty ellipse (radiusY == 0)");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.moveTo(20, 0);
  ctx.ellipse(80, 0, 10, zero, Math.pi / 6, -Math.pi / 2, Math.pi / 2, false);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(22, 90, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(79, 90, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(87, 94, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug("empty ellipse (swing == 0) + lineTo");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.ellipse(20, 0, 10, 20, Math.pi / 6, -Math.pi / 2, -Math.pi / 2 + zero, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(26, 101, 1, 1);
  shouldBe(imageData.data[1], 255);
  imageData = ctx.getImageData(32, 103, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(77, 119, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug("empty ellipse (radiusX == 0) + lineTo");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.ellipse(20, 0, zero, 20, Math.pi / 6, -Math.pi / 2, Math.pi / 2, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(28, 135, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(11, 166, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(76, 151, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug("empty ellipse (radiusY == 0) + lineTo");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.ellipse(20, 0, 10, zero, Math.pi / 6, -Math.pi / 2, Math.pi / 2, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(27, 183, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(21, 179, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(77, 180, 1, 1);
  shouldBe(imageData.data[1], 0);

  ctx.restore();

  ctx.translate(100, 0);
  ctx.save();
  debug("lineTo + empty ellipse (radiusX == 0) + lineTo");
  debug(" 1. sweepAngle < PI / 2");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, zero, 20, Math.pi / 6, -Math.pi / 4, Math.pi / 4, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(110, 29, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(122, 22, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(113, 42, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(144, 38, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug(" 2. sweepAngle < PI");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, zero, 20, Math.pi / 6, -Math.pi / 4, Math.pi / 2, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(122, 54, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(112, 76, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(142, 70, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug(" 3. sweepAngle < 2PI");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, zero, 20, Math.pi / 6, -Math.pi / 4, Math.pi * 3 / 2, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(115, 86, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(110, 104, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(138, 77, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug(" 4. sweepAngle < 4PI");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, zero, 20, Math.pi / 6, -Math.pi / 4, Math.pi * 2, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(115, 116, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(111, 136, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(127, 106, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(127, 121, 1, 1);
  shouldBe(imageData.data[1], 255);

  debug(" 5. sweepAngle > 4PI");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, zero, 20, Math.pi / 6, -Math.pi / 4, Math.pi * 16, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(115, 146, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(111, 166, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(127, 136, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(127, 151, 1, 1);
  shouldBe(imageData.data[1], 255);

  ctx.restore();

  ctx.translate(100, 0);
  ctx.save();
  debug("lineTo + empty ellipse (radiusY == 0) + lineTo");
  debug(" 1. sweepAngle < PI / 2");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, 20, zero, Math.pi / 6, -Math.pi / 4, Math.pi / 4, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(213, 32, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(234, 39, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(240, 36, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug(" 2. sweepAngle < PI");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, 20, zero, Math.pi / 6, -Math.pi / 4, Math.pi / 2, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(232, 69, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(238, 72, 1, 1);
  shouldBe(imageData.data[1], 255);
  imageData = ctx.getImageData(228, 65, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(242, 61, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug(" 3. sweepAngle < 2PI");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, 20, zero, Math.pi / 6, -Math.pi / 4, Math.pi * 3 / 2, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(204, 82, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(234, 100, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(212, 92, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(240, 90, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug(" 4. sweepAngle < 4PI");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, 20, zero, Math.pi / 6, -Math.pi / 4, Math.pi * 2, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(208, 114, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(235, 130, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(210, 120, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(252, 124, 1, 1);
  shouldBe(imageData.data[1], 0);

  debug(" 5. sweepAngle > 4PI");
  ctx.translate(0, 30);
  ctx.save();
  ctx.beginPath();
  ctx.lineTo(10, 0);
  ctx.ellipse(20, 0, 20, zero, Math.pi / 6, -Math.pi / 4, Math.pi * 16, false);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  imageData = ctx.getImageData(208, 144, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(235, 160, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(210, 150, 1, 1);
  shouldBe(imageData.data[1], 0);
  imageData = ctx.getImageData(252, 154, 1, 1);
  shouldBe(imageData.data[1], 0);
}
