-- Creating tables for eCommerce_dataDB

CREATE TABLE geolocation_data (
	geolocation_zip_code_prefix INT NOT NULL,
	geolocation_lat float NOT NULL,
	geolocation_lng float NOT NULL,
	PRIMARY KEY (geolocation_zip_code_prefix)
);

CREATE TABLE customers_data (
	customer_id VARCHAR NOT NULL,
	customer_unique_id VARCHAR NOT NULL,
	customer_zip_code_prefix INT NOT NULL,
	customer_city VARCHAR NOT NULL,
	customer_state VARCHAR NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE product_category_data (
	product_category_name VARCHAR NOT NULL,
	product_category_name_english VARCHAR NOT NULL

);

CREATE TABLE products_data (
	product_id VARCHAR NOT NULL,
	product_category_name VARCHAR NOT NULL,
	product_photos_qty float NOT NULL,
	PRIMARY KEY (product_id)
);

CREATE TABLE order_item_data (
	order_id VARCHAR NOT NULL,
	order_item_id INT NOT NULL,
	product_id VARCHAR NOT NULL,
	seller_id VARCHAR NOT NULL,
	shipping_limit_date DATE NOT NULL,
	price float NOT NULL,
	freight_value float NOT NULL,
FOREIGN KEY (product_id) REFERENCES products_data (product_id),
	PRIMARY KEY (order_id)
);

CREATE TABLE orders_data (
	order_id VARCHAR NOT NULL,
	customer_id VARCHAR NOT NULL,
	order_status VARCHAR NOT NULL,
	order_purchase_timestamp DATE NOT NULL,
	order_approved_at DATE NOT NULL,
	order_delivered_carrier_date DATE NOT NULL,
	order_delivered_customer_date DATE NOT NULL,
	order_estimated_delivery_date DATE NOT NULL,
	PRIMARY KEY (order_id)
);
CREATE TABLE order_payment_data (
	order_id VARCHAR NOT NULL,
	payment_sequential int NOT NULL,
	payment_type VARCHAR NOT NULL,
	payment_installments int NOT NULL,
	payment_value float NOT NULL,
	
	PRIMARY KEY (order_id)
);

CREATE TABLE order_reviews_data (
	review_id VARCHAR NOT NULL,
	order_id VARCHAR NOT NULL,
	review_score int NOT NULL,
	review_creation_date DATE NOT NULL,
	review_answer_timestamp DATE NOT NULL,
	PRIMARY KEY (review_id)
);
CREATE TABLE seller_data (
	seller_id VARCHAR NOT NULL,
	seller_zip int NOT NULL,
	seller_city VARCHAR NOT NULL,
	seller_state VARCHAR NOT NULL,
		
	PRIMARY KEY (seller_id)
);

SELECT *  
  INTO cust_loc
  FROM customers_data
INNER JOIN geolocation_data
  ON geolocation_data.geolocation_zip_code_prefix = customers_data.customer_zip_code_prefix;

ALTER TABLE cust_loc
RENAME COLUMN customer_id TO cust_id;

SELECT *
  INTO cust_loc_orders
  FROM cust_loc
INNER JOIN orders_data
  ON orders_data.customer_id = cust_loc.cust_id;

ALTER TABLE cust_loc_orders
RENAME COLUMN order_id TO order_id1;
SELECT *
  INTO cust_loc_orders_items
  FROM cust_loc_orders
INNER JOIN order_item_data
  ON order_item_data.order_id = cust_loc_orders.order_id1;

ALTER TABLE cust_loc_orders_items
DROP COLUMN order_id;
SELECT *
  INTO cust_loc_orders_items_reviews
  FROM cust_loc_orders_items
INNER JOIN order_reviews_data
  ON order_reviews_data.order_id = cust_loc_orders_items.order_id1;

ALTER TABLE cust_loc_orders_items_reviews
DROP COLUMN order_id;

SELECT *
  INTO cust_loc_orders_items_reviews_payment
  FROM cust_loc_orders_items_reviews
INNER JOIN order_payment_data
  ON order_payment_data.order_id = cust_loc_orders_items_reviews.order_id1;

ALTER TABLE cust_loc_orders_items_reviews_payment
rename COLUMN product_id to product_id1;

SELECT *
  INTO cust_loc_orders_items_reviews_payment_product
  FROM cust_loc_orders_items_reviews_payment
INNER JOIN products_data
  ON products_data.product_id = cust_loc_orders_items_reviews_payment.product_id1;

ALTER TABLE cust_loc_orders_items_reviews_payment_product
rename COLUMN product_category_name to product_category_name1;
SELECT *
  INTO cust_loc_orders_items_reviews_payment_product_category
  FROM cust_loc_orders_items_reviews_payment_product
INNER JOIN product_category_data
  ON product_category_data.product_category_name = cust_loc_orders_items_reviews_payment_product.product_category_name1;


ALTER TABLE cust_loc_orders_items_reviews_payment_product_category
rename COLUMN seller_id to seller_id1;
SELECT *
  INTO olist_final_data
  FROM cust_loc_orders_items_reviews_payment_product_category
INNER JOIN seller_data
  ON seller_data.seller_id = cust_loc_orders_items_reviews_payment_product_category.seller_id1;

select * from olist_final_data;

ALTER TABLE olist_final_data
DROP COLUMN customer_unique_id;

ALTER TABLE olist_final_data
DROP COLUMN geolocation_zip_code_prefix;


ALTER TABLE olist_final_data
rename COLUMN customer_zip_code_prefix to zipcode;


ALTER TABLE olist_final_data
DROP COLUMN  seller_id;

ALTER TABLE olist_final_data
DROP COLUMN  order_id1;
ALTER TABLE olist_final_data
DROP COLUMN  product_id1;

ALTER TABLE olist_final_data
DROP COLUMN  cust_id;
ALTER TABLE olist_final_data
rename COLUMN  seller_id1 to seller_id;
ALTER TABLE olist_final_data
DROP COLUMN  product_category_name1;

ALTER TABLE olist_final_data
DROP COLUMN  product_category_name;



select * from olist_final_data
