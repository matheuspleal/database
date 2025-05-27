insert into customers (id, name, email) values (1, 'John', 'john@example.com');
insert into customers (id, name, email) values (2, 'Jane', 'jane@example.com');

insert into products (id, name, price) values
(1, 'Notebook', 3500.00),
(2, 'Mouse', 100.00),
(3, 'Teclado', 150.00);

insert into orders (id, customer_id, order_date) values
(1, 1, '2025-05-01'),
(2, 2, '2025-05-02');

insert into order_items (id, order_id, product_id, quantity) values
(1, 1, 1, 1),  -- John comprou 1 Notebook
(2, 1, 2, 2),  -- John comprou 2 Mouses
(3, 2, 2, 1),  -- Jane comprou 1 Mouse
(4, 2, 3, 1);  -- Jane comprou 1 Teclado

select * from customers;

select 
	i.id as order_id,
	p.name as product_name,
	p.price,
	i.quantity,
	(p.price * i.quantity) as total
from order_items i 
join products p on i.product_id = p.id
where i.order_id = 1;

select
	o.id as order_id,
	c.name as customer_name,
	p.name as product_name,
	i.quantity,
	p.price,
    (p.price * i.quantity) as total_item
from orders o
join customers c on o.customer_id = c.id
join order_items i on i.order_id = o.id
join products p on p.id = i.product_id;