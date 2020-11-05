

filename='raw data2020.xlsx';
sheetname='Sheet1';

T=xlsread(filename,sheetname);

no=T(:,1);
lati=T(:,2);
longti=T(:,3);
s=T(:,4);
l=T(:,5);
hh=T(:,6);
vv=T(:,7);
hv=T(:,8);
vh=T(:,9);
m=T(:,10);
t=m;
%%%%%%%%%%%%%%%%%%%%%%
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




qq1=0.03:0.05:0.98;
qq2=0.3:0.05:1;
qq3=0.4:0.05:1;
qq4=0.5:0.05:1;



for jj=1:15
    if jj==1
        X=x1;
        qq=qq1;
        filename='hh.xlsx';
        tname='hh';
    end
    if jj==2
        X=x2;
        qq=qq1;
        filename='vv.xlsx';
        tname='vv';
    end
    if jj==3
        X=x3;
        qq=qq1;
        filename='hv.xlsx';
        tname='hv';
    end
    if jj==4
        X=x4;
        qq=qq1;
        filename='rough4.xlsx';
        tname='vh';
    end
  %%%%%%%%%%%%%%%%%%%%%%%%
    if jj==5
        X=x5;
        qq=qq2;
        filename='hh-vv.xlsx';
        tname='hh-vv';
    end
    if jj==6
        X=x6;
        qq=qq2;
        filename='hh-hv.xlsx';
        tname='hh-hv';
    end
    if jj==7
        X=x7;
        qq=qq2;
        filename='hh-vh.xlsx';
        tname='hh-vh';
    end
    if jj==8
        X=x8;
        qq=qq2;
        filename='vv-vh.xlsx';
        tname='vv-vh';
    end
    if jj==9
        X=x9;
        qq=qq2;
        filename='vv-hv.xlsx';
        tname='vv-hv';
    end
    if jj==10
        X=x10;
        qq=qq2;
        filename='hv-vh.xlsx';
        tname='hv-vh';
    end
 %%%%%%%%%%%%%%%%%%%%%%%%
    if jj==11
        X=x11;
        qq=qq3;
        filename='hh-vv-hv.xlsx';
        tname='hh-vv-hv';
    end
    if jj==12
        X=x12;
        qq=qq3;
        filename='hh-vv-vh.xlsx';
        tname='hh-vv-vh';
    end
    if jj==13
        X=x13;
        qq=qq3;
        filename='rough13.xlsx';
        tname='hh-vh-hv';
    end
    if jj==14
        X=x13;
        qq=qq3;
        filename='vv-vh-hv.xlsx';
        tname='vv-vh-hv';
    end
    if jj==15
        X=x14;
        qq=qq4;
        filename='hh-vv-hv-vh.xlsx';
        tname='hh-vv-hv-vh';
    end
%%%%%%%%%%%%%%%%%%%%%%%%
    YYY=[];
    YYy1=[];

 
    for i=1:length(qq)
       q=qq(i);
       y=tenfold_grnn1(X,t,q);
       yy=tenfold_grnn2(X,t,q);
       ys=tenfold_grnn3(X,t,q);
       yw=tenfold_grnn4(X,t,q);
       yp=tenfold_grnn5(X,t,q);
       yz=tenfold_grnn6(X,t,q);
       yu=tenfold_grnn7(X,t,q);
       ya=tenfold_grnn8(X,t,q);
       yb=tenfold_grnn9(X,t,q);
       yt=tenfold_grnn10(X,t,q);
       ynum=analysis2(y,yy,ys,yw,yp,yz,yu,ya,yb,yt);
       YY=[y;0;yy;0;ys;0;yw;0;yp;0;yz;0;yu;0;ya;0;yb;0;yt];
       if ynum(1)==1
         YYy1=[YYy1,y];
       end
       if ynum(1)==2
         YYy1=[YYy1,yy];
       end
       if ynum(1)==3
       YYy1=[YYy1,ys];
       end
       if ynum(1)==4
        YYy1=[YYy1,yw];
       end
       if ynum(1)==5
         YYy1=[YYy1,yp];
       end
       if ynum(1)==6
         YYy1=[YYy1,yz];
       end
       if ynum(1)==7
         YYy1=[YYy1,yu];
       end
       if ynum(1)==8
         YYy1=[YYy1,ya];
       end
        if ynum(1)==9
         YYy1=[YYy1,yb];
        end
       if ynum(1)==10
         YYy1=[YYy1,yt];
       end
    
       YYY=[YYY,YY];
       clear y ys yw yy yp yz yu ya yb yt 
    end
    clear X
  
    YYY=[qq;YYY;qq;YYy1];
    YYy=[qq;YYy1];
    xlswrite(filename,YYy);
    subplot(4,4,jj);
    plot(qq,YYy1(1,:),'-.g',qq,YYy1(2,:),'-.r',qq,YYy1(3,:),'-.b')
    title(tname);
   


end




