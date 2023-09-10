% Load the dataset and prepare the features and target variables
data = readtable('dataset22_modified.csv');
X = data(:, {'Time', 'Sample'});
y = data.aftershock;

% Split the dataset into training and testing sets
[trainInd, testInd] = dividerand(height(data), 0.6, 0.4, 'seed', 42);
X_train = X(trainInd, :);
y_train = y(trainInd, :);
X_test = X(testInd, :);
y_test = y(testInd, :);

% Train the Random Forest model
model = TreeBagger(100, X_train, y_train);

% Make predictions on the test set
y_pred = predict(model, X_test);

% Convert predictions to numeric values
y_pred = str2double(y_pred);

% Evaluate the model
confusionMatrix = confusionmat(y_test, y_pred);
accuracy = sum(diag(confusionMatrix)) / sum(confusionMatrix(:));
classificationReport = classificationReport(y_test, y_pred);
