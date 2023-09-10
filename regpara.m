% Given confusion matrix
confusionMat = [3046, 309; 0, 1925];

% Parameters
parameters = struct();

% True Positive (TP)
parameters.TP = confusionMat(1, 1);
disp("True Positive (TP): " + parameters.TP);

% True Negative (TN)
parameters.TN = confusionMat(2, 2);
disp("True Negative (TN): " + parameters.TN);

% False Positive (FP)
parameters.FP = confusionMat(2, 1);
disp("False Positive (FP): " + parameters.FP);

% False Negative (FN)
parameters.FN = confusionMat(1, 2);
disp("False Negative (FN): " + parameters.FN);

% Accuracy
parameters.accuracy = (parameters.TP + parameters.TN) / sum(confusionMat(:));
disp("Accuracy: " + parameters.accuracy);

% Misclassification Rate
parameters.misclassificationRate = (parameters.FP + parameters.FN) / sum(confusionMat(:));
disp("Misclassification Rate: " + parameters.misclassificationRate);

% True Positive Rate (TPR), also known as Sensitivity, Recall, Hit Rate, or Probability of Detection
parameters.TPR = parameters.TP / (parameters.TP + parameters.FN);
disp("True Positive Rate (TPR): " + parameters.TPR);

% True Negative Rate (TNR), also known as Specificity or Probability of Correct Rejection
parameters.TNR = parameters.TN / (parameters.TN + parameters.FP);
disp("True Negative Rate (TNR): " + parameters.TNR);

% Positive Predictive Value (PPV), also known as Precision
parameters.PPV = parameters.TP / (parameters.TP + parameters.FP);
disp("Positive Predictive Value (PPV): " + parameters.PPV);

% Negative Predictive Value (NPV)
parameters.NPV = parameters.TN / (parameters.TN + parameters.FN);
disp("Negative Predictive Value (NPV): " + parameters.NPV);

% Prevalence
parameters.prevalence = (parameters.TP + parameters.FN) / sum(confusionMat(:));
disp("Prevalence: " + parameters.prevalence);

% F1-Score
parameters.F1score = 2 * parameters.TP / (2 * parameters.TP + parameters.FP + parameters.FN);
disp("F1-Score: " + parameters.F1score);

% Matthews Correlation Coefficient (MCC)
parameters.MCC = (parameters.TP * parameters.TN - parameters.FP * parameters.FN) / sqrt((parameters.TP + parameters.FP) * (parameters.TP + parameters.FN) * (parameters.TN + parameters.FP) * (parameters.TN + parameters.FN));
disp("Matthews Correlation Coefficient (MCC): " + parameters.MCC);

% Informedness (Youden's J statistic)
parameters.informedness = parameters.TPR + parameters.TNR - 1;
disp("Informedness: " + parameters.informedness);

% Markedness
parameters.markedness = parameters.PPV + parameters.NPV - 1;
disp("Markedness: " + parameters.markedness);

% Prevalence Threshold
parameters.prevalenceThreshold = sum(confusionMat(:, 2)) / sum(confusionMat(:));
disp("Prevalence Threshold: " + parameters.prevalenceThreshold);

% Diagnostic Odds Ratio (DOR)
parameters.DOR = (parameters.TP / parameters.FN) / (parameters.FP / parameters.TN);
disp("Diagnostic Odds Ratio (DOR): " + parameters.DOR);

% Balanced Accuracy
parameters.balancedAccuracy = (parameters.TPR + parameters.TNR) / 2;
disp("Balanced Accuracy: " + parameters.balancedAccuracy);

% Youden's Index (Youden's J statistic)
parameters.youdensIndex = parameters.TPR + parameters.TNR - 1;
disp("Youden's Index: " + parameters.youdensIndex);

% Precision at a given Recall Level
parameters.precisionAtRecall = parameters.TP / (parameters.TP + parameters.FP + parameters.FN);
disp("Precision at a given Recall Level: " + parameters.precisionAtRecall);

% False Positive Rate (FPR)
parameters.FPR = parameters.FP / (parameters.FP + parameters.TN);
disp("False Positive Rate (FPR): " + parameters.FPR);

% False Discovery Rate (FDR)
parameters.FDR = parameters.FP / (parameters.FP + parameters.TP);
disp("False Discovery Rate (FDR): " + parameters.FDR);

% False Negative Rate (FNR)
parameters.FNR = parameters.FN / (parameters.FN + parameters.TP);
disp("False Negative Rate (FNR): " + parameters.FNR);

% Negative Likelihood Ratio (NLR)
parameters.NLR = parameters.FN / parameters.TN;
disp("Negative Likelihood Ratio (NLR): " + parameters.NLR);

% Positive Likelihood Ratio (PLR)
parameters.PLR = parameters.TP / parameters.FP;
disp("Positive Likelihood Ratio (PLR): " + parameters.PLR);
