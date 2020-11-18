function save2tikzII(fig, fileName,clearDAT)

    dir_name = '~/Documents/workspace/matlab/matlabImages';
    f_name = [dir_name,'/ALL']; 
    mkdir(f_name);
    % system(['mkdir ',f_name])
    save_path = [f_name,'/',fileName,'.tikz']; 
    tex_file  = [f_name,'/',fileName,'.tex']; 
    matlab2tikz('figurehandle', fig, 'filename', save_path)       
    
    fileID = fopen(tex_file,'w'); 
    fprintf(fileID,['\\documentclass{standalone}\n',...
                    '\\usepackage{tikz}\n',...
                    '\\usepackage{pgfplots}\n',...
                    '\\pgfplotsset{compat=newest}\n',...
                    '\\usetikzlibrary{arrows.meta}\n',...
                    '\\usepackage{amsmath}\n',...
                    '\\usepackage[utf8]{inputenc}\n',...
                    '\\usepackage{ngerman}\n',... 
                    '\\usepackage{siunitx}\n\n\n',...
                    '\\pgfplotsset{every axis/.append style={\n',...
                    'title style 	 ={font=\\small},\n',...
                    'tick label style={font=\\small}}}\n',...
                    '\\begin{document}\n',...
                    '\\small\n',...
                    '\t\\input{',save_path,'}\n',...
                    '\\end{document}\n'])
    fclose(fileID);
    
%     [s,c_dir] = system('pwd'); 
    c_dir = pwd; 
     
    cd(f_name) 
    system(['pdflatex --interaction=batchmode ',fileName,'.tex'])
%     system(['lualatex --interaction=nonstopmode ',fileName,'.tex'])
    if clearDAT
        system('rm *.log *.aux *.png *.tikz *.tex');
%        system('del /f *.log *.aux *.png *.tikz *.tex');
    else
        system('rm *.log *.aux');
%        system('del /f *.log *.aux');
    end
%     f = cellstr(c_dir);
%     cd(f{1,1})  
    cd(c_dir) 
%     \documentclass{standalone}
%     \usepackage{tikz}
%     \usepackage{pgfplots}
%     \pgfplotsset{compat=newest}
%     \usepackage{siunitx}
% 
%     \begin{document}
%     \input{polarrep.tikz}
%     \end{document}
end

