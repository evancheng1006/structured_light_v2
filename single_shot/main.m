cali_mat_fn = 'calibration_parameters_05.mat';
proj_xy_fn = 'proj_xy.mat';
grouping_min_dist = 0.1;

% pic01
img_fn = 'pic01.png';
background_fn = 'pic01_background.png';
%img_fn = 'calib_img_h1.7500_rad0.1500_spacing1.0000.png';
%background_fn = 'calib_img_background_h1.7500_rad0.1500_spacing1.0000.png';
pic01_pc = single_shot_reconstruct(cali_mat_fn, proj_xy_fn, img_fn, background_fn);
pic01_result = euclidean_grouping(pic01_pc, grouping_min_dist);
img_fn = 'pic01_shifted.png';
background_fn = 'pic01_shifted_background.png';
pic01_shifted_pc = single_shot_reconstruct(cali_mat_fn, proj_xy_fn, img_fn, background_fn);
pic01_shifted_pc = pointCloud(pic01_shifted_pc.Location + [5,-1,0]);
pic01_shifted_result = euclidean_grouping(pic01_shifted_pc, grouping_min_dist);
pic01_merged_grouped = pointCloud([pic01_result; pic01_shifted_result]);
pcwrite(pic01_merged_grouped, 'pic01_merged_grouped.ply');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pic02
img_fn = 'pic02.png';
background_fn = 'pic02_background.png';
pic02_pc = single_shot_reconstruct(cali_mat_fn, proj_xy_fn, img_fn, background_fn);
pic02_result = euclidean_grouping(pic02_pc, grouping_min_dist);
img_fn = 'pic02_shifted.png';
background_fn = 'pic02_shifted_background.png';
pic02_shifted_pc = single_shot_reconstruct(cali_mat_fn, proj_xy_fn, img_fn, background_fn);
pic02_shifted_pc = pointCloud(pic02_shifted_pc.Location + [5,-1,0]);
pic02_shifted_result = euclidean_grouping(pic02_shifted_pc, grouping_min_dist);
pic02_merged_grouped = pointCloud([pic02_result; pic02_shifted_result]);
pcwrite(pic02_merged_grouped, 'pic02_merged_grouped.ply');


figure;
pcshow(pic01_merged_grouped, 'MarkerSize', 500);
figure;
pcshow(pic02_merged_grouped, 'MarkerSize', 500);