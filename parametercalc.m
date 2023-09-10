% Given Confusion Matrix and Accuracy
confusionMat = [6764, 2; 0, 3794];
accuracy = 0.99981;

% Calculate True Positives (TP), True Negatives (TN), False Positives (FP), False Negatives (FN)
TP = confusionMat(1, 1);
TN = confusionMat(2, 2);
FP = confusionMat(2, 1);
FN = confusionMat(1, 2);

% Calculate Precision, Recall, and F1-score
precision = TP / (TP + FP);
recall = TP / (TP + FN);
f1Score = 2 * (precision * recall) / (precision + recall);

% Calculate Error Rate
errorRate = (FP + FN) / sum(confusionMat, 'all');

% Calculate True Positive Rate (TPR) or Sensitivity
TPR = recall;

% Calculate False Positive Rate (FPR)
FPR = FP / (FP + TN);

% Calculate Negative Predictive Value (NPV)
NPV = TN / (TN + FN);

% Calculate False Negative Rate (FNR) or Miss Rate
FNR = FN / (FN + TP);

% Calculate False Discovery Rate (FDR)
FDR = FP / (FP + TP);

% Calculate False Omission Rate (FOR)
FOR = FN / (FN + TN);

% Calculate Prevalence
prevalence = (TP + FN) / sum(confusionMat, 'all');

% Display the results
disp("Precision: " + precision);
disp("Recall: " + recall);
disp("F1-score: " + f1Score);
disp("Error Rate: " + errorRate);
disp("True Positive Rate (TPR): " + TPR);
disp("False Positive Rate (FPR): " + FPR);
disp("Negative Predictive Value (NPV): " + NPV);
disp("False Negative Rate (FNR): " + FNR);
disp("False Discovery Rate (FDR): " + FDR);
disp("False Omission Rate (FOR): " + FOR);
disp("Prevalence: " + prevalence);
