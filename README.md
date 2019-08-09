# Recommender System

Recommendation system for ecommerce using the turicreate library.

## Turi create

<p align="center"><img src="https://docs-assets.developer.apple.com/turicreate/turi-dog.svg" alt="Turi Create" width="100"> </p>
<p align="center">
<a href="https://github.com/apple/turicreate#"><img src="https://travis-ci.com/apple/turicreate.svg?branch=master" alt="Build Status"></a> <a href="https://github.com/apple/turicreate#"><img src="https://img.shields.io/pypi/v/turicreate.svg" alt="Build Status"></a> <a href="https://github.com/apple/turicreate#"><img src="https://img.shields.io/pypi/pyversions/turicreate.svg" alt="Build Status"></a>
</p>

Turi Create simplifies the development of custom machine learning models. You
don't have to be a machine learning expert to add recommendations, object
detection, image classification, image similarity or activity classification to
your app.

* **Easy-to-use:** Focus on tasks instead of algorithms
* **Visual:** Built-in, streaming visualizations to explore your data
* **Flexible:** Supports text, images, audio, video and sensor data
* **Fast and Scalable:** Work with large datasets on a single machine
* **Ready To Deploy:** Export models to Core ML for use in iOS, macOS, watchOS, and tvOS apps

## Data

<p align="center"><img src="https://raw.githubusercontent.com/NicolasU-N/Recommender_system/master/resources/Data.png" alt="Data" width="600"> </p>

Data has 45 observations with 5 users and 13 items.

## Model and Evaluation
Turi Create provides a

```python
 model = turicreate.recommender.create(...)
```
method that will automatically choose an appropriate model for your data set.

In this example, Ranking Factorization Recommender is used to recommend products to users, with RMSE Final Training: 0.849708

## Recommendations

<p align="center"><img src="https://raw.githubusercontent.com/NicolasU-N/Recommender_system/master/resources/Recommendations.png" alt="Recommendations" width="600"> </p>

Product recommendations for all users, for a new user that does not appear in the data set and for a specific user.

<p align="center"><img src="https://raw.githubusercontent.com/NicolasU-N/Recommender_system/master/resources/Demostracion.gif" alt="Recommendations specific users" width="600"> </p>


**Note**: Each product is represented by its product_id


## Adding web service

In this case we use java servlets and python flask for the backend together with postgresql, in addition, we use JavaScript + Bootstrap + Css for the frontend of our bike store.

<p align="center"><img src="https://raw.githubusercontent.com/NicolasU-N/Recommender_system/master/resources/index_pag_ecommerce.png" alt="index" width="600"> </p>


<p align="center"><img src="https://raw.githubusercontent.com/NicolasU-N/Recommender_system/master/resources/index_2_ecommerce.png" alt="index" width="600"> </p>

### Recommendation for new users

<p align="center"><img src="https://raw.githubusercontent.com/NicolasU-N/Recommender_system/master/resources/New_user.png" alt="Recommendations new users" width="600"> </p>

### Recommendation for specific users

<p align="center"><img src="https://raw.githubusercontent.com/NicolasU-N/Recommender_system/master/resources/User_specific.png" alt="Recommendations specific users" width="600"> </p>






