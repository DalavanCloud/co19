/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test superclass members. Super constructor
 * named argument is tested.
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ArgumentsBindingSuper1_t02 {
  ArgumentsBindingSuper1_t02.named(@T1 value, {@T1 val2}) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02.c2(dynamic t1, @T0 t2) : super.named(t1, val2: t2) {}
}


main() {
  new ArgumentsBinding1_t02.c2(t1Instance, t0Instance);
}
