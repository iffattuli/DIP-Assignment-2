rgb_image=imread('input1.jpeg');
grayscale_image=rgb2gray(rgb_image);
%figure;
%imshow(grayscale_image);
R=grayscale_image;
[rows, cols]= size(R);
bitdepth=8;

for k=1:bitdepth
   % X = bitshift(1, k);
    X=uint8(2^(k-1));
    S=bitand(R, X);
    subplot(3, 3, k);
    imshow(S);
    title(['Bit Position ', num2str(k-1)]);
    
end

