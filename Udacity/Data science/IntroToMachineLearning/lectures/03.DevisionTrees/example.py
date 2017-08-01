import numpy as np
import sklearn.tree

# Training points (features and labels)
X = np.array([[-1, 1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2]])
Y = np.array([1, 1, 1, 2, 2, 2])

classiffier = sklearn.tree.DecisionTreeClassifier()
# Training (learning the patterns)
classiffier.fit(X, Y)
# Using the patterns to predict
print classiffier.predict([[-0.8, -1]])

# A one liner (X, Y) should be test data
print classiffier.score(X, Y)