% Load the dataset
data = readtable('dataset22.csv');

% Convert 'Time' column to numeric representation
timeNumeric = posixtime(data.Time); % Convert datetime to numeric (seconds since 1970-01-01 00:00:00 UTC)

% Select the features (Time and Sample)
X = [timeNumeric, data.Sample];

% Generate the Aftershock variable (replace this line with your own logic to generate the target variable)
Aftershock = rand(height(data), 1); % Example: generating random values

% Add the Aftershock variable to the dataset
data.Aftershock = Aftershock;

% Randomly shuffle the dataset
data = data(randperm(height(data)), :);

% Split the dataset into training and testing sets
trainSize = round(0.6 * height(data));
X_train = X(1:trainSize, :);
y_train = data.Aftershock(1:trainSize, :);
X_test = X(trainSize+1:end, :);
y_test = data.Aftershock(trainSize+1:end, :);

% Create and train the regression model
model = regress(y_train, [ones(size(X_train, 1), 1), X_train]);

% Make predictions on the testing set
y_pred = [ones(size(X_test, 1), 1), X_test] * model;

% Evaluate the model
mse = mean((y_pred - y_test).^2);
disp(['Mean Squared Error: ', num2str(mse)]);
