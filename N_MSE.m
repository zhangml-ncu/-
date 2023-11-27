clc;
clear;
close all;
load('origial signal.mat','s');
% ��������
L=2000; %�źų���
SNR= 20; % �����
%% ����
N=1:1:10; %ά���˲����Ľ���
for m=1:length(N)
    n=N(m);
x=awgn(s,SNR,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%% ����ź�x1ά���˲�
Rxx=xcorr(x,n-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
     for i=1:n    %����ؾ���
         for j=1:n
            rxx(i,j)=Rxx(n-i+j); % N*Nά��
         end
     end
Rxs=xcorr(x,s,n-1,'biased'); % ����غ���1*(2N-1)ά��
     for i=1:n    %���������
         rxs(i)=Rxs(n-1+i); % 1*Mά��
     end
h=inv(rxx)*rxs';%�õ�ά���˲�ϵ��
y=conv(h,x);%����ź�2ͨ��ά���˲���
Signal_Filter=y(1:L);
en=s-Signal_Filter;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE(:,m)=mean(en.^2);  %�˲�������ź������ԭ�źŵ�ͳ�ƾ������
end
figure(1)
plot(N,MSE,'LineWidth',1.5);
title('ά���˲����Ľ�����ʵ������Ӱ��');
xlabel('ά���˲�������');ylabel('�������MSE');
grid on;