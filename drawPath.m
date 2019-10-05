function []= drawPath(neorunsWeight,cityCordinations)
%we start from neuron 1 if it matched to a city show it in a different
%color find next neuron mateched to a city and draw line between them
lastneuron=[-100 -100];
first=[-100,-100];
    for i =1: size(neorunsWeight,1)
        find=0;
        nx=neorunsWeight(i,1);
        ny=neorunsWeight(i,2);
        for j=1 : size(cityCordinations,1)
            find=0;
            cx=cityCordinations(j,1);
            cy=cityCordinations(j,2);
            val=abs(nx-cx)+abs(ny-cy);
            if(val<=0.005)
                
                find=1;
                break
            end
        end
        if(find==1)
            %draw line and neurons
            if(lastneuron(1,1)==-100 && lastneuron(1,2)==-100)
                first=neorunsWeight(i,:);
                lastneuron=neorunsWeight(i,:);
                plot(neorunsWeight(i,1),neorunsWeight(i,2),'*r');
            else
                pause(0.5);
                
                drawLine(neorunsWeight(i,:),lastneuron,'*y');
                plot(neorunsWeight(i,1),neorunsWeight(i,2),'*r');
                lastneuron=neorunsWeight(i,:);
            end
        end
       
    end
    pause(0.5);
    drawLine(first,lastneuron,'*y');
    plot(first(1,1),first(1,2),'*r');
    plot(lastneuron(1,1),lastneuron(1,2),'*r');
end