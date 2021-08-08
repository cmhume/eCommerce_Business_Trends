## Database
We used Postgres to create tables in SQL. The ERD below shows connectivity among 9 tables. 


The description of these tables is as follows: -
1) olist_orders_dataset: This table is connected to 4 other tables. It is used to connect all the details related to an order.
2) olist_order_items_dataset: It contains the details of an item that had been purchased such as shipping date, price and so on.
3) olist_order_reviews_dataset: It contains details related to any reviews posted by the customer on a particular product that he had purchased.
4) olist_products_dataset: It contains related to a product such as the ID, category name and measurements.
5) olist_order_payments_dataset: The information contained in this table is related to the payment details associated with a particular order.
6) olist_customers_dataset: Details the customer base information of this firm.
7) olist_geolocation_dataset: It contains geographical information related to both the sellers and customers.
8) olist_sellers_dataset: This table contains the information related to all the sellers who have registered with this firm.
9) olist_product_category_name_translation: This table is connected to products database. 

We cleaned all these tables using Jupyter Notebook and imported to postgres for joining the tables to create one big database to further anaysis. 
We used inner join to join all the tables. 
<img width="590" alt="SQL" src="https://user-images.githubusercontent.com/69255270/128648004-910c37f3-e5bb-44ba-bfbc-8820744e1d79.png">


### Using RDS on AWS with Jupyter notebooks

#### Step 1: Setting up the Database on : 
We used AWS free tier template to create our RDS database on AWS. We learnt that free template isn't available only for Postgres 12 and higher versions.
AWS![Uploading AWS.png…]()

We made our database accessible from anywhere so it’s accessible outside of the default VPC.  

#### Step2: Create AWS server on postgres
Once database is created on AWS, we created AWS server with name final_project on postgres. 

<img width="488" alt="pic" src="https://user-images.githubusercontent.com/69255270/128648078-2d43df09-0a78-44b6-884f-45cc7aae1ad8.png">

We used the schema we created before to create all the tables again and then join them using inner join. 

<img width="504" alt="query" src="https://user-images.githubusercontent.com/69255270/128648145-b29de563-386d-4b6b-a969-ff7773cf0fe8.png">

The final joined database was imported to jupyter notebook and it has total 34 columns and 91596 rows. 

<img width="494" alt="info" src="https://user-images.githubusercontent.com/69255270/128648229-152faa16-4ece-4357-bcf1-63a9ae06c7db.png">

#### Step 3: Simplifying our data
We Created a profile of our data to understand the relation between various features. We realised many features in our data are not affecting the review score and we dropped those columns.  for example:  features like "customer_city", "customer_state", "geolocation_lat","geolocation_lng", "customer_id", "order_purchase_timestamp", "order_approved_at", "order_delivered_carrier_date", "payment_sequential" etc were dropped.  

<img width="487" alt="profiling" src="https://user-images.githubusercontent.com/69255270/128648277-acf13a84-8f81-4f39-ba30-4708d932d933.png">

We confirmed our results by creating a corelation matrix.  
<img width="449" alt="corelation_matrix" src="https://user-images.githubusercontent.com/69255270/128648339-d6a96522-5313-4f21-8970-263fec15bf38.png">

Finally we were left with the follwing columns in our data:
- zipcode	order_status
- price	freight_value	review_score	
- payment_type	
- payment_value	product_id	
- product_photos_qty	
- product_category	
- seller_zip	
- seller_state	
- time_order_to_delivery	
- time_estimate_to_delivery

#### Step 4:  Feature Engineering

We used the following methids to encode the catagorical variables:

- lambda function
- label encoder
<img width="416" alt="feature engineering1" src="https://user-images.githubusercontent.com/69255270/128648449-1c0cfb08-ee1b-4c62-a8bf-4f86a8a4875c.png">
<img width="423" alt="Feature engineering 2" src="https://user-images.githubusercontent.com/69255270/128648452-70e8facd-0a78-47fa-9e4b-453765c0a0aa.png">

Our final data has 13 columns
<img width="550" alt="final" src="https://user-images.githubusercontent.com/69255270/128648468-b1c846a9-2f89-4b50-aed3-61a93f481c3a.png">

#### Step 5: Importing CSV
As a first step to connect with AWS database we imported our dataframe to csv file. 
<img width="469" alt="CSV" src="https://user-images.githubusercontent.com/69255270/128648506-d0cfcfc7-532e-4516-a31f-8ac474355dc7.png">


#### Step 6: Setting up your config file
Once you have psycopg2, you created a config.py file to store the details for accessing your database. To connect, we’ll need the database:
- Endpoint
- Port
- Name
- User’s Name
- User’s Password

#### Step 7: Connecting & Creating a table
After importing psycopg2 and our config file, we created a function that connects to the database and sets up a cursor. This function uses our credentials from our config.py file to create the conn_string, and uses the conn_string to create the connection to our database hosted by AWS.
- <img width="421" alt="sql connection1" src="https://user-images.githubusercontent.com/69255270/128648577-848721ad-5c32-474a-9742-7ce50f94970a.png">

#### Step 8: Create Table
Once we have a connection and a cursor, wrote SQL queries in Python. PostgreSQL queries from Python using the psycopg2 library need four elements:
- Establish Connection
- Establish Cursor
- Execute Cursor
- Commit Connection

#### Step 9: Loading data into a Postgres table from CSV

Once we have our tables, we copied data from CSV files with psycopg2 using the copy_from() method.
<img width="417" alt="SQL connection 2" src="https://user-images.githubusercontent.com/69255270/128648687-d4cabb97-31e9-469e-b9a5-a65de3e4defc.png">

#### Step 10: Importing data from AWS database to jupyter notebook for Machie Learning (Code included in theabove picture)
We used pandas to read SQl database to jupyter notebook.  We used final_customers_sql file to create machine learning models

<img width="629" alt="SQL_todb" src="https://user-images.githubusercontent.com/69255270/128648778-1650ad90-d6b8-4676-bba9-5d850da1c7b2.png">

