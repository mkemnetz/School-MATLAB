clc;clear;close all
c = 0;
terms = [5];

t = linspace(0,pi);
x = zeros(length(terms),100);
for m = terms
    c = c+1;
      n = (1:2:2*m-1);
      for k=n
          x(c,:) = x(c,:)+cos(k.*pi.*t)./k.^2;
      end
end
   plot(t,x)