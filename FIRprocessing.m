% h=fir1(L,0,3,'low');
%h=fir1(L,[2.6*2/fs,200*2/fs],'stop');
h=fir1(L,[40*2/fs,180*2/fs],hann(L+1));
ffth=fft(h,L);
fft1=fftrecover;
for k=1:L
    fft1(k)=fft1(k).*ffth(k);
end
%fft1=fft1.*ffth;
recomus2=ifft(fft1);
halfL=round(L/2);
ran=recomus2;
for k=1:halfL
    recomus2(k)=ran(k+halfL);
    recomus2(k+halfL)=ran(k);
end
audiowrite('music_firoutput.wav',real(recomus2),44100);
figure;
subplot(2,1,1);
plot(0:L-1,real(recomus2));
title('FIR滤波后时域波形');xlabel('n');ylabel('x(n)');
subplot(2,1,2);
plot(0:L-1,abs(fftshift(fft1)));
title('FIR滤波后频谱');xlabel('k');ylabel('X(k)');
recomus2=round(abs(fft1));
dataimg=LSBrecover(recomus2,szdataimg);
figure;
imshow(dataimg);
title('FIR滤波后恢复的图像');