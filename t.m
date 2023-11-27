clc;
clear;
close all;
% ��������
L=2000;%�źų���
a=0.2;%ARģ�Ͳ���
% w=repmat(0.02,L,1);
w=randn(L,1);
%% ����ԭʼ�ź�s(n)
s=zeros(L,1);
s(1)=0; %ԭʼ�źŵĳ�ʼֵ
for n=2:L
    s(n)=a*s(n-1)+w(n);%ԭʼ�ź�
end
%% ����20dB 
SNR1 = 20; % �����20dB
x1=awgn(s,SNR1,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%% ����ź�x1ά���˲�
N=200;%ά���˲����Ľ���
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
y1=conv(x1,h1);%����ź�1ͨ��ά���˲���
Signal_Filter1=y1(1:L);
en1=s-Signal_Filter1;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE1=mean(en1.^2);
%% ����10dB
SNR2 = 10; % �����10dB
x2=awgn(s,SNR2,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%% ����ź�x2ά���˲�
N=200;%ά���˲����Ľ���
Rxx2=xcorr(x2,N-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
for i=1:N    %����ؾ���
    for j=1:N
        rxx2(i,j)=Rxx2(N-i+j); % N*Nά��;
    end
end
Rxs2=xcorr(x2,s,N-1,'biased'); % ����غ���1*(2N-1)ά��
for i=1:N     %���������
    rxs2(i)=Rxs2(N-1+i); %1*Nά��
end
h2=inv(rxx2)*rxs2';%�õ�ά���˲�ϵ��
y2=conv(h2,x2);%����ź�2ͨ��ά���˲���
Signal_Filter2=y2(1:L);
en2=s-Signal_Filter2;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE2=mean(en2.^2);
%% ����6dB
SNR3 = 6; % �����6dB
x3=awgn(s,SNR3,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%% ����ź�x3ά���˲�
N=200;%ά���˲����Ľ���
Rxx3=xcorr(x3,N-1,'biased'); % ����غ���1*(2N-1)ά�ȣ�����һ���ӳٷ�Χ��[-N��N]�Ļ���غ�������,�ԳƵ�;
for i=1:N    %����ؾ���
    for j=1:N
        rxx3(i,j)=Rxx3(N-i+j); % N*Nά��;
    end
end
Rxs3=xcorr(x3,s,N-1,'biased'); % ����غ���1*(2N-1)ά��
for i=1:N     %���������
    rxs3(i)=Rxs3(N-1+i); % 1*Nά��
end
h3=inv(rxx3)*rxs3';%�õ�ά���˲�ϵ��
y3=conv(h3,x3);%����ź�2ͨ��ά���˲���
Signal_Filter3=y3(1:L);
en3=s-Signal_Filter3;%����źŵ��������ź����˲�����źŵĲ�ֵ
MSE3=mean(en3.^2);
figure(1)
subplot(3,1,1);
plot(x1);
title('SNR=20dBʱ�Ĺ۲��ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,2);
plot(x2);
title('SNR=10dBʱ�Ĺ۲��ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,3);
plot(x3);
title('SNR=6dBʱ�Ĺ۲��ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
figure(2);
subplot(3,1,1);
plot(s);
title('ԭʼ�ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,2);
plot(x1);%���ϸ�˹�����Ļ���ź�
title('SNR=20dB�������ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,3);
plot(Signal_Filter1);%�˲��ź�
title('SNR=20dB�Ĺ۲��źž�ά���˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
figure(3);
subplot(3,1,1);
plot(s);
title('ԭʼ�ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,2);
plot(x2);%���ϰ������Ļ���ź�
title('SNR=10dB�������ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,3);
plot(Signal_Filter2);%�˲��ź�
title('SNR=10dB�Ĺ۲��źž�ά���˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
figure(4);
subplot(3,1,1);
plot(s);%�����ź�
title('ԭʼ�ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,2);
plot(x3);%���ϰ������Ļ���ź�
title('SNR=6dB�������ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,3);
plot(Signal_Filter3);%�˲��ź�
title('SNR=6dB�Ĺ۲��źž�ά���˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
save('origial signal.mat','s');
