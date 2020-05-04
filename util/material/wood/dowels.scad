/*
Nia Calia-Bogan
May 2, 2020
OpenSCAD 2019.05

Wood dowel modules.
*/

use <../../bom.scad>;
use <../../verify.scad>;
use <../../version.scad>;

use <../../../BOSL/shapes.scad>;


// A generic dowel.
module GenericDowel(
  diameter, // diameter of the dowel.
  length, // length of the dowel
  ch_size, // chamfer size
  ch_angle, // chamfer angle
  bom = true // BOM switch
) {
  // Version and Arguments checking.
  VersionCheck201905OrHigher();
  AssertIsNum(diameter);
  AssertIsBool(bom);
  
  c_size  = is_undef(ch_size)? 0: ch_size;
  c_angle = is_undef(ch_angle)? 45: ch_angle;
  AssertIsNum(c_size);
  AssertIsNum(c_angle);
  
  if (bom)
    Bom("GENERIC DOWEL", [diameter, length]);
  
  color("cornsilk")
  cyl(
    d = diameter,
    l = length,
    center = false,
    chamfer = c_size,
    chamfang = c_angle
  );
}

// internal dowel module for code simplfication
module _D(d, l, c_s, c_a=45, material, bom) {
  VersionCheck201905OrHigher();
  AssertIsNum(d);
  AssertIsNum(l);
  AssertIsString(material);
  AssertIsBool(bom);
  if (bom) Bom(material, l);
  GenericDowel(d, l, c_s, c_a, false);
}

// 1/4 inch dowel
module Dowel_1_4