classdef Inventaire < handle
    %INVENTAIRE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = public)
        voiture Voiture;
    end
    
    methods (Access = public)
        %Charger l'inventaire
        function inventaire = Inventaire(voiture)
            inventaire.voiture = voiture;
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
      %Afficher l'inventaire de voiture
%       function lesVoitures(voiture)
%           for i = 1: numel(maVoiture)
%               disp(maVoiture(i));
%           end
%       end
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

