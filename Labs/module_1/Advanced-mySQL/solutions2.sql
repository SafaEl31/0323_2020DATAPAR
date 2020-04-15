-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

select tit.title_id as 'Title ID',ta.au_id as 'Author ID',
round(tit.advance * ta.royaltyper / 100) as 'Advance',
round(tit.price * s.qty * tit.royalty / 100 * ta.royaltyper / 100) as Royalty 
 from sales s
 inner join titles tit on s.title_id = tit.title_id
 inner join titleauthor ta on ta.title_id = tit.title_id;


-- Step 2: Aggregate the total royalties for each title and author

select distinct(`Title ID`), `Author ID`, sum(Royalty)
from (select tit.title_id as `Title ID`,ta.au_id as `Author ID`,
round(tit.advance * ta.royaltyper / 100) as 'Advance',
round(tit.price * s.qty * tit.royalty / 100 * ta.royaltyper / 100) as Royalty 
 from sales s
 inner join titles tit on s.title_id = tit.title_id
 inner join titleauthor ta on ta.title_id = tit.title_id
 ) as tab1 group by `Author ID`
 ;
 
 -- Step 3: Calculate the total profits of each author
 
 
 