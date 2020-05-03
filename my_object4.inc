#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"
#include "textures.inc"
#include "shapes.inc"

// pseudo-random generater height_diff = amp * sin(pA*X*X+pB*X*Y+pC*Y*Y+pD*X+pE*Y+pF) 

#macro MyObj4(X, Xstep, Xmax, Y, Ystep, Ymax, height, ball_rad, amp,pA,pB,pC,pD,pE,pF)

#while (X <= Xmax)
	#declare tmpY = Y;
	#while (tmpY <= Ymax)
		#declare height_diff = amp * sin(pA*X*X+pB*X*tmpY+pC*tmpY*tmpY+pD*X+pE*tmpY+pF);
		sphere {
			<X,tmpY,height + height_diff>, ball_rad
			texture{ T_Wood3 }
		}
		#declare tmpY = tmpY + Ystep;
	#end
	#declare X = X + Xstep;
#end

#end