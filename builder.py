#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul 26 15:29:58 2019

@author: nicolas
"""
#----- BD connection 
from ecommerce_postgresql import EcommercePostgres
#-----

from flask import Flask, jsonify
from flask_cors import CORS 

import pandas as pd
import turicreate as tc
from sklearn.cross_validation import train_test_split

app = Flask(__name__)
CORS(app)

@app.route('/build/<int:user_to_rc>')
def build_model(user_to_rc):    
    
    #----------------- Read -----------------------
    # Generar Consulta en la base de datos para traer datos con nuevos usuarios
    ecommerce_postgres = EcommercePostgres()
    ratings = ecommerce_postgres.getDataframe()           
    #----------------------------------------------
    
    #---------------- Creating interaction matrix using rating data
    df_matrix = pd.pivot_table(ratings, values='rating', index='user_id', columns='product_id')    

    #-------------------------------------------------
    #---------------- create a table for input to the modeling  
    d = df_matrix.reset_index() 
    d.index.names = ['rating'] 
    data_norm = pd.melt(d, id_vars=['user_id'], value_name='rating').dropna()   
    
    #---------------- Split train and test set ------------
    def split_data(data):
        train, test = train_test_split(data, test_size = .2)
        train_data = tc.SFrame(train)
        test_data = tc.SFrame(test)
        return train_data, test_data
    
    train_data_norm, test_data_norm = split_data(data_norm)
    #-----------------------------------------------------
    
    #------------------------------------------------------------------
    # constant variables to define field names include:
    user_id = 'user_id'
    item_id = 'product_id'
    users_to_recommend = list(data_norm[user_id])
    n_rec = 10 # number of items to recommend
    n_display = 20 # to display the first few rows in an output dataset
    #------------------------------------------------------------------
    
    
    def model(train_data, name, user_id, item_id, target, users_to_recommend, n_rec, n_display):
        if name == 'pearson':
            model = tc.item_similarity_recommender.create(train_data, 
                                                        user_id=user_id, 
                                                        item_id=item_id, 
                                                        target=target, 
                                                        similarity_type='pearson')
            
        recom = model.recommend(users=users_to_recommend, k=n_rec)
        recom.print_rows(n_display)
        return model
    
    
    name = 'pearson'
    target = 'rating'
    # -------------- MODELO!
    pear_norm = model(train_data_norm, name, user_id, item_id, target, users_to_recommend, n_rec, n_display)
    
    
    #------------------ Model Evaluation ------------------------------
    
    print("---------------------------------------------------############################################")     
    
    print(pear_norm.evaluate(test_data_norm))     
      
    #------------------------ RECOMENDACIÓN ---------------------------

    def create_output(model, users_to_recommend, n_rec,print_json):
        
        recomendation = model.recommend(users=users_to_recommend, k=n_rec)
        
        df_rec = recomendation.to_dataframe().drop_duplicates() # Dataframe IMPORTANTE -- Eliminar Repetidas
        
        df_rec['recommendedProducts'] = df_rec.groupby([user_id])[item_id] \
            .transform(lambda x: '|'.join(x.astype(str)))
        
        df_output = df_rec[['user_id', 'recommendedProducts']].drop_duplicates() \
            .sort_values('user_id').set_index('user_id')       
            
        #JSON File    
        if print_json:       
            df_output.to_json('./output/recommendation.json')
            print("An output file can be found in 'output' folder with name 'recommendation.json'")
            
        return df_output
    
    #----------------- Generando Dataframe de salida  ------------------------------ 
    df_output = create_output(pear_norm, users_to_recommend, n_rec, print_json=False)
    #print(df_output.shape)
    #df_output.head()

    #----------------- Función para recommendar
    def customer_recomendation(user_id):
        if user_id not in df_output.index:
            print('Customer not found.')
            return {'Customer not found':user_id}
        return df_output.loc[user_id].to_dict()
    
    print(customer_recomendation(user_to_rc))
    
    #----------- Mostrar recomendación -----     
    return jsonify(customer_recomendation(user_to_rc))


	#INVESTIGAR
    recomendation1=pear_norm.recommend([11]);	
    print(recomendation1);

if __name__ == '__main__':
    app.debug = True
    app.run()