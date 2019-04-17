import pandas as pd
from sklearn.model_selection import train_test_split

labeled_images = pd.read_csv('labeled_images.csv')
labeled_images = labeled_images[['gsurl', 'class']]

train_set, eval_set = train_test_split(labeled_images, test_size=0.30, random_state=42)

train_set.to_csv('train_set.csv', index=False)
eval_set.to_csv('eval_set.csv', index=False)
