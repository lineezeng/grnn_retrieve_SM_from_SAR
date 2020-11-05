function y=tenfold_grnn5(x,t,q)
Np=length(t);
nop=1:1:Np;
nop_rest=nop;
intvp=[10*ones(7,1);14*ones(3,1)];
nop_intv=randperm(length(intvp));
intvvp=intvp(nop_intv);

nop1=randperm(length(nop_rest),intvvp(1));
nop_rest=setdiff(nop_rest,nop1);
nop2=randperm(length(nop_rest),intvvp(2));
nop_rest=setdiff(nop_rest,nop2);
nop3=randperm(length(nop_rest),intvvp(3));
nop_rest=setdiff(nop_rest,nop3);
nop4=randperm(length(nop_rest),intvvp(4));
nop_rest=setdiff(nop_rest,nop4);
nop5=randperm(length(nop_rest),intvvp(5));
nop_rest=setdiff(nop_rest,nop5);
nop6=randperm(length(nop_rest),intvvp(6));
nop_rest=setdiff(nop_rest,nop6);
nop7=randperm(length(nop_rest),intvvp(7));
nop_rest=setdiff(nop_rest,nop7);
nop8=randperm(length(nop_rest),intvvp(8));
nop_rest=setdiff(nop_rest,nop8);
nop9=randperm(length(nop_rest),intvvp(9));
nop_rest=setdiff(nop_rest,nop9);
nop10=randperm(length(nop_rest),intvvp(10));
nop_rest=setdiff(nop_rest,nop10);


    crosvalip=[];
    for i=1:10
      if i==1
        nop_test=nop1;
      end
      if i==2
        nop_test=nop2;
      end
      if i==3
        nop_test=nop3;
      end
      if i==4
        nop_test=nop4;
      end
      if i==5
        nop_test=nop5;
      end
      if i==6
        nop_test=nop6;
      end
      if i==7
        nop_test=nop7;
      end
      if i==8
        nop_test=nop8;
      end
      if i==9
        nop_test=nop9;
      end
      if i==10
        nop_test=nop10;
      end
   
        nop_train=setdiff(nop,nop_test);
    
        xp_train=x(nop_train,:);
        xp_test=x(nop_test,:);
        tp_train=t(nop_train);
        tp_test=t(nop_test);

        net=newgrnn(xp_train',tp_train',q);
        predip=sim(net,xp_test');
        y=predip';
        ccvp=cvalid(y,tp_test);
        crosvalp=ccvp;
        crosvalip=[crosvalip;crosvalp];
    end   
  maemeanp=mean(crosvalip(1,:));
  rmsemeanp=mean(crosvalip(2,:));
  r2meanp=mean(crosvalip(3,:));
  croval10foldgrnnoutrp=[maemeanp,rmsemeanp,r2meanp]';

y=croval10foldgrnnoutrp;
% xlswrite('10 fold grnn without r 0.2.xlsx',croval10foldgrnnoutr);
