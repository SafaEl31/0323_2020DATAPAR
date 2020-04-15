-- challenge 1
-- 1- royalty of each sale for each author and the advance for each author and publication
select 
round(T.price * S.qty * T.royalty / 100 * TA.royaltyper / 100)  as sales_royalty,
s.ord_num, 
auth.au_id,
auth.au_lname,
t.title_id,
advance,
pub_name
from sales s
inner join titles t on s.title_id = s.title_id
inner join titleauthor TA on t.title_id = TA.title_id
inner join authors auth on auth.au_id = TA.au_id
inner join publishers pub on t.pub_id = pub.pub_id
order by sales_royalty desc;
 -- 2- Using the output from Step 1 as a subquery, aggregate the total royalties for each title and author
select titleID,authorID, sum(sales_royalty) from (
select 
round(T.price * S.qty * T.royalty / 100 * TA.royaltyper / 100)  as sales_royalty,s.ord_num, auth.au_id as authorID,auth.au_lname as authorName,t.title_id as titleID,
advance as advance,pub_name as publication
from sales s
inner join titles t on s.title_id = s.title_id
inner join titleauthor TA on t.title_id = TA.title_id
inner join authors auth on auth.au_id = TA.au_id
inner join publishers pub on t.pub_id = pub.pub_id
order by sales_royalty desc
) as tab
group by titleID,authorID
order by sales_royalty
;
-- 3- Using the output from Step 2 as a subquery, calculate the total profits of each author by aggregating the advances and total royalties of each title
select authorID, sum((advance * TA.royaltyper / 100)+sales_royalty) as 'total profits' from
(
select titleID,authorID, sum(sales_royalty),advance from (
select 
round(T.price * S.qty * T.royalty / 100 * TA.royaltyper / 100)  as sales_royalty,s.ord_num, auth.au_id as authorID,auth.au_lname as authorName,t.title_id as titleID,
advance as advance,
pub_name as publication
from sales s
inner join titles t on s.title_id = s.title_id
inner join titleauthor TA on t.title_id = TA.title_id
inner join authors auth on auth.au_id = TA.au_id
inner join publishers pub on t.pub_id = pub.pub_id
order by sales_royalty desc
) as tab
group by titleID,authorID
order by sales_royalty
) as tab2
;
-- challenge 2

CREATE TEMPORARY TABLE tab1 as
select round(T.price * S.qty * T.royalty / 100 * TA.royaltyper / 100)  as sales_royalty, s.ord_num, auth.au_id as 'AuthorID',auth.au_lname,t.title_id as 'TitleID',t.advance * TA.royaltyper / 100 as advance,pub_name
from sales s
inner join titles t on s.title_id = s.title_id
inner join titleauthor TA on t.title_id = TA.title_id
inner join authors auth on auth.au_id = TA.au_id
inner join publishers pub on t.pub_id = pub.pub_id
order by sales_royalty desc;


select `Title ID`, `Author ID`, sum(sales_royalty) from tab1
group by `Title ID`, `Author ID`
order by sales_royalty;





-- step3


