function [] =  drawpath2(neorunsWeight,cityCordinations,maxV,minV)
% for each city determine winer then sort the result and draw lines in
% order
maxX=maxV(1,1);
maxY=maxV(1,2);
minX=minV(1,1);
minY=minV(1,2);
tmp = zeros(size(neorunsWeight,1));
res=zeros(size(cityCordinations,1),2);% in baraye har city index neurone moadelesh ro negah midare
for i=1:size(cityCordinations,1)
    winIndex=findWinner(cityCordinations(i,:), neorunsWeight,tmp);
    tmp(winIndex,1)=1;
    res(i,1) = cityCordinations(i,1);
    res(i,2) = cityCordinations(i,2);
    res(i,3) = winIndex;
end

[values, order] = sort(res(:,3));
res = res(order,:);
%baraye mohasebeye dis bayad be halate adi bargardunam mokhtasat ha ro
dis=0;
for i =1 : size(res,1)-1
    point1= res(i,1:2);
    point1(1,1) = point1(1,1)*(maxX - minX)+minX;
    point1(1,2) = point1(1,2)*(maxY - minY)+minY;
    point2=res(i+1,1:2);
    point2(1,1) = point2(1,1)*(maxX - minX)+minX;
    point2(1,2) = point2(1,2)*(maxY - minY)+minY;
    point1;
    dis=dis+power(norm(point1-point2),2);
    pause(0.2);
    drawLine(res(i,1:2),res(i+1,1:2),'*y');
    plot(res(i,1),res(i,2),'*r');
    
end
i=size(res,1);
point1= res(i,1:2);
point1(1,1) = point1(1,1)*(maxX - minX)+minX;
point1(1,2) = point1(1,2)*(maxY - minY)+minY;
point2=res(1,1:2);
point2(1,1) = point2(1,1)*(maxX - minX)+minX;
point2(1,2) = point2(1,2)*(maxY - minY)+minY;
dis=dis+power(norm(point1-point2),2);
pause(0.2);
drawLine(res(i,1:2),res(1,1:2),'*y');
plot(res(i,1),res(i,2),'*r');
dis
maxV;
minV;
end