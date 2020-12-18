format long
n1 = [1,1,1,1];
n2 = conv(n1, n1);           
for i = 1:7
    n = conv(n2, n1);           % ������|�ӤE����A�C���I�ƳQ��쪺����
    n2 = n;
end

s1 = [1,1,1,1,1,1];
s2 = conv(s1, s1);
for i = 1:4
    s = conv(s2, s1);           % �����뤻�Ӥ�����A�C���I�ƳQ��쪺����
    s2 = s;
end

s0 = zeros(1,28);
s0(1) = s(1)+s(2)+s(3);         % �N���Ӥ����뤤�A���6�I�B7�I�B8�I�����ưO��
for kk = 2:28
    s0(kk) = s0(kk-1)+s(kk+2);  % �N���Ӥ����뤤�A���9~36�I�H�U�����ưO�����@�V�q
end

win = 0;
for ii = 1:28
    win = win + n(ii)*s0(ii);   % ���o��Ӫ����Ƭ��A�b���9~36�I�ɡA���몺�I�Ƥ�ۤv�p�����p
end

Prob0 = win/(4^9*6^6);          % ���o��Ӫ����v���A����Ӧ��ư��H�˥��Ŷ��Ӽ�
Prob = round(Prob0, 9)*100;
disp(['���o��Ӫ����v��', num2str(Prob,9), '%'])

even = 0;
for ii = 1:28
    even = even + n(ii)*s(ii+3); % ��H���⪺���Ƭ��A��̻��ۦP�I�ƪ����p
end

Prob1 = even/(4^9*6^6);          % ��H���⪺���v���A�䥭�⦸�ư��H�˥��Ŷ��Ӽ�
Prob2 = round(Prob1, 9)*100;
disp(['��H���⪺���v��', num2str(Prob2,9), '%'])

s1 = zeros(1,28);
s1(1) = sum(s) - s0(2);
for kk = 2:27
    s1(kk) = s1(kk-1) - s(kk+3); % �N���Ӥ����뤤�A���9~35�I�H�W�����ưO�����@�V�q
end

lose = 0;
for ii = 1:27
    lose = lose + n(ii)*s1(ii); % ���o�骺���Ƭ��A�b���9~35�I�ɡA���몺�I�Ƥ�ۤv�j�����p
end

Prob3 = lose/(4^9*6^6);         % ���o�骺���v���A��馸�ư��H�˥��Ŷ��Ӽ�
Prob4 = round(Prob3, 9)*100;
disp(['���o�骺���v��', num2str(Prob4,9), '%'])

a0 = 4^9*6^6;                   % �˥��Ŷ��Ӽ�
a1 = win + even +lose;          % �T�بƥ�o�ͭӼƬۥ[
if a0 == a1
    disp('���G���ƻP�˥��Ŷ��ӼƧk�X')
end