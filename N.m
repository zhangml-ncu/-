clc;
clear;
close all;
load('origial signal.mat','s');
% ��������
L=2000;
SNR = 10; % �����10dB
%% ����10dB 
x=awgn(s,SNR,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%% N=1 ά���˲�
N1=1;%ά���˲����Ľ���
Rxx1=xcorr(x,N1-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
for i=1:N1    %����ؾ���
    for j=1:N1
        rxx1(i,j)=Rxx1(N1-i+j); % N*Nά��;
    end
end
Rxs1=xcorr(x,s,N1-1,'biased'); % ����غ���1*(2N-1)ά��
for i=1:N1     %���������
    rxs1(i)=Rxs1(N1-1+i); % 1*Mά��
end
h1=inv(rxx1)*rxs1';%�õ�ά���˲�ϵ��
y1=conv(h1,x);%����ź�2ͨ��ά���˲���
Signal_Filter1=y1(1:L);
en1=s-Signal_Filter1;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE1=mean(en1.^2);
%% N=3 ά���˲�
N2=3;%ά���˲����Ľ���
Rxx2=xcorr(x,N2-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
for i=1:N2    %����ؾ���
    for j=1:N2
        rxx2(i,j)=Rxx2(N2-i+j); % N*Nά��;
    end
end
Rxs2=xcorr(x,s,N2-1,'biased'); % ����غ���1*(2N-1)ά��
for i=1:N2     %���������
    rxs2(i)=Rxs2(N2-1+i); % 1*Mά��
end
h2=inv(rxx2)*rxs2';%�õ�ά���˲�ϵ��
y2=conv(h2,x);%����ź�2ͨ��ά���˲���
Signal_Filter2=y2(1:L);
en2=s-Signal_Filter2;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE2=mean(en2.^2);
%% N=10 ά���˲�
N3=10;%ά���˲����Ľ���
Rxx3=xcorr(x,N3-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
for i=1:N3    %����ؾ���
    for j=1:N3
        rxx3(i,j)=Rxx3(N3-i+j); % N*Nά��;
    end
end
Rxs3=xcorr(x,s,N3-1,'biased'); % ����غ���1*(2N-1)ά��
for i=1:N3     %���������
    rxs3(i)=Rxs3(N3-1+i); % 1*Mά��
end
h3=inv(rxx3)*rxs3';%�õ�ά���˲�ϵ��
y3=conv(h3,x);%����ź�2ͨ��ά���˲���
Signal_Filter3=y3(1:L);
en3=s-Signal_Filter3;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE3=mean(en3.^2);
%%
figure(1)
subplot(2,2,1);
plot(Signal_Filter1);
title('����N=1ʱ�˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([0,40]);
grid on;
subplot(2,2,2);
plot(Signal_Filter2);
title('����N=3ʱ�˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([0,40]);
grid on;
subplot(2,2,3);
plot(Signal_Filter3);
title('����N=10ʱ�˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([0,40]);
grid on;
subplot(2,2,4);
plot(s);
title('ԭʼ�ź�');
xlabel('ʱ��');ylabel('����');
ylim([0,40]);
grid on;