% EDITMESHES  allows to edit the dae meshes using Matlab. Currently, the only available action
%             is the automatic indentation of the .dae file.
%
clear variables
close all
clc

% open all the meshes
meshesNames  = dir('*.dae');

for k = 1:length(meshesNames)
    
    fid = fopen(meshesNames(k).name);

    % indent the .dae file correctly
    indentMesh(fid, meshesNames(k).name);
end
