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

include <../util/material/wood/lumber_constants.scad>;
include <../util/units.scad>;

include <../BOSL/constants.scad>;
use <../BOSL/transforms.scad>;
use <../BOSL/shapes.scad>;


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
  zmove(LUMBER1X4WIDTH)
  GenericPlywood(width, depth, thickness);
  // side pieces
  grid3d(
    xa=[0:width-LUMBER1X4DEPTH:width-LUMBER1X4DEPTH]
  )
  xmove(LUMBER1X4DEPTH)
  yrot(270)
  Lumber1x4(depth);
  // back piece
  ymove(depth-LUMBER1X4DEPTH)
  xmove(LUMBER1X4DEPTH)
  xrot(-90)
  zrot(-90)
  Lumber1x4(width-2*LUMBER1X4DEPTH);
  // front piece
  ymove(LUMBER2X4WIDTH)
  xmove(LUMBER1X4DEPTH)
  zmove(LUMBER1X4WIDTH)
  zmove(-LUMBER2X4DEPTH)
  zrot(-90)
  Lumber2x4(width-2*LUMBER1X4DEPTH);
}

// A leg of the desk.
module DeskLeg(
  height, // the height of the leg
  
) {
  xrot(90)
  yrot(90)
  Lumber2x2(height);
}

// The desk assembly itself. 
module Desk(
  floor_to_surface, // distance from floor to surface
  width, // full width of desktop
  depth, // how far back the desk extends
  top_thickness // thickness of desktop material
) {
  AssertIsNum(floor_to_surface);
  AssertIsNum(width);
  AssertIsNum(depth);
  AssertIsNum(top_thickness);
  
  zmove(floor_to_surface)
  zmove(-(top_thickness + LUMBER1X4WIDTH))
  DeskTop(width, depth, top_thickness);
  
}

// My specific build of this desk
module NiaDesk() {
  Desk(30, 58, 32, 1);
}

//NiaDesk();
DeskLeg(30);