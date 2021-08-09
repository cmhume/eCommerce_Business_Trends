# eCommerce Business Trends


### Group Members


Elaine Ng - Machine Learning Model (Square role), Branches: [Elaine](https://github.com/cmhume/eCommerce_Business_Trends/tree/Elaine), [technology.md](https://github.com/cmhume/eCommerce_Business_Trends/tree/technology.md), [Machine_Learning](https://github.com/cmhume/eCommerce_Business_Trends/tree/Machine_Learning), [readme_wk2](https://github.com/cmhume/eCommerce_Business_Trends/blob/dbb9a857e30dd3be375ff0cc25c391f09c8242df/Machine_Learning_Elaine.md)


Luz Maria Cabral - Dashboard (X role), Branches: [Luz](https://github.com/cmhume/eCommerce_Business_Trends/tree/Luz), [readme_wk2](https://github.com/cmhume/eCommerce_Business_Trends/blob/dbb9a857e30dd3be375ff0cc25c391f09c8242df/Dashboard_Luz.md)


Manupriya Sharma - Database (Triangle role), Branches: [Manupriya](https://github.com/cmhume/eCommerce_Business_Trends/tree/Manupriya), [Database](https://github.com/cmhume/eCommerce_Business_Trends/tree/Database), [readme_wk2](https://github.com/cmhume/eCommerce_Business_Trends/blob/dbb9a857e30dd3be375ff0cc25c391f09c8242df/Database_Manupriya.md)


Corinne Hume - Visual (Circle role), Branches: [Corinne](https://github.com/cmhume/eCommerce_Business_Trends/tree/Corinne), [visuals_wk2](https://github.com/cmhume/eCommerce_Business_Trends/tree/visuals_wk2), [readme_wk2](https://github.com/cmhume/eCommerce_Business_Trends/edit/readme_wk2)


## Presentation


Link to [Google Slides](https://docs.google.com/presentation/d/1YUH8ro5pKktJKYCZNBRglaXnZXEQMiV8kwARAiLlti0/edit?usp=sharing)


### Project 


**Selected Topic:** Brazilian eCommerce Business Trends


In this project, we will analyze customer orders placed between 2016-2018 from sellers on the Brazilian eCommerce platform [Olist Store](https://olist.com/).  From this data, we will first determine the number of customers by geographic region (looking at zip code prefix, city, and state), most popular products, number of repeat customers and purchases, and total purchases by date. After data cleaning and initial analysis, we will use machine learning to make predictions on customer behavior, providing sellers on Olist the opportunity to increase sales and their customer base.


**Why we selected our topic:** 

We selected this topic because of the analysis options available from eCommerce data, with information available on customers, sellers, products and geographic regions.  We would like to know if consumer behavior differs between customer's geographic location and if future purchases could be predicted using geolocation data. We would also like to know what products are likely to be purchased depending on the time of year.  Our ultimate goal is to predict consumer behavior from this dataset using machine learning.

**Description of our source of data:**

We chose the [Brazilian-eCommerce](https://www.kaggle.com/olistbr/brazilian-ecommerce) dataset from Kaggle for our analysis.  This dataset contains approximately 100,000 customer orders, along with corresponding files on product information and English translations of product categories originally in Portuguese. Seller names in this dataset were anonymized and replaced with Game of Thrones House names.  Six files from the original Kaggle dataset were chosen for further analysis: geolocation dataset, olist_customers_dataset, olist_product_dataset, order_item_dataset, olist_orders_dataset, and product_category_name_translation. 

*_Data Source: https://www.kaggle.com/olistbr/brazilian-ecommerce_*

**Questions we hope to answer with our data:**

With this data, we hope to answer...
- What is the ordering behavior for consumers in each geographical region?
- What type of products would a company expect to buy more of depending on the season?
- Analyse reviews and develop predictive model based on the given parameters. 


### Communication Protocol


* We will coordinate and communicate through Slack and Zoom. Our team will meet on Zoom every Monday, Wednesday and Thursday. 


#### Planning Meeting:


* Every Monday we will meet to plan the deliverables and responsibilities for the entire week. Everyone will work on their branch or feature branch on Github.


- **Google Drive:** To add websites with data, brainstorm topics to choose from, and share our files for the project


#### Debugging Session:


* Every Wednesday we will discuss challenges and try to debug issues together.


#### Merging work to main branch


* We will post on slack before merging to the main branch and after creating new branches.


* On Sundays at 7pm, we will check in on Slack to review our GitHub page before turning in the assignment on Canvas.  


## Machine Learning


We plan on trying a variety of machine learning models on our database and choosing the best performing model for our final analysis. We choose the following classification models to analyse our data:
- Logistic Regresssion
- K-NN model
- SVM model: Linear
- Kernel SVM: Non Linear
- Decision Tree
- Ensemble: Randon Forest
- k-Fold Cross Validation
- Artification Neural Network

Week 1: This week we created logistic regression model to look at the relationship of features like zipcode, state, price, freight value and product category on the review score. Kernel SVM – nonlinear model gave the best accuracy of 56.4% that suggests that we need to look at some other features like order date and delivery date in order to create a better model.


Week 2: 

#### Model Accuracy


The pictures below show the comparison of accuracies of all the models we created for our data:




### Data Exploration 


Jupyter notebook was used for initial data exploration as seen below:


[Data Exploration and Machine Learning Models](https://github.com/cmhume/eCommerce_Business_Trends/blob/316e955522d8b579456a33c4dd14e87809000155/Machine_Learning/ecommerce_business_trend_ML.ipynb)


#### Top 50 Product Categories


![image (2)](https://user-images.githubusercontent.com/78699521/127797828-9de00b7b-bb34-40dc-ad43-695d8dca795e.png)


#### Correlation of different features 


![image (1)](https://user-images.githubusercontent.com/78699521/127797843-2e4ec95e-d7c5-4818-9bee-66b577a210f6.png)


## Database


We used Postgres to create tables in SQL. The ERD below shows connectivity among 9 tables. 


![FP_ERD3](https://github.com/cmhume/eCommerce_Business_Trends/blob/316e955522d8b579456a33c4dd14e87809000155/Resources/Schema/FP_ERD3.png)


The description of these tables is as follows: 


1) olist_orders_dataset: This table is connected to 4 other tables. It is used to connect all the details related to an order.
2) olist_order_items_dataset: It contains the details of an item that had been purchased such as shipping date, price and so on.
3) olist_order_reviews_dataset: It contains details related to any reviews posted by the customer on a particular product that he had purchased.
4) olist_products_dataset: It contains related to a product such as the ID, category name and measurements.
5) olist_order_payments_dataset: The information contained in this table is related to the payment details associated with a particular order.
6) olist_customers_dataset: Details the customer base information of this firm.
7) olist_geolocation_dataset: It contains geographical information related to both the sellers and customers.
8) olist_sellers_dataset: This table contains the information related to all the sellers who have registered with this firm.
9) olist_product_category_name_translation: This table is connected to products database. 


We cleaned all these tables using Jupyter Notebook and imported them to a postgresSQL 11 server for joining the tables to create one big database to further analyze. 
SQL inner joins were used to connect all the tables. 


<img width="590" alt="SQL" src="https://user-images.githubusercontent.com/69255270/128648004-910c37f3-e5bb-44ba-bfbc-8820744e1d79.png">


### Using RDS on AWS with Jupyter notebooks


#### Step 1: Setting up the Database


We used an AWS free tier template to create our RDS database on AWS. We learned that free templates are only available for Postgres 12 and higher versions.


AWS![Uploading AWS.png…]()


We made our database accessible from anywhere so it’s accessible outside of the default VPC.  


#### Step 2: Create AWS server on postgres 


Once the database was created on AWS, we created an AWS server with the name final_project on postgres. 


<img width="488" alt="pic" src="https://user-images.githubusercontent.com/69255270/128648078-2d43df09-0a78-44b6-884f-45cc7aae1ad8.png">


We used the schema we created before to create all the tables again and then join them using inner joins. 


<img width="504" alt="query" src="https://user-images.githubusercontent.com/69255270/128648145-b29de563-386d-4b6b-a969-ff7773cf0fe8.png">


The final joined database was imported to jupyter notebook and it has a total of 34 columns and 91,596 rows. 


<img width="494" alt="info" src="https://user-images.githubusercontent.com/69255270/128648229-152faa16-4ece-4357-bcf1-63a9ae06c7db.png">


#### Step 3: Simplifying our data (Machine Learning)


We created a profile of our data to understand the relation between various features. We realized many features in our data did not affect the review score so we dropped those columns.  For example, features like "customer_city", "customer_state", "geolocation_lat","geolocation_lng", "customer_id", "order_purchase_timestamp", "order_approved_at", "order_delivered_carrier_date", "payment_sequential" were dropped.  


<img width="487" alt="profiling" src="https://user-images.githubusercontent.com/69255270/128648277-acf13a84-8f81-4f39-ba30-4708d932d933.png">


We confirmed our results by creating a correlation matrix:  


<img width="449" alt="corelation_matrix" src="https://user-images.githubusercontent.com/69255270/128648339-d6a96522-5313-4f21-8970-263fec15bf38.png">


Finally, we were left with the following columns in our data:


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


#### Step 4:  Feature Engineering (Machine Learning)


We used the following methods to encode the catagorical variables:


- lambda function
- label encoder
<img width="416" alt="feature engineering1" src="https://user-images.githubusercontent.com/69255270/128648449-1c0cfb08-ee1b-4c62-a8bf-4f86a8a4875c.png">
<img width="423" alt="Feature engineering 2" src="https://user-images.githubusercontent.com/69255270/128648452-70e8facd-0a78-47fa-9e4b-453765c0a0aa.png">


Our final data has 13 columns:


<img width="550" alt="final" src="https://user-images.githubusercontent.com/69255270/128648468-b1c846a9-2f89-4b50-aed3-61a93f481c3a.png">


#### Step 5: Importing CSV


As a first step to connect with AWS database we imported our dataframe to csv file. 


<img width="469" alt="CSV" src="https://user-images.githubusercontent.com/69255270/128648506-d0cfcfc7-532e-4516-a31f-8ac474355dc7.png">


#### Step 6: Setting up a config file


Once psycopg2 was imported, we created a config.py file to store the details for accessing our database. To connect, we needed the following details:


- Endpoint
- Port
- Name
- User’s Name
- User’s Password


#### Step 7: Connecting & Creating a table


After importing psycopg2 and our config file, we created a function that connects to the database and sets up a cursor. This function uses our credentials from our config.py file to create the conn_string, and uses the conn_string to create the connection to our database hosted by AWS.


<img width="421" alt="sql connection1" src="https://user-images.githubusercontent.com/69255270/128648577-848721ad-5c32-474a-9742-7ce50f94970a.png">


#### Step 8: Create Table


Once we had a connection and a cursor, we wrote SQL queries in Python. PostgreSQL queries from Python using the psycopg2 library need four elements:


- Establish Connection
- Establish Cursor
- Execute Cursor
- Commit Connection


#### Step 9: Loading data into a Postgres table from CSV

Once we had our tables, we copied data from CSV files with psycopg2 using the copy_from() method.


<img width="417" alt="SQL connection 2" src="https://user-images.githubusercontent.com/69255270/128648687-d4cabb97-31e9-469e-b9a5-a65de3e4defc.png">


#### Step 10: Importing data from AWS database to jupyter notebook for Machine Learning (Code included in the picture above)


We used pandas to read in the SQL database to jupyter notebook.  We used the final_customers_sql file to create our machine learning models


<img width="629" alt="SQL_todb" src="https://user-images.githubusercontent.com/69255270/128648778-1650ad90-d6b8-4676-bba9-5d850da1c7b2.png">

## Machine Learning:
#### Goal: To create a Machine Learning model to predict review score. We converted review score to binary variable by using the following code:

![Picture1](https://user-images.githubusercontent.com/69255270/128654839-26c38bca-fbd0-4fe2-b73a-e6170dfd33b4.png)

As our target variable is binary, we choose classification model.  We created 6 different models and compared their accuracy. Over all we got pretty good accuracy >85% for all the models we tested but Random forest performed the best for our data:
1.	Linear Logistic Regression: We got accuracy of 88%
2.	K-NN model: We were hoping to receive higher accuracy with K-NN but we got lower accuracy of 86%
3.	Kernel SVM:Non Linear: We got accuracy of 87%
4.	Decision Tree: We got accuracy of 95%
5.	Ensemble: Randon Forest: As this combines various decision tree models, it gave us the best value of accuracy of 96%
6.	Artificial Neural Network: We were hoping to get the highest accuracy with this one but it gave us accuracy of 87%

Here is a graph that shows the comparison of all the models we tested:
![Picture2](https://user-images.githubusercontent.com/69255270/128654867-ae82a472-d1ff-4475-aa0b-33a616d501b0.png)


## Dashboard


Link to Story Board on [Google Slides](https://docs.google.com/presentation/d/1YUH8ro5pKktJKYCZNBRglaXnZXEQMiV8kwARAiLlti0/edit?usp=sharing) (begins on slide number 21)


Link to Draft Story on [Tableau](https://10ay.online.tableau.com/t/ecommercetrends20162018/views/eCommerce_Draft/eCommerce_Draft_1?:showAppBanner=false&:origin=viz_share_link&:display_count=n&:showVizHome=n)


For the Dashboard, we began working on Google slides and figuring out how our presentation would flow. We decided to tell our story with Google slides and show our final dashboard with Tableau. Since a couple of us will be working on Tableau, we started a free trial using Tableau Online so we can all download and edit the same files. 


### Outline

Our preliminary slides will show how we chose the topic of eCommerce Business Trends, where we gathered our data from, and topics of exploration.
![Google slide pic](Dashreadwk2_pics/pres_slide1.png)

For the Database portion, we will show how our database connects with the machine learning model in jupyter notebook and how we used SQL joins to create our final database. 
![Google slide pic](Dashreadwk2_pics/pres_slide2.png)

For the machine learning section we will show the results of our machine learning models, predictions, and which algorithm performed best. 


### Storyboarding our dashboard:


#### Questions we will address with our Dashboard (using Olist Sales Data from 2016-2018)


* Did the number of sellers increase over time?
* How did the number of sales by product category change over time?
* How did customer review scores change over time?


We will show this information with:


Interactive elements:

* line graphs that can be filtered by year 
* Maps that can be filtered by customer review scores, product category,  and city


Additional Ideas:


* Review if the number of seller accounts have increased over time
* And another dashboard for logistics
    * how do logistics impact the buying and selling experience? 
