function [] = indentMesh(fid, meshFileName)

    % get all characters in the file
    stringMesh = fscanf(fid, '%c');

    % get the tags delimiters
    openTagDelimiter  = stringMesh == '<';
    closeTagDelimiter = stringMesh == '>';
    closeTagDelimiter = 2.*closeTagDelimiter;
    tagDelimiters     = openTagDelimiter + closeTagDelimiter; 

    % create a cell array containing, in each cell: either the tag, or the
    % content of the tag, or white spaces
    cellMesh          = {};
    cont              = 1;
    y_previous        = 0;

    for k = 1:length(stringMesh)
    
        if tagDelimiters(k) == 1
        
            exitLoop = false;
            y        = k;
        
            while ~exitLoop
            
                y = y +1;
            
                if tagDelimiters(y) == 2
                
                    if k-1 > y_previous
                    
                        % there is something in the middle
                        cellMesh{cont} = stringMesh(y_previous + 1: k-1); %#ok<*AGROW>
                        cont           = cont +1;
                    
                        % now add the tag
                        cellMesh{cont} = stringMesh(k: y);
                        cont           = cont +1;
                    else
                        % in this case, just add the tag
                        cellMesh{cont} = stringMesh(k: y);
                        cont           = cont +1;                  
                    end
                    y_previous = y;
                    exitLoop   = true;
                end
            end
        end
    end

    % remove empty cells
    %
    % WORKAROUND: it is assumed that each cell should contain at least an alphabet
    %             character or a number.
    cont               = 1;
    cleanedCellMesh    = {};
    alphabetAndNumbers = 'abcdefghijklmnopqrstuvwxyz0123456789';

    for k = 1:length(cellMesh)
    
        exitLoop = false;
        notEmpty = false;
        y        = 1;
    
        while ~exitLoop
        
            currentString = cellMesh{k};
        
            for j = 1:length(alphabetAndNumbers)
            
                if strcmpi(currentString(y), alphabetAndNumbers(j))
                
                    exitLoop = true;
                    notEmpty = true;
                end
            end
        
            y = y+1;
        
            if y > length(currentString)
            
                exitLoop = true;
            end
            if notEmpty
            
                cleanedCellMesh{cont} = cellMesh{k};
                cont                  = cont + 1;
            end
        end
    end

    fclose(fid);
    
    % rewrite the file with indentation
    whiteSpaces      = '';
    addDefaultIndent = '  ';
    newFid           = fopen(meshFileName, 'w');
    
    % save mesh with the correct indentation
    for k = 1:length(cleanedCellMesh)
    
        if k > 2 % ignore xml version and initial tag
        
            if length(cleanedCellMesh{k}) >= 2 
            
                if ~strcmp(cleanedCellMesh{k}(1:2), '</') 
            
                    % either an open tag or a value. 
                
                    % increment the white spaces if the previous element is not
                    % an end tag, otherwise do not increment
                    if ~strcmp(cleanedCellMesh{k-1}(1:2), '</') && ~strcmp(cleanedCellMesh{k-1}(end-1:end), '/>')
                    
                        whiteSpaces = [whiteSpaces, addDefaultIndent];
                    end
                else
                    % end tag. Remove whiteSpaces
                    whiteSpaces = whiteSpaces(1:end-2);
                end
            else
                % a single value. Increment white spaces (is not a tag)
                whiteSpaces     = [whiteSpaces, addDefaultIndent];
            end
        end 
    
        fprintf(fid,'%s\n', [whiteSpaces, cleanedCellMesh{k}]);
    end

    fclose(newFid);
end