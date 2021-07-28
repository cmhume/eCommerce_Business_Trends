-- Creating tables for eCommerce_dataDB
CREATE TABLE customers (
	customer_id VARCHAR NOT NULL,
	customer_zip_code_prefix INT NOT NULL,
	customer_city VARCHAR NOT NULL,
	customer_state VARCHAR NOT NULL,
FOREIGN KEY (customer_zip_code_prefix) REFERENCES Geological_Dataset (geological_zip_code_prefix),
FOREIGN KEY (customer_city) REFERENCES Geological_Dataset (geological_city),
FOREIGN KEY (customer_state) REFERENCES Geological_Dataset (geological_state),
	PRIMARY KEY (customer_id),
	
);
CREATE TABLE order_items (
	order_id VARCHAR NOT NULL,
	order_item_id INT NOT NULL,
	product_id VARCHAR NOT NULL,
	seller_id VARCHAR NOT NULL,
	shipping_limit_date DATE NOT NULL,
	price INT NOT NULL,
	freight_value INT NOT NULL,
FOREIGN KEY (product_id) REFERENCES Products_Dataset (product_id),
	PRIMARY KEY (order_id, product_id)
);
CREATE TABLE Products_Dataset (
	product_id VARCHAR NOT NULL,
	product_category_name VARCHAR NOT NULL,
	product_name_length INT NOT NULL,
	product_description_length INT NOT NULL,
	product_photos_qty INT NOT NULL,
	product_weight_g INT NOT NULL,
	product_length_cm INT NOT NULL,
	product_height_cm INT NOT NULL,
	product_width_cm INT NOT NULL,
FOREIGN KEY (product_category_name) REFERENCES product_category_name_translation (product_category_name),
	PRIMARY KEY (product_id)
);
CREATE TABLE product_category_name_translation (
	product_category_name VARCHAR NOT NULL,
	product_category_name_english VARCHAR NOT NULL,
	PRIMARY KEY (product_category_name)
);
CREATE TABLE Geological_Dataset (
	geological_zip_code_prefix INT NOT NULL,
	geological_lat INT NOT NULL,
	geological_lng INT NOT NULL,
	geological_city VARCHAR NOT NULL,
	geological_state VARCHAR NOT NULL,
	PRIMARY KEY (geological_zip_code_prefix, geological_city, geological_state)
);
CREATE TABLE Orders_dataset (
	order_id VARCHAR NOT NULL,
	customer_id VARCHAR NOT NULL,
	order_status VARCHAR NOT NULL,
	order_purchase_timestamp DATE NOT NULL,
	order_approved_date DATE NOT NULL,
	order_delivered__carrier_date DATE NOT NULL,
	order_delivered_customer_date DATE NOT NULL,
	order_estimated_delivery_date DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers_dataset (customer_id),
	PRIMARY KEY (order_id)
);

SELECT * FROM customers