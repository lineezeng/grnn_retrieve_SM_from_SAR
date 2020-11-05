function y=tenfold_grnn4(x,t,q)
Nw=length(t);
now=1:1:Nw;
now_rest=now;
intvw=[10*ones(7,1);14*ones(3,1)];
now_intv=randperm(length(intvw));
intvvw=intvw(now_intv);

now1=randperm(length(now_rest),intvvw(1));
now_rest=setdiff(now_rest,now1);
now2=randperm(length(now_rest),intvvw(2));
now_rest=setdiff(now_rest,now2);
now3=randperm(length(now_rest),intvvw(3));        
now_rest=setdiff(now_rest,now3);
now4=randperm(length(now_rest),intvvw(4));
now_rest=setdiff(now_rest,now4);
now5=randperm(length(now_rest),intvvw(5));
now_rest=setdiff(now_rest,now5);
now6=randperm(length(now_rest),intvvw(6));
now_rest=setdiff(now_rest,now6);
now7=randperm(length(now_rest),intvvw(7));
now_rest=setdiff(now_rest,now7);
now8=randperm(length(now_rest),intvvw(8));
now_rest=setdiff(now_rest,now8);
now9=randperm(length(now_rest),intvvw(9));
now_rest=setdiff(now_rest,now9);
now10=randperm(length(now_rest),intvvw(10));
now_rest=setdiff(now_rest,now10);


    crosvaliw=[];
    for i=1:10
      if i==1
        now_test=now1;
      end
      if i==2
        now_test=now2;
      end
      if i==3
        now_test=now3;
      end
      if i==4
        now_test=now4;
      end
      if i==5
        now_test=now5;
      end
      if i==6
        now_test=now6;
      end
      if i==7
        now_test=now7;
      end
      if i==8
        now_test=now8;
      end
      if i==9
        now_test=now9;
      end
      if i==10
        now_test=now10;
      end
   
        now_train=setdiff(now,now_test);
    
        xw_train=x(now_train,:);
        xw_test=x(now_test,:);
        tw_train=t(now_train);
        tw_test=t(now_test);

        net=newgrnn(xw_train',tw_train',q);
        prediw=sim(net,xw_test');
        yw=prediw';

        ccvw=cvalid(yw,tw_test);
        crosvalw=ccvw;
        crosvaliw=[crosvaliw;crosvalw];
    end   
  maemeanw=mean(crosvaliw(1,:));
  rmsemeanw=mean(crosvaliw(2,:));
  r2meanw=mean(crosvaliw(3,:));
  crw=[maemeanw,rmsemeanw,r2meanw]';

y=crw;
% xlswrite('10 fold grnn without r 0.2.xlsx',croval10foldgrnnoutr);
