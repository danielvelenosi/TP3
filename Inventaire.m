classdef Inventaire < handle
    %INVENTAIRE Summary of this class goes here
    %   Detailed explanation goes here
    properties (Access = public)
        voiture Voiture;
    end
    
    methods (Access = public)
        %Charger l'inventaire
        function lesVoiture = lireData()
            % Initialisation des variables
            i = 1;
            lesVoiture = [];
            % Ouvrir data.txt
            fid = fopen('data.txt','r');
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
                    lesVoiture = [lesVoiture;data];
                    %lesVoiture(i) = Voiture(nbVoiture,marque,modele,annee,consommation.combinee,consommation.ville,consommation.autoroute);
                    %maVoiture(i) = Voiture(nbVoiture,marque,modele,annee,combinee,ville,autoroute);
                    %maVoiture(i) = Voiture(nbVoiture,marque,modele,annee,consommation);
                    %lesVoiture(i) = Inventaire(voiture);
                    %maVoiture(i) = Inventaire(nbVoiture,marque,modele,annee,consommation.combinee,consommation.ville,consommation.autoroute);
                    
                    i = i + 1;
                end
                fclose(fid);
            else
                error('Error Message');
            end
        end
    end
    
    methods (Access = public)
        %Ajouter une voiture
               
    end
    
    methods (Access = public)
      % Supprimer une voiture
      
    end
    
    methods (Access = public)
      %Modifier une voiture
      
    end
    
    methods (Access = public)
      %Sauvegarder l'inventaire de voiture
      
    end
    
    methods (Access = public)
        % Afficher l'inventaire de voiture
        function disp(lesVoiture)
        end
    end

    
    methods (Access = public)
      %Trouver les meilleures voitures
      
    end
    
    methods (Access = public)
      %Afficher les meilleures voitures
      
    end
    
    
        
      
        
        
        
        
        %Affichage
%         function disp(inventaire)
%           fprintf('\t ID                                : %d \n', (inventaire.id));  
%           fprintf('\t Marque                            : %s \n', (inventaire.voiture.marque));
%           fprintf('\t Modele                            : %s \n', (inventaire.voiture.modele));
%           fprintf('\t Annee                             : %s \n', (inventaire.voiture.annee));
%           fprintf('\t Consommation combinée             : %.2f kWh/100km \n', (inventaire.voiture.consommation.combinee));
%           fprintf('\t Consommation en ville             : %.2f kWh/100km \n', (inventaire.voiture.consommation.ville));
%           fprintf('\t Consommation sur l''autoroute      : %.2f kWh/100km \n', (inventaire.voiture.consommation.autoroute));
%         end   
end

