function tenfold_regr

filename='raw data2020.xlsx';
sheetname='Sheet1';

T=xlsread(filename,sheetname);

no=T(:,1);
lati=T(:,2);
longti=T(:,3);
lns=log(T(:,4));
lnl=log(T(:,5));
s=T(:,4);
l=T(:,5);
z=log((s.^2)./l);
hh=T(:,6);
vv=T(:,7);
hv=T(:,8);
vh=T(:,9);
m=T(:,10);

t=m;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1=hh;
x2=vv;
x3=hv;
x4=vh;   
x5=[hh,vv];
x6=[hh,hv];
x7=[hh,vh];
x8=[vv,vh];   
x9=[vv,hv];
x10=[vh,hv];
x11=[hh,vv,hv];
x12=[hh,vv,vh];  
x13=[hh,hv,vh];
x14=[vv,hv,vh];  
x15=[hh,vv,hv,vh];  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=length(T);
no=1:1:N;
no_rest=no;
intv=[15*ones(7,1);14*ones(3,1)];
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

for j=1:15
        if j==1
            x=x1;
        end
        if j==2
          x=x2;
        end
        if j==3
          x=x3;
        end
        if j==4
          x=x4;
        end 
        if j==5
          x=x5;
        end
        if j==6
          x=x6;
        end
        if j==7
          x=x7;
        end
        if j==8
          x=x8;
        end    
        if j==9
          x=x9;
        end
        if j==10
          x=x10;
        end
        if j==11
          x=x11;
        end 
        if j==12
          x=x12;
        end
        if j==13
          x=x13;
        end
        if j==14
         x=x14;
        end
        if j==15
          x=x15;
        end   
    
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

        b=regress(t_train,x_train);
        pre=zeros(size(t_test));
        
        for kk=1:length(b)
          pre=pre+b(kk)*x_test(:,kk);
        end
       
        ccv=cvalid(pre,t_test);
        crosvali=[crosvali;ccv];
    end 
    
  maemean=mean(crosvali(1,:));
  rmsemean=mean(crosvali(2,:));
  fp=mean(crosvali(3,:));
  croval(:,j)=[maemean,rmsemean,fp]';
end
xlswrite('10 fold nonlingress without rough.xlsx',croval);


