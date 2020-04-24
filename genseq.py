import os
import sys
import subprocess
import time

with open('main.pov', 'r') as f:
    data = f.read()

appendix = [
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  1,  1)',
'',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  2,  1)',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  4,  1)',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  8,  1)',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  16, 1)',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  32, 1)',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  1,  2)',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  1,  4)',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  1,  8)',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  1, 16)',
'Proj(proj_rad, proj_spacing, proj_num_x, proj_num_y,  1, 32)',
]
fn_out_basename = 'pic05_'

for i in range(len(appendix)):
    fn = '%s%02d.pov' % (fn_out_basename, (i + 1))
    with open(fn, 'w') as f:
        f.write(data)
        f.write('\r\n'+appendix[i])