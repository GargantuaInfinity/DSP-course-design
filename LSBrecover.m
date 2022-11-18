function dataimg=LSBrecover(intabsrecover,szdataimg)
%intabsrecover=round(absrecover*10);
Limg=szdataimg(1)*szdataimg(2);
data=zeros(Limg,1);
for k=1:Limg
    data(k)=bitget(intabsrecover(6000+k),1);
end
data=data';
dataimg=reshape(data,szdataimg(1),szdataimg(2));
% figure;
% imshow(dataimg);
% fileID=fopen('test.bin','wb');
% fwrite(fileID,data);
% fclose(fileID);