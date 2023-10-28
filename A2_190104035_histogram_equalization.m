input_image= imread('cameraman.png');
%input_image= rgb2gray(input_image);
count_2Darray=zeros(256,1);
[rows, cols]=size(input_image);
for i=1:rows
    for j=1:cols
        gray_level_intensity=input_image(i,j);
        count_2Darray(gray_level_intensity+1)=count_2Darray(gray_level_intensity+1)+1;
    end
end
%bar(count_2Darray);
total_pixels= rows*cols;
pdf=count_2Darray/total_pixels;
cdf=zeros(256,1);
cdf(1)=pdf(1);
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end
L=2^8;
m=cdf*(L-1);
m=round(m);
equalized_image=m(input_image+1);

count_2Darray_equalized=zeros(256,1);
[e_rows, e_cols]=size(equalized_image);
for i=1:e_rows
    for j=1:e_cols
        gray_level_intensity_equalized=equalized_image(i,j);
        count_2Darray_equalized(gray_level_intensity_equalized+1)=count_2Darray_equalized(gray_level_intensity_equalized+1)+1;
    end
end
%bar(count_2Darray_equalized);

figure;
subplot(2, 2, 1);
imshow(input_image);
title('Input Image');

subplot(2, 2, 3);
imshow(equalized_image, [0, 255]);
title('Equalized Image');

subplot(2, 2, 2);
bar(count_2Darray);
title('Input Image Histogram');

subplot(2, 2, 4);
bar(count_2Darray_equalized);
title('Equalized Image Histogram');

%histogram_specification_starts:(bonus)
desired_image=imread('input2.jpeg');
desired_image= rgb2gray(desired_image);
desired_count_2Darray=zeros(256,1);
[d_rows, d_cols]=size(desired_image);
for i=1:d_rows
    for j=1:d_cols
        d_gray_level_intensity=desired_image(i,j);
        desired_count_2Darray(d_gray_level_intensity+1)=desired_count_2Darray(d_gray_level_intensity+1)+1;
    end
end
desired_total_pixels= d_rows*d_cols;
desired_pdf=desired_count_2Darray/desired_total_pixels;
desired_cdf=zeros(256,1);
desired_cdf(1)=desired_pdf(1);
for i=2:256
    desired_cdf(i)=desired_cdf(i-1)+desired_pdf(i);
end
d_L=2^8;
desired_m=desired_cdf*(d_L-1);
desired_m=round(desired_m);
equalized_desired_image=desired_m(desired_image+1);

count_2Darray_desiredequalized=zeros(256,1);
[ed_rows, ed_cols]=size(equalized_desired_image);
for i=1:ed_rows
    for j=1:ed_cols
        gray_level_intensity_desiredequalized=equalized_desired_image(i,j);
        count_2Darray_desiredequalized(gray_level_intensity_desiredequalized+1)=count_2Darray_equalized(gray_level_intensity_desiredequalized+1)+1;
    end
end

specified_image=desired_m(equalized_image+1);
specified_count_2Darray=zeros(256,1);
[s_rows, s_cols]=size(specified_image);
for i=1:s_rows
    for j=1:s_cols
       gray_level_intensity_specified=specified_image(i,j);
        specified_count_2Darray(gray_level_intensity_specified+1)=specified_count_2Darray(gray_level_intensity_specified+1)+1;
    end
end
figure;
subplot(3, 2, 1);
imshow(desired_image);
title('Desired Image');


subplot(3, 2, 3);
imshow(equalized_desired_image, [0,255]);
title('Desired Equalized Image Histogram');

subplot(3, 2, 2);
bar(desired_count_2Darray);
title('Desired Image Histogram');

subplot(3, 2, 4);
bar(count_2Darray_desiredequalized);
title('Desired Equalized Image Histogram');

subplot(3, 2, 5);
imshow(specified_image, [0,255]);
title('Specified Image');

subplot(3, 2, 6);
bar(specified_count_2Darray);
title('Specified Image Histogram');







