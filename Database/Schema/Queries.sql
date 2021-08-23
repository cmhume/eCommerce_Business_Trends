-- Joining tables.
SELECT olist_customers_dataset.customer_id,
	order_item_revised.order_id,
	product_revised.product_id,
	product_category_name_translation.product_category_name_english,
	olist_customers_dataset.customer_zip_code_prefix,
	olist_customers_dataset.customer_city,
	olist_customers_dataset.customer_state,
	order_item_revised.price,
	order_item_revised.freight_value
INTO product_data
FROM product_revised
INNER JOIN product_category_name_translation
ON product_revised.product_category_name = product_category_name_translation.product_category_name
JOIN order_item_revised
ON order_item_revised.product_id = product_revised.product_id
JOIN order_list_revised
ON order_list_revised.order_id = order_item_revised.order_id
JOIN olist_customers_dataset
on olist_customers_dataset.customer_id = order_list_revised.customer_id;

--Changing column names.
ALTER TABLE product_data
RENAME product_category_name_english TO product_category;
ALTER TABLE product_data
RENAME customer_zip_code_prefix TO zip_code;
ALTER TABLE product_data
RENAME customer_city TO city;
ALTER TABLE product_data
RENAME customer_state TO state;

 --Random selection for machine learning mockup.
CREATE TABLE product_sample AS
	SELECT * FROM product_data
 	ORDER BY RANDOM()
 	LIMIT 150;

SELECT * FROM product_sample;

DROP TABLE product_sample;


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
