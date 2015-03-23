function [ y ] = generateTriangeWave( t, f, n )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    y = zeros(1,length(t));

    for k=0:n
      y(1,:) = y(1,:)+((-1)^k)*(sin(2*pi*(2*k+1).*(f*t))./((2*k+1).^2));
    end
    y(1,:) = (8/(pi^2))*y(1, :);
end

