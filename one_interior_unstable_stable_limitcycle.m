clear all;
format long;

set(0, 'DefaultAxesFontSize', 14)

 S=0.29779715;
 A=0.17;
 B=0.15;
 R=0.02;
 Q=0.2;
 L=0.1;

  M=150000;
  N=2;
% 
   x(1:N,:)=zeros(N,M+1);
   y(1:N,:)=zeros(N,M+1);
  x1(1,:)=zeros(1,M+1);
   y1(1,:)=zeros(1,M+1);
% 
%  
 t=zeros(1,M+1);
% 
% -ve direction N=1, M=9700
%     x(1,1)=0.1+0.00001;
%     y(1,1)=(0.715033916527159/0.699089764061691)*0.00001;


%  +ve direction N=2, M=150000  pic 1, S=0.35 R=0.105
%     x(1,1)=0.6166724522-0.1;
%     y(1,1)=0.4864447084-0.1;
%     x(2,1)=0.5;
%     y(2,1)=0.357;
    
    
    %  +ve direction N=7, M=150000 
    x(1,1)=0.633;
    y(1,1)=0.58;
    x(2,1)=0.633;
    y(2,1)=0.5;
%     x(3,1)=1;
%     y(3,1)=0.001;
%     x(4,1)=0.55;
%     y(4,1)=0.2;
%     x(5,1)=0.1;
%     y(5,1)=0.2;
%     x(6,1)=0.18;
%     y(6,1)=0.2;
%     x(7,1)=0.4;
%     y(7,1)=0.001;
%  
% 
% 
% 
  t(1)=0;
  dt=0.01;
% 
%  
  for j=1:M
      t(j+1)=t(j)+dt;
  end
 

 
  for i=1:N
    
for j=1:M
    
    k1(i)=dt*(x(i,j)*(1-x(i,j))*(x(i,j)-L)-S*(x(i,j)*y(i,j))/(A+x(i,j)+B*y(i,j)));
    l1(i)=dt*(S*(x(i,j)*y(i,j))/(A+x(i,j)+B*y(i,j))-Q*y(i,j)-R*y(i,j)^2);
    k2(i)=dt*((x(i,j)+0.5*k1(i))*(1-(x(i,j)+0.5*k1(i)))*((x(i,j)+0.5*k1(i))-L)-S*((x(i,j)+0.5*k1(i))*(y(i,j)+0.5*l1(i)))/(A+(x(i,j)+0.5*k1(i))+B*(y(i,j)+0.5*l1(i))));
    l2(i)=dt*(S*((x(i,j)+0.5*k1(i))*(y(i,j)+0.5*l1(i)))/(A+(x(i,j)+0.5*k1(i))+B*(y(i,j)+0.5*l1(i)))-Q*(y(i,j)+0.5*l1(i))-R*(y(i,j)+0.5*l1(i))^2);
    k3(i)=dt*((x(i,j)+0.5*k2(i))*(1-(x(i,j)+0.5*k2(i)))*((x(i,j)+0.5*k2(i))-L)-S*((x(i,j)+0.5*k2(i))*(y(i,j)+0.5*l2(i)))/(A+(x(i,j)+0.5*k2(i))+B*(y(i,j)+0.5*l2(i))));
    l3(i)=dt*(S*((x(i,j)+0.5*k2(i))*(y(i,j)+0.5*l2(i)))/(A+(x(i,j)+0.5*k2(i))+B*(y(i,j)+0.5*l2(i)))-Q*(y(i,j)+0.5*l2(i))-R*(y(i,j)+0.5*l2(i))^2);
    k4(i)=dt*((x(i,j)+k3(i))*(1-(x(i,j)+k3(i)))*((x(i,j)+k3(i))-L)-S*((x(i,j)+k3(i))*(y(i,j)+l3(i)))/(A+(x(i,j)+k3(i))+B*(y(i,j)+l3(i))));
    l4(i)=dt*(S*((x(i,j)+k3(i))*(y(i,j)+l3(i)))/(A+(x(i,j)+k3(i))+B*(y(i,j)+l3(i)))-Q*(y(i,j)+l3(i))-R*(y(i,j)+l3(i))^2);
    
    
    x(i,j+1)=x(i,j)+(k1(i)+2*k2(i)+2*k3(i)+k4(i))/6;
    y(i,j+1)=y(i,j)+(l1(i)+2*l2(i)+2*l3(i)+l4(i))/6;
end
  end

   
  %for limit cycle
   
% x1(1)=0.4604;
%  y1(1)=0.2683;
%     
%  for j=1:M
%     k1=dt*(x1(j)*(1-x1(j))*(x1(j)-L)-S*(x1(j)*y1(j))/(A+x1(j)+B*y1(j)));
%     l1=dt*(S*(x1(j)*y1(j))/(A+x1(j)+B*y1(j))-Q*y1(j)-R*y1(j)^2);
%      
%     k2=dt*((x1(j)+0.5*k1)*(1-(x1(j)+0.5*k1))*((x1(j)+0.5*k1)-L)-S*((x1(j)+0.5*k1)*(y1(j)+0.5*l1))/(A+(x1(j)+0.5*k1)+B*(y1(j)+0.5*l1)));
%     l2=dt*(S*((x1(j)+0.5*k1)*(y1(j)+0.5*l1))/(A+(x1(j)+0.5*k1)+B*(y1(j)+0.5*l1))-Q*y1(j)-R*(y1(j)+0.5*l1)^2);
%     k3=dt*((x1(j)+0.5*k2)*(1-(x1(j)+0.5*k2))*((x1(j)+0.5*k2)-L)-S*((x1(j)+0.5*k2)*(y1(j)+0.5*l2))/(A+(x1(j)+0.5*k2)+B*(y1(j)+0.5*l2)));
%     l3=dt*(S*((x1(j)+0.5*k2)*(y1(j)+0.5*l2))/(A+(x1(j)+0.5*k2)+B*(y1(j)+0.5*l2))-Q*(y1(j)+0.5*l2)-R*(y1(j)+0.5*l2)^2);
%     k4=dt*((x1(j)+k3)*(1-(x1(j)+k3))*((x1(j)+k3)-L)-S*((x1(j)+k3)*(y1(j)+l3))/(A+(x1(j)+k3)+B*(y1(j)+l3)));
%     l4=dt*(S*((x1(j)+k3)*(y1(j)+l3))/(A+(x1(j)+k3)+B*(y1(j)+l3))-Q*(y1(j)+l3)-R*(y1(j)+l3)^2);
%     x1(j+1)=x1(j)+(k1+2*k2+2*k3+k4)/6;
%     y1(j+1)=y1(j)+(l1+2*l2+2*l3+l4)/6;
% end
%   
  
  

%plot(x1, y1)
% plot(x1(9000:end),y1(9000:end),'LineWidth',2)
% hold on;
%comet(x1,y1)
 %plot(t,x1)
% hold on;
% plot(t,y1)
 %hold on;




 
 
 
 
 
 
 
 
%  
%  
% % 
        plot(x(1,:),y(1,:),'LineWidth',2)
         hold on;
        plot(x(2,:),y(2,:),'LineWidth',2);
         hold on;
%         plot(x(3,:),y(3,:),'LineWidth',2)
%          hold on;
%         plot(x(4,:),y(4,:),'LineWidth',2);
%          hold on;
%         plot(x(5,:),y(5,:),'LineWidth',2)
%          hold on;
%         plot(x(6,:),y(6,:),'LineWidth',2);
%          hold on;
%         plot(x(7,:),y(7,:),'LineWidth',2)
%          hold on;
%         plot(x(8,:),y(8,:),'LineWidth',2);
%          hold on;
% % %  
% % 
% % 
% % 
% %   hold on;
% 
% 
   plot(0.6339239261, 0.5852695815,'marker','o','markersize',10,'color','black','LineWidth',2);
   hold on;
% %   
%     plot(0.6334671784, 0.08851061502,'marker','o','markersize',10,'color','black','LineWidth',2);
%     hold on;
%      plot(1,0,'marker','o','markersize',10,'color','black','LineWidth',2);
%      hold on;
%      plot(0,0,'marker','.','markersize',30,'color','red','LineWidth',2);
%      hold on;
%      plot(L,0,'marker','o','markersize',10,'color','black','LineWidth',2);
 %axis([0 1 0 0.2 ]);
 xlabel('u \rightarrow');
 ylabel('v \rightarrow');