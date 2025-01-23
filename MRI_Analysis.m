% Clear Workspace and Load Data
% clear; clc; close all;

% Create an object of the class
processIMG = img_processing_functions;

input_image_path_1 = 'Brain1.jpeg';
input_image_path_2 = 'Brain2.jpeg';

reference_image_path_1 = 'groundTruth1.jpeg';
reference_image_path_2 = 'groundTruth2.jpeg';

% Calculate Gray Scale
grayscale_img_1 = processIMG.grayscale(input_image_path_1);
grayscale_img_2 = processIMG.grayscale(input_image_path_2);

% Calculate Simple Threshold
%if ~exist('threshold', 'var')
%    threshold = 82;  % Default value if not defined externally for testing
%end

simple_thresholding_img_1 = processIMG.simple_thresholding(grayscale_img_1, 83);
simple_thresholding_img_2 = processIMG.simple_thresholding(grayscale_img_2, 67);

% Calculate Adaptive Threshold
sensitivity = 0.975;
adaptive_thresholding_img_1 = processIMG.adaptive_thresholding(grayscale_img_1, sensitivity);
adaptive_thresholding_img_2 = processIMG.adaptive_thresholding(grayscale_img_2, sensitivity);

% Print Thresholds and Ground Truth with Tumour
brain_label = {'Patient 0001 - Brain MRI'; 'Patient 0002 - Brain MRI'};
al1 = "Simple Thresholding T=" + string(83);
al2 = "Adaptive Thresholding sensitivty=" + string(sensitivity);
al3 = "Simple Thresholding T=" + string(67);
al4 = "Adaptive Thresholding sensitivty=" + string(sensitivity);
analysis_label = {al1, al2, al3, al4};

figure('Name', brain_label{1}, 'NumberTitle', 'off');
subplot(1,3,1), imshow(grayscale_img_1), title('Grayscale Image');
subplot(1,3,2), imshow(reference_image_path_1), title('Ground Truth Image');
subplot(1,3,3), imshow(simple_thresholding_img_1), title(al1);
%subplot(1,4,4), imshow(adaptive_thresholding_img_1),  title(al2);

figure('Name', brain_label{2}, 'NumberTitle', 'off');
subplot(1,3,1), imshow(grayscale_img_2), title('Grayscale Image');
subplot(1,3,2), imshow(reference_image_path_2), title('Ground Truth Image');
subplot(1,3,3), imshow(simple_thresholding_img_2), title(al3);
%subplot(1,4,4), imshow(adaptive_thresholding_img_2),  title(al4);

% Calculate Jacardian Similarity Scores for each threshold
simple_similarity_1 = processIMG.similarity_score(reference_image_path_1, simple_thresholding_img_1);
simple_similarity_2 = processIMG.similarity_score(reference_image_path_2, simple_thresholding_img_2);
adaptive_similarity_1 = processIMG.similarity_score(reference_image_path_1, adaptive_thresholding_img_1);
adaptive_similarity_2 = processIMG.similarity_score(reference_image_path_2, adaptive_thresholding_img_2);

simple_threshold_scores = [simple_similarity_1; simple_similarity_2];
adaptive_threshold_scores = [adaptive_similarity_1; adaptive_similarity_2];

% Create a table with column labels
results_table = table(brain_label, simple_threshold_scores, adaptive_threshold_scores, ...
    'VariableNames', {'Patient', 'Simple Threshold', 'Adaptive Threshold'});

% Display the table
disp(results_table);