insert into users (name, email) values ('Asadbek', 'asadbek@mail.ru');
insert into users (name, email) values ('Alisher', 'alisher@mail.ru');

insert into products (name, description, price) values 
    ('iPhone', 'zor telefon', 1000),
    ('Apple Watch', 'zor soat', 500),
    ('Macbook', 'zor mac', 2000);

insert into product_photo (url, product_id) values 
    ('iphone_photo', 1),
    ('watch_photo', 2),
    ('mac_photo', 3);

insert into carts (count, user_id) values (2, 1);
insert into carts (count, user_id) values (1, 2);

insert into cart_products (product_id, cart_id) values (1, 1), (2, 1);
insert into cart_products (product_id, cart_id) values (1, 2), (2, 2);

insert into product_photo (product_id, url) values (100, 'url');

select * from users;
select * from products;

select pp.* from product_photo pp;

select p.id as product_id, p.name as product_name, pp.url as product_photo_url from product_photo pp left join products p on p.id=pp.product_id;

select p.id as product_id, p.name as product_name, pp.url as product_photo_url from product_photo pp right join products p on p.id=pp.product_id;

select cp.id, u.name as user_name, p.name as product_name, p.price as product_price from cart_products cp left join carts c on cp.cart_id=c.id left join users u on u.id=c.user_id left join products p on p.id = cp.product_id;

select u.name as user_name, sum(coalesce(p.price, 0) * c.count) as order_sum from cart_products cp left join carts c on cp.cart_id=c.id left join users u on u.id=c.user_id left join products p on p.id = cp.product_id group by u.name;

select u.name as user_name, sum(coalesce(p.price, 0) * c.count) as order_sum from cart_products cp left join carts c on cp.cart_id=c.id left join users u on u.id=c.user_id left join products p on p.id = cp.product_id group by u.name having u.name = 'Alisher';

select u.name as user_name, sum(coalesce(p.price, 0) * c.count) as order_sum from cart_products cp left join carts c on cp.cart_id=c.id left join users u on u.id=c.user_id left join products p on p.id = cp.product_id group by u.name order by order_sum desc; 

select u.name as user_name, sum(coalesce(p.price, 0) * c.count) as order_sum from cart_products cp left join carts c on cp.cart_id=c.id left join users u on u.id=c.user_id left join products p on p.id = cp.product_id group by u.name having (sum(p.price * c.count) < 2000);

select cp.id, u.name as user_name, p.name as product_name, p.price as product_price from cart_products cp left join carts c on cp.cart_id=c.id left join users u on u.id=c.user_id left join products p on p.id = cp.product_id limit 1 offset 1;

-- inner join
-- left join 
-- right join