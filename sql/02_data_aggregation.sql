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




