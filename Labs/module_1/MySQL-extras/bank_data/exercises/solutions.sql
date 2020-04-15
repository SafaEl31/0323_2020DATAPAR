-- question 1
SELECT district_id,count(*) FROM finance.client where district_id<10 group by district_id;
-- question 2
select type,count(*) from card group by type;
-- question 3
select account_id,sum(amount) from loan group by account_id order by 2 desc limit 10;
-- question 4
select date, count(*)  from loan where date<930907 group by loan_id order by date desc;
-- question 5
select date, duration, count(*) from loan where date between 971201 and 971231 group by duration,date order by date,duration asc;
-- question 6
select account_id, type,sum(amount) as total_amount from trans where account_id=396 group by type having type='VYDAJ' or type='PRIJEM';

-- question 7
select account_id, 
case 
	when type='VYDAJ' then 'OUTGOING'
	when type='PRIJEM' then 'INGOING'
END, round(total_amount) from (select account_id, type,sum(amount) as total_amount from trans where account_id=396 group by type having type='VYDAJ' or type='PRIJEM') as tab1;

-- question 7
create temporary table temp
select account_id, sum(amount) as total_amount,
case when type='PRIJEM' then 'INGOING' else 'OUTGOING'
end as Types
from trans
where account_id = 396
group by type
having type='VYDAJ' or type='PRIJEM';
select * from temp;

-- question 7 other way 
create temporary table temp2
select  account_id,
if(type='PRIJEM','INCOMING','OUTGOING') as transaction_type,
floor(sum(amount)) as total_amount
from trans
where account_id=396
group by 1,2
order by 2;
select * from temp2;
-- question 8
select 
account_id, sum(if(transaction_type='INCOMING',total_amount,0)) as INCOMING, sum(if(transaction_type='OUTGOING',total_amount,0)) as OUTGOING,
sum(if(transaction_type='INCOMING',total_amount,0)) -sum(if(transaction_type='OUTGOING',total_amount,0)) as DIFFERENCE
from temp2;
-- other method without temporary table
select account_id, floor(sum(If(type='PRIJEM',amount,0))) as INCOMING, floor(sum(If(type='VYDAJ',amount,0))) as OUTGOING,
(floor(sum(If(type='PRIJEM',amount,0)))-floor(sum(If(type='VYDAJ',amount,0)))) as DIFFERENCE
from trans
where account_id = 396;
-- Question 9
select  
account_id, (floor(sum(If(type='PRIJEM',amount,0)))-floor(sum(If(type='VYDAJ',amount,0)))) as difference
from trans
group by account_id
order by difference desc
limit 10
;



