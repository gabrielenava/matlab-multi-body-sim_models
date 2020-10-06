clear 
close
clc

%% Get all mesh files in the folder

% Usage: move this file and simplifyMesh.py in the folder where the meshes
% are located. Specify the mesh format into meshesFormat.
meshesFormat = 'stl';
nIter        = 1;
meshesNames  = dir(['*.',meshesFormat]);

for k = 1:length(meshesNames)
    
    command  = ['python simplifyMesh.py ', meshesNames(k).name, ' ', num2str(nIter)];
    system(command);
end
