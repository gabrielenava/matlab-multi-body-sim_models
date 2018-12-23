% EDITMESHES  allows to edit the dae meshes using Matlab. 
clear variables
close all
clc

% open all the meshes
meshesNames  = dir('*.dae');

for k = 1:length(meshesNames)
    
    fid = fopen(meshesNames(k).name);
    indentMesh(fid, meshesNames(k).name);
end
