/*
Nia Calia-Bogan
April 26th, 2020
OpenSCAD 2019.05

BOM (Bill Of Materials) utility functions.
*/

use <verify.scad>;

// Format message with preceding BOM tag. Return undef and warn
// in console if argument is not a string.
function bom(msg) = !is_undef(verify_is_str(msg))?
  str("BOM: ", msg):
  echo(str("BOM WARNING: MESSAGE IS NOT STRING: ", msg)) undef;
  
// Module to make a call to the bom function. Supports units 
// as a string argument, and an amount that is any of a string,
// list, or number. Material must be a string.
module Bom(material, amount, units=undef) {
  AssertIsString(material);
  AssertNotUndef(amount);
  if (!is_undef(units)) AssertIsString(units);
  
  u = is_undef(units)? "in." : units;
  
  assert(is_string(amount) || is_list(amount) || is_num(amount), 
    "BOM AMOUNT UNSUPPORTED TYPE");
  
  if (is_string(amount)) 
    echo(bom(str(material, ": ", amount)));
  
  if (is_list(amount))
      echo(bom(str(material, ": ", 
        str([for (d = amount) str(d, " ", u)]))));
          
  if (is_num(amount)) 
    echo(bom(str(material, ": ", amount, " ", u)));
}
