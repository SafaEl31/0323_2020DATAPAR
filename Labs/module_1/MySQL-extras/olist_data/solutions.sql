-- Question 1 
select max(price), min(price) from order_items;

-- Question 2
select min(shipping_limit_date), max(shipping_limit_date) from order_items;

-- Question 3
select count(*),customer_state from customers group by customer_state order by 1 desc limit 3;

-- Question 4

select count(*) as number_customer,customer_state,customer_city  from customers 
where customer_state='SP'
group by customer_state, customer_city order by 1 desc limit 3
;

-- Question 5:
select count(distinct(business_segment)) from closed_deals where business_segment is not null;

-- Question 6:
select sum(declared_monthly_revenue), business_segment  from closed_deals group by business_segment order by 1 desc limit 3;

-- Question 7:
select count(distinct(review_score)) from order_reviews;

-- Question 8:
select * from order_reviews;
ALTER TABLE order_reviews DROP review_category;
select distinct review_score, count(review_score) 
as review_occuracy
from order_reviews
group by review_score
order by review_score desc;

-- Question 9:
select distinct review_score, count(review_score) 
as review_occuracy
from order_reviews
group by review_score
order by review_score desc
limit 1;