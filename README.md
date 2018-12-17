# matlab-multi-body-sim_models

Collection of models and meshes to be used inside the `matlab-multi-body-sim` simulator. They can also be used as standalone `urdf` models, e.g. with the [idyntree](https://github.com/robotology/idyntree) library.

## Operating system

The code has been developed and tested on Ubuntu 18.04.

## Installation and usage

This repository can be used in two different ways:

- `git clone` or download this repository as standalone library of `urdf` models. In order to use the library, you may write your code following this [templates](https://github.com/gabrielenava/matlab-multi-body-sim_app/templates). This approach does not necessarily require to `install` the repository.

- dowload this repository using the [matlab-multi-body-sim_superbuild](https://github.com/gabrielenava/matlab-multi-body-sim_superbuild) **(suggested)**. The `superbuild` **will install** (copy and paste) all the models and meshes of this repo inside the `$PATH-TO-SUPERBUILD/build/install` folder. This results in a cleaner installation as the [standard simulations](https://github.com/gabrielenava/matlab-multi-body-sim_app) by default temporary add the path to the installed files.
 
## Available models

- [icubGazeboSim](models/icubGazeboSim): the iCub model without backpack.

- [iCubGazeboV2_5](models/iCubGazeboV2_5): the iCub model with backpack.

- [ironBot](models/ironBot): the flying iCub model.

## Mantainer

Gabriele Nava ([@gabrielenava](https://github.com/gabrielenava)).
