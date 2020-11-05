function y=tenfold_grnn1(x,t,q)
N=length(t);
no=1:1:N;
no_rest=no;
intv=[10*ones(7,1);14*ones(3,1)];
no_intv=randperm(length(intv));
intvv=intv(no_intv);

no1=randperm(length(no_rest),intvv(1));
no_rest=setdiff(no_rest,no1);
no2=randperm(length(no_rest),intvv(2));
no_rest=setdiff(no_rest,no2);
no3=randperm(length(no_rest),intvv(3));
no_rest=setdiff(no_rest,no3);
no4=randperm(length(no_rest),intvv(4));
no_rest=setdiff(no_rest,no4);
no5=randperm(length(no_rest),intvv(5));
no_rest=setdiff(no_rest,no5);
no6=randperm(length(no_rest),intvv(6));
no_rest=setdiff(no_rest,no6);
no7=randperm(length(no_rest),intvv(7));
no_rest=setdiff(no_rest,no7);
no8=randperm(length(no_rest),intvv(8));
no_rest=setdiff(no_rest,no8);
no9=randperm(length(no_rest),intvv(9));
no_rest=setdiff(no_rest,no9);
no10=randperm(length(no_rest),intvv(10));
no_rest=setdiff(no_rest,no10);


    crosvali=[];
    for i=1:10
      if i==1
        no_test=no1;
      end
      if i==2
        no_test=no2;
      end
      if i==3
        no_test=no3;
      end
      if i==4
        no_test=no4;
      end
      if i==5
        no_test=no5;
      end
      if i==6
        no_test=no6;
      end
      if i==7
        no_test=no7;
      end
      if i==8
        no_test=no8;
      end
      if i==9
        no_test=no9;
      end
      if i==10
        no_test=no10;
      end
   
        no_train=setdiff(no,no_test);
    
        x_train=x(no_train,:);
        x_test=x(no_test,:);
        t_train=t(no_train);
        t_test=t(no_test);

        net=newgrnn(x_train',t_train',q);
        predi=sim(net,x_test');
        y=predi';
        ccv=cvalid(y,t_test);
        crosval=ccv;
        crosvali=[crosvali;crosval];
    end   
  
  maemean=mean(crosvali(1,:));
  rmsemean=mean(crosvali(2,:));
  r2mean=mean(crosvali(3,:));
  croval10foldgrnnoutr=[maemean,rmsemean,r2mean]';

y=croval10foldgrnnoutr;
% xlswrite('10 fold grnn without r 0.2.xlsx',croval10foldgrnnoutr);
