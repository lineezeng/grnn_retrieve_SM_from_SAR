function y=tenfold_grnn7(x,t,q)
Nu=length(t);
nou=1:1:Nu;
nou_rest=nou;
intvu=[10*ones(7,1);14*ones(3,1)];
nou_intv=randperm(length(intvu));
intvvu=intvu(nou_intv);

nou1=randperm(length(nou_rest),intvvu(1));
nou_rest=setdiff(nou_rest,nou1);
nou2=randperm(length(nou_rest),intvvu(2));
nou_rest=setdiff(nou_rest,nou2);
nou3=randperm(length(nou_rest),intvvu(3));
nou_rest=setdiff(nou_rest,nou3);
nou4=randperm(length(nou_rest),intvvu(4));
nou_rest=setdiff(nou_rest,nou4);
nou5=randperm(length(nou_rest),intvvu(5));
nou_rest=setdiff(nou_rest,nou5);
nou6=randperm(length(nou_rest),intvvu(6));
nou_rest=setdiff(nou_rest,nou6);
nou7=randperm(length(nou_rest),intvvu(7));
nou_rest=setdiff(nou_rest,nou7);
nou8=randperm(length(nou_rest),intvvu(8));
nou_rest=setdiff(nou_rest,nou8);
nou9=randperm(length(nou_rest),intvvu(9));
nou_rest=setdiff(nou_rest,nou9);
nou10=randperm(length(nou_rest),intvvu(10));
nou_rest=setdiff(nou_rest,nou10);


    crosvaliu=[];
    for i=1:10
      if i==1
        nou_test=nou1;
      end
      if i==2
        nou_test=nou2;
      end
      if i==3
        nou_test=nou3;
      end
      if i==4
        nou_test=nou4;
      end
      if i==5
        nou_test=nou5;
      end
      if i==6
        nou_test=nou6;
      end
      if i==7
        nou_test=nou7;
      end
      if i==8
        nou_test=nou8;
      end
      if i==9
        nou_test=nou9;
      end
      if i==10
        nou_test=nou10;
      end
   
        nou_train=setdiff(nou,nou_test);
    
        xu_train=x(nou_train,:);
        xu_test=x(nou_test,:);
        tu_train=t(nou_train);
        tu_test=t(nou_test);

        net=newgrnn(xu_train',tu_train',q);
        prediu=sim(net,xu_test');
        yu=prediu';
        ccvu=cvalid(yu,tu_test);
        crosvalu=ccvu;
        crosvaliu=[crosvaliu;crosvalu];
    end   
  maemeanu=mean(crosvaliu(1,:));
  rmsemeanu=mean(crosvaliu(2,:));
  r2meanu=mean(crosvaliu(3,:));
  croval10foldgrnnoutru=[maemeanu,rmsemeanu,r2meanu]';

y=croval10foldgrnnoutru;
% xlswrite('10 fold grnn without r 0.2.xlsx',croval10foldgrnnoutr);
