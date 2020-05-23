function [CC, dot_10_2_label, dot_10_9_label, dot_1_5_label] = get_feature_labels(delta)
    [r,c] = find(delta);
    min_x = min(c);
    max_x = max(c);
    min_y = min(r);
    max_y = max(r);
    
    CC = bwlabel(delta,8);
    left_most_x = min_x;
    left_most_y = min(find(delta(:,left_most_x)));
    left_most_label = CC(left_most_y, left_most_x);
    right_most_x = max_x;
    right_most_y = min(find(delta(:,right_most_x)));
    right_most_label = CC(right_most_y, right_most_x);
    bottom_most_y = max_y;
    bottom_most_x = min(find(delta(bottom_most_y,:)));
    bottom_most_label = CC(bottom_most_y, bottom_most_x);
    top_most_y = min_y;
    top_most_x = min(find(delta(top_most_y,:)));
    top_most_label = CC(top_most_y, top_most_x);
    
    dot_10_2_label = left_most_label;
    dot_10_9_label = bottom_most_label;
    dot_1_5_label = top_most_label;
end