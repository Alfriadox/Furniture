/*
Nia Calia-Bogan 
April 25th, 2020
OpenSCAD 2019.05

List operation utilities.
*/

use <../BOSL/math.scad>;
use <verify.scad>;

// Reverse a list. If the argument is
// not a list, this returns undefined.
function reverse_list(l) = 
  !is_undef(verify_is_list(l))? 
    reverse(l): 
    undef;