function centers = get_CC_centers(CC)
    centers = [];
    for label=1:max(max(CC))
        [r,c] = find(CC==label);
        label_center = mean([r,c]);
        centers = [centers;label_center];
    end
end