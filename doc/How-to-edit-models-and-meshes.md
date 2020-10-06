# How to edit models and meshes

## Concerning the `urdf model`:

- **Optional**: There may be tags such as the `<gazebo/>` tag that produce a lot of warnings and it is not used by iDyntree. A suggestion is to comment out/remove all these tags from the model. The urdf model can also be edited from MATLAB using [this function](https://github.com/gabrielenava/mbs_models/blob/master/patches/editUrdfModel.m).

## Concerning the `meshes`:

- They must be exported in `.obj` or `.stl` format and, optionally, the size can be reduced. This procedure may be done using [this patch](https://github.com/gabrielenava/mbs_models/blob/master/patches/simplifyMesh.py).

### DAE format

`.dae` meshes are currently not supported in the visualizer. However, here are some fancy tools that may be used to imporove your `.dae` mesh.

- The default color may result very ugly or very shiny inside the visualizer. To add/edit the mesh colors, modify the meshes using [this patch](https://github.com/gabrielenava/mbs_models/blob/master/patches/add_colors_to_meshes.xml).

- To indent the mesh file properly, modify the meshes using [this patch](https://github.com/gabrielenava/mbs_models/blob/master/patches/indentMesh.m).
