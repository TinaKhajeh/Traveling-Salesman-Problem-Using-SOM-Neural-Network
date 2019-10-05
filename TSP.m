clear;
clc;
close all;
% load maps
%[ ulysses16, maxvec, minvec ] = getDataFromFile('ulysses16.tsp', 14);
%[ bays29, maxvec, minvec ] = getDataFromFile('bays29.tsp', 14);
%[ fry26, maxvec, minvec ] = getDataFromFile('fry26.tsp', 14);

[ burma14, maxvec, minvec ] = getDataFromFile('burma14.tsp', 14);

cityNum=15;
LR=1;
var=0.8;
neuronNum = 2*cityNum;%to converge and find a solution neuronNum should be more than cityNum
cityCordination=rand(cityNum,2);%rows determine cities and columns determine x,y
%cityCordination =burma14;%in order to use map cities delete the comment of
%this line
neorunCordinations = zeros(neuronNum,2);
neuronWeights = rand(neuronNum,2);
selctedNeurons = zeros(neuronNum,1);
%set cordination of neurons in a unit circle centered at (0.5,0.5)
for i=1 :neuronNum
    x=0.5*cos((i-1)*(2*pi/neuronNum))+0.5;
    y=0.5*sin((i-1)*(2*pi/neuronNum))+0.5;
    neorunCordinations(i,1)=x;
    neuronWeights(i,1)=x;
    neorunCordinations(i,2)=y;
    neuronWeights(i,2)=y;
end
figure('units','normalized','outerposition',[0 0 1 1])
whitebg([0,0.5,0.5]);
draw(cityCordination,neuronWeights);
pause(0.2);
error=1;
numOfEpoch=1;
iteration =1;
endFlag=0;
while(error>0.1 && endFlag==0 && iteration <150)
    error=0;
    cityArray=cityCordination;
    
    for i =1: size(selctedNeurons,1)
        selctedNeurons(i,1) = 0;
    end
    
    while(size(cityArray,1)~=0 && endFlag==0)%choose one city and count it as an input
        city=rand();
        city=floor(size(cityArray,1)*city+1);%random index in the unshown cityArray
        input = cityArray(city,:);
        winnerIndex = findWinner(input, neuronWeights,selctedNeurons);
        selctedNeurons(winnerIndex,1)=1;
        error=error+norm(input-neuronWeights(winnerIndex,:));
        tmp=zeros(size(neorunCordinations));
        
        for neuronIndex=1:size(neuronWeights,1)
            h=neighborhoodFunction(neorunCordinations(winnerIndex,:),neorunCordinations(neuronIndex,:),var,neuronNum);
            if(isnan(h))
                h=0;
            end
            %update weights
            tmp(neuronIndex,:)=neuronWeights(neuronIndex,:)+LR*h*(input-neuronWeights(neuronIndex,:));
        end
        
        LR=1/power(iteration,1/4);
        var = var*(1-0.01*iteration);
        iteration=iteration+1;
        if(endFlag==0)
            neuronWeights=tmp;
        end
        
        %delete the row
        cityArray = [cityArray(1:city-1,:);cityArray(city+1:end,:)];
        pause(0.01)
        draw(cityCordination,neuronWeights);
    end
    
    %pause(0.01);
    numOfEpoch=numOfEpoch+1;
end
drawpath2(neuronWeights,cityCordination,maxvec,minvec);
