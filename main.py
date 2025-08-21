n.py
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
import joblib
import os

print("Starting training script...")

# Create dummy data
data = {
            'feature1': range(100),
                'feature2': [i * 2 for i in range(100)],
                    'target': [0] * 50 + [1] * 50
                    }
df = pd.DataFrame(data)

X = df[['feature1', 'feature2']]
y = df['target']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

model = RandomForestClassifier(n_estimators=10)
model.fit(X_train, y_train)

print(f"Model accuracy: {model.score(X_test, y_test)}")

# Save the model
model_filename = 'model.joblib'
joblib.dump(model, model_filename)
print(f"Model saved to {model_filename}")
print("This is a new run triggered by a git push!")
