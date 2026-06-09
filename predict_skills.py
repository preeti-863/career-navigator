import sys
import joblib
import numpy as np
import os

# 1️⃣ Check if 3 arguments are provided
if len(sys.argv) != 4:
    print("Error: Please provide 3 phase scores as arguments")
    sys.exit(1)

# 2️⃣ Convert arguments to integers
try:
    phase1 = int(sys.argv[1])
    phase2 = int(sys.argv[2])
    phase3 = int(sys.argv[3])
except ValueError:
    print("Error: Phase scores must be integers")
    sys.exit(1)

# 3️⃣ Absolute path to the ML model
script_dir = os.path.dirname(os.path.abspath(__file__))  # folder of the script
model_path = os.path.join(script_dir, "career_model.pkl")

# 4️⃣ Load the trained ML model
try:
    model = joblib.load(model_path)
except FileNotFoundError:
    print("Error: career_model.pkl not found")
    sys.exit(1)
except Exception as e:
    print(f"Error loading model: {e}")
    sys.exit(1)

# 5️⃣ Prepare features for prediction
X = np.array([[phase1, phase2, phase3]])

# 6️⃣ Predict skill level
try:
    predicted_level = model.predict(X)[0]
    # Output the prediction (PHP will capture this)
    print(str(predicted_level).strip())
except Exception as e:
    print(f"Error: {e}")
    sys.exit(1)