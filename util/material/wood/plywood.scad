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

// Generic plywood material. 
// Renders 'tan' color.
module GenericPlywood(
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
  if (bom) Bom("GENERIC PLYWOOD", [width, length, depth]);
  color("tan") 
  cube([width, length, depth], center=false);
}