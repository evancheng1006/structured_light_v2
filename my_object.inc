#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"
#include "textures.inc"
#include "shapes.inc"

#macro MyObj(X, Xstep, Xmax, height, cy_rad)
//#declare X = -4.5;
//#declare Xstep = 1;
//#declare Xmax = 5;
//#declare height = 2;
//#declare cy_rad = 0.25;
#while (X < Xmax)
cylinder {
	<X,0.5,0>, <X,0.5,height>, cy_rad
	texture{ T_Stone3 } 
}
#declare X = X + Xstep;
#end

#end