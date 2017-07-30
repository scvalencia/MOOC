import numpy as np
import sklearn.naive_bayes

# Training points (features and labels)
X = np.array([[-1, 1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2]])
Y = np.array([1, 1, 1, 2, 2, 2])

classiffier = sklearn.naive_bayes.GaussianNB()
# Training (learning the patterns)
classiffier.fit(X, Y)
# Using the patterns to predict
print classiffier.predict([[-0.8, -1]])

# Evaluation of the classifier (no of correctly classiffied points / length of dataset)
correct = 0

for index, data in enumerate(X):
	training_example = X[index]
	label = Y[index]

	if label == classiffier.predict([training_example])[0]:
		correct += 1

print correct / (len(X) + 0.0)

# A one liner
print classiffier.score(X, Y)

'''
Train and test on different data (test generalization)

from sklearn-metrics import accuracy_score
print accuracy_score(pred, label_test)
'''