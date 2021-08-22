
import pickle
import streamlit as st
import pandas as pd
 
st.write("""# Simple eCommerce Review Score Predictor App
This app predicts the**Review Score!** 
""")

def user_input_features():
        zipcode = st.number_input('Enter the Zip Code', step = 1)
        price = st.number_input('Enter the Price')
        freight_value = st.number_input('Enter the freight')	
        payment_value = st.number_input('Enter the payment value')
        product_photos_qty = st.number_input('Enter the number of photos', step = 1)	
        time_order_to_delivery = st.number_input('Enter the days it took the product to arrive', step = 1)
        time_estimate_to_delivery = st.number_input('Days Delayed or Early', step = 1)
        data = {'zipcode': zipcode,
            'price': price,
            'freight_value': freight_value,
            'payment_value': payment_value,
            'product_photos_qty': product_photos_qty,
            'time_order_to_delivery': time_order_to_delivery,
            'time_estimate_to_delivery': time_estimate_to_delivery}

        features = pd.DataFrame(data, index=[0])
        return features

df = user_input_features()


# loading the trained model
pickle_in = open('model.pkl', 'rb') 
classifier = pickle.load(pickle_in)
prediction = classifier.predict(df)
#rediction_proba = classifier.predict_proba(df)
if prediction == 1 :
        prediction  = "Positive Review"
else:
        prediction = "Negative Review"


    
if st.button("Predict"):      

        st.subheader('Prediction')

        st.subheader(f"This transaction has a {prediction}!")
        

        #st.(f"The Probability is:  {prediction_proba}")


