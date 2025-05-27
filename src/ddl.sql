create table customers (
	id int primary key,
	name varchar(100),
	email varchar(100)
);

create table products (
	id int primary key,
	name varchar(100),
	price decimal(10, 2)
);

create table orders (
	id int primary key,
	customer_id int,
	order_date date,
	foreign key (customer_id) references customers(id)
);

create table order_items (
	id int primary key,
	order_id int,
	product_id int,
	quantity int,
	foreign key (order_id) references orders(id),
	foreign key (product_id) references products(id)
);
