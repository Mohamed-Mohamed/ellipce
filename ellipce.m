%% Coded by
% Mohamed Mohamed El-Sayed Atyya
% mohamed.atyya94@eng-st.cu.edu.eg


% this program is designd to plot ellipce at different a and e
close all; clear all; clc;
open=1;  % plot factor (dont change)
e_old=0; a_old=0;
%% inputs
e=0; % eccentricity
a=1;   % semi-major axis
theta=linspace(0,2*pi,200); % theta vctor
slider_range=[0,5];  % slider_range=[min , max]
%% ellipce solution
r=a*(1-e^2)./(1+e*cos(theta));  % ellipce equation
x=r.*cos(theta);  % ellipce x-axis equation
y=r.*sin(theta);  % ellipce y-axis equation
%% plotting
fig=figure();
menu = uicontrol('Parent',fig,'Style','popupmenu','String',{'e';'a';'Exit'},'Units','centimeters' ,'Position',[17.5,0.25,3,0.5]);
slider = uicontrol('Parent',fig,'Style','slider','Units','centimeters' ,'Position',[0,0,15,0.5],'value',0,'SliderStep', [0.01,0.1] , 'min',slider_range(1), 'max',slider_range(2));
set(gcf,'color','w');
while open==1
    figure(fig);
    S = get(menu,'value');
    if S == 1
        e=get(slider,'value')/slider_range(2)*2;
    elseif S == 2
        a=get(slider,'value');
    elseif S == 3
        open=0;
    end
    if e~=e_old || a~=a_old
        clear x y r
        cla;
        if e == 0 % Circle
            theta=linspace(0,2*pi,200);
            r=a*(1-e^2)./(1+e*cos(theta));
            x=r.*cos(theta);
            y=r.*sin(theta);
            hold all;
            plot(x,y,'color','b','linewidth',2);
            % center
            plot(0,0,'o','color',[0.5,0.25,0],'linewidth',8);
            % R
            plot([0,a],[0,0],'color','g','linewidth',2);
            legend('Circle','Center','Radius')
            title(['Circle  ' '  R = ' num2str(a)],'Fontsize',18);
            axis equal
        elseif e>0 && e<1 % ellipce
            theta=linspace(0,2*pi,200);
            r=a*(1-e^2)./(1+e*cos(theta));
            x=r.*cos(theta);
            y=r.*sin(theta);
            hold all;
            plot(x,y,'color','b','linewidth',2);
            % Focus
            plot(0,0,'o','color',[0.5,0.25,0],'linewidth',8);
            % ra
            plot([0,a*(1-e)],[0,0],'color','g','linewidth',2);
            % rp
            plot([0,-a*(1+e)],[0,0],'color','cyan','linewidth',2);
            %P = semi-latus-Rectum
            plot([0,0],[0,a*(1-e^2)],'color','black','linewidth',2);
            % ae
            plot(linspace(0,-a*e,5),linspace(0,0,5),'*','color','red','linewidth',4);
            % minor axis
            plot([-a*e,-a*e],[max(y),min(y)],'color',[0.7,0.2,0.5],'linewidth',2);
            % perigee
            plot(a*(1-e),0,'o','color',[0.5,0.25,0.7],'linewidth',6);
            % apogee
            plot(-a*(1+e),0,'o','color',[0.75,0.25,0.1],'linewidth',6);
            legend('Ellipce','Focus','rp','ra','P','ae','Minor axis','Perigee','Apogee');
            title(['Ellipce  e = ' num2str(e) '  a = ' num2str(a)],'Fontsize',18);
        elseif e == 1  % Parabolic
            theta=linspace(pi/1.5,-pi/1.5,200);
            r=a*(1)./(1+cos(theta));
            x=r.*cos(theta);
            y=r.*sin(theta);
            hold all;
            plot(x,y,'color','b','linewidth',2);
            % Focus
            plot(0,0,'o','color',[0.5,0.25,0],'linewidth',8);
            % apse line
            plot([min(x),max(x)],[0,0],'color','cyan','linewidth',2);
            % rp
            plot([0,max(x)],[0,0],'color','g','linewidth',2);
            %P = semi-latus-Rectum
            plot([0,0],[0,2*max(x)],'color','black','linewidth',2);
            % perigee
            plot(max(x),0,'o','color',[0.5,0.25,0.7],'linewidth',6);
            legend('Parabolic','Focus','apse line','rp','P','Perigee');
            title(['Parabolic  e = ' num2str(e) '  a = ' num2str(a)],'Fontsize',18);
        elseif e > 1  % Hyperbolic
            theta=linspace(pi/1.5,-pi/1.5,200);
            r=a*(e^2-1)./(1+e*cos(theta));
            x=r.*cos(theta);
            y=r.*sin(theta);
            hold all;
            plot(x,y,'color','b','linewidth',2);
            % Focus
            plot(0,0,'o','color',[0.5,0.25,0],'linewidth',8);
            % apse line
            plot([min(x),max(x)],[0,0],'color','cyan','linewidth',2);
            % rp
            plot([0,max(x)],[0,0],'color','g','linewidth',2);
            % perigee
            plot(max(x),0,'o','color',[0.5,0.25,0.7],'linewidth',6);
            legend('Parabolic','Focus','apse line','rp','Perigee');
            title(['Hyperbolic  e = ' num2str(e) '  a = ' num2str(a)],'Fontsize',18);
        end
        e_old=e;
        a_old=a;
        ylabel('Y-axis','Fontsize',18);
        xlabel('X-axis','Fontsize',18);
        grid on;
    end
end
close