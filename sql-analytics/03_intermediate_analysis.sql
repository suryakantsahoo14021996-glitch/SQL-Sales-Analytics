select * from saless limit 1;

/*What is the overall Sales, Profit, Quantity and Average Discount?*/
select 
sum(Sales) as total_sales , 
sum(Profit) as total_profit,
sum(Quantity) as total_qty,
avg(Discount) as avg_discount
from saless;

/*What are the monthly Sales and Profit trends?*/
select 
month(STR_TO_DATE(`Order Date`, '%Y-%m-%d')) as month_number,
monthname(STR_TO_DATE(`Order Date`, '%Y-%m-%d')) as month,
Round(sum(Sales),2) as total_sales,
round(sum(Profit),2) as total_profit
from saless
group by 1, 2
order by month(STR_TO_DATE(`Order Date`, '%Y-%m-%d')) ;

/*Which countries generate the highest Sales and Profit?*/
select
Country , 
round(sum(Sales),2) as total_sales,
round(sum(Profit),2) as total_profit
from saless
group by 1
order by 1 desc ,2 desc
limit 1;

/*Which Products generate the highest Sales, Quantity and Profit?*/
select
Product, 
sum(Sales) as total_sales,
sum(Quantity) as total_qty,
sum(Profit) as total_profit
from saless
group by 1
order by 2 desc , 3 desc , 4 desc
limit 10;

/*Which Customer Segments are most profitable?*/
select 
Segment,
sum(Profit) as total_profit
from saless
group by 1
order by 2 desc;

/*Which Industries generate high Sales but low/negative Profit?*/
select 
Industry,
sum(Sales) as total_sales,
sum(Profit) as total_profit
from saless
group by 1
having 
sum(Sales) > 20000
and 
sum(Profit) <= 0
order by total_sales;

/*What is the Profit Margin % by Region?*/
select
Region,
round(sum(Profit),2) as total_profit,
round(Sum(Sales),2) as total_sales,
round((sum(Profit)/Nullif(Sum(Sales),0)),2) * 100 as Profit_margin
 from saless
 group by 1;
 
 /*What percentage of total Sales does each Region contribute?*/
 select 
 Region,
 round(sum(Sales),2) as total_Sales,
 round(sum(Sales)/(Select sum(Sales) from saless)*100,2) as total_contribution
 from saless
 group by 1;
 
 /*Who are the Top 10 Customers by Sales and Profit?*/
 select 
 Customer,
 sum(Sales) as total_sales,
 sum(Profit) as total_profit
 from saless
 group by 1
 order by 2 desc , 3 desc
 limit 10;
 
 /*Which Customers have high Sales but negative Profit?*/
 select 
 Customer,
 sum(Sales) as total_sales,
 sum(Profit) as total_profit
 from saless
 group by 1
 having
 sum(Sales) > 20000
 and sum(Profit) < 0
 order by 2 desc;
 
 /*What is the relationship between Discount and Profit?*/
 Select
 case
 when Discount = 0 then 'No Discount'
 when Discount between 0.1 and 0.3 then 'Low Discount'
 when Discount >= 0.4 then 'Medium Discount'
 else 'High Discount'
 end as Discount_category,
 sum(Sales) as total_sales,
 sum(Profit) as total_profit,
 round(sum(Profit)/nullif(sum(Sales),0) *100,2) as profit_margin
 from saless
 group by 1
 order by 2 desc;
 
 /* Which products have the highest average discount and how does it affect margin?	*/
 select
 Product , 
 sum(Sales) as total_sales,
 sum(Profit) as total_profit,
 avg(Discount) as avg_discount,
 sum(Profit)/nullif(sum(Sales),0) * 100 as profit_margin,
 case 
 when Discount = 0 then 'No Discount'
 when Discount between 0.1 and 0.3 then 'Low Discount'
 when Discount between 0.4 and 0.6 then 'High Discount'
 else 'High Discount'
 end as Discount_category
 from saless
 group by 1 , 6
 order by 6;