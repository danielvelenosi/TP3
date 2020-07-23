%--------------------------------------------------------------------------
% FICHIER       : lireData.m
% PAR           : Daniel Velenosi, Simon Tremblay, Daniele Sciascia et
%                 Alvin Le
% DATE          : 23/07/2020
% DESCRIPTION   : 
%--------------------------------------------------------------------------
% PARAMÈTRES :
%
% RETOUR :
% 
%--------------------------------------------------------------------------
% VARIABLES UTILISÉES :
% 
%--------------------------------------------------------------------------
function voiture = lireData()
    % Initialisation des variables
    i = 1;
    % Ouvrir data.txt
    fid = fopen('data.txt','r');
    if fid ~= 1
        while ~feof(fid)

            ligne = fgetl(fid);
            [data] = textscan(ligne,'%s %s %s %s %s %s %s','delimiter',';');

            nbVoiture = double(string(data(1)));
            marque = string(data(2));
            modele = string(data(3));
            annee = string(data(4));
            combinee = double(string(data(5)));
            ville = double(string(data(6)));
            autoroute = double(string(data(7)));
            
            voiture(i) = Voiture(nbVoiture,marque,modele,annee,combinee,ville,autoroute);
            i = i + 1;
        end
        fclose(fid);
    else
        error('Error Message');
    end
end

