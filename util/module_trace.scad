/*
Nia Calia-Bogan
April 25th, 2020
OpenSCAD 2019.05

Utilities for tracing through parents of a given
module.
*/

// Module that immediately calls children
// without any operation.
module Nop() {children();}

// Returns list of parent modules. 
function list_parents() = 
  [for (i = [0:$parent_modules-1]) parent_module(i)];

// This module prints the name of all of it's parents.
module TraceParents() {
  for (p = list_parents()) echo(str("IN ", p));
}