/*
Nia Calia-Bogan
April 25th, 2020
OpenSCAD 2019.05

Plywood material definition.
All units are in inches, unless otherwise stated.

*/

use <../../version.scad>;
use <../../verify.scad>;
use <../../bom.scad>;

// Plywood material. Comes in rectangles, so is only 
// instantiable in rectangles. Renders 'tan' color.
module Plywood(
  width,  // width / x delta of the plywood.
  length, // length / y delta of the plywood.
  depth,  // depth / z delta of the plywood.
  bom = true // echo plywood info.
) {
  // Version check.
  VersionCheck201905OrHigher();
  // Argument checking.
  AssertIsNum(width);
  AssertIsNum(length);
  AssertIsNum(depth);
  AssertIsBool(bom);
  if (bom) Bom("PLYWOOD", [width, length, depth]);
  color("tan") 
  cube([width, length, depth], center=false);
}