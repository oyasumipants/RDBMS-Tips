DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
address VARCHAR(100),
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE items (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
price INT UNSIGNED NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE orders (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
order_date DATE NOT NULL,
customer_id INT UNSIGNED NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_details (
order_id INT UNSIGNED NOT NULL,
item_id INT UNSIGNED NOT NULL,
item_quantity INT UNSIGNED NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL,
PRIMARY KEY(order_id,item_id),
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (item_id) REFERENCES items(id)
);
