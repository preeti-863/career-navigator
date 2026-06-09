import pandas as pd
import mysql.connector
from sklearn.linear_model import LogisticRegression
import joblib

# connect to database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="careernavigator"
)

query = """
SELECT 
user_id,
SUM(CASE WHEN phase=1 AND correct=1 THEN 1 ELSE 0 END) AS phase1_score,
SUM(CASE WHEN phase=2 AND correct=1 THEN 1 ELSE 0 END) AS phase2_score,
SUM(CASE WHEN phase=3 AND correct=1 THEN 1 ELSE 0 END) AS phase3_score
FROM user_answers
GROUP BY user_id
"""

df = pd.read_sql(query, conn)

# Features
X = df[['phase1_score','phase2_score','phase3_score']]

# Target label (simple rule for now)
def classify(row):
    total = row['phase1_score'] + row['phase2_score'] + row['phase3_score']
    
    if total < 15:
        return "Beginner"
    elif total < 35:
        return "Intermediate"
    else:
        return "Advanced"

df['level'] = df.apply(classify,axis=1)

y = df['level']


# Train model
model = LogisticRegression()
model.fit(X,y)

# Save model
joblib.dump(model,"career_model.pkl")
# Exit safely if less than 2 classes
if df['level'].nunique() < 2:
    print("Not enough classes to train the model. Add more user data with multiple levels.")
    exit()
    
print("Model trained successfully")