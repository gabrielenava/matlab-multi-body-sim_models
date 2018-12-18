# How to edit models and meshes

At the current stage, both the [urdf model]() and the associated [meshes]() require modifications w.r.t. a classical workflow in order to be able to use the model inside the [iDyntree visualizer](https://github.com/robotology/idyntree/blob/master/src/visualization/src/Visualizer.cpp). 

Concerning the `urdf model`:

- There may be tags such as the `<gazebo/>` tag that produce a lot of warnings and it is not used by iDyntree. A suggestion is to comment out/remove all these tags from the model.

- Unfortunatley, the visualizer requires to specify the **absolute path** of the meshes w.r.t. the folder where the **visualizer is running** and not relative to the model. While waiting for this issue to be solved, all models have been edited to have a **predefined tag** as absolute path of the meshes, e.g. `ABSOLUTE_PATH_TO_MESHES`. To use the model with a specific simulation, a temporary model is then created in which the tag has been substituted with the correct path. See e.g. the [wrappers test]().

Concerning the `meshes`:

- They must be exported in `.dae` format and, optionally, the size can be reduced. This procedure may be done using [meshlab]().

- The default color may result very ugly or very shiny inside the visualizer. To add/edit the mesh colors, modify the meshes using [this patch]().
