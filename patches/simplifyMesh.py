#!/usr/bin/env python

import sys
import os
import subprocess

# This script will perform automatically the following operation:
#
#     Filters > Remeshing, Simplification and Reconstruction >
#     Quadric Edge Collapse Decimation
#
# with parameters:
#
#     0.9 percentage reduction (10%), 
#     0.3 Quality threshold (70%)
#
# Target number of faces is ignored with those parameters.
#
# Original code: https://gist.github.com/tylerlindell/7435ca2261e7c404ccc1241f18e483aa
#
# Usage:
#
#     python filename.py meshName.stl numOfIterations
#
filter_script_mlx = """
<!DOCTYPE FilterScript>
<FilterScript>
 <filter name="Quadric Edge Collapse Decimation">
  <Param type="RichInt"   value="9000"  name="TargetFaceNum"/>
  <Param type="RichFloat" value="0.9"   name="TargetPerc"/>
  <Param type="RichFloat" value="0.3"   name="QualityThr"/>
  <Param type="RichBool"  value="false" name="PreserveBoundary"/>
  <Param type="RichFloat" value="1"     name="BoundaryWeight"/>
  <Param type="RichBool"  value="false" name="PreserveNormal"/>
  <Param type="RichBool"  value="false" name="PreserveTopology"/>
  <Param type="RichBool"  value="true"  name="OptimalPlacement"/>
  <Param type="RichBool"  value="false" name="PlanarQuadric"/>
  <Param type="RichBool"  value="false" name="QualityWeight"/>
  <Param type="RichBool"  value="true"  name="AutoClean"/>
  <Param type="RichBool"  value="false" name="Selected"/>
 </filter>
</FilterScript>
"""

cwd = os.getcwd()

# Create the filter script and save the path
def create_tmp_filter_file(filename='filter_file_tmp.mlx'):

    with open(cwd + '/' + filename, 'w') as f:

        f.write(filter_script_mlx)

    return cwd + '/' + filename

# Remeshing function call
def reduce_faces(in_file, out_file, filter_script_path=create_tmp_filter_file()):

    # Add input mesh
    command = "meshlabserver -i " + in_file

    # Add the filter script
    command += " -s " + filter_script_path

    # Add the output filename and output flags
    command += " -o " + out_file
    
    # Execute command
    print("Going to execute: " + command)  
    output = subprocess.call(command, shell=True)
    last_line = output
    print()
    print("Done:")
    print(in_file + " > " + out_file + ": " + str(last_line))

# Main function call
if __name__ == '__main__':

    # Display usage if no arguments are passed
    if len(sys.argv) < 3:

        print("Usage:")
        print(sys.argv[0] + " /path/to/input_mesh num_iterations")
        print("For example, to reduce size 10 times:")
        print(sys.argv[0] + " /home/myuser/mymesh.stl 10")
        exit(0)

    # Get input mesh and n. of iterations
    in_mesh        = sys.argv[1]
    filename       = in_mesh.split('.')[0]
    num_iterations = int(sys.argv[2])
    print("Input mesh: " + in_mesh + " (filename: " + filename + ")")
    print("Num iterations: " + str(num_iterations))
   
    # Repeat the desired operation (remeshing and semplification) for n. iterations
    for it in range(num_iterations):

        if num_iterations == 1:

            # out_mesh = filename + "_it" + str(it) + ".stl"
            out_mesh = filename + ".stl"
            reduce_faces(in_mesh, out_mesh)
        else:
            # out_mesh = filename + "_it" + str(it) + ".stl"
            out_mesh = filename + ".stl"
            reduce_faces(last_out_mesh, out_mesh)

        last_out_mesh = out_mesh

    print()
    print("Done with remeshing and semplification.")

