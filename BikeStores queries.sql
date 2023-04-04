Select 
ord.order_id, 
CONCAT(cus.first_name, ' ',cus.last_name) as 'customers', 
cus.city, cus.state, ord.order_date, 
sum(ite.quantity) as 'Total units', 
sum(ite.quantity * ite.list_price) AS 'Revenue',
pro.product_name,
cat.category_name,
sto.store_name,
CONCAT(sta.first_name, ' ' , sta.last_name) AS 'sales_rep'
from sales.orders  ord
join sales.customers cus on ord.customer_id = cus.customer_id
Join sales.order_items ite on ord.order_id = ite.order_id
JOIN production.products pro on ite.product_id = pro.product_id
Join production.categories cat ON pro.category_id = cat.category_id
JOIN sales.stores sto ON ord.store_id = sto.store_id
JOIN sales.staffs sta ON ord.staff_id = sta.staff_id
group by ord.order_id, CONCAT(cus.first_name, ' ',cus.last_name), cus.city, cus.state, ord.order_date, 
pro.product_name, cat.category_name,sto.store_name,
CONCAT(sta.first_name, ' ' , sta.last_name) 