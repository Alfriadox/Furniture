/*
Nia Calia-Bogan
April 25th 2020
OpenSCAD 2019.05

Verification functions.
*/

// Warn if the argument is not a list. 
// Will return undefined if the argument is not a list.
function verify_is_list(l) = is_list(l) ? l : echo(str(
  "VERIFICATION WARNING: ARGUMENT IS NOT LIST: ", l));
    
// Warn if the argument is not a number.
// Will return undefined if the argument is not a number.
function verify_is_num(n) = is_num(n)? n : echo(str(
  "VERIFICATION WARNING: ARGUMENT IS NOT NUM: ", n));

// Warn if the argument is not a string.
// Will return undefined if the argument is not a string.
function verify_is_str(s) = is_string(s)? s : echo(str(
  "VERIFICATION WARNING: ARGUMENT IS NOT STRING: ", s));

// Warn if the argument is not a boolean.
// Will return undefined if the argument is not a boolean.
function verify_is_bool(b) = is_bool(b)? b : echo(str(
  "VERIFICATION WARNING: ARGUMENT IS NOT BOOL: ", b));

// Crash if the argument is not a list.
module AssertIsList(l) {
  assert(is_list(l), "ARGUMENT WAS NOT LIST");
}

// Crash if the argument is not a number.
module AssertIsNum(n) {
  assert(is_num(n), "ARGUMENT WAS NOT NUMBER");
}

// Crash if the argument is not a string.
module AssertIsString(s) {
  assert(is_string(s), "ARGUMENT WAS NOT STRING");
}

// Crash if the argument is not a boolean.
module AssertIsBool(b) {
  assert(is_bool(b), "ARGUMENT WAS NOT BOOLEAN");
}

// Crash if the argument is undefined.
module AssertNotUndef(a) {
  assert(!is_undef(a), "ARGUMENT WAS UNDEFINED");
}