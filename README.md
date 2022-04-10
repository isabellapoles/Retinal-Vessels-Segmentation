# Retinal-Vessels-Segmentation
Matlab implementation of a retinal vessels segmentation alogorithm using the Chan-Vese segmentation method from a Matched Filter response.

## Database 
The proposed method has been developed using the available [STARE](https://cecas.clemson.edu/~ahoover/stare/probing/index.html)'s images.
On the basis of visual inspection a further classification of the 20 retinal fundus slides has been performed considering intensity based features:
12 images in the informative group (high contrasted blood vessels with respect to the background and absence of illumination artifacts), 5 images in the low contrast image group (presence of shadows of various colors (yellow, orange and blue), non uniform illumination and lower contrast between the vessel structures and the background), 3 images in the artifacts image group (affected by strong light reflectance artifacts).

## Algorithm 
The dataset subdivision reflects also the algorithm architecture that has been structured in three parallel flows, each one specialized to assess the proper image group. Each flow is implemented in one FOLD. 

### FOLD Informative image group

```main_informative``` is the main script used to implement: 
1. Top Hat morphological operation, the Matched Filter and the Chan-Vese Active Contour segmentation method: main method; 
2. Matched Filter response segmented with Otzu Thresholding: for comparison; 
3. Matched Filter response enhanced with Sobel edge detector segmented with Otzu Thresholding: for comparison;
4. Matched Filter response enhanced with Kirsh compass mask and segmented with Otzu Thresholding: for comparison.

#### Images
An I/O interface is proposed to let the user choose the wanted image: select one of the images reported in the table below. 
For this script no parameter tuning is necessary. 
Images belonging to this group are stored in the ```Images``` fold: 
| Images        | 
| --------------|
| im0044.ppm.gz |
| im0077.ppm.gz |
| im0081.ppm.gz |
| im0082.ppm.gz |
| im0139.ppm.gz |
| im0162.ppm.gz |
| im0163.ppm.gz |
| im0235.ppm.gz |
| im0236.ppm.gz |
| im0239.ppm.gz |
| im0240.ppm.gz |
| im0255.ppm.gz |

For each image the corresponding ground truth hand labelled image is selected automatically. 

The computation of the following evaluation metrics is proposed: 
1. Accuracy; 
2. Dice Similarity Coefficient; 
3. True Positive Rate (sensitivity/recall/hit rate); 
4. False Positive Rate (specificity=1-FPR); 
5. Positive predictive value (precision). 

At the end the optic disk extraction is implemented. 

```result_In``` is the script that allows to compute the mean and standard deviation values of the evaluation metrics proposed above between all the informative images. The comparison between the performance of the 4 methods listed above is shown in a table. The results are stored in the ```Results``` fold.


### FOLD Low constrast image group

```main_lowContrast``` is the main script used to implement: 
1. Contrast Limited Adaptive Histogram Equalization, the Matched Filter with the Chan-Vese Active Contour: main method; 
2. Matched Filter response and segmented with Otzu Thresholding: for comparison; 
3. Matched Filter response enhanced with Sobel edge detector and segmented with Otzu Thresholding: for comparison. 

#### Images
An I/O interface is proposed to let the user choose the wanted image: select one of the images reported in the table below. 
Parameter tuning is necessary: feed the code at ```extension_par``` (line 208) with the parameters shown below.
Images belonging to this group are stored in the ```Images``` fold: 
| Images        | ```extension_par``` |
|-------------- |:-------------------:| 
| im0004.ppm.gz |-0.23                |
| im0005.ppm.gz |-0.18                |
| im0291.ppm.gz |-0.25                |
| im0319.ppm.gz |-0.19                |
| im0324.ppm.gz |-0.19                |

For each image the corresponding ground truth hand labelled image is selected automatically. 

The computation of the following evaluation metrics is proposed: 
1. Accuracy; 
2. Dice Similarity Coefficient; 
3. True Positive Rate (sensitivity/recall/hit rate); 
4. False Positive Rate (specificity=1-FPR); 
5. Positive predictive value (precision).

```result_Lc``` is the script that allows to compute the mean and standard deviation values of the evaluation metrics proposed above between all the low contrast images. The comparison between the performance of the 3 methods listed above is shown in a table. The results are stored in the ```Results``` fold.


### FOLD Artifact image group

```main_artifact``` is the main script used to implement: 
1. Speeded-Up Adaptive Contrast Enhancement, the Matched Filter and the Chan-Vese Active Contour: main method; 
2. Matched Filter response segmented with Otzu Thresholding: for comparison; 
3. Matched Filter response enhanced with Sobel edge detector and segmented with Otzu Thresholding: for comparison. 

#### Images
An I/O interface is proposed to let the user choose the wanted image: select one of the images reported in the table below. 
Parameter tuning is necessary: feed the code at ```extension_par``` (line 219) and ```BW_burnt``` (line 90) with the parameters shown below.
Images belonging to this group are stored in the ```Images``` fold: 
| Images        | ```extension_par``` | ```BW_burnt```      |
|-------------- |:-------------------:|:-------------------:|
| im0001.ppm.gz |-0.06                |0.52                 |
| im0002.ppm.gz |-0.06                |0.46                 |
| im0003.ppm.gz |-0.04                |0.6                  |

For each image the corresponding ground truth hand labelled image is selected automatically. 

The computation of the following evaluation metrics is proposed: 
1. Accuracy; 
2. Dice Similarity Coefficient; 
3. True Positive Rate (sensitivity/recall/hit rate); 
4. False Positive Rate (specificity=1-FPR); 
5. Positive predictive value (precision).

```result_Ar``` is the script that allows to compute the mean and standard deviation values of the evaluation metrics proposed above between all the artifact images. The comparison between the performance of the 3 methods listed above is shown in a table. The results are stored in the ```Results``` fold.

## Paper
If you use this repo or some part of the code, please cite: 

Poles, Isabella, Eleonora D'Arnese, and Marco D. Santambrogio. "An Automatic Active Contour Approach to Segment Retinal Blood Vessels." 2021 IEEE 6th International Forum on Research and Technology for Society and Industry (RTSI). IEEE, 2021.
