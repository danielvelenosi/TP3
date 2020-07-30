classdef Inventaire < handle
    %INVENTAIRE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        id;
        voiture Voiture;
    end
    
    methods (Access = public)
        %Constructeur
        function inventaire = Inventaire(id,marque,modele,annee,combinee,ville,autoroute)
            inventaire.id = id;
            inventaire.voiture = Voiture(marque,modele,annee,combinee,ville,autoroute);           
        end
        
        %Accesseur
        function id = getId(inventaire)
            id = inventaire.id;
        end
        
%         function marque = getMarque(inventaire)
%            marque = inventaire.voiture.marque; 
%         end
        
        
        %Mutateur
        function setId(inventaire,id)
            inventaire.id = id;
        end
        
        %Affichage
        function disp(inventaire)
          fprintf('\t ID                                : %d \n', (inventaire.id));  
          fprintf('\t Marque                            : %s \n', (inventaire.voiture.marque));
          fprintf('\t Modele                            : %s \n', (inventaire.voiture.modele));
          fprintf('\t Annee                             : %s \n', (inventaire.voiture.annee));
          fprintf('\t Consommation combinée             : %.2f kWh/100km \n', (inventaire.voiture.consommation.combinee));
          fprintf('\t Consommation en ville             : %.2f kWh/100km \n', (inventaire.voiture.consommation.ville));
          fprintf('\t Consommation sur l''autoroute      : %.2f kWh/100km \n', (inventaire.voiture.consommation.autoroute));
        end
    end 
end

