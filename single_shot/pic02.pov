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
#include "my_object2.inc"


//1 unit = 500um

MyCam(-25, -25, 100, 15)

object {
	my_object2
	translate <0,0,0>
}

global_settings { ambient_light White }
light_source { <0,0,100>  color White*0.2 }
background { color White }
plane { <0, 0, 1>, 0 pigment { checker color <0.5,0.5,0.5>, color <1,1,1> } }


Proj(0.15, 1)