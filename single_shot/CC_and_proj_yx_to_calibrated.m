function [calibrated_x, calibrated_y] = CC_and_proj_yx_to_calibrated(yxs, CC)
    calibrated_x = zeros(size(CC));
    calibrated_y = zeros(size(CC));
    [r,c] = find(CC);

    for i=1:length(r)
        label = CC(r(i), c(i));
        calibrated_x(r(i), c(i)) = yxs(label, 2);
        calibrated_y(r(i), c(i)) = yxs(label, 1);
    end
end