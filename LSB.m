%将信息隐写到指定序列中,返回含有隐藏信息的序列
function out=LSB(size,hidedata,Carrierdata)
L0=length(Carrierdata)-6000;%隐写信息的起始位置
temdata=Carrierdata;
if size(1)*size(2)>L0
    error('隐藏的信息太大了');
end
for k=1:size(1)*size(2)
    temdata(6000+k)=bitset(temdata(6000+k),1,hidedata(k));
end
out=temdata;