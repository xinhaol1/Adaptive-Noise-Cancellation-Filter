load Sources.mat
%h = [0.78 -0.55 0.24 -0.16 0.08];
h = randn(5,1);
fnoise = 100*conv(noise,h);
primary = primary + fnoise(1:size(primary));
errl = LMSFilter(primary, 100*noise, 0.000005, 5);
sound(errl,22000);

errr = RLSFilter(primary, 100*noise, 5, 15);
pause(20);
sound(errr, 22000);