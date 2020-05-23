%for height=1:0.05:1.5
proj_x = [];
proj_y = [];

height_min = 1;
height_max = 2.001;
height_step = 0.05;
%output_fn = sprintf("proj_%.4f_%.4f_%.4f.mat", height_min, height_step, height_max);

fn_gif = 'calibration_animation.gif';
dt_gif = 0.25;

for height=height_min:height_step:height_max
    info = sprintf("h%.4f_rad%.4f_spacing%.4f", height, 0.15, 1);
    fn = sprintf('calib_img_%s.png', info);
    background_fn = sprintf('calib_img_background_%s.png', info);
    
    img = rgb2gray(im2double(imread(fn)));
    background_img = rgb2gray(im2double(imread(background_fn)));
    
    threshold = 0.01; % from synthetic images
    delta = im2bw(img - background_img, threshold);
    
    [CC, dot_10_2_label, dot_10_9_label, dot_1_5_label] = get_feature_labels(delta);
    yxs = CC_label_to_proj_yx(CC, dot_10_2_label, dot_10_9_label, dot_1_5_label);
    [calibrated_x, calibrated_y] = CC_and_proj_yx_to_calibrated(yxs, CC);

    if size(proj_x,1) == 0
        proj_x = calibrated_x;
    else
        proj_x = max(cat(3,proj_x,calibrated_x),[],3);
    end
    if size(proj_y,1) == 0
        proj_y = calibrated_y;
    else
        proj_y = max(cat(3,proj_y,calibrated_y),[],3);
    end
    
    tmp = cat(1,cat(2,img,background_img),cat(2,proj_x/10,proj_y/10));
    %imshow(tmp);
    %pause
    [im,map2]=rgb2ind(cat(3,tmp,tmp,tmp),128);
    if height==height_min
        imwrite(im,map2,fn_gif,'gif','writeMode','overwrite','delaytime',dt_gif,'loopcount',inf);
    else
        imwrite(im,map2,fn_gif,'gif','writeMode','append','delaytime',dt_gif);
    end
    %subplot(2,2,3)
    %imshow(proj_x / 10)
    %subplot(2,2,4)
    %imshow(proj_y / 10)
    %pause
end

save proj_xy.mat proj_x proj_y;

