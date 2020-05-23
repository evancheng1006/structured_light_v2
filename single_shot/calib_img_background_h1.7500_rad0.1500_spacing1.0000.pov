#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"
#include "textures.inc"
#include "shapes.inc"

#include "pattern.inc"
#include "my_camera.inc"
#include "my_object.inc"
#include "my_substrate.inc"

//1 unit = 500um
//MyObj(-4.5, 1, 5, 2, 0.25)
MyCam(-25, -25, 100, 15)

#declare height = 1;

//MySubstrate(height)

global_settings { ambient_light White }
light_source { <0,0,100>  color White*0.2 }
background { color White }
plane { <0, 0, 1>, 0 pigment { checker color <0.5,0.5,0.5>, color <1,1,1> } }


//Proj(0.15, 1)
MySubstrate(1.750000)
