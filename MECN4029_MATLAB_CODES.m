t1=out.tout;

%Linear Defintions
Velocity=out.velocity;
Position=out.position;

%NonLineaer Definitions

Velocity2=out.velocity2;
Position2=out.position2;
%velocity figure


figure; plot(t1, Velocity);
hold on; plot(t1, Velocity2,'--b');
grid on;
legend('Linear', 'Non-Linear');
xlabel('time[s]','FontSize',10,'FontWeight','bold');
ylabel('thetadot[rad/s]','FontSize',10,'FontWeight','bold');

%Positionplot

figure; plot(t1,Position);
hold on; plot(t1, Position2,'--b');
grid on;
legend('Linear','Non-Linear');
xlabel('time[s]','FontSize',10,'FontWeight','bold');
ylabel('theta (rad)','FontSize',10,'FontWeight','bold');


%responses plot
t1=out.tout;
Voltage=out.response;
Voltagex=squeeze(Voltage);
figure; plot(t1, Voltagex);
grid on;
xlabel('time[s]','FontSize',10,'FontWeight','bold');
ylabel('Voltage[V]','FontSize',10,'FontWeight','bold');

%plots for nonlinear stability
figure; plot(t1, Position2);
grid on;
xlabel('time[s]','FontSize',10,'FontWeight','bold');
ylabel('theta (rad)','FontSize',10,'FontWeight','bold');

figure; plot(t1, Velocity2);
grid on;
xlabel('time[s]','FontSize',10,'FontWeight','bold');
ylabel('thetadot[rad/s]','FontSize',10,'FontWeight','bold');

t_tracking=out.tout;
input=out.TRACKING(:,1);
response=out.TRACKING(:,2);
figure; plot(t_tracking,input, '--b');
hold on; plot(t_tracking,response,'--r');
grid on;
legend('Input', 'System response');
xlabel('time[mins]','FontSize',10,'FontWeight','bold');
ylabel('Position[rad]','FontSize',10,'FontWeight','bold');

Data= 'SOLAR DATA.xlsx';

summerdata=readtable(Data, 'Sheet','SUMMER','Range','B1:C164');
summertime=summerdata{:,1};
summerposition=summerdata{:,2};

winterdata=readtable(Data, 'Sheet','WINTER','Range','B1:C128');
wintertime=winterdata{:,1};
winterposition=winterdata{:,2};

figure;plot(summertime,summerposition);
hold on; plot(wintertime,winterposition);
grid on;
legend('Summer', 'Winter')
xlabel('time[mins]','FontSize',10,'FontWeight','bold');
ylabel('Position[rad]','FontSize',10,'FontWeight','bold');

