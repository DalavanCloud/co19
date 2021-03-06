/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 and T0 are both Object then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from reflexivity_A03.dart and 
 * arguments_binding_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



Object t0Instance = new Object();
Object t1Instance = new Object();




namedArgumentsFunc1(Object t1, {Object t2}) {}
positionalArgumentsFunc1(Object t1, [Object t2]) {}

namedArgumentsFunc2<X>(X t1, {X t2}) {}
positionalArgumentsFunc2<X>(X t1, [X t2]) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass(Object t1) {}

  ArgumentsBindingClass.named(Object t1, {Object t2}) {}
  ArgumentsBindingClass.positional(Object t1, [Object t2]) {}

  factory ArgumentsBindingClass.fNamed(Object t1, {Object t2}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional(Object t1, [Object t2]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod(Object t1, {Object t2}) {}
  static positionalArgumentsStaticMethod(Object t1, [Object t2]) {}

  namedArgumentsMethod(Object t1, {Object t2}) {}
  positionalArgumentsMethod(Object t1, [Object t2]) {}

  set testSetter(Object val) {}
}

class ArgumentsBindingGen<X>  {
  ArgumentsBindingGen(X t1) {}

  ArgumentsBindingGen.named(X t1, {X t2}) {}
  ArgumentsBindingGen.positional(X t1, [X t2]) {}

  factory ArgumentsBindingGen.fNamed(X t1, {X t2}) {
    return new ArgumentsBindingGen.named(t1, t2: t2);
  }
  factory ArgumentsBindingGen.fPositional(X t1, [X t2]) {
    return new ArgumentsBindingGen.positional(t1, t2);
  }

  namedArgumentsMethod(X t1, {X t2}) {}
  positionalArgumentsMethod(X t1, [X t2]){}

  set testSetter(X val) {}
}

main() {
  // test functions
  namedArgumentsFunc1(t0Instance, t2: t0Instance);
  positionalArgumentsFunc1(t0Instance, t0Instance);

  // test class constructors
  ArgumentsBindingClass instance1 = new ArgumentsBindingClass(t0Instance);
  instance1 = new ArgumentsBindingClass.fNamed(t0Instance, t2: t0Instance);
  instance1 = new ArgumentsBindingClass.fPositional(t0Instance, t0Instance);
  instance1 = new ArgumentsBindingClass.named(t0Instance, t2: t0Instance);
  instance1 = new ArgumentsBindingClass.positional(t0Instance, t0Instance);

  // tests methods and setters
  instance1.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance1.positionalArgumentsMethod(t0Instance, t0Instance);
  instance1.testSetter = t0Instance;

  // test static methods
  ArgumentsBindingClass.namedArgumentsStaticMethod(t0Instance, t2: t0Instance);
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t0Instance, t0Instance);

  // Test type parameters

  //# <-- NotGenericFunctionType
  // test generic functions
  namedArgumentsFunc2<Object>(t0Instance, t2: t0Instance);
  positionalArgumentsFunc2<Object>(t0Instance, t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<Object> instance2 = new ArgumentsBindingGen<Object>(t0Instance);
  instance2 = new ArgumentsBindingGen<Object>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<Object>.fPositional(t0Instance, t0Instance);
  instance2 = new ArgumentsBindingGen<Object>.named(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<Object>.positional(t0Instance, t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.positionalArgumentsMethod(t0Instance, t0Instance);
  instance2.testSetter = t0Instance;
  //# -->
}
