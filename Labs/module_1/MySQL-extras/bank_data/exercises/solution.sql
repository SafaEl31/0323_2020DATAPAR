use finance;
-- Question 1
select client_id from client where district_id=1 order by 1 asc limit 5;
-- Question 2
select client_id from client where district_id = 72 order by 1 desc  limit 1;
-- Question 3
select amount from loan order by amount asc limit 3;
 -- Question 4
 select distinct status from loan order by status asc;
 -- Question 5
 select loan_id from loan order by payments asc  limit 1;
-- Question 6
select account_id, amount from loan order by account_id asc limit 5;
-- Question 7
select account_id from loan where duration=60 order by amount asc;
-- Question 8 
select distinct k_symbol from `order`;
-- Question 9 
select order_id from `order` where account_id=34;
-- Question 10 
select distinct account_id from `order` where order_id>=29540 and order_id<=29560;
-- Question 11
select amount from `order` where account_to=30067122;
-- Question 12
select trans_id, `date`, `type`, amount from trans where account_id=793 order by 2 desc limit 10;


