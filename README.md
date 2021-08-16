
# eCommerce Business Trends


### Group Members


Elaine Ng - Peer reviews on code (Square role), Branches: [Elaine](https://github.com/cmhume/eCommerce_Business_Trends/tree/Elaine), [technology.md](https://github.com/cmhume/eCommerce_Business_Trends/tree/technology.md), [Machine_Learning](https://github.com/cmhume/eCommerce_Business_Trends/tree/Machine_Learning), [readme_wk2](https://github.com/cmhume/eCommerce_Business_Trends/blob/readme_wk3/README.md), [readme_wk3](https://github.com/cmhume/eCommerce_Business_Trends/tree/readme_wk3), [.gitignore](https://github.com/cmhume/eCommerce_Business_Trends/blob/readme_wk3/.gitignore), [requirements.txt](https://github.com/cmhume/eCommerce_Business_Trends/blob/readme_wk3/requirements.txt)


Luz Maria Cabral - Dashboard (Circle role), Branches: [Luz](https://github.com/cmhume/eCommerce_Business_Trends/tree/Luz), [readme_wk2](https://github.com/cmhume/eCommerce_Business_Trends/blob/dbb9a857e30dd3be375ff0cc25c391f09c8242df/Dashboard_Luz.md), [readme_wk3](https://github.com/cmhume/eCommerce_Business_Trends/blob/readme_wk3/Luz_dashboard_readme_wk3)


Manupriya Sharma - Quality Assurance and test the code (X role), Branches: [Manupriya](https://github.com/cmhume/eCommerce_Business_Trends/tree/Manupriya), [Database](https://github.com/cmhume/eCommerce_Business_Trends/tree/Database), [readme_wk2](https://github.com/cmhume/eCommerce_Business_Trends/blob/dbb9a857e30dd3be375ff0cc25c391f09c8242df/Database_Manupriya.md), [readme_wk3](https://github.com/cmhume/eCommerce_Business_Trends/blob/readme_wk3/Manupriya_ML_readme_wk3)


Corinne Hume - Draft presentation (Triangle role), Branches: [Corinne](https://github.com/cmhume/eCommerce_Business_Trends/tree/Corinne), [visuals_wk2](https://github.com/cmhume/eCommerce_Business_Trends/tree/visuals_wk2), [readme_wk2](https://github.com/cmhume/eCommerce_Business_Trends/edit/readme_wk2), [readme_wk3](https://github.com/cmhume/eCommerce_Business_Trends/tree/readme_wk3), [presentation_wk3](https://github.com/cmhume/eCommerce_Business_Trends/tree/presentation_wk3)


## Presentation


Link to [Google Slides](https://docs.google.com/presentation/d/1i0Znvf8fqon94xzfKeM4TORzG9IobtLutqnbttMPqDc/edit?usp=sharing)


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


## Database


We used Postgres to create tables in SQL. The ERD below shows connectivity among 9 tables. 


![QuickDBD-export (1)](https://user-images.githubusercontent.com/79742633/129489813-9152f9d2-ec14-4ce4-8965-bfbfe5d3ca45.png)


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


<img width="720" alt="AWS" src="https://user-images.githubusercontent.com/78699521/128657713-2d95e1f0-c2cd-4b7c-ba33-65f364f8823b.png">


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


Finally, we decided to keeping the following columns in our data:

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
- 
<img width="416" alt="feature engineering1" src="https://user-images.githubusercontent.com/69255270/128648449-1c0cfb08-ee1b-4c62-a8bf-4f86a8a4875c.png">
<img width="423" alt="Feature engineering 2" src="https://user-images.githubusercontent.com/69255270/128648452-70e8facd-0a78-47fa-9e4b-453765c0a0aa.png">

Our final data for machine learning has 13 columns:

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
[Link to Machine Learning jupyter notebook](https://github.com/cmhume/eCommerce_Business_Trends/blob/f8f44e6809cccd2e409a8839d7495d894fcb530e/Machine_Learning/ecommerce_business_trend_ML_feature_importance.ipynb)

#### Goal: To create a Machine Learning model to predict review score. We converted review score to binary variable by using the following code:

![Picture1](https://user-images.githubusercontent.com/69255270/128654839-26c38bca-fbd0-4fe2-b73a-e6170dfd33b4.png)


#### (See Feature Engineering and Data Preprocessing for  Machine Learning in Database section above)


**Description of how data was split into training and testing sets:**

The goal of the training and testing sets is to create the machine learning model to predict review score. We took the review score and used it as a target column, then made it into y data. After that, we put x and y into training and testing to make X_train, X_test and y_train, and y_test. We split the data by making a 75/25 split where 25% of the data was used for testing. X is everything except review score and y is review score.

<img width="664" alt="training_testing_split" src="https://user-images.githubusercontent.com/79742633/128658004-72f09d48-8437-45ab-bea9-1b87afb9f2e5.png">

**Resampling**

Our data has more positive reviews than negative reviews, as the pie chart below shows. 

<img width="144" alt="pie chart" src="https://user-images.githubusercontent.com/69255270/129483263-840225aa-a0a3-4e26-89c7-e3373dc3fba9.png">

We used Random undersampling to resample our data  using the follwoing code:

<img width="363" alt="resample" src="https://user-images.githubusercontent.com/69255270/129484445-eb68ff20-47a8-493c-89d6-ee92954d699f.png">

**Model Choice:**

As our target variable is binary, we choose a classification model.  We created 5 different models and compared their accuracies. We got accuracy >70% for all the models except for Artificial Neural Network that gave us only 50% of accuracy. Random forest performed the best for our data:


1.	Linear Logistic Regression: We got accuracy of 74%. Logistic regression is easier to implement and interpret, and very efficient to train. But it is tough to obtain complex relationships using logistic regression and it over fits the model.


2.	K-NN model: We were hoping to receive higher accuracy with K-NN but we got lower accuracy of 67% than logistic regression. One benefit of KNN algorithm is that it doesn’t require training before making predictions, new data can be added seamlessly which will not impact the accuracy of the algorithm.

3. Decision Tree: We got accuracy of ~92%. Decision Tree algorithm is very intuitive and easy to understand but a small change in the data can change the prediction big time. 

4. Ensemble-Random Forest: As this combines various decision tree models, it gave us the best value of accuracy of 94% . The Random Forest doesn’t over fit the model but it makes algorithms to run slow. 

5. Artificial Neural Network: We were hoping to get the highest accuracy with this one but it gave us accuracy of 50%. ANN can overfit the data and takes a lot of time to run.  
Here is a graph that shows the comparison of all the models we tested:

<img width="635" alt="model comparison" src="https://user-images.githubusercontent.com/69255270/129485488-1cb04e3a-ef6f-4786-a417-3be2fb8b9f4e.png">


## Feature Importance
We used Random Forest feature importance technique (as Random Forest has the maximum accuracy ~94% among the all models we tried to find importance score to input features based on how useful they are at predicting a target variable. As the picture below shows that the most important feature is the "time estimate to delivery" which is the differnce between estimate delivery date and actual delivery date and the least important feature is the "order status".

<img width="380" alt="feature importance" src="https://user-images.githubusercontent.com/69255270/129485131-f4993795-1415-4ad0-a46b-4970b943e91e.png">

## Predictive Web App
We used Streamlit to create an interactive web app to predict the review score for various combinations of the features. We used Random Forest classifier model to create the prediction. 

<img width="416" alt="Predictive App" src="https://user-images.githubusercontent.com/69255270/129506869-b2713b22-6a5d-4df3-8af1-07ab9be5bf9f.png">
 

## Dashboard


Link to dashboard on [Google Slides](https://docs.google.com/presentation/d/1i0Znvf8fqon94xzfKeM4TORzG9IobtLutqnbttMPqDc/edit?usp=sharing)


[Link to video of dashboard interactivity](https://drive.google.com/file/d/1j4lY__ZRvh5D1mSSov30nQ8UTuH0VBjq/view?usp=sharing)


This report starts by telling the story of Olist, how they began, where there customers are at, what products sell the most and 
ways to improve their services. Olist is a company that begins its online presence in the Fall of 2016 and builds a robust presence 
in 2017 and 2018. We review the products that they help distribute and how they're performing around the country. As part of their 
quality control review they send out surveys for feedback on their services, we were able to use their star rating to see how customers
felt about the services provided. Finally part of the service Olist provides is logistics and delivery is largely discussed in these
reviews, we attempt to draw this picture in our visualizations.

## Visualization Tools
The team decided to move forward with Tableau for our dashboard needs. The data, as previously described, was cleaned, merged and 
further processed via Python, postgresSQL, and AWS. The dataset that we've been working with include some of the changes made for 
the machine learning models, changing strings into integers. Also, in assistance to our Tableau learning journey, aside from the 
module, were youtube videos for guidance on connecting worksheets for interactive connections and overlapping maps to demonstrate
the data. 

## Sales Dashboard
![Olist Sales Review](https://user-images.githubusercontent.com/79742633/129506408-da6dab4b-1c0f-4544-a715-e004e2b8b4c5.png)

In this board we see the popularity of items being sold on Olist, most popular item are home goods and least popular are security
services. We used cluster or bubble chart to review this and a map to locate places where these items were sold most frequently. 

## Review Dashboard
![Review_Dashboard](Dashboard/Category_Review_Dashboard.png)
The next dashboard illustrates the reviews and how most categories were rated. Overall Olist provides a good service with most 
items receiving reviews of 3.5 and greater. There are negative reviews and there will be seen in areas where delivering large ticket
items may not be as easy as delivering smaller items. Most of our machine learning visualizations and results are located in this frame
as well. The logistics might be different. For this reason we also reviewed freight costs and services. 



Interactive elements:

* line graphs that can be filtered by year 
* Maps that can be filtered by customer review scores, product category,  and city

