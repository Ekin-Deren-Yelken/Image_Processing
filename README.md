# img_Processing
Manipulating medical images using MATLAB

This project is split into 3 parts. 

Part 1: DFT is manually calculated for the sake of understanding. See document labeled DFT_Calc.PDF

Part 2: Chest x-ray image manipulation for analysis

Part 3: MRI image of a brain tumour is analyzed

## Part 2

#### Input Images
![chest_x-ray1](https://github.com/user-attachments/assets/aedda25c-49a9-48fe-b9f1-ba71ded6ef7e)
Raw Input

#### 
![chest_x-ray2](https://github.com/user-attachments/assets/04cd68d8-e2cf-45c2-87ac-1f9e079e5ac4)
Refrence Image

### Analysis

#### Chest X-Ray Negative
![chest_negative_x-ray](https://github.com/user-attachments/assets/3edebde2-546c-4bf4-81bb-71b5f143c2e4)
It is easier to see details such as the ribs and vertebrae in the negative as the colours have been almost inverted.

#### Chest X-Ray Contrast Stretched
![chest_contrast-stretched_x-ray](https://github.com/user-attachments/assets/d379a415-3c13-45bf-ad8c-61b227625832)
The contrasting significantly boosted the intensity of the bright and dark regions of the image. It is easier to see details. An upper and lower percentile of 99 and 1 are chosen for this.

#### Chest X-Ray Equalized
![chest_equalized_x-ray](https://github.com/user-attachments/assets/d0238aa3-ab20-4353-aeab-729126fbd087)
The details in the chest cavity are much clearer, especially the vertebrae. It appears the soft tissue which caused some attenuation durig the x-ray which were causing ambiguity in the structures in this is less visible. Additionally, some details around the shoulders and arms, which are not of particular interest, are gone.

#### Chest X-Ray Histogram Specification Method
![chest_histogram-specification-equalized_x-ray](https://github.com/user-attachments/assets/1921acc8-69c0-4e02-a31a-717895d1d7c2)
With no equalization, the results are poor, so some preprocessing equalization is added to the standard method to introduce more contrast between structures.

---

## Part 3

#### Input Images
![Brain1](https://github.com/user-attachments/assets/d81fc9c9-0a50-4f5e-aca0-c58bb0a14fa4)
Brain MRI Result 1

![Brain2](https://github.com/user-attachments/assets/02acfb47-1564-448e-8246-356c8473c117)
Brain MRI Result 2

#### Reference Images
![groundTruth1](https://github.com/user-attachments/assets/27658a60-460d-4c9c-a8d6-2fe5da468e94)
Ground Truth for Tumour in Brain 1

![groundTruth2](https://github.com/user-attachments/assets/bff373e0-8d3c-4661-b54c-2ff60a593571)
Ground Truth for Tumour in Brain 2

### Analysis

Images are converted to greyscale for analysis. Using these greyscale images and the provided ground truth images a similarity score was calculated for two scenarios, simple and adaptive thresholding for each image.

![grayscale_brain_2](https://github.com/user-attachments/assets/a3d4355f-6a5d-4765-929b-f9983c1e05ef)

![grayscale_brain_1](https://github.com/user-attachments/assets/b4fb6a2a-8e13-4063-be72-f7fb59853e31)

#### Simple Thresholding Segmentation
This function performs basic image segmentation by setting pixel values above a given threshold to 255 (white) and all others to 0 (black). Each pixel in the grayscale image is compared to a fixed threshold value, resulting in a binary image.

#### Adaptive Thresholding Segmentation
This function adjusts the threshold value locally across the image. It starts by smoothing the image using a Gaussian filter to reduce noise. A local threshold using Otsu's method is computed, which automatically determines an optimal threshold based on local characteristics. The resulting binary image distinguishes objects from the background effectively.

#### Calculate Similarity Score using Jaccard Index
This function computes the similarity score between a segmented image and its corresponding ground truth using the Jaccard index. By calculating the ratio of the intersection to the union of two images, a quantitative measure of segmentation accuracy of the overlap is made available.

#### Simple and Adaptive Thresholding

For each image, no pre-processing was applied. A simple threshold and adaptive threhsold were implemented to isolate the tumour. The ground truth of the tumour's location is presented. A threshold of 82 was aribtrarily chosen by roughly looking at the results to see if they were reasonable. See the Sensitivity analysis below.

### Patient 0001

![Patient 0001 - Brain MRI](https://github.com/user-attachments/assets/1ee09136-1075-473c-9ab9-ddcf09da07a9)


### Patient 0002

![Patient 0002 - Brain MRI](https://github.com/user-attachments/assets/e331f806-641a-4cb1-96ad-8e8fea1ca895)

### Jaccard Similarity Score
![Similarity Table](https://github.com/user-attachments/assets/355371bb-bc37-43d8-9a5a-535c9426b0f1)

According to this analysis, the simple threshold is better at identifying the tumour.


#### Simple Threshold Sensitivty Analysis

The value used in the simple threshold is varied from 50 to 125 in incremebts of 25. To identify the ideal threshold, the Jaccard Similarity Score can be used.

##### Raw Jaccard Similarity Score Data
![Sensitivity-Calcs](https://github.com/user-attachments/assets/f108e2c3-fb91-4094-8250-9a288ea8fd5b)

![Table](https://github.com/user-attachments/assets/9e60c65f-7d30-4ea2-ad5f-c72d87bf21d2)
To identify the optimal threshold, the results are graphed out. For both instances, third order polynomial functions can be used to describe each curve. Using these functions, the optimal threshold is calculated.

Notably, the curve for the orange line, patient 2, is a poor fit. It is expected that the optimal value calculated will likely be lower than the actual optimal value.

#### Patient 1
$S = 8 E^{-07}x^3 - 0.0004x^2 + 0.0498x - 1.48$

Where $s$ is similarity and $T$ is threshold value.

$\frac{dS}{dT}\ = 24 E^{-07}x^2 - 0.0008x + 0.0498 = 0$

$x_1 = 82.83$ and $x_2 = 166.67$ Therefore if $50 ≤ T ≤ 125$,

$T_{\text{optimal}} = 82.83 = 83$

The optimal threshold for patient 1 is approximately 83.

![optimal_threshold_1](https://github.com/user-attachments/assets/fc61c6a2-e1e4-4a89-86d6-0ae9e569b6fa)

#### Patient 2
$S = 4 E^{-6}T^3 - 0.0012T^2 + 0.1068T - 2.785$

Where $s$ is similarity and $T$ is threshold value.

$\frac{dS}{dT}\ = 12 E^{-07}x^2 - 0.0024x + 0.1068 = 0$

$x_1 = 66.83$ and $x_2 = 133.17$ Therefore if $50 ≤ T ≤ 125$,

$T_{\text{optimal}} = 66.83 = 67$

The optimal threshold for patient 2 is approximately 67.

![optimal_threshold_2](https://github.com/user-attachments/assets/3dfdb170-8f14-47fa-8312-5f9102307b3c)

As expected the similarity value for patient 1 is higher for simple thresholding indicating a good selection for thresold. However, for patient 2, the similarity value has decreased. As predicted, a higher value is closer to the optimal threshold. In this case, 75 is likely the optimal threshold for patient 2.

![optimal_threshold_table](https://github.com/user-attachments/assets/24821e9d-50ab-4e6b-a332-2299a6ebc6ce)
