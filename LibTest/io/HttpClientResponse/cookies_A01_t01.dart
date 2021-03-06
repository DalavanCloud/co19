/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Cookie> cookies
 * Cookies set by the server (from the 'set-cookie' header).
 * @description Checks that this property returns cookies set by the server
 * (from the 'set-cookie' header)
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  asyncStart();
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.response.headers.set(HttpHeaders.setCookieHeader,
        "Lily-cookie=Lily-was-here");
    request.response.close();
    server.close();
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.equals(1, response.cookies.length);
    Expect.equals("Lily-cookie", response.cookies[0].name);
    Expect.equals("Lily-was-here", response.cookies[0].value);
    Expect.isNull(response.cookies[0].expires);
    asyncEnd();
  });
}

main() {
  test("get");
  test("head");
  test("delete");
  test("put");
  test("post");
  test("patch");
}
