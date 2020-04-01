-- my sql select
-- challenge 1
select 
titleauthor.au_id 'AUTHORID',
au_lname 'LAST NAME',
au_fname 'FIRST NAME',
title 'TITLE',

from titleauthor
inner join authors on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on titles.pub_id = publishers.pub_id
 ;
 

-- challenge 2
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
select 
titleauthor.au_id 'AUTHORID',
au_lname 'LAST NAME',
au_fname 'FIRST NAME',
pub_name 'PUBLISHER',
count(title) 'TITLE'
from titleauthor
inner join authors on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on titles.pub_id = publishers.pub_id
group by au_lname
 ;
 
 -- challenge 3
-- top 3 authors who have sold the highest number of titles?.
 
select 
titleauthor.au_id 'AUTHOR ID',
au_lname 'LAST NAME',
au_fname 'FIRST NAME',
pub_name 'PUBLISHER',
count(title) 'TITLE'
from titleauthor
inner join authors on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on titles.pub_id = publishers.pub_id
group by au_lname
order by count(title) desc
limit 3
 ;
 -- challenge 4 
 -- display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output 
 -- (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low. 
select titleauthor.au_id 'AUTHOR ID',au_lname 'LAST NAME',au_fname 'FIRST NAME',pub_name 'PUBLISHER',count(title) 'TITLE'
from titleauthor
inner join authors on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on titles.pub_id = publishers.pub_id
group by au_lname
order by count(title) desc
limit 23;
