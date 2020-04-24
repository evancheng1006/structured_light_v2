#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"
#include "textures.inc"
#include "shapes.inc"

#include "projectors.inc"
#include "my_camera.inc"
#include "my_object.inc"

MyObj(-4.5, 1, 5, 2, 0.25)
MyCam(0, 0, 13.7374, 40)

global_settings { ambient_light White }
light_source { <0,0,100>  color White*0.2 }
background { color White }
plane { <0, 0, 1>, 0 pigment { checker color <0.5,0.5,0.5>, color <1,1,1> } }

#declare proj_rad = 0.05;
#declare proj_spacing = 1;
#declare proj_num_x = 32;
#declare proj_num_y = 32;
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 1, 1)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 2, 1)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 4, 1)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 8, 1)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 16, 1)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 32, 1)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 1, 2)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 1, 4)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 1, 8)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 1, 16)
//Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y, 1, 32)



Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  16, 1)