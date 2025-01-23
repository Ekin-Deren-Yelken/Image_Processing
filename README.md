# img_Processing
Manipulating medical images using MATLAB

This project is split into 3 parts. 

Part 1: DFT is manually calculated for the sake of understanding.
Part 2: Chest x-ray image manipulation for analysis
Part 3: MRI image of a brain tumour is analyzed

## Part 1

### Images Used
#### Input Images
![chest_x-ray1](https://github.com/user-attachments/assets/aedda25c-49a9-48fe-b9f1-ba71ded6ef7e)
Raw Input

#### Reference Images
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

## Part 2

### Images Used
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

![grayscale_brain_1](https://github.com/user-attachments/assets/77e1c445-4066-48c7-91ad-b86d4a5aeee2)

![grayscale_brain_2](https://github.com/user-attachments/assets/8445ec79-cdd6-49ff-96fa-e73411cc0d81)

#### Simple Thresholding Segmentation
This function performs basic image segmentation by setting pixel values above a given threshold to 255 (white) and all others to 0 (black). Each pixel in the grayscale image is compared to a fixed threshold value, resulting in a binary image.

#### Adaptive Thresholding Segmentation
This function adjusts the threshold value locally across the image. It starts by smoothing the image using a Gaussian filter to reduce noise. A local threshold using Otsu's method is computed, which automatically determines an optimal threshold based on local characteristics. The resulting binary image distinguishes objects from the background effectively.

#### Calculate Similarity Score using Jaccard Index
This function computes the similarity score between a segmented image and its corresponding ground truth using the Jaccard index. By calculating the ratio of the intersection to the union of two images, a quantitative measure of segmentation accuracy of the overlap is made available.

