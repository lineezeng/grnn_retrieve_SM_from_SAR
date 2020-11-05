function y=cvalid(pred,insitu)


delta=abs(pred-insitu);
delta2=power(delta,2);

m_insi=ones(size(insitu))*mean(insitu);

mae=mean(delta);
rmse1=(mean(delta2)).^0.5;


SSR=mean((pred-m_insi).^2);

SST=mean((insitu-m_insi).^2);

r2=SSR/SST;

y=[mae,rmse1,r2];





