function y=tenfold_grnn2(x,t,q)
NN=length(t);
noo=1:1:NN;
noo_rest=noo;
intvv=[10*ones(7,1);14*ones(3,1)];
no_intvv=randperm(length(intvv));
intvvv=intvv(no_intvv);

noo1=randperm(length(noo_rest),intvvv(1));
noo_rest=setdiff(noo_rest,noo1);
noo2=randperm(length(noo_rest),intvvv(2));
noo_rest=setdiff(noo_rest,noo2);
noo3=randperm(length(noo_rest),intvvv(3));
noo_rest=setdiff(noo_rest,noo3);
noo4=randperm(length(noo_rest),intvvv(4));
noo_rest=setdiff(noo_rest,noo4);
noo5=randperm(length(noo_rest),intvvv(5));
noo_rest=setdiff(noo_rest,noo5);
noo6=randperm(length(noo_rest),intvvv(6));
noo_rest=setdiff(noo_rest,noo6);
noo7=randperm(length(noo_rest),intvvv(7));
noo_rest=setdiff(noo_rest,noo7);
noo8=randperm(length(noo_rest),intvvv(8));
noo_rest=setdiff(noo_rest,noo8);
noo9=randperm(length(noo_rest),intvvv(9));
noo_rest=setdiff(noo_rest,noo9);
noo10=randperm(length(noo_rest),intvvv(10));
noo_rest=setdiff(noo_rest,noo10);


    crosvalii=[];
    for i=1:10
      if i==1
        noo_test=noo1;
      end
      if i==2
        noo_test=noo2;
      end
      if i==3
        noo_test=noo3;
      end
      if i==4
        noo_test=noo4;
      end
      if i==5
        noo_test=noo5;
      end
      if i==6
        noo_test=noo6;
      end
      if i==7
        noo_test=noo7;
      end
      if i==8
        noo_test=noo8;
      end
      if i==9
        noo_test=noo9;
      end
      if i==10
        noo_test=noo10;
      end
   
        noo_train=setdiff(noo,noo_test);
    
        xx_train=x(noo_train,:);
        xx_test=x(noo_test,:);
        tt_train=t(noo_train);
        tt_test=t(noo_test);

        net=newgrnn(xx_train',tt_train',q);
        predii=sim(net,xx_test');
        yy=predii';
        ccsv=cvalid(yy,tt_test);
        crosvall=ccsv;
        crosvalii=[crosvalii;crosvall];
    end   
  maemean1=mean(crosvalii(1,:));
  rmsemean1=mean(crosvalii(2,:));
  r2mean1=mean(crosvalii(3,:));
  cvr=[maemean1,rmsemean1,r2mean1]';

y=cvr;
% xlswrite('10 fold grnn without r 0.2.xlsx',croval10foldgrnnoutr);

