-- Show total amount paid to each vendor.
select v.vendor_name, sum(vp.amount) as total_amount
from vendors v
join vendor_payments vp
on v.vendor_id=vp.vendor_id
group by v.vendor_name;

-- Find vendors from “San Francisco” who received payments above 10,000.
select v.vendor_name, vp.amount
from vendors v
join vendor_payments vp
on v.vendor_id=vp.vendor_id
where amount>10000 and city='San Francisco';

-- Compare average employee salary vs. total vendor payment (Finance-type query).
select 
(select avg(salary) as avg_salary from salaries), 
(select sum(amount) as total_vender_amount from vendor_payments);
