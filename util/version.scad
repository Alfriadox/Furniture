/*
Nia Calia-Bogan
April 25th 2020
OpenSCAD 2019.05

Version checking module.
*/

// Version Check Two Field Exact
function VC2FE(a) = is_list(a) 
    && len(a) >= 2 
    && version()[0] == a[0] 
    && version()[1] == a[1];

// Version Check Two Field Greater than or Equal
function VC2FGE(a) = is_list(a)
    && len(a) >= 2
    && (version()[0] == a[0]? 
            version()[1] >= a[1]:
            version()[0] > a[0]
       );

// Version Check Two Field strictly Greater
function VC2FGT(a) = !VC2FE(a) && VC2FGE(a);

// Check if the current version is 2019.05.
module VersionCheck201905Exact() {
    if (!VC2FE([2019, 05])) {
        echo("VERSION CHECK WARNING: VERSION IS NOT 2019.05.");
    }
}

// Check if the current version is 2019.05 or higher.
module VersionCheck201905OrHigher() {
    if (!VC2FGE([2019, 05])) {
        echo("VERSION CHECK WARNING: VERSION IS NOT 2019.05^.");
    }
}
