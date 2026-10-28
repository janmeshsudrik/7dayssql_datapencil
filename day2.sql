use sqlchallenge;

-- 1)
select count(*) as total_order
from orders;

-- 2)
select status , count(*) as no_of_orders
from orders
group by status;

-- 5)
 
select count(*) as total_order,order_date
from orders
group by order_date
order by order_date asc;

-- 3

select order_date as latest_date
from orders
order by order_date desc
limit 10;
 
 -- 4
 
 select amount
 from payments
 order by amount desc
 limit 10;
 
 -- 6 monthly trend 
 
 select month(order_date),count(*)as total_orders
 from orders
 group by month(order_date)
order by month(order_date) asc;

-- 7
select round(avg(order_amount),2) as average_value
from (
select order_id,sum(quantity*unit_price)as order_amount
from order_items 
group by order_id
)as order_total;

-- 8
select customer_id,count(order_id) as total_orders
from orders
group by customer_id
order by total_orders desc
limit 10;

-- there are total 3000 orders
-- there are total 1796 orders which were delieverd,280 orders were returned,236 were cancelled 385 orders were shipped and 303 is still processing
-- on 2025-01-11 these date highest order were there
-- '2026-09-30''2026-09-30''2026-09-30''2026-09-30''2026-09-30''2026-09-29''2026-09-29''2026-09-29''2026-09-29''2026-09-29' these are the latest date order
-- 62489.96,49547.60 were the highest amount and lowest amount respectively
-- 300 were the highest order in the month of 8(aug) and 130 were the loweest order in the month of 11(nov)
--  total average value is '20901.27'
-- 434 and 503 customer id order maximum and 736 customer id order less 