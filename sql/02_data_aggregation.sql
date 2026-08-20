/*data aggregation*/
SELECT * from saless limit 1;
select Region, round(sum(Sales),2) FROM saless group by Region
order by 2 desc;
select count(*),
count('Order ID'),
count('Customer') from saless;
select max(Sales) as max_sales,
max(Quantity) as max_quantity from saless;
select count(distinct(Region)) as Region from saless;
select max('Order Date') as min_date from saless;
describe saless;
SELECT
    STR_TO_DATE(`Order Date`, '%d-%m-%Y') AS converted_date
FROM SALESS;

/*Region wise Sales*/
select
Region,
sum(Sales),
sum(Quantity),
sum(Sales)/nullif(sum(Quantity),0) as Unit_Price
from saless
group by 1;
Select Distinct(Subregion) from saless
where Region= "AMER";

select round(sum(Sales),2),
max(Sales) as max_sales,
min(Sales) as min_sales,
avg(Sales) as avg_sales
from saless;

select * from saless
where Sales < 0;

Select 
Region,
round(sum(Sales),2) as total_sales
 from saless
 group by 1
 order by 1 desc;
 
 select 
 Industry,
 sum(Sales) as total_sales
 from saless
 group by 1
 order by 1
 limit 1;
 
 select 
 Customer,
 Sales as total_sales
 from saless
 order by Sales desc
 limit 5;
 
 /*Quantity Aggregation*/
select 
sum(Quantity) as totla_qty,
avg(Quantity) as avg_quantity,
max(Quantity) as max_qty
from saless; 

select 
Product , 
sum(Quantity) as total_qty
from saless
group by 1
order by total_qty desc
limit 5;

select 
Region , 
sum(Quantity) as total_qty
from saless
group by 1
order by total_qty desc
limit 5;

#data aggregation checks to see the data quality , Nulls and performed data profiling by aggregation


 




