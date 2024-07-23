# djs-compute-tasks
Tasks for DJS Compute

Task 2:
1. In this Jupyter Notebook, I first imported the necessary python libraries that can be used to analyse data.
2. Loaded the csv data in a pandas dataframe.
3. Examined data to understand data types and the null values using functions like head, info, describe and shape.
4. Removed any duplicate rows using the drop_duplicates() function.
5. Examined each column and removed the irrelevant columns, based how whether they would impact the overall performance of a player.
6. Replaced the blank values with NaN value from the NumPy library and used the dropna() function to remove the rows which have NaN values, as all attributes are needed for analyse a player's performance.
7. Changed the data type of the height and weight attributed to float type.
8. Using Seaborn's regplot() function, I plotted a regression plot of mentality_vision against a player's overall performance to find how a player's vision affects their performance. 
Inference:
As seen in the plot and the regression line, there is a weak positive correlation between a player's vision and their performance.
9. Using Seaborn's regplot() function, I plotted a regression plot of dribbling against a player's overall performance to find how a player's dribbling ability affects their performance.
Inference:
As seen in the plot and the regression line, there is a strong positive correlation between a player's dribbling ability and their performance.
10. Using Pyplot's hist() function, I plotted the distribution of the player's ages.
Inference:
As visible in the plot, most players, more than 2000, are in the age band of about 23 to 27. There are very few players above the age of 38. There are no players in the age band of 46 to 49.
