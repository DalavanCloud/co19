/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion   Evaluation of e proceeds as follows:
 * First, the argument list (a1 , . . . , an , xn+1 : an+1 , . . . , xn+k : an+k )
 * is evaluated.
 * Then, if q is a non-factory constructor of an abstract class then an
 * AbstractClassInstantiationError is thrown.
 * If T is malformed or if T is a type variable a dynamic error occurs.
 * In checked mode, if T or any of its superclasses is malbounded a dynamic error occurs.
 * Otherwise, if q is not defined or not accessible, a NoSuchMethodError is thrown.
 * If q has less than n positional parameters or more than n required parameters,
 * or if q lacks any of the keyword parameters {xn+1 , . . . , xn+k },
 * a NoSuchMethodError is thrown.
 * @description  Checks that in checked mode, dynamic error occurs if T is
 * malbounded.
 * @static-warning
 * @author ilya
 */
import '../../../../Utils/dynamic_check.dart';
 
class C<T extends int> {}

main() {
  checkTypeError(() => new C<String>());
}
