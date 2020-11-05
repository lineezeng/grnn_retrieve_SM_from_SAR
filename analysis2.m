function ynum=analysis2(y,ys,yw,yy,yp,yz,yu,ya,yb,yt) 

mae=[y(1),yy(1),ys(1),yw(1),yp(1),yz(1),yu(1),ya(1),yb(1),yt(1)];
rmse=[y(2),yy(2),ys(2),yw(2),yp(2),yz(2),yu(2),ya(2),yb(2),yt(2)];
rsqr=[y(3),yy(3),ys(3),yw(3),yp(3),yz(3),yu(3),ya(3),yb(3),yt(3)];

memae=median(mae);
mermse=median(rmse);
mersqr=median(rsqr);

ssemae=abs(mae-memae*ones(size(mae)))./memae;
ssermse=abs(rmse-mermse*ones(size(rmse)))./mermse;
ssersqr=abs(rsqr-mersqr*ones(size(rsqr)))./mersqr;
[st_ssemae,id_ssemae]=sort(ssemae,'ascend');
[st_ssermse,id_ssermse]=sort(ssermse,'ascend');
[st_ssersqr,id_ssersqr]=sort(ssersqr,'descend');


for j=1:10
    sumsse(j)=ssemae(j)+ssermse(j)+ssersqr(j);
end

ynum=find(sumsse==min(sumsse));

