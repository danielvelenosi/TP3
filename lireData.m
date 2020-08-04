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
function maVoiture = lireData()
    % Initialisation des variables
    i = 1;
    % Ouvrir data.txt
    fid = fopen('data.txt','w');
    %Look up fid ... why is fid = 6 in workspace when running lireData with
    %breakpoint?
    if fid ~= -1
        while ~feof(fid)

            ligne = fgetl(fid);
            [data] = textscan(ligne,'%s %s %s %s %s %s %s','delimiter',';');

            nbVoiture = double(string(data(1)));
            %nbVoiture = double(data(1));
            marque = string(data(2));
            modele = string(data(3));
            annee = string(data(4));
            combinee = double(string(data(5)));
            %combinee = double(data(5));
            ville = double(string(data(6)));
            %ville = double(data(6));
            autoroute = double(string(data(7)));
            %autoroute = double(data(7));
            
            % I tried all of these and none worked
            %maVoiture(i) = Voiture(nbVoiture,marque,modele,annee,consommation.combinee,consommation.ville,consommation.autoroute);
            %maVoiture(i) = Voiture(nbVoiture,marque,modele,annee,combinee,ville,autoroute);
            %maVoiture(i) = Voiture(nbVoiture,marque,modele,annee,consommation);
            %maVoiture(i) = Inventaire(voiture);
            %maVoiture(i) = Inventaire(nbVoiture,marque,modele,annee,consommation.combinee,consommation.ville,consommation.autoroute);

            i = i + 1;
        end
        fclose(fid);
    else
        error('Error Message');
    end
end

