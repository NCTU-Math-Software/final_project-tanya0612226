format long
n1 = [1,1,1,1];
n2 = conv(n1, n1);           
for i = 1:7
    n = conv(n2, n1);           % 紀錄骰四個九面骰，每種點數被骰到的次數
    n2 = n;
end

s1 = [1,1,1,1,1,1];
s2 = conv(s1, s1);
for i = 1:4
    s = conv(s2, s1);           % 紀錄骰六個六面骰，每種點數被骰到的次數
    s2 = s;
end

s0 = zeros(1,28);
s0(1) = s(1)+s(2)+s(3);         % 將六個六面骰中，骰到6點、7點、8點的次數記錄
for kk = 2:28
    s0(kk) = s0(kk-1)+s(kk+2);  % 將六個六面骰中，骰到9~36點以下的次數記錄成一向量
end

win = 0;
for ii = 1:28
    win = win + n(ii)*s0(ii);   % 彼得獲勝的次數為，在骰到9~36點時，對手骰的點數比自己小的情況
end

Prob0 = win/(4^9*6^6);          % 彼得獲勝的機率為，其獲勝次數除以樣本空間個數
Prob = round(Prob0, 9)*100;
disp(['彼得獲勝的機率為', num2str(Prob,9), '%'])

even = 0;
for ii = 1:28
    even = even + n(ii)*s(ii+3); % 兩人平手的次數為，兩者骰到相同點數的情況
end

Prob1 = even/(4^9*6^6);          % 兩人平手的機率為，其平手次數除以樣本空間個數
Prob2 = round(Prob1, 9)*100;
disp(['兩人平手的機率為', num2str(Prob2,9), '%'])

s1 = zeros(1,28);
s1(1) = sum(s) - s0(2);
for kk = 2:27
    s1(kk) = s1(kk-1) - s(kk+3); % 將六個六面骰中，骰到9~35點以上的次數記錄成一向量
end

lose = 0;
for ii = 1:27
    lose = lose + n(ii)*s1(ii); % 彼得輸的次數為，在骰到9~35點時，對手骰的點數比自己大的情況
end

Prob3 = lose/(4^9*6^6);         % 彼得輸的機率為，其輸次數除以樣本空間個數
Prob4 = round(Prob3, 9)*100;
disp(['彼得輸的機率為', num2str(Prob4,9), '%'])

a0 = 4^9*6^6;                   % 樣本空間個數
a1 = win + even +lose;          % 三種事件發生個數相加
if a0 == a1
    disp('結果次數與樣本空間個數吻合')
end