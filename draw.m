function draw(cityCordination,neurinCordinations)
%
clf;
hold on;
%draw cities
for index=1:size(cityCordination,1)
    x=cityCordination(index,1);
    y=cityCordination(index,2);
    plot(x,y,'*r');
end
%draw neurons
    for index=1:size(neurinCordinations,1)
    x=neurinCordinations(index,1);
    y=neurinCordinations(index,2);
    plot(x,y,'ok');
    str1=strcat('Q',num2str(index));
    text(x,y-0.02,str1);
    if(index>1 && index<size(neurinCordinations,1)+1)
        point1=[neurinCordinations(index-1,1) , neurinCordinations(index-1,2)];
        point2=[neurinCordinations(index,1) , neurinCordinations(index,2)];
        drawLine(point1,point2,'k');
    end
end
point1=[neurinCordinations(1,1) , neurinCordinations(1,2)];
point2=[neurinCordinations(index,1) , neurinCordinations(index,2)];
drawLine(point1,point2,'k');
end