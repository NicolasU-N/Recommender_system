#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jul 27 12:09:55 2019

@author: nicolas
"""
    
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
   return "Hello World"

if __name__ == '__main__':
   app.debug = True
   app.run()