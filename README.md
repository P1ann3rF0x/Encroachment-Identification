# Encroachment-Identification-using-ML
# Encroachment Identification using Machine Learning
## Automated Detection of Unauthorized Structures from Satellite Imagery

[![MATLAB](https://img.shields.io/badge/MATLAB-R2020a%2B-red.svg)](https://www.mathworks.com/products/matlab.html)
[![Deep Learning](https://img.shields.io/badge/Deep%20Learning-Toolbox-orange.svg)](https://www.mathworks.com/products/deep-learning.html)

This repository contains the implementation and methodology for the automated identification of land encroachments, specifically unauthorized structures along public roads, utilizing machine learning and image processing techniques.

## 📋 Overview

Rapid urbanization and population growth lead to significant challenges in urban land management, with unauthorized land occupation being a persistent issue. Traditional methods for identifying and managing encroachments are often manual, time-consuming, and prone to inaccuracies.

This project addresses these limitations by developing a robust machine learning model that leverages high-resolution satellite imagery to detect encroachments. The solution aims to provide a more efficient, scalable, and accurate approach to monitoring land use changes, thereby supporting proactive management and sustainable urban development.

### Key Features

-   **Automated Road Identification**: Employs image processing techniques, including Canny edge detection and Hough Transform, to accurately delineate road networks from satellite imagery.

-   **Encroached Region Segmentation**: Utilizes a Convolutional Neural Network (CNN) for semantic segmentation to classify pixels, identifying potential encroached regions.

-   **Building Encroachment Detection**: Implements a U-Net architecture for precise semantic segmentation, pinpointing individual building units that extend into public road areas.

-   **Performance Evaluation**: Assesses model accuracy using standard metrics such as Structural Similarity Index (SSIM), Dice Similarity Coefficient (DSC), and Jaccard Similarity Coefficient (JSC).

## 🎯 Results Summary

-   **Dataset**: High-resolution satellite images.
-   **Processing Method**: Multi-stage machine learning pipeline including CNN and U-Net for semantic segmentation.
-   **Output**: Segmented images highlighting roads, encroached regions, and individual encroaching buildings.
-   **Structural Similarity Value (SSIM)**: 1.00
-   **Dice Similarity Coefficient (DSC)**: 0.9608
-   **Jaccard Similarity Coefficient (JSC)**: 0.9608

## 🛠️ Technical Stack

### Software Requirements
-   **MATLAB** (R2020a or later recommended)
-   **Deep Learning Toolbox** (for CNN and U-Net implementation)
-   **Image Processing Toolbox** (for image preprocessing and classical image processing techniques)

### Hardware Requirements
-   **Minimum**: Standard PC with MATLAB installation.
-   **Recommended**: System with sufficient RAM and processing power for image and deep learning model training.

### Data Acquisition
-   High-resolution satellite images.

## 🚀 Quick Start

### 1. Data Preparation
-   Organize your satellite images and corresponding pixel-level ground truth labels into separate directories (e.g., `train/images`, `train/labels`).
-   Ensure your labels are consistent with the expected class names (e.g., "road", "building").

### 2. Run MATLAB Scripts
-   Modify the `fullfile` paths in the provided MATLAB scripts (`A.1.1 Road Identification.m`, `A.1.2 Identification of Encroached Region.m`, `A.1.3 Identification of Encroached buildings.m`) to point to your local dataset directories.
-   Execute the MATLAB scripts sequentially in the following order:
    1.  `A.1.1 Road Identification.m`
    2.  `A.1.2 Identification of Encroached Region.m`
    3.  `A.1.3 Identification of Encroached buildings.m`

    *Note: Each script builds upon the previous one, and the full pipeline requires running them in sequence on the same MATLAB instance.*

### Example Code Snippet (Conceptual - for `A.1.2 Identification of Encroached Region.m`):
```matlab
% Example for loading data and training a CNN
imageSize = [256,256,1];
numClasses = numel(classNames); % Assuming classNames are defined
lgraph = unetLayers(imageSize, numClasses); % Or create custom CNN layers
options = trainingOptions('sgdm', ...
 'InitialLearnRate',1e-3, ...
 'MaxEpochs',15, ...
 'VerboseFrequency',1);
% net = trainNetwork(pximdsTrain,lgraph,options); % pximdsTrain is a pixelLabelImageDatastore
```
## 📊 Accuracy Results

The model demonstrates high performance in identifying encroachments, with evaluation metrics showing a strong structural similarity and a very high degree of overlap between predictions and ground truth.

| Metric | Value | Interpretation |
|---------------------------------|----------|---------------------------------------------------------------------------------------|
| Structural Similarity Value (SSIM) | 1.00 | Indicates perfect structural similarity between predicted and ground truth images. |
| Dice Similarity Coefficient (DSC) | 0.9608 | High overlap (96.08%) between predicted and ground truth segmented regions. |
| Jaccard Similarity Coefficient (JSC) | 0.9608 | High similarity (96.08%) between predicted and ground truth segmented regions. |


## 🔧 Configuration

### Model Parameters
-   **Image Dimensions**: Typically resized to [256 256] for processing.
-   **Neural Network Architectures**: Convolutional Neural Network (CNN) for region segmentation, U-Net for building segmentation.
-   **Training Options**: SGD with momentum (`sgdm`), `InitialLearnRate` 1e-3, `MaxEpochs` 15.

### Image Processing Techniques
-   Grayscale conversion, noise reduction, Canny edge detection, Hough Transform.

## 📁 Project Structure (Conceptual)
```
Encroachment-Identification-using-ML/
├── data/
│   ├── images/              # Raw satellite images
│   └── labels/              # Corresponding pixel-level labels
├── scripts/
│   ├── A.1.1 Road Identification.m
│   ├── A.1.2 Identification of Encroached Region.m
│   └── A.1.3 Identification of Encroached buildings.m
└── outputs/                 # Results, segmented images, models
```

## 🎯 Applications

This methodology is suitable for:
-   **Urban Planning**: Automated monitoring of land use changes and spatial planning.
-   **Land Management**: Proactive identification and management of unauthorized constructions.
-   **Government Agencies**: Enhancing efficiency in municipal surveying and enforcement.
-   **Infrastructure Development**: Assessing clear passage along road networks.

## ⚠️ Limitations and Considerations

-   **Data Quality**: Performance heavily relies on the quality and accuracy of input satellite imagery and ground truth labels.
-   **Computational Resources**: Training deep learning models can be computationally intensive.
-   **Generalizability**: Model performance may vary in areas with different building styles or urban patterns if not adequately represented in training data.
-   **Dynamic Changes**: Requires updated imagery for continuous monitoring of new encroachments.

## 🔮 Future Enhancements

-   **Multi-Modal Data Integration**: Incorporate other data sources like LiDAR or street-level imagery for richer context.
-   **Real-Time Processing**: Develop optimized models for faster inference to enable near real-time monitoring.
-   **Automated Labeling**: Explore techniques for semi-supervised or weakly-supervised learning to reduce manual labeling effort.
-   **Deployment Platform**: Create a web-based or desktop application for easier deployment and interaction by urban planning authorities.
-   **Advanced Architectures**: Research and implement more state-of-the-art semantic segmentation models.

## 📚 References

This work builds upon established machine learning and image processing principles. The research references are present in the report available in the repository.

## 🤝 Contributing

Contributions are welcome! If you have suggestions or improvements, please feel free to fork the repository and submit pull requests.

## 📧 Contact

For questions, suggestions, or collaboration opportunities:

-   **Author**: Udhay Kiraan K H
-   **eMail**: Udhay_k@ce.iitr.ac.in 
-   **Institution**: IIT Roorkee, Geospatial Engineering Department 
-   **Location**: Uttarakhand, India

## 🙏 Acknowledgments

-   MATLAB development team
-   Contributors to open-source deep learning and image processing libraries
-   Academic supervisors and colleagues who provided guidance and support.

---

**Note**: This implementation represents academic research conducted at School of Planning and Architecture, Bhopal. Results may vary based on data quality and processing parameters.
