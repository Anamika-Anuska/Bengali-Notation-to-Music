 function [ wave ] = note( fs,Fs )
wave = ones(1,Fs);
wave = (sin(2*pi*fs*(0:1/Fs:1)));
end

