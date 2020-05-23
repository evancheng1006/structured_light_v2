import os
import sys
import subprocess
import time
import numpy as np


with open('empty.pov', 'r') as f:
    data = f.read()

proj_rad = 0.15
proj_spacing = 1

for height in np.arange(1.0,2.001,0.05):
    info = 'h%.4f_rad%.4f_spacing%.4f' % (height,proj_rad,proj_spacing)
    fn = 'calib_img_%s.pov' % info
    background_fn = 'calib_img_background_%s.pov' % info
    substrate = '\r\nMySubstrate(%f)\r\n' % height
    proj = '\r\nProj(%f, %f)\r\n' % (proj_rad,proj_spacing)
    with open(fn, 'w') as f:
        f.write(data)
        f.write(substrate)
        f.write(proj)
    with open(background_fn, 'w') as f:
        f.write(data)
        f.write(substrate)