/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A try statement try s1 catch1...catchn finally sf defines an exception
 * handler h that executes as follows:
 * The catch clauses are examined in order, starting with catch1, until either
 * a catch clause that matches the current exception (11.14) is found, or the list
 * of catch clauses has been exhausted. If a catch clause catchk is found, then
 * pk1 is bound to the current exception, pk2, if declared, is bound to the current stack trace
 * (11.14), and then catchk is executed. If no catch clause is found, the finally
 * clause is executed. Then, execution resumes at the end of the try statement.
 * A finally clause "finally s" defines an exception handler h that executes by
 * executing the finally clause. Then, execution resumes at the end of the try
 * statement.
 * Execution of a catch clause "catch (p1, p2) s" of a try statement t proceeds as follows: 
 * The statement s is executed in the dynamic scope of the exception
 * handler defined by the finally clause of t. Then, the current exception and
 * current stack trace both become undefined.
 * Execution of a finally clause "finally s" of a try statement proceeds as follows:
 * The statement s is executed. Then, if the current exception is defined,
 * control is transferred to the nearest dynamically enclosing exception handler.
 * Execution of a try statement of the form "try s1 catch1...catchn finally sf;"
 * proceeds as follows:
 * The statement s1 is executed in the dynamic scope of the exception handler
 * defined by the try statement. Then, the finally clause is executed.
 * @description Checks that when another exception is raised in a catch clause,
 * the finally clause of the same try statement is still executed, other catch clauses
 * of that try statement aren't, and control is transferred to the nearest enclosing
 * exception handler afterwards.
 * @author rodionov
 * @reviewer iefremov
 * @note issue 430
 */

void main() {
  bool flag = false;
  
  var exStr = "foo", exInt = 2;
  try {
    try {
      throw exStr;
    } catch(String s) {
      throw exInt;
    } catch(int i) {
      Expect.fail("This code shouldn't be executed");
    } catch(var v) {
      Expect.fail("This code shouldn't be executed");
    } finally {
      flag = true;
    }
  } catch (int ok) {
    Expect.equals(exInt, ok);
  }

  Expect.isTrue(flag);
}
