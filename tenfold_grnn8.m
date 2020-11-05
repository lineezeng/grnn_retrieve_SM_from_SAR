function y=tenfold_grnn8(x,t,q)
Na=length(t);
noa=1:1:Na;
noa_rest=noa;
intva=[10*ones(7,1);14*ones(3,1)];
noa_intv=randperm(length(intva));
intvva=intva(noa_intv);

noa1=randperm(length(noa_rest),intvva(1));
noa_rest=setdiff(noa_rest,noa1);
noa2=randperm(length(noa_rest),intvva(2));
noa_rest=setdiff(noa_rest,noa2);
noa3=randperm(length(noa_rest),intvva(3));
noa_rest=setdiff(noa_rest,noa3);
noa4=randperm(length(noa_rest),intvva(4));
noa_rest=setdiff(noa_rest,noa4);
noa5=randperm(length(noa_rest),intvva(5));
noa_rest=setdiff(noa_rest,noa5);
noa6=randperm(length(noa_rest),intvva(6));
noa_rest=setdiff(noa_rest,noa6);
noa7=randperm(length(noa_rest),intvva(7));
noa_rest=setdiff(noa_rest,noa7);
noa8=randperm(length(noa_rest),intvva(8));
noa_rest=setdiff(noa_rest,noa8);
noa9=randperm(length(noa_rest),intvva(9));
noa_rest=setdiff(noa_rest,noa9);
noa10=randperm(length(noa_rest),intvva(10));
noa_rest=setdiff(noa_rest,noa10);


    crosvalia=[];
    for i=1:10
      if i==1
        noa_test=noa1;
      end
      if i==2
        noa_test=noa2;
      end
      if i==3
        noa_test=noa3;
      end
      if i==4
        noa_test=noa4;
      end
      if i==5
        noa_test=noa5;
      end
      if i==6
        noa_test=noa6;
      end
      if i==7
        noa_test=noa7;
      end
      if i==8
        noa_test=noa8;
      end
      if i==9
        noa_test=noa9;
      end
      if i==10
        noa_test=noa10;
      end
   
        noa_train=setdiff(noa,noa_test);
    
        xa_train=x(noa_train,:);
        xa_test=x(noa_test,:);
        ta_train=t(noa_train);
        ta_test=t(noa_test);

        net=newgrnn(xa_train',ta_train',q);
        predia=sim(net,xa_test');
        ya=predia';
        ccva=cvalid(ya,ta_test);
        crosvala=ccva;
        crosvalia=[crosvalia;crosvala];
    end   
  maemeana=mean(crosvalia(1,:));
  rmsemeana=mean(crosvalia(2,:));
  r2meana=mean(crosvalia(3,:));
  croval10foldgrnnoutra=[maemeana,rmsemeana,r2meana]';

y=croval10foldgrnnoutra;
% xlswrite('10 fold grnn without r 0.2.xlsx',croval10foldgrnnoutr);
