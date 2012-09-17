/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The type parameters of a generic G are in scope in the bounds of all of
 * the type parameters of G. The type parameters of a generic class or interface
 * declaration G are also in scope in the extends and implements clauses of G
 * (if these exist) and in the non-static members of G.
 * @description Checks that type parameters are in scope in the non-static members of G
 * (if G is a class or interface declaration).
 * @author iefremov
 * @reviewer kaigorodov
 */

class A<N, S, U> {
  final List<U> field;
  
  A(N n, S s) : field = new List<U>() {
    Expect.isTrue(n is N);
    Expect.isTrue(s is S);
  }

  A.empty() : field = null{}
  
  factory A.f(S s) {
    Expect.isTrue(s is S);
    return new A.empty();
  }

  const A.c(U u, S s) : field = const [null];

  List<U> get getter {
    return field;
  }
  
  void set setter(S s){}
}

interface J<Aa, B>{}

interface I<H, C, K> extends J<C, K>
{ }


main() {
  new A<num, double, List>(1, 2.0);
  A a = new A<int, int, int>.f(1);
  const A<int, int, List>.c(const[], 1);

  var z = a.getter;
  a.setter = 1;
}
