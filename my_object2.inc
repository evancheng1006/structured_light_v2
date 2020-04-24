#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"
#include "textures.inc"
#include "shapes.inc"

#macro MyObj2(X, Xstep, Xmax, Y, Ystep, Ymax, height, cy_rad)

#while (X <= Xmax)
	#declare tmpY = Y;
	#while (tmpY <= Ymax)
		cylinder {
			<X,tmpY,0>, <X,tmpY,height>, cy_rad
			texture{ T_Stone3 }
		}
		#declare tmpY = tmpY + Ystep;
	#end
	#declare X = X + Xstep;
#end

#end