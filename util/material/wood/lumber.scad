/*
Nia Calia-Bogan
April 26th, 2020
OpenSCAD 2019.05

Wood material library.
Useful for wood working projects.
All units are assumed to be inches 
unless indicated otherwise.
*/


use <../../version.scad>;
use <../../verify.scad>;
use <../../bom.scad>;

include <../../../BOSL/constants.scad>;
use <../../../BOSL/masks.scad>;
use <../../../BOSL/transforms.scad>;

// Generic nonstandard Lumber. 
// Renders 'wheat' color.
module GenericLumber(
  width,  // width / x of the lumber in inches
  length, // length / y of the lumber in inches
  depth, // depth / z of the lumber in inches
  bom = true // BOM switch
) {
  // Version check.
  VersionCheck201905OrHigher();
  // Argument checking.
  AssertIsNum(width);
  AssertIsNum(length);
  AssertIsNum(depth);
  AssertIsBool(bom);
  if (bom) 
    Bom("GENERIC LUMBER", [depth, width, length]);
  
  // Wood tends to be slightly rounded when store 
  // bought.
  fillet_size = 0.1;
  
  color("wheat")
  difference() {
    cube([width, length, depth], center=false);
    // do roundover
    grid3d(
      xa = [0:width:width],
      za = [0:depth:depth]
    )
    fillet_mask(
      l=length, 
      r=fillet_size, 
      orient=ORIENT_Y, 
      align=V_BACK);
  }
}

// Below are standard lumber sizes.

// internal lumber module, used for 
// code simplification.
module _L(width, length, depth, material, bom) {
  // Version check.
  VersionCheck201905OrHigher();
  // Argument checking.
  AssertIsNum(length);
  AssertIsNum(width);
  AssertIsNum(depth);
  AssertIsString(material);
  AssertIsBool(bom);
  if (bom) Bom(material, length);
  GenericLumber(width, length, depth, false);
}

// 1 by 4. Actual size: 0.75" by 3.5"
module Lumber1x4(length, bom=true) {
  _L(3.5, length, 0.75, "1x4 LUMBER", bom);
}

// 1 by 6. Actual size: 0.75" by 5.5"
module Lumber1x6(length, bom=true) {
  _L(5.5, length, 0.75, "1x6 LUMBER", bom);
}

// 2 by 2. Actual size: 1.5" by 1.5"
module Lumber2x2(length, bom=true) {
  _L(1.5, length, 1.5, "2x2 LUMBER", bom);
}

// 2 by 4. Actual size: 1.5" by 3.5"
module Lumber2x4(length, bom=true) {
  _L(3.5, length, 1.5, "2x4 LUMBER", bom);
}

// 2 by 6. Actual size: 1.5" by 5.5"
module Lumber2x6(length, bom=true) {
  _L(5.5, length, 1.5, "2x6 LUMBER", bom);
}

// 2 by 8. Actual size: 1.5" by 7.25"
module Lumber2x8(length, bom=true) {
  _L(7.25, length, 1.5, "2x8 LUMBER", bom);
}

// 2 by 10. Actual size: 1.5" by 9.25"
module Lumber2x10(length, bom=true) {
  _L(9.25, length, 1.5, "2x10 LUMBER", bom);
}

// 4 by 4. Actual size: 3.5" by 3.5"
module Lumber4x4(length, bom=true) {
  _L(3.5, length, 3.5, "4x4 LUMBER", bom);
}