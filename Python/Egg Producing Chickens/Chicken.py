#!/usr/bin/env python
# coding: utf-8

# # Egg Producing Chicken <BR>
# Data Analyzed By: Dr. Sulove Koirala <BR>
# Veterinarian (NVC Reg: 1080)<BR>

# ### Introduction
# 
# The dataset consists of data created artificially based partially on subject matter knowledge of Poultry and references derived from the websites listed below. It lists observations made on certain days relating to physical chicken attributes and information relating to; the number of eggs laid, the amount of food consumed and the amount of time exposed to natural light.

# ##### Dataset Source: https://www.kaggle.com/phuzoman/egg-producing-chickens

# ### Loading the Packages

# In[58]:


import pandas as pd
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
import matplotlib
import seaborn as sns


# ### Content
# GallusBreed - breed of chicken such as ‘Buff Orpington chicken’<br>
# Day - an integer indicating the day on which an observation was made <br>
# Age - age of the chicken in weeks<br>
# GallusWeight - weight of the chicken in grams<br>
# GallusEggColor - color of the eggs<br>
# GallusEggWeight - weight of the eggs in grams<br>
# AmountOfFeed - amount of feed in grams the chicken consumed per day<br>
# EggsPerDay - number of eggs a chicken laid on a particular day<br>
# GallusCombType - comb type of a particular chicken<br>
# SunLightExposure - number of hours a chicken is exposed to natural light (sunlight) in a day<br>
# GallusClass - chicken classes as classified by international Poultry associations<br>
# GallusLegShanksColor - color of the legs/feet and shanks on them<br>
# GallusBeakColor - color of the chicken’s beak<br>
# GallusEarLobesColor - color of the chicken earlobes<br>
# GallusPlumage - color of the feathers<br>

# ### Importing the dataset

# In[ ]:





# In[7]:


data = pd.read_csv("GallusGallusDomesticus.csv") #Loading the dataset
data.head()


# ### Describing the data

# In[8]:


data.describe ()


# ### Analysing the Data

# Let us move straight to the analysis by visualization. We will first group the data on the basis of the breed and compare the results. 

# In[11]:


breed = data.groupby('GallusBreed').mean()
breed


# We see that the performance and characteristics of two breeds of chicken "Ameraucana" and "Marans" are observed. Just by looking at the table we straightaway tell that Ameraucana breed is superior because it utilizes less feed and gives more Eggs per day. However, we will visualize the data. 

# In[83]:


breed['GallusWeight'].plot.bar()
plt.xlabel('Chicken Breeds')
plt.ylabel('Weight')


# In[82]:


breed['EggsPerDay'].plot.bar()
plt.xlabel('Chicken Breeds')
plt.ylabel('Eggs Per Day')


# In[80]:


sns.boxplot( x=data["GallusBreed"], y=data["GallusEggWeight"] )


# In[81]:


sns.lmplot( x='Age', y='GallusWeight', data=data,hue='GallusBreed', legend=True)


# It shows that there are few Ameraucana breed of Chicken. Let us find the number of each breeds in the observation. 

# In[64]:


data['GallusBreed'].value_counts()


# In[60]:


sns.set(rc={'figure.figsize':(14,8.27)})
sns.boxplot( x=data["GallusPlumage"], y=data["GallusEggWeight"] )


# In[65]:


sns.lmplot( x='AmountOfFeed', y='GallusEggWeight', data=data,hue='GallusBreed', legend=True)


# It is interesting to note that the greater amount of feed has negative impact on the weight of the Ameraucana Breed of Chicken. Whereas, the weight is grown steadly in Marans. 

# In[74]:


sns.distplot( data["GallusWeight"] , color="skyblue")


# In[79]:


sns.heatmap(data.corr(), annot = True, cmap = 'PuBuGn')


# This is also called Correlation Plot. Here we can see that almost every category is negatively correlated to each other

# ### Bibliography
# https://www.kaggle.com/phuzoman/egg-producing-chickens
# 
# http://www.chickenbreedsoftheworld.com
# 
# https://www.thehappychickencoop.com/10-breeds-of-chicken-that-will-lay-lots-of-eggs-for-you
# 
# https://www.starmilling.com/poultry-chicken-breeds.php
# 
# https://agronomag.com/top-13-best-egg-laying-chicken-breeds

# ### Contact
# For any suggestions or queries, do not hesitate to email: sulovekoirala@gmail.com

# In[ ]:




