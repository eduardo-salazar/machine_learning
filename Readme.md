# Machine_Learning [![Build Status](https://travis-ci.org/eduardo-salazar/machine_learning.svg?branch=master)](https://travis-ci.org/eduardo-salazar/machine_learning)
Basic machine learning technique in Ruby. This is for pure understanding of the techniques

# Techniques
1. Decision Trees [On Progress]
  How DT is build:
  * Check the model for the base case
  * Iterate through all the attributes
  * Get the normalized information gain from splitting the attributes
  * Let best_attr be the attribute with the highest information gain
  * Create a decision node that splits on the best_attr
  * Work on the sublists that are obtained by splitting on best_attr and add those
  nodes a child nodes.

  Training Data Attributes [data/customer_purcharse_training.csv]
  ## Placement:
    What type of stand the CD is displayed on: an end rack,special offer bucket
    , or a standard rack
  ## Prominence:
    What percentage of the CDs on display are from that author CDs.
  ## Pricing:
    What percentage of the full price was the CD at the time of purchase,
    unless it is an old, back catalog title.
  ## Eye Level:
    Was the product displayed at eye level position? The majority of sales
    will happen when a product is displayed at the eye level.
  ## Customer purchase:
    What was the outcome? Did the customer purchase?

2. Bayesian Networks [On Progress]
3. Artificial Neural Networks [On Progress]
4. Association Rules learning [On Progress]
5. Support Vector Machines [On Progress]
6. Clustering [On Progress]
