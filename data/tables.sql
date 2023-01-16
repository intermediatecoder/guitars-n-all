create table carts
(
    id int AUTO_INCREMENT PRIMARY KEY,
    profile_id int,
    created_at DATETIME DEFAULT NOW()
);

create table cart_items
(
    id int AUTO_INCREMENT PRIMARY KEY,
    seller_product_id int,
    quantity INT,
    cart_id int,
    FOREIGN KEY (seller_product_id) REFERENCES seller_products(id),
    FOREIGN KEY (cart_id) REFERENCES carts(id)
);


create table orders
(
    id int AUTO_INCREMENT PRIMARY KEY,
    profile_id int,
    name VARCHAR(255),
    email VARCHAR(255),
    phone_no VARCHAR(255),
    address VARCHAR(8000),
    pincode VARCHAR(16),
    city VARCHAR(255),
    created_at DATETIME DEFAULT NOW()
);

create table order_items
(
    id int AUTO_INCREMENT PRIMARY KEY,
    seller_product_id int,
    order_id int,
    quantity INT,
    FOREIGN KEY (seller_product_id) REFERENCES seller_products(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
