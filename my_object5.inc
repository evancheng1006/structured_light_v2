#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"
#include "textures.inc"
#include "shapes.inc"

#macro MyObj5(X, Xstep, Xmax, Y, Ystep, Ymax, height, ball_rad)

#while (X <= Xmax)
	#declare tmpY = Y;
	#while (tmpY <= Ymax)
		sphere {
			<X,tmpY,height>, ball_rad
			texture{ T_Wood3 }
		}
		#declare tmpY = tmpY + Ystep;
	#end
	#declare X = X + Xstep;
#end

#end