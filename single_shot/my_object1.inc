#include "my_substrate.inc"
#declare my_object1 = union {
// 1 unit = 500um

#declare X_min = -6;
#declare Y_min = -6;
#declare X_max = 10;
#declare Y_max = 10;
#declare X_step = 2.3;
#declare Y_step = 2.3;
#declare sphere_center_height = 0.5;
#declare sphere_radius = 0.8;

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