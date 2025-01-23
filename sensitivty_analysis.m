% Define threshold values for sensitivity analysis
threshold_values = [50, 75, 100, 125];

for i = 1:length(threshold_values)
    threshold = threshold_values(i);  % Assign threshold for this iteration
    
    fprintf('Running analysis with threshold = %d\n', threshold);
    run('MRI_Analysis.m');  % Execute the script
end

% Compare results
disp('Sensitivity analysis completed.');