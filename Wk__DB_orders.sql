-- Creating tables for eCommerce_dataDB
CREATE TABLE Geolocation_revised (
	geolocation_zip_code_prefix INT NOT NULL,
	geolocation_lat FLOAT NOT NULL,
	geolocation_lng FLOAT NOT NULL,
	geolocation_city VARCHAR NOT NULL,
	geolocation_state VARCHAR NOT NULL,
	PRIMARY KEY (geolocation_zip_code_prefix)
);
CREATE TABLE olist_customers_dataset (
	customer_id VARCHAR NOT NULL,
	customer_unique_id VARCHAR NOT NULL,
	customer_zip_code_prefix INT NOT NULL,
	customer_city VARCHAR NOT NULL,
	customer_state VARCHAR NOT NULL
FOREIGN KEY (customer_zip_code_prefix) REFERENCES olist_geolocation_dataset (geolocation_zip_code_prefix),
FOREIGN KEY (customer_city) REFERENCES olist_geolocation_dataset (geolocation_city),
FOREIGN KEY (customer_state) REFERENCES olist_geolocation_dataset (geolocation_state),
	PRIMARY KEY (customer_id)
);
CREATE TABLE product_category_name_translation (
	product_category_name VARCHAR NOT NULL,
	product_category_name_english VARCHAR NOT NULL,
	PRIMARY KEY (product_category_name)
);
CREATE TABLE olist_products_dataset (
	product_id VARCHAR NOT NULL,
	product_category_name VARCHAR,
	product_name_length INT,
	product_description_lenght INT,
	product_photos_qty INT,
	product_weight_g INT NOT NULL,
	product_length_cm INT NOT NULL,
	product_height_cm INT NOT NULL,
	product_width_cm INT NOT NULL,
FOREIGN KEY (product_category_name) REFERENCES product_category_name_translation (product_category_name),
	PRIMARY KEY (product_id)
);
CREATE TABLE olist_order_items_dataset (
	order_id VARCHAR NOT NULL,
	order_item_id INT NOT NULL,
	product_id VARCHAR NOT NULL,
	seller_id VARCHAR NOT NULL,
	shipping_limit_date DATE NOT NULL,
	price FLOAT NOT NULL,
	freight_value FLOAT NOT NULL,
FOREIGN KEY (product_id) REFERENCES olist_products_dataset (product_id),
	PRIMARY KEY (order_id)
);

CREATE TABLE olist_orders_dataset (
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

SELECT * FROM Geolocation_revised;

DROP TABLE olist_order_items_dataset;

