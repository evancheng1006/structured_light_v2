%load('calibration_parameters_01.mat'); % pic01_, pic02_
load('calibration_parameters_02.mat'); % pic03_
%load('calibration_parameters_03.mat'); % pic04_
%load('calibration_parameters_04.mat'); % pic05_

img_fn = strings(12,1);
img_fn_basename = "pic03_";
pc_fn_name = sprintf("%spc.ply", img_fn_basename);
for i=1:12
    img_fn(i) = sprintf("%s%02d.png", img_fn_basename, i);
end

current = im2double(imread(img_fn(1)));
seq = zeros(size(current,1),size(current,2),3,length(img_fn));
seq(:,:,:,1) = current;

for i=2:length(img_fn)
    current = im2double(imread(img_fn(i)));
    seq(:,:,:,i) = current;
end

[w,h,~,N] = size(seq);
new_seq = zeros(w,h,N);
for i=1:N
    new_seq(:,:,i) = rgb2gray(seq(:,:,:,i));
end

% 2 is full dark
decode_delta = zeros(size(new_seq));
for i=1:N
    decode_delta(:,:,i) = (new_seq(:,:,i) - new_seq(:,:,2));
end

threshold = 0.01; % from synthetic images
known = im2bw(decode_delta(:,:,1), threshold);
%has_data = im2bw(full_dark_delta, threshold);
decode_delta_binary = zeros(size(decode_delta));
for i=3:N
    decode_delta_binary(:,:,i-2) = 1 - im2bw(decode_delta(:,:,i), threshold);
end

power_of_two = [1,2,4,8,16];
x_code = zeros(w,h,1);
y_code = zeros(w,h,1);
for i=1:5
    x_code = power_of_two(i) * decode_delta_binary(:,:,i) + x_code;
    y_code = power_of_two(i) * decode_delta_binary(:,:,i+5) + y_code;
end


K1 = camera_intrinsic_matrix;
R1 = camera_extrinsic_matrix(1:3,1:3);
T1 = camera_extrinsic_matrix(1:3,4);
K2 = projector_intrinsic_matrix;
R2 = projector_extrinsic_matrix(1:3,1:3);
T2 = projector_extrinsic_matrix(1:3,4);

d = zeros(w,h,3);

for x=1:w
    for y=1:h
        if(known(y,x))
            % Compute A and b
            A = zeros(4,3);
            b = zeros(4,1);
            % Convert points to normalized camera coordinates
            p1 = K1\[x;y;1];
            p2 = K2\[x_code(y,x); y_code(y,x);1];
            % Compute linear constraints -> Camera
            A(1,:) = [R1(3,1)*p1(1)-R1(1,1), R1(3,2)*p1(1)-R1(1,2), R1(3,3)*p1(1)-R1(1,3)];
            A(2,:) = [R1(3,1)*p1(2)-R1(2,1), R1(3,2)*p1(2)-R1(2,2), R1(3,3)*p1(2)-R1(2,3)];
            b(1:2) = [T1(1)-T1(3)*p1(1); T1(2)-T1(3)*p1(2)];
            
            % Compute linear constraints -> Projector (~ camera no.2)
            A(3:4,1:3) = [1,0,0;0,1,0] * R2;
            b(3:4) = [p2(1); p2(2)];

            d(y,x,:) = A\b; % least mean square solution
        end
    end
end

point_cloud = zeros(nnz(known),3);
i_point = 1;
for x=1:w
    for y=1:h
        if(known(y,x))
            point_cloud(i_point,:) = d(y,x,:);
            i_point = i_point + 1;
        end
    end
end


pcwrite(pointCloud(point_cloud), pc_fn_name);
pcshow(point_cloud);
set(gca,'color','w');
set(gcf,'color','w');