clc;
clear;
close all;
% ��������
L=2000; %�źų���
var_w=1;  %����w(n)�ķ���
a=1;  %ARģ�Ͳ���
w=sqrt(var_w)*randn(L,1);
%% ����ԭʼ�ź�s(n)
s=zeros(L,1);
s(1)=0;  %ԭʼ�źŵĳ�ʼֵ
for n=2:L
    s(n)=a*s(n-1)+w(n);  %ԭʼ�ź�
end
S=fft(s);
%% ����20dB 
SNR1 = 20; % �����20dB 
x1=awgn(s,SNR1,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%�۲��ź� x=s+v�� ��s(n)���������Ϊ20dB�ĸ�˹������
X1=fft(x1);
%% ����ź�x1ά���˲�
% ά���˲�
H1 = fft(s) ./ fft(x1); % Ƶ���
y1 = real(ifft(H1 .* fft(x1))); % �˲�����ź�
en1=s-y1;  %����źŵ��������ź����˲�����źŵĲ�ֵ
MSE1=mean(en1.^2);
%% ����10dB
SNR2 = 10; %�����10dB
x2=awgn(s,SNR2,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%�۲��ź� x=s+v.����s(n)���������Ϊ20dB�ĸ�˹������
X2=fft(x2);
%% ����ź�x2ά���˲�
% ά���˲�
H2 = fft(s) ./ fft(x2); % Ƶ���
y2 = real(ifft(H2 .* fft(x2))); % �˲�����ź�
en2=s-y2;  %����źŵ��������ź����˲�����źŵĲ�ֵ
MSE2=mean(en2.^2);
%% ����6dB
SNR3 = 6; % �����6dB
x3=awgn(s,SNR3,'measured'); %�ڼ�����ǰ�Ȳ��������źŵĹ��ʣ��ٸ���SNR������
%�۲��ź� x=s+v.����s(n)���������Ϊ20dB�ĸ�˹������
X3=fft(x3);
%% ����ź�x3ά���˲�
% ά���˲�
H3 = fft(s)./fft(x3); % Ƶ���
y3 = real(ifft(H3 .* fft(x3))); % �˲�����ź�
en3=s-y3;  %����źŵ��������ź����˲�����źŵĲ�ֵ
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
plot(y1);%�˲��ź�
title('SNR=20dB�Ĺ۲��źž�ά���˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
figure(3);
subplot(3,1,1);
plot(s);%�����ź�
title('ԭʼ�ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,2);
plot(x2);%���ϰ������Ļ���ź�
title('SNR=10dB�������ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
subplot(3,1,3);
plot(y2);%�˲��ź�
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
plot(y3);%�˲��ź�
title('SNR=6dB�Ĺ۲��źž�ά���˲�����ź�');
xlabel('ʱ��');ylabel('����');
ylim([-40,40]);
