% Train the SVM model
svmModel = fitcsvm(X_train, y_train, 'KernelFunction', 'linear', 'IterationLimit', 100, 'Verbose', 1);

% Predict on the testing set
y_pred = predict(svmModel, X_test);

% Evaluate the model
accuracy = sum(y_pred == y_test) / numel(y_test);
confusionMat = confusionmat(y_test, y_pred);

% Compute precision, recall, and F1-score
precision = confusionMat(2, 2) / sum(confusionMat(:, 2));
recall = confusionMat(2, 2) / sum(confusionMat(2, :));
f1Score = 2 * (precision * recall) / (precision + recall);

% Display the results
disp("Accuracy: " + accuracy);
disp("Confusion Matrix:");
disp(confusionMat);
disp("Precision: " + precision);
disp("Recall: " + recall);
disp("F1-score: " + f1Score);
accuracy_percent = accuracy * 100;
fprintf('Accuracy: %.2f%%\n', accuracy_percent);

% Train the SVM model with iteration info
svmModel = fitcsvm(X_train, y_train, 'KernelFunction', 'linear', 'IterationLimit', 100, 'Verbose', 1);

% Access the iteration info
iterationLog = svmModel.Trained{1}.IterationLog;

% Extract accuracy and loss values
accuracyValues = iterationLog(:, 2);
lossValues = iterationLog(:, 1);

% Plot accuracy curve
figure;
plot(1:length(accuracyValues), accuracyValues);
xlabel('Iteration');
ylabel('Accuracy');
title('Accuracy Curve');

% Plot loss curve
figure;
plot(1:length(lossValues), lossValues);
xlabel('Iteration');
ylabel('Loss');
title('Loss Curve');
