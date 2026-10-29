create database sqlchallenge;
use sqlchallenge;
create table customers(customer_id int primary key,
full_name varchar (100) not null,
email varchar(100) not null,
city varchar(100) not null,
signup_date date not null,
segment varchar(20) not null);
create table products
(product_id int primary key,
product_name varchar(40),
category varchar(40),
price decimal(10,2),
cost decimal(10,2));

-- orders table

create table orders
(order_id int primary key,
customer_id int not null,
order_date date not null,
status varchar(20),
channel varchar(20),
foreign key(customer_id) references customers(customer_id));

create table order_items(
order_item_id int primary key,
order_id int not null,
product_id int not null,
quantity int not null, 
unit_price decimal(10,2),
foreign key(order_id) references orders(order_id),
foreign key(product_id) references products(product_id));

create table payments(
payment_id int primary key,
order_id int unique,
payment_method varchar(100),
payment_status varchar(100),
amount decimal(10,2),
foreign key(order_id) references orders(order_id)
);
create table delieveries(
delievery_id int primary key,
order_id int unique,
dispatch_date date,
delievery_date date null,
delievery_status varchar(100),
foreign key(order_id) references orders(order_id) 

);
DESC delieveries;

ALTER TABLE delieveries RENAME COLUMN delievery_id TO delivery_id;
ALTER TABLE delieveries RENAME COLUMN delievery_date TO delivery_date;
ALTER TABLE delieveries RENAME COLUMN delievery_status TO delivery_status;


