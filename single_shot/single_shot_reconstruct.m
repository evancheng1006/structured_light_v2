function pc = single_shot_reconstruct(cali_mat_fn, proj_xy_fn, img_fn, background_fn)

%cali_mat_fn = 'calibration_parameters_05.mat';
%proj_xy_fn = 'proj_xy.mat';
%img_fn = 'calib_img_h1.7500_rad0.1500_spacing1.0000.png';
%background_fn = 'calib_img_background_h1.7500_rad0.1500_spacing1.0000.png';

load(cali_mat_fn);
load(proj_xy_fn);
img = rgb2gray(im2double(imread(img_fn)));
background_img = rgb2gray(im2double(imread(background_fn)));
threshold = 0.01; % from synthetic images
delta = im2bw(img - background_img, threshold);

[h, w] = size(delta);
d = zeros(h, w, 3);

K1 = camera_intrinsic_matrix;
R1 = camera_extrinsic_matrix(1:3,1:3);
T1 = camera_extrinsic_matrix(1:3,4);
K2 = projector_intrinsic_matrix;
R2 = projector_extrinsic_matrix(1:3,1:3);
T2 = projector_extrinsic_matrix(1:3,4);

point_cloud = [];
for x=1:w
    for y=1:h
        if delta(y,x) && proj_x(y,x) && proj_y(y,x)
            % Compute A and b
            A = zeros(4,3);
            b = zeros(4,1);
            % Convert points to normalized camera coordinates
            p1 = K1\[x;y;1];
            p2 = K2\[proj_x(y,x); proj_y(y,x);1];
            % Compute linear constraints -> Camera
            A(1,:) = [R1(3,1)*p1(1)-R1(1,1), R1(3,2)*p1(1)-R1(1,2), R1(3,3)*p1(1)-R1(1,3)];
            A(2,:) = [R1(3,1)*p1(2)-R1(2,1), R1(3,2)*p1(2)-R1(2,2), R1(3,3)*p1(2)-R1(2,3)];
            b(1:2) = [T1(1)-T1(3)*p1(1); T1(2)-T1(3)*p1(2)];
            
            % Compute linear constraints -> Projector (~ camera no.2)
            A(3:4,1:3) = [1,0,0;0,1,0] * R2;
            b(3:4) = [p2(1); p2(2)];

            d(y,x,:) = A\b; % least mean square solution
            point_cloud(end+1,:) = d(y,x,:);
            
            %A
            %b
            %A*(A\b)
            %pause
        end
    end
end

%pcshow(point_cloud);
pc = pointCloud(point_cloud);

end