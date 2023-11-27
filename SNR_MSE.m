clc;
clear;
close all;
load('origial signal.mat','s');
% ��������
L=2000;%�źų���
%% ����
SNR= 30:2:50; % �����
for m=1:length(SNR)
    snr=SNR(m);
x=awgn(s,snr,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%% ����ź�x1ά���˲�
N=200;%ά���˲����Ľ���
Rxx=xcorr(x,N-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
     for i=1:N    %����ؾ���
         for j=1:N
            rxx(i,j)=Rxx(N-i+j); % N*Nά��;
         end
     end
Rxs=xcorr(x,s,N-1,'biased'); % ����غ���1*(2N-1)ά��
     for i=1:N     %���������
         rxs(i)=Rxs(N-1+i); % 1*Mά��
     end
h=inv(rxx)*rxs';%�õ�ά���˲�ϵ��
y=conv(h,x);%����ź�ͨ��ά���˲���
Signal_Filter=y(1:L);
en=s-Signal_Filter;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE(:,m)=mean(en.^2);    
end
figure(1)
plot(SNR,MSE,'LineWidth',1.5);
title('����ȶ�ʵ������Ӱ��');
xlabel('�����/dB');ylabel('�������MSE');
grid on;