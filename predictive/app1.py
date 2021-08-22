
import pickle
import streamlit as st
 
st.write("""# Simple eCommerce Review Score Predictor App
This app predicts the**Review Score!** 
""")

time_estimate_to_delivery = st.number_input('Days Delayed or Early', step = 1)
zipcode = st.number_input('Enter the Zip Code', step = 1)

# loading the trained model
pickle_in = open('model.pkl', 'rb') 
classifier = pickle.load(pickle_in)
prediction = classifier.predict([[time_estimate_to_delivery, zipcode]])


if prediction == 1 :
        prediction  = "Positive Review"
else:
        prediction = "Negative Review"

st.subheader('Prediction')
st.write(f"The Review Score is:  {prediction}")

