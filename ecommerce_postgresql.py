#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul 26 16:17:19 2019

@author: nicolas
"""

from sqlalchemy import create_engine
from sqlalchemy import text
from pandas import DataFrame

class EcommercePostgres:

    def getConnection(self):
        # create connection        
        engine = create_engine('postgres://ecommerce:ecommerce@localhost:5432/ecommerce')
        return engine
    
    def getDataframe(self):
        # execute query        
        '''
        Copiar BD en fichero local:
            
        copy reviews(product_id,user_id,rating) 
        to '/home/nicolas/Documentos/DataScience/Tareas DataScience/Tarea2/Codigo_RC_System/Datos_review/data.csv' delimiter ',' csv header;
        '''        
              
         # execute query
        sql = text('select product_id, user_id, rating from reviews')
        engine = self.getConnection()
        result = engine.execute(sql)
        # convert sqlalchemy.engine.result to pandas dataframe
        ratings = DataFrame(result.fetchall())
        ratings.columns = result.keys()
        #print(ratings.head(5))
        return ratings