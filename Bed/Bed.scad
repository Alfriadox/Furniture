/*
Nia Calia-Bogan
April 25th, 2020
OpenSCAD 2019.5

This design is intended to be cut out of wood
using hand tools or power tools. Materials are
listed and there will be a module to echo a
Bill of Materials (BOM) to the console. 

Basic tools are assumed. These include:
- Jig saw
- Hand saw

All units are inches except where noted otherwise.
*/

use <../util/version.scad>;
use <../util/verify.scad>;
use <../BOSL/transforms.scad>;

// Set resolution for circles and spheres to 90.
$fn = 90;

// Version check.
VersionCheck201905OrHigher();
