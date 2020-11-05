function y=tenfold_grnn10(x,t,q)
Nt=length(t);
not=1:1:Nt;
not_rest=not;
intvt=[10*ones(7,1);14*ones(3,1)];
not_intv=randperm(length(intvt));
intvvt=intvt(not_intv);

not1=randperm(length(not_rest),intvvt(1));
not_rest=setdiff(not_rest,not1);
not2=randperm(length(not_rest),intvvt(2));
not_rest=setdiff(not_rest,not2);
not3=randperm(length(not_rest),intvvt(3));
not_rest=setdiff(not_rest,not3);
not4=randperm(length(not_rest),intvvt(4));
not_rest=setdiff(not_rest,not4);
not5=randperm(length(not_rest),intvvt(5));
not_rest=setdiff(not_rest,not5);
not6=randperm(length(not_rest),intvvt(6));
not_rest=setdiff(not_rest,not6);
not7=randperm(length(not_rest),intvvt(7));
not_rest=setdiff(not_rest,not7);
not8=randperm(length(not_rest),intvvt(8));
not_rest=setdiff(not_rest,not8);
not9=randperm(length(not_rest),intvvt(9));
not_rest=setdiff(not_rest,not9);
not10=randperm(length(not_rest),intvvt(10));
not_rest=setdiff(not_rest,not10);


    crosvalit=[];
    for i=1:10
      if i==1
        not_test=not1;
      end
      if i==2
        not_test=not2;
      end
      if i==3
        not_test=not3;
      end
      if i==4
        not_test=not4;
      end
      if i==5
        not_test=not5;
      end
      if i==6
        not_test=not6;
      end
      if i==7
        not_test=not7;
      end
      if i==8
        not_test=not8;
      end
      if i==9
        not_test=not9;
      end
      if i==10
        not_test=not10;
      end
   
        not_train=setdiff(not,not_test);
    
        xt_train=x(not_train,:);
        xt_test=x(not_test,:);
        tt_train=t(not_train);
        tt_test=t(not_test);

        net=newgrnn(xt_train',tt_train',q);
        predit=sim(net,xt_test');
        yt=predit';
        ccvt=cvalid(yt,tt_test);
        crosvalt=ccvt;
        crosvalit=[crosvalit;crosvalt];
    end   
  maemeant=mean(crosvalit(1,:));
  rmsemeant=mean(crosvalit(2,:));
  r2meant=mean(crosvalit(3,:));
  croval10foldgrnnoutrt=[maemeant,rmsemeant,r2meant]';

y=croval10foldgrnnoutrt;
% xlswrite('10 fold grnn without r 0.2.xlsx',croval10foldgrnnoutr);
