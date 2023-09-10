% Read the dataset
data = readtable('dataset22.csv');

% Create the aftershock column based on the condition
data.aftershock = data.Sample > 4000;

% Convert the logical values to numeric (1 for true, 0 for false)
data.aftershock = double(data.aftershock);

% Save the modified dataset with the aftershock column
writetable(data, 'dataset22_modified.csv');
