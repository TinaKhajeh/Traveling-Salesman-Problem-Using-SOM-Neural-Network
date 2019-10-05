function winnerIndex = findWinner(input, weights,selctedNeurons)
%input - > is a sample input
%weights -> is a matrix containing all weights
[rowW,colW]=size(weights);
min=10000;
minWeightIndex=0;
for i=1:rowW
    if(selctedNeurons(i,1)~=1)
        dif=norm(input-weights(i,:));
        
        if(dif<min)
            %distances are garantuee to be less than 1 because all cordinations are scaled
            min=dif;
            minWeightIndex = i;
        end
    end
end
winnerIndex = minWeightIndex;
end

