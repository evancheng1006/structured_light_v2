#macro Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, X_PERIOD, Y_PERIOD)
//#declare proj_rad = 0.15;
//#declare proj_spacing = 1;
//#declare proj_num_x = 8;
//#declare proj_num_y = 8;
#declare proj_x_scale = proj_spacing;
#declare proj_x_shift = -(proj_num_x*proj_spacing-1)/2;
#declare proj_y_scale = proj_spacing;
#declare proj_y_shift = -(proj_num_y*proj_spacing-1)/2;

#declare proj_x = 0;
#while (proj_x < proj_num_x)
	#declare proj_y = 0;
	#while (proj_y < proj_num_y)
		#declare real_x = proj_x_scale * proj_x + proj_x_shift;
		#declare real_y = proj_y_scale * proj_y + proj_y_shift;
		#if (mod(proj_x, X_PERIOD) * 2 < X_PERIOD)
			#if (mod(proj_y, Y_PERIOD) * 2 < Y_PERIOD)
				light_source{<real_x,real_y,100> color rgb <1,1,1> cylinder point_at<real_x,real_y,0> radius proj_rad falloff proj_rad}
			#end
		#end
		#declare proj_y = proj_y + 1;
	#end
	#declare proj_x = proj_x + 1;
#end

#end
