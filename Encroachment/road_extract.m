%% Find Line Segments and Highlight longest segment
% Read image into workspace.
clc;
clear all;
close all;

I  = imread('saidapet road buf.png');
figure, imshow(I);
%% 
% Rotate the image.

%rotI = imrotate(I,33,'crop');
%% 
% Create a binary image.
rotI=rgb2gray(I);
BW = edge(rotI,'approxcanny');
figure,imshow(BW)
%%
%imdilation
se90 = strel('line',3,90);
se0 = strel('line',3,0);
BWsdil = imdilate(BW,[se90 se0]);
figure,
imshow(BWsdil)
title('Dilated Gradient Mask')
BW=BWsdil;

%% 
% Create the Hough transform using the binary image.

[H,T,R] = hough(BW);
figure,imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
%% 
% Find peaks in the Hough transform of the image.

P  = houghpeaks(H,25,'threshold',ceil(0.4*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');
% Find lines and plot them.

lines = houghlines(BW,T,R,P,'FillGap',8,'MinLength',8);
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
  % plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
  % plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
title('road extracted');
