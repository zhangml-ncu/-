clc;
clear;
close all;
load('origial signal.mat','s');
% ��������
SNR1= 20; % �����20dB
%% ����
L=50:50:300;%�źų���
for m=1:length(L)
    l=L(m);
    S=s(1:l,:);
x=awgn(S,SNR1,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%% ����ź�x1ά���˲�
N=10;%ά���˲����Ľ���
Rxx=xcorr(x,N-1,'biased'); % ����غ���
     for i=1:N    %����ؾ���
         for j=1:N
            rxx(i,j)=Rxx(N-i+j); % N*Nά��;
         end
     end
Rxs=xcorr(x,S,N-1,'biased'); % ����غ���
     for i=1:N     %���������
         rxs(i)=Rxs(N-1+i);  % 1*Mά��
     end
h=inv(rxx)*rxs'; %�õ�ά���˲�ϵ��
y=conv(h,x); %����ź�ͨ��ά���˲���
Signal_Filter=y(1:l);
en=S-Signal_Filter;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE1(:,m)=mean(en.^2);    
end
SNR2= 10; % �����20dB
%% ����
L=50:50:300;%�źų���
for m=1:length(L)
    l=L(m);
    S=s(1:l,:);
x=awgn(S,SNR2,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%% ����ź�x1ά���˲�
N=10;%ά���˲����Ľ���
Rxx=xcorr(x,N-1,'biased'); % ����غ���
     for i=1:N    %����ؾ���
         for j=1:N
            rxx(i,j)=Rxx(N-i+j); % N*Nά��;
         end
     end
Rxs=xcorr(x,S,N-1,'biased'); % ����غ���
     for i=1:N     %���������
         rxs(i)=Rxs(N-1+i);  % 1*Mά��
     end
h=inv(rxx)*rxs'; %�õ�ά���˲�ϵ��
y=conv(h,x); %����ź�ͨ��ά���˲���
Signal_Filter=y(1:l);
en=S-Signal_Filter;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE2(:,m)=mean(en.^2);    
end
SNR3= 6; % �����20dB
%% ����
L=50:50:300;%�źų���
for m=1:length(L)
    l=L(m);
    S=s(1:l,:);
x=awgn(S,SNR3,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%% ����ź�x1ά���˲�
N=10;%ά���˲����Ľ���
Rxx=xcorr(x,N-1,'biased'); % ����غ���
     for i=1:N    %����ؾ���
         for j=1:N
            rxx(i,j)=Rxx(N-i+j); % N*Nά��;
         end
     end
Rxs=xcorr(x,S,N-1,'biased'); % ����غ���
     for i=1:N     %���������
         rxs(i)=Rxs(N-1+i);  % 1*Mά��
     end
h=inv(rxx)*rxs'; %�õ�ά���˲�ϵ��
y=conv(h,x); %����ź�ͨ��ά���˲���
Signal_Filter=y(1:l);
en=S-Signal_Filter;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE3(:,m)=mean(en.^2);    
end
figure(1)
plot(L,MSE1,'-s','LineWidth',1.5);
hold on;
plot(L,MSE2,'-*','LineWidth',1.5);
hold on;
plot(L,MSE3,'-o','LineWidth',1.5);
title('�źų��ȶ�ʵ������Ӱ��');
xlabel('�źų���');ylabel('�������');
legend( 'SNR=20dB','SNR=10dB','SNR=6dB'); 
grid on;