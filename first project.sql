-- create table
CREATE TABLE retail_sales(
   transactions_id INT  PRIMARY KEY ,
   sale_date	DATE , 
   sale_time	TIME , 
   customer_id	INT ,
   gender	VARCHAR(15) ,
   age	INT , 
   category	VARCHAR(15) , 
   quantiy	INT , 
   price_per_unit	FLOAT ,
   cogs	  FLOAT ,
   total_sale FLOAT 
) ;
SELECT * FROM retail_sales 
LIMIT 10 

-- count
SELECT 
COUNT (*) 
FROM retail_sales 
-- 
-- checking null

SELECT * FROM retail_sales  
where 
transactions_id is null
   or
sale_date	 is null 
   or
   sale_time is null
   or
   customer_id	is null
   or
   gender	is null
   or
   category	is null 
   or
   quantiy	is null 
   or
   price_per_unit is null
   or
   cogs	 is null
   or
   total_sale is null ; 

   -- 
   -- data cleaning 
delete from retail_sales 
where transactions_id is null
   or
sale_date	 is null 
   or
   sale_time is null
   or
   customer_id	is null
   or
   gender	is null
   or
   category	is null 
   or
   quantiy	is null 
   or
   price_per_unit is null
   or
   cogs	 is null
   or
   total_sale is null ; 

   -- data exploration 
   select count (*) as total_sale from retail_sales 


  --
    select count ( distinct customer_id) as total_sale from retail_sales 
   


  -- 
   select   distinct category  as total_sale from retail_sales 


   -- data analysis  Q1 
   select *  from retail_sales 
   where sale_date = '2022-11-05'

   -- Q2 
   SELECT * 
   FROM retail_sales 
   WHERE category = 'Clothing'
   and 
   to_char(sale_date,'YYYY-MM') = '2022-11'
   and 
   quantiy >= 4 

   -- Q3 
   select category ,
   sum (total_sale) as net_sale , 
   count (*) as total_orders
   from retail_sales
   group by 1

   -- q4 
   select round(avg(age), 2) as avg_age
   from retail_sales
   where category = 'Beauty'

   -- Q5 

  select * from retail_sales
  where total_sale
          >1000   

  -- Q6 
  select category , 
         gender    , 
		 count (*) as total_trans
		 from retail_sale
		 group by  category , 
                    gender   
					order by 1 
-- Q7 
select year , month , avg_sale
from
 ( select extract(YEAR FROM sale_date) as year,
        extract(MONTH FROM sale_date) as month ,
  avg(total_sale) as avg_sale ,
  rank() over(PARTITION by extract (year from sale_date) order by  avg(total_sale) desc ) as rank 
  from retail_sales 
  group by 1, 2) as t1 
  where rank = 1 
  -- order by 1,  3 desc


 -- Q8 
select 
customer_id , 
sum(total_sale) as total_sales
from retail_sales
group by 1 
order by 2  desc 
limit 5 

-- Q9 
select 
category , 
count(distinct customer_id) as unique_customer
from retail_sales 
group by 1 
 




-- Q10 
with hourly_sale
as
(select * ,
case 
   when  extract(hour from sale_time) < 12 then 'morning'
   when extract(hour from sale_time) between 12 and 17  then 'afternoon'
   else 'evening '
   end as shift 
from retail_sales)  
select 
shift , 
count(*) as toral_orders
from hourly_sale
group by shift














   

