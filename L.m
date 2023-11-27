clc;
clear;
close all;
% ��������
SNR = 20; % �����20dB
L1=2000;%�źų���
a=1;%ARģ�Ͳ���
w=randn(L,1);
%% ����ԭʼ�ź�s(n)
s=zeros(L,1);
s(1)=0; %ԭʼ�źŵĳ�ʼֵ
for n=2:L
    s(n)=a*s(n-1)+w(n);%ԭʼ�ź�
end
%% ����
x1=awgn(s,SNR,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%�۲��ź� x=s+v.����s(n)���������Ϊ20dB�ĸ�˹������
L2=1000;
s2=s(1:L2);
x2=awgn(s2,SNR,'measured');
L3=10;
s3=s(1:L3);
x3=awgn(s3,SNR,'measured');
%% L=2000 ά���˲�
N=100;%ά���˲����Ľ���
Rxx1=xcorr(x1,N-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
for i=1:N    %����ؾ���
    for j=1:N
        rxx1(i,j)=Rxx1(N-i+j); % N*Nά��;
    end
end
Rxs1=xcorr(x1,s,N-1,'biased'); % ����غ���1*(2N-1)ά��
for i=1:N     %���������
    rxs1(i)=Rxs1(N-1+i); % 1*Mά��
end
h1=inv(rxx1)*rxs1';%�õ�ά���˲�ϵ��
y1=conv(h1,x1);%����ź�2ͨ��ά���˲���
Signal_Filter1=y1(1:L);
en1=s-Signal_Filter1;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE1=mean(en1.^2);
%% L=1000 ά���˲�
N=100;%ά���˲����Ľ���
Rxx2=xcorr(x2,N-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
for i=1:N    %����ؾ���
    for j=1:N
        rxx2(i,j)=Rxx2(N-i+j); % N*Nά��;
    end
end
Rxs2=xcorr(x2,s,N-1,'biased'); % ����غ���1*(2N-1)ά��
for i=1:N     %���������
    rxs2(i)=Rxs2(N-1+i); % 1*Mά��
end
h2=inv(rxx2)*rxs2';%�õ�ά���˲�ϵ��
y2=conv(h2,x2);%����ź�2ͨ��ά���˲���
Signal_Filter2=y2(1:L2);
en2=s-Signal_Filter2;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE2=mean(en2.^2);
%% L=10 ά���˲�
N=100;%ά���˲����Ľ���
Rxx3=xcorr(x3,N-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
for i=1:N    %����ؾ���
    for j=1:N
        rxx3(i,j)=Rxx3(N-i+j); % N*Nά��;
    end
end
Rxs3=xcorr(x3,s,N-1,'biased'); % ����غ���1*(2N-1)ά��
for i=1:N     %���������
    rxs3(i)=Rxs3(N-1+i); % 1*Mά��
end
h3=inv(rxx3)*rxs3';%�õ�ά���˲�ϵ��
y3=conv(h3,x3);%����ź�2ͨ��ά���˲���
Signal_Filter3=y3(1:L3);
en3=s-Signal_Filter3;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE3=mean(en3.^2);
%%
figure(1)
subplot(2,2,1);
plot(Signal_Filter1);
title('�źų���L=2000ʱ�˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([0,80]);
subplot(2,2,2);
plot(Signal_Filter2);
title('�źų���L=1000ʱ�˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([0,80]);
subplot(2,2,3);
plot(Signal_Filter3);
title('�źų���L=10ʱ�˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([0,80]);
subplot(2,2,4);
plot(s);
title('ԭʼ�ź�');
xlabel('ʱ��');ylabel('����');
ylim([0,80]);