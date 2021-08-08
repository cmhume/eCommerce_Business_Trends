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


### Mock-up Machine Learning Model


## Database


The final database is on a PostgresSQL Server on AWS.  Initial table creation and table joining was performed using SQL in pgAdmin. 


### ERD


To begin with this analysis we reviewed the different information that was provided by the six datasets we chose to work with. Using the Quick Databse Diagrams (Quick DBD) we were able to draw out our datasets using the Entity Relationship Diagrams (ERD) and find the relation between all of them.  We then mapped how we would merge our data to achieve the results we had set for ourselves. 


![FP_ERD3](https://github.com/cmhume/eCommerce_Business_Trends/blob/316e955522d8b579456a33c4dd14e87809000155/Resources/Schema/FP_ERD3.png)


### Cleaning csv files with pandas


As we tried to upload the datasets to pgAdmin we noticed they needed some light cleaning and removing of duplicate information.  To clean and merge datasets we used a combination of jupyter notebook/pandas and PostgresSQL/pgAdmin interface.  It was easier to do the cleaning in Jupyter Notebook, and such was used to clean geolocation dataset, olist_product_dataset, order_item_dataset, and olist_orders_dataset.  This process shrank our datasets, still leaving us with thousands of entries to work with. After cleaning they were easily uploaded to postgres with new titles; geolocation_revies.csv, order_item_revised, order_list_revised, and product_revised.  We were then able to merge some datasets to better fit our analysis.  Below is a link to our data cleaning jupyter notebook and an example of the cleaning process on the geolocation dataset.

[Jupyter Notebook](https://github.com/cmhume/eCommerce_Business_Trends/blob/Database/Geolocation_revised.ipynb)


![Screenshot (374)](https://user-images.githubusercontent.com/78699521/127747712-3ffa02c2-8c5d-47d6-b77b-02c6661d90ab.png)


### Creating tables in SQL


[Schema](https://github.com/cmhume/eCommerce_Business_Trends/blob/316e955522d8b579456a33c4dd14e87809000155/Resources/Schema/Wk__DB_orders.sql)


![Screenshot (372)](https://user-images.githubusercontent.com/78699521/127747331-f1bb587e-d59c-4443-b71a-6d2e2a3cdea7.png)


### Joining tables in SQL



### AWS Database connection string


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
