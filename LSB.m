function out=LSB(size,hidedata,Carrierdata)
L0=length(Carrierdata)-6000;
temdata=Carrierdata;
if size(1)*size(2)>L0
    error('隐藏的信息太大了');
end
for k=1:size(1)*size(2)
    temdata(6000+k)=bitset(temdata(6000+k),1,hidedata(k));
end
out=temdata;
