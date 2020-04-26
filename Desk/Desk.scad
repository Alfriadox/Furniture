/*
Nia Calia-Bogan
April 25th, 2020
OpenSCAD 2019.05

A desk to work on. 

All units are inches unless otherwise
indicated. This design is intended to be
cut out of wood using hand tools or 
power tools.

Tools needed:
- Jig saw
- Hand saw

Materials needed:
-
*/

use <../util/material/wood/plywood.scad>;
use <../util/material/wood/lumber.scad>;
use <../util/verify.scad>;

include <../BOSL/constants.scad>;
use <../BOSL/transforms.scad>;

// set circle resolution.
$fn = 90;

// The plane on top of the desk. This will
// be used for working on and stuff, and 
// could theoretically be made of a number
// of materials. This implementation uses
// plywood and 1x4s.
module DeskTop(
  width, // x-delta 
  depth, // y-delta
  thickness // z-delta of desktop only.
) {
  AssertIsNum(width);
  AssertIsNum(depth);
  AssertIsNum(thickness);
  // top
  zmove(3.5)
  Plywood(width, depth, thickness);
  // side pieces
  grid3d(
    xa=[0:width-0.75:width-0.75]
  )
  xmove(0.75)
  yrot(270)
  Lumber1x4(depth);
  // back piece
  ymove(depth-0.75)
  xmove(0.75)
  xrot(-90)
  zrot(-90)
  Lumber1x4(width-2*0.75);
}

DeskTop(36, 24, 0.75);