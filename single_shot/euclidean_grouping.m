function pc_group_centers = euclidean_grouping(pc, min_dist)
    [labels,numClusters] = pcsegdist(pc,min_dist);
    acc_vec = zeros(numClusters, 3);
    label_count = zeros(numClusters, 1);
    for i=1:size(pc.Location,1)
        tmp_label = labels(i);
        acc_vec(tmp_label,:) = acc_vec(tmp_label,:) + pc.Location(i,:);
        label_count(tmp_label) = label_count(tmp_label) + 1;
    end
    pc_group_centers = zeros(numClusters, 3);
    for i=1:numClusters
        pc_group_centers(i,:) = acc_vec(i,:) / label_count(i);
    end
end