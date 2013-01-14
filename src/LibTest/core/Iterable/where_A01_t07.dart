/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * This method returns a view of the mapped elements. 
 * As long as the returned Iterable is not iterated over, the supplied function f will not be invoked. 
 * Iterating will not cache results, and thus iterating multiple times over the the returned Iterable 
 * will invoke the supplied function f multiple times on the same element.
 * @description Checks that this method returns correct collection for various predicates.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  List<int> list = new List<int>();
  
  for(int i = 0; i < 101; i++) {
    list.addLast(i - 50);
  }
  
  Iterable a = list.where((int element) {
    return element > 0;
  });
  Expect.isTrue(a.length == 50);
  Expect.listEquals(list.getRange(51, 50), new List.from(a));
  
  a = list.where((int element) {
    return element == 0;
  });
  Expect.isTrue(a.length == 1);
  Expect.isTrue(a.first == 0);
  
  a = list.where((int element) {
    return true;
  });
  Expect.isTrue(a.length == 101);
  Expect.listEquals(list, new List.from(a));
  
  a = list.where((int element) {
    return false;
  });
  Expect.isTrue(a.isEmpty);
}
