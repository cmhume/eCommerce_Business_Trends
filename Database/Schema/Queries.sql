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
