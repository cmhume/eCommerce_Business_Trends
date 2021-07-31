# eCommerce Business Trends


## Presentation


### Group Members


Elaine Ng - Technology (X role), Branches: [Repo Branch](https://github.com/cmhume/eCommerce_Business_Trends/tree/Elaine), [technology.md](https://github.com/cmhume/eCommerce_Business_Trends/tree/technology.md)


Luz Maria Cabral - Database (Circle role), Branches: [Repo Branch](https://github.com/cmhume/eCommerce_Business_Trends/tree/Luz), [Database](https://github.com/cmhume/eCommerce_Business_Trends/tree/Database)


Manupriya Sharma - Machine Learning Model (Triangle role), Branches: [Repo Branch](https://github.com/cmhume/eCommerce_Business_Trends/tree/Manupriya), [Machine_Learning](https://github.com/cmhume/eCommerce_Business_Trends/tree/Machine_Learning)


Corinne Hume - GitHub (Square role), Branches: [Repo Branch](https://github.com/cmhume/eCommerce_Business_Trends/tree/Corinne), [readme_wk1](https://github.com/cmhume/eCommerce_Business_Trends/tree/readme_wk1)


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


### Communication Protocol


* We will coordinate and communicate through Slack and Zoom. Our team will meet on Zoom every Monday, Wednesday and Thursday. 


#### Planning Meeting:


* Every Monday we will meet to plan the deliverables and responsibilities for the entire week. Everyone will work on their branch or feature branch on Github.


#### Debugging Session:


* Every Wednesday we will discuss challenges and try to debug issues together.


#### Merging work to main branch


* We will post on slack before merging to the main branch and after creating new branches.


* Every Thursday we will merge work to the main branch for everyone to review and provide feedback. 


* On Sundays at 7pm, we will check in on Slack to review our GitHub page before turning in the assignment on Canvas.  


## Machine Learning


We plan on trying a variety of machine learning models on our database and choosing the best performing model for our final analysis.


### Tensor Flow Diagram


screenshot of TensorFlow diagram for machine learning model


Bar graph of machine learning models accuracy


### Jupyter Notebook


[Data Exploration and Machine Learning Models](https://github.com/cmhume/eCommerce_Business_Trends/blob/Machine_Learning/ecommerce_business_trend.ipynb)


## Database


We are using a PostgreSQL 11 server with the pgAdmin interface for our database.


### ERD


![FP_ERD3](https://user-images.githubusercontent.com/78699521/127382944-ff63d2b2-e908-4af9-b303-53484415c826.png)


### Cleaning csv files with pandas


https://github.com/cmhume/eCommerce_Business_Trends/blob/Database/Geolocation_revised.ipynb


### Creating tables in SQL


Schema - https://github.com/cmhume/eCommerce_Business_Trends/blob/31305c1985f295618599131190d3154b92eb57e2/schema.sql


### Joining tables in SQL


Sample Database - 



