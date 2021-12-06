CREATE TABLE users (
    id serial primary key,
    name varchar(32),
    email varchar(255)
);

create table products (
    id serial primary key,
    name varchar(255),
    description text,
    price int
);

create table product_photo (
    id serial primary key,
    url text,
    product_id int references products(id)
);

create table carts (
    id serial primary key,
    user_id int references users(id),
    count int
);

create table cart_products (
    id serial primary key,
    product_id int references products(id),
    cart_id int references carts(id)
);

create table orders (
    id serial primary key,
    user_id int references users (id),
    count int,
    total bigint
);

create table order_items (
    id serial primary key,
    order_id int references orders(id),
    product_id int references carts(id)
);