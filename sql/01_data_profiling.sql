/*Data understanding--*/
select * from saless limit 2;
Describe saless;
Select count(*) from saless;
select distinct(Region) from saless;
select count(distinct(Product)) as Count from saless;
select count(*) from saless where Sales = 'NULL';
SELECT count(*) as Total_count FROM saless;

/*Data Validation */
select * from saless where Quantity <= 0;
select * from saless where Discount > 100;
select distinct Country from saless;


