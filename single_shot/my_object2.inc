#include "my_substrate.inc"
#declare my_object2 = union {
// 1 unit = 500um

#declare X_min = -0;
#declare Y_min = -0;
#declare X_max = 1;
#declare Y_max = 1;
#declare X_step = 30;
#declare Y_step = 30;
#declare sphere_center_height = -11;
#declare sphere_radius = 13;

#declare X = X_min;

#while (X < X_max)
	#declare Y = Y_min;
	#while (Y < Y_max)
		sphere {
			<X, Y, sphere_center_height>, sphere_radius
			texture{ T_Wood2 }
		}
		#declare Y = Y + Y_step;
	#end
	#declare X = X + X_step;
#end

MySubstrate(1)
}