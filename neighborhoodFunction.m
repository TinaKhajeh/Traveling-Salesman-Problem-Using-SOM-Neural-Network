function h=neighborhoodFunction(winer,point,var,m)
val=sum(abs(winer-point));
dis=min(val,m-val);
h=exp(-1*power(dis,2)/power(var,2));
% display('************************');
% val
% m-val
% dis
% display('************************');
%______________________________________________
% dis=norm(winer-point);
% theta
% dis
% h=exp(-1*power(dis,2)/power(theta,2))
%______________________________________________

% dist = winer - point ;
% val=sum(power(dist,2));
% if(val==0)
%     val=1;
% end
% h=exp(-1*val/(2*theta));
end