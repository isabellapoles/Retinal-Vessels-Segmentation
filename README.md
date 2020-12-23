# Retinal-Vessels-Segmentation
Matlab implementation of a retinal vessels segmentation alogorithm using the Chan-Vese segmentation method from a Matched Filter response.

## Database 
The proposed method has been developed using the available STARE images (https://cecas.clemson.edu/~ahoover/stare/probing/index.html).
On the basis of visual inspection a further classification of the 20 retinal fundus slides has been performed considering intensity based features:
12 images in the informative group (high contrasted blood vessels with respect to the background and absence of illumination artifacts), 5 images in the low contrast image group (presence of shadows of various colors (yellow, orange and blue), non uniform illumination and lower contrast between the vessel structures and the background), 3 images in the artifacts image group (affected by strong light reflectance artifacts).

## Algorithm 
The dataset subdivision reported in Section \ref{sec:Images} reflects also the algorithm architecture that has been structured in three parallel flows, each one specialized to assess the proper image group. 
### Informative image group
```main_informative```

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |



