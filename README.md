# mbs_models

Collection of models and meshes to be used inside the `multi-body simulator`. They can also be used as standalone `.urdf` models, e.g. with the [iDyntree](https://github.com/robotology/idyntree) library.


## Operating system

The code has been developed and tested on Ubuntu 18.04 LTS.


## Installation and usage

This repository can be used in two different ways:

- `git clone` or download this repository as standalone library of `urdf` models. This approach does not necessarily require to `install` the repository.

- dowload this repository using the [mbs_superbuild](https://github.com/gabrielenava/mbs_superbuild) **(suggested)**. The `superbuild` **will install** (copy and paste) all the models and meshes of this repo inside the `$PATH-TO-SUPERBUILD/build/install` folder. This results in a cleaner installation as the [MBS default simulations](https://github.com/gabrielenava/mbs_app) point to the path to the installed files.
 
## Available models

- [icubGazeboSim](models/icubGazeboSim): the iCub model without backpack.

- [iCubGazeboV2_5](models/iCubGazeboV2_5): the iCub model with backpack.

## Utilities

- inside the [doc](doc) folder, it is explained how to edit meshes and urdf file in order to be able to use them inside the [iDyntree visualizer](https://github.com/robotology/idyntree/blob/master/src/visualization/src/Visualizer.cpp).

- inside the [patches](patches) folder, it is explained how to edit the meshes in order to be able to add colors in the [iDyntree visualizer](https://github.com/robotology/idyntree/blob/master/src/visualization/src/Visualizer.cpp).

## Mantainer

Gabriele Nava ([@gabrielenava](https://github.com/gabrielenava)).
