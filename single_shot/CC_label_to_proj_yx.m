function yxs = CC_label_to_proj_yx(CC, dot_10_2_label, dot_10_9_label, dot_1_5_label)
    %(y,x)
    % feature points: (10,2), (1,5), (10,9)
    %dot_10_2 = zeros(size(CC));
    %dot_10_2(find(CC==dot_10_2_label)) = 1;
    %dot_1_5 = zeros(size(CC));
    %dot_1_5(find(CC==dot_1_5_label)) = 1;
    %dot_10_9 = zeros(size(CC));
    %dot_10_9(find(CC==dot_10_9_label)) = 1;
    %feature_demo = cat(3, dot_10_2, dot_1_5, dot_10_9);
    %imshow(feature_demo);
    %pause
    
    [r,c] = find(CC==dot_10_2_label);
    dot_10_2_center = mean([r,c]);
    [r,c] = find(CC==dot_1_5_label);
    dot_1_5_center = mean([r,c]);
    [r,c] = find(CC==dot_10_9_label);
    dot_10_9_center = mean([r,c]);
    
    % first guess of unit vector of projected patterns
    unit_proj_x = (dot_10_9_center - dot_10_2_center) / 7;
    unit_proj_y = (dot_10_2_center + 3*unit_proj_x - dot_1_5_center) / 9;
    % retrieve centers of all connected components
    centers = get_CC_centers(CC);
    % get best center and unit vector of projected patterns
    pairwise_center_deltas = [];
    for i=1:size(centers,1)
        for j=1:size(centers,1)
            if i ~= j
                pairwise_center_deltas(end+1,:) = centers(i,:) - centers(j,:);
            end
        end
    end
    threshold = 10;
    % re-estimate unit proj x
    dist_with_unit_proj_x = vecnorm((pairwise_center_deltas-unit_proj_x)');
    unit_proj_x_cands = pairwise_center_deltas(find(dist_with_unit_proj_x<threshold), :);
    unit_proj_x = mean(unit_proj_x_cands);
    % re-estimate unit proj y
    dist_with_unit_proj_y = vecnorm((pairwise_center_deltas-unit_proj_y)');
    unit_proj_y_cands = pairwise_center_deltas(find(dist_with_unit_proj_y<threshold), :);
    unit_proj_y = mean(unit_proj_y_cands);
    % estimate dot_0_0_center
    %dot_0_0_center_cands = [];
    %dot_0_0_center_cands(end+1,:) = dot_10_2_center - 10*unit_proj_y - 2*unit_proj_x;
    %dot_0_0_center_cands(end+1,:) = dot_10_9_center - 10*unit_proj_y - 9*unit_proj_x;
    %dot_0_0_center_cands(end+1,:) = dot_1_5_center - 1*unit_proj_y - 5*unit_proj_x;
    dot_0_0_center = dot_1_5_center - 1*unit_proj_y - 5*unit_proj_x;
    
    % match labels to projector coordinates
    yxs = [];
    for label=1:size(centers,1)
        delta_center = centers(label,:) - dot_0_0_center;
        % solve delta_center = x*unit_proj_x + y*unit_proj_x
        % [y,x] * [unit_proj_y; unit_proj_x] = delta_center
        yx = delta_center * inv([unit_proj_y; unit_proj_x]);
        %label
        %yx
        %round(yx)
        yxs(end+1,:) = round(yx);
    end
    %scatter(yxs(:,2), yxs(:,1));
end