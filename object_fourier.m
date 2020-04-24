PLen = 100;
P = zeros(PLen);
center = [(PLen+1)/2, (PLen+1)/2];
for i=1:PLen
    for j=1:PLen
        if ((j-center(1))^2 + (i-center(2))^2) <= (PLen/4)^2
            P(i,j)=1;
        end
    end
end
X = repmat(P,[10 10]);
Y = fft2(X);
YAmp = abs(fftshift(Y));

[xx,yy] = meshgrid(1:size(X,2), 1:size(X,1));
xxF = xx - size(X,2)/2;
yyF = yy - size(X,2)/2;

subplot(2,2,1);
imagesc(X);
title('object (top view)')
subplot(2,2,3);
mesh(xx,yy,X);
title('object (3D plot)')
subplot(2,2,2);
imagesc(YAmp);
title('spectrum (top view)')
subplot(2,2,4);
mesh(xxF,yyF,YAmp);
title('spectrum (3D plot)')
figure;
mesh(xxF(400:600,400:600),yyF(400:600,400:600),YAmp(400:600,400:600));
title('spectrum (3D plot, center)')