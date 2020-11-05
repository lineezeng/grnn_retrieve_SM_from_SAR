function y=tenfold_grnn6(x,t,q)
Nz=length(t);
noz=1:1:Nz;
noz_rest=noz;
intvz=[10*ones(7,1);14*ones(3,1)];
noz_intv=randperm(length(intvz));
intvvz=intvz(noz_intv);

noz1=randperm(length(noz_rest),intvvz(1));
noz_rest=setdiff(noz_rest,noz1);
noz2=randperm(length(noz_rest),intvvz(2));
noz_rest=setdiff(noz_rest,noz2);
noz3=randperm(length(noz_rest),intvvz(3));
noz_rest=setdiff(noz_rest,noz3);
noz4=randperm(length(noz_rest),intvvz(4));
noz_rest=setdiff(noz_rest,noz4);
noz5=randperm(length(noz_rest),intvvz(5));
noz_rest=setdiff(noz_rest,noz5);
noz6=randperm(length(noz_rest),intvvz(6));
noz_rest=setdiff(noz_rest,noz6);
noz7=randperm(length(noz_rest),intvvz(7));
noz_rest=setdiff(noz_rest,noz7);
noz8=randperm(length(noz_rest),intvvz(8));
noz_rest=setdiff(noz_rest,noz8);
noz9=randperm(length(noz_rest),intvvz(9));
noz_rest=setdiff(noz_rest,noz9);
noz10=randperm(length(noz_rest),intvvz(10));
noz_rest=setdiff(noz_rest,noz10);


    crosvaliz=[];
    for i=1:10
      if i==1
        noz_test=noz1;
      end
      if i==2
        noz_test=noz2;
      end
      if i==3
        noz_test=noz3;
      end
      if i==4
        noz_test=noz4;
      end
      if i==5
        noz_test=noz5;
      end
      if i==6
        noz_test=noz6;
      end
      if i==7
        noz_test=noz7;
      end
      if i==8
        noz_test=noz8;
      end
      if i==9
        noz_test=noz9;
      end
      if i==10
        noz_test=noz10;
      end
   
        noz_train=setdiff(noz,noz_test);
    
        xz_train=x(noz_train,:);
        xz_test=x(noz_test,:);
        tz_train=t(noz_train);
        tz_test=t(noz_test);

        net=newgrnn(xz_train',tz_train',q);
        prediz=sim(net,xz_test');
        yz=prediz';
        ccvz=cvalid(yz,tz_test);
        crosvalz=ccvz;
        crosvaliz=[crosvaliz;crosvalz];
    end   
  maemeanz=mean(crosvaliz(1,:));
  rmsemeanz=mean(crosvaliz(2,:));
  r2meanz=mean(crosvaliz(3,:));
  croval10foldgrnnoutrz=[maemeanz,rmsemeanz,r2meanz]';

y=croval10foldgrnnoutrz;
% xlswrite('10 fold grnn without r 0.2.xlsx',croval10foldgrnnoutr);
