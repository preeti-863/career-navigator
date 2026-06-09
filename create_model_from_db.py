# create_model_from_db.py
import mysql.connector
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
import joblib
import os

# ----------------- CONFIG -----------------
DB_HOST = "localhost"
DB_USER = "root"
DB_PASS = ""           # put your DB password
DB_NAME = "careernavigator"  # your database name
TABLE_NAME = "user_answers"

# Absolute path to save the model
script_dir = os.path.dirname(os.path.abspath(__file__))
model_path = os.path.join(script_dir, "career_model.pkl")

# ----------------- CONNECT TO DB -----------------
conn = mysql.connector.connect(host=DB_HOST, user=DB_USER, password=DB_PASS, db=DB_NAME)
cursor = conn.cursor()

# Fetch user answers
query = f"SELECT user_id, phase, SUM(correct) as correct FROM {TABLE_NAME} GROUP BY user_id, phase"
df = pd.read_sql(query, conn)

if df.empty:
    print("No data found in database to train model.")
    exit(1)

# Pivot to get phase-wise scores per user
df_scores = df.pivot_table(
    index='user_id',
    columns='phase',
    values='correct',
    aggfunc='sum',
    fill_value=0
).reset_index()

# Dynamically rename columns to phase1, phase2, phase3...
new_columns = ['user_id'] + [f"phase{c}" for c in df_scores.columns if isinstance(c, int)]
df_scores.columns = new_columns

# ----------------- CREATE TARGET LABEL -----------------
# For demonstration: simple rule-based labels (adjust as needed)
def skill_label(row):
    total = row.get('phase1',0) + row.get('phase2',0) + row.get('phase3',0)
    if total <= 5:
        return "Beginner"
    elif total <= 15:
        return "Intermediate"
    else:
        return "Advanced"

df_scores['label'] = df_scores.apply(skill_label, axis=1)

# ----------------- TRAIN MODEL -----------------
X = df_scores[['phase1', 'phase2', 'phase3']]
y = df_scores['label']

model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X, y)

# Save model to career_model.pkl
joblib.dump(model, model_path)
print(f"Model saved successfully at {model_path}")

# Close DB connection
conn.close()