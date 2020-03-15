# How to edit models and meshes

At the current stage, both the [urdf model](https://github.com/gabrielenava/mbs_models/blob/master/models/icubGazeboSim/model.urdf) and the associated [meshes](https://github.com/gabrielenava/mbs_models/tree/master/models/icubGazeboSim/meshes) require **manual modifications** in order to be able to use the model inside the [iDyntree visualizer](https://github.com/robotology/idyntree/blob/master/src/visualization/src/Visualizer.cpp). 

Concerning the `urdf model`:

- **Optional**: There may be tags such as the `<gazebo/>` tag that produce a lot of warnings and it is not used by iDyntree. A suggestion is to comment out/remove all these tags from the model.

- The visualizer requires to specify the **absolute path** of the meshes w.r.t. the folder where the **visualizer is running** and not the relative path between the meshes and the model. The current workaround is that all models must have the meshes path set as follows:

```
<geometry>
  <mesh filename="ABSOLUTE_PATH_TO_MESHES/icub_simple_collision_chest.dae" scale="1 1 1" />
</geometry>
```

where `ABSOLUTE_PATH_TO_MESHES` is a **tag** that will be recognized by the Multi-Body Simulator software and it will allow to handle the meshes path for the visualizer.

Concerning the `meshes`:

- They must be exported in `.dae` format and, optionally, the size can be reduced. This procedure may be done using [meshlab](http://www.meshlab.net/).

- The default color may result very ugly or very shiny inside the visualizer. To add/edit the mesh colors, modify the meshes using [this patch](https://github.com/gabrielenava/mbs_models/blob/master/patches/add_colors_to_meshes.xml).
