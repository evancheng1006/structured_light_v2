#macro Proj(proj_rad, proj_spacing)
//#declare proj_rad = 0.15;
//#declare proj_spacing = 1;
//#declare proj_num_x = 8;
//#declare proj_num_y = 8;
#declare proj_x_scale = proj_spacing;
#declare proj_x_shift = -(10*proj_spacing-1)/2;
#declare proj_y_scale = proj_spacing;
#declare proj_y_shift = -(10*proj_spacing-1)/2;

#declare pattern_1_src = 
array[10][10]
{
  {0,1,0,1,0,1,0,1,1,0},
  {0,1,0,0,1,1,0,1,1,1},
  {0,1,0,0,0,1,1,0,0,0},  
  {0,0,1,1,1,1,1,0,0,1},
  {0,0,1,1,0,1,1,0,1,0},
  {0,0,1,0,1,1,1,0,1,1},
  {0,0,1,0,0,1,1,1,0,0},
  {0,0,0,1,1,1,1,1,0,1},
  {0,0,0,1,0,1,1,1,1,0},
  {0,0,0,0,1,1,1,1,1,1}
}


#declare proj_x = 0;
#while (proj_x < 10)
	#declare proj_y = 0;
	#while (proj_y < 10)
		#declare real_x = proj_x_scale * proj_x + proj_x_shift;
		#declare real_y = proj_y_scale * proj_y + proj_y_shift;
		#if (pattern_1_src[proj_y][proj_x])
			light_source{<real_x,real_y,100> color rgb <1,1,1> cylinder point_at<real_x,real_y,0> radius proj_rad falloff proj_rad}
		#end
		#declare proj_y = proj_y + 1;
	#end
	#declare proj_x = proj_x + 1;
#end

#end
