#macro MyCam(CamRotateXDeg, CamRotateYDeg, CamHeight, CamAngle)

#declare CamRotateXRad = CamRotateXDeg * pi / 180.0;
#declare CamRotateYRad = CamRotateYDeg * pi / 180.0;
//#declare CamHeight = 10
//#declare CamAngle = 53.1301024
//#declare CamHeight = 13.7374
//#declare CamAngle = 40
camera { location  <0,0,0>  look_at <0,0,1> sky<0,0,-1> right<1,0,0>
                matrix <1, 0, 0,
                0, 1, 0
                0, 0, -1
                0, 0, CamHeight>
				matrix <1, 0, 0,
						0, cos(CamRotateXRad), -sin(CamRotateXRad)
						0, sin(CamRotateXRad), cos(CamRotateXRad)
						0, 0, 0>
				matrix <cos(CamRotateYRad), 0, -sin(CamRotateYRad),
						0, 1, 0
						sin(CamRotateYRad), 0, cos(CamRotateYRad)
						0, 0, 0>
				angle CamAngle
		}
#end
