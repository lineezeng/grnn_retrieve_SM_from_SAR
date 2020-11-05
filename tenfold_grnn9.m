function y=tenfold_grnn9(x,t,q)
Nb=length(t);
nob=1:1:Nb;
nob_rest=nob;
intvb=[10*ones(7,1);14*ones(3,1)];
nob_intv=randperm(length(intvb));
intvvb=intvb(nob_intv);

nob1=randperm(length(nob_rest),intvvb(1));
nob_rest=setdiff(nob_rest,nob1);
nob2=randperm(length(nob_rest),intvvb(2));
nob_rest=setdiff(nob_rest,nob2);
nob3=randperm(length(nob_rest),intvvb(3));
nob_rest=setdiff(nob_rest,nob3);
nob4=randperm(length(nob_rest),intvvb(4));
nob_rest=setdiff(nob_rest,nob4);
nob5=randperm(length(nob_rest),intvvb(5));
nob_rest=setdiff(nob_rest,nob5);
nob6=randperm(length(nob_rest),intvvb(6));
nob_rest=setdiff(nob_rest,nob6);
nob7=randperm(length(nob_rest),intvvb(7));
nob_rest=setdiff(nob_rest,nob7);
nob8=randperm(length(nob_rest),intvvb(8));
nob_rest=setdiff(nob_rest,nob8);
nob9=randperm(length(nob_rest),intvvb(9));
nob_rest=setdiff(nob_rest,nob9);
nob10=randperm(length(nob_rest),intvvb(10));
nob_rest=setdiff(nob_rest,nob10);


    crosvalib=[];
    for i=1:10
      if i==1
        nob_test=nob1;
      end
      if i==2
        nob_test=nob2;
      end
      if i==3
        nob_test=nob3;
      end
      if i==4
        nob_test=nob4;
      end
      if i==5
        nob_test=nob5;
      end
      if i==6
        nob_test=nob6;
      end
      if i==7
        nob_test=nob7;
      end
      if i==8
        nob_test=nob8;
      end
      if i==9
        nob_test=nob9;
      end
      if i==10
        nob_test=nob10;
      end
   
        nob_train=setdiff(nob,nob_test);
    
        xb_train=x(nob_train,:);
        xb_test=x(nob_test,:);
        tb_train=t(nob_train);
        tb_test=t(nob_test);

        net=newgrnn(xb_train',tb_train',q);
        predib=sim(net,xb_test');
        yb=predib';
        ccvb=cvalid(yb,tb_test);
        crosvalb=ccvb;
        crosvalib=[crosvalib;crosvalb];
    end   
  maemeanb=mean(crosvalib(1,:));
  rmsemeanb=mean(crosvalib(2,:));
  r2meanb=mean(crosvalib(3,:));
  croval10foldgrnnoutrb=[maemeanb,rmsemeanb,r2meanb]';

y=croval10foldgrnnoutrb;
% xlswrite('10 fold grnn without r 0.2.xlsx',croval10foldgrnnoutr);
