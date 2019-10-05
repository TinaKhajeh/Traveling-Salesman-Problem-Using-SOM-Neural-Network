function [data,maxV,minV] = getDataFromFile(fileName, num)
fid = fopen(fileName);
mat=ones(num,3);%dimention of data set
for(i=1:8)
    nextline = fgets(fid);
end
nextline = fgets(fid);
for i =1 :num
    nextline;
    a = strread(nextline,'%s','delimiter','  ');
    mat(i,:) = str2double(a)';
    nextline = fgets(fid);
end

data= mat(:,2:3);

maxX = max(data(:,1));
minX = min(data(:,1));
maxY = max(data(:,2));
minY = min(data(:,2));
maxV(1,1)=maxX;
maxV(1,2)=maxY;
minV(1,1)=minX;
minV(1,2)=minY;
data(:,1) = (data(:,1) - minX)./(maxX-minX);
data(:,2) = (data(:,2) - minY)./(maxY-minY);
end

