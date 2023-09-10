% Load your dataset and split it into features (X) and target (y)
data = readtable('dataset22_modified.csv');
X = data(:, 2:end-1);  % Exclude the first column (Datetime) and the last column (target)
y = data.aftershock;

% Split the data into training and testing sets
cv = cvpartition(height(data), 'HoldOut', 0.2);
X_train = X(training(cv), :);
y_train = y(training(cv));
X_test = X(test(cv), :);
y_test = y(test(cv));

% Define the linear SVM model with ridge regularization
svmModel = fitclinear(X_train, y_train, 'Learner', 'logistic', 'Regularization', 'ridge');

% Predict on the testing set
y_pred = predict(svmModel, X_test);

% Evaluate the model
accuracy = sum(y_pred == y_test) / numel(y_test);
confusionMat = confusionmat(y_test, y_pred);

% Display the results
disp("Accuracy: " + accuracy);
disp("Confusion Matrix:");
disp(confusionMat);

% Perform cross-validation to evaluate model performance
cv = cvpartition(height(data), 'KFold', 5);
accuracyCV = zeros(cv.NumTestSets, 1);

for i = 1:cv.NumTestSets
    trainIdx = cv.training(i);
    testIdx = cv.test(i);
    
    X_train = X(trainIdx, :);
    y_train = y(trainIdx);
    X_test = X(testIdx, :);
    y_test = y(testIdx);
    
    svmModelCV = fitclinear(X_train, y_train, 'Learner', 'logistic', 'Regularization', 'ridge');
    y_predCV = predict(svmModelCV, X_test);
    
    accuracyCV(i) = sum(y_predCV == y_test) / numel(y_test);
end

meanAccuracyCV = mean(accuracyCV);
stdAccuracyCV = std(accuracyCV);

disp("Cross-Validation Accuracy: " + meanAccuracyCV);
disp("Standard Deviation: " + stdAccuracyCV);
