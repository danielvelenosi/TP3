classdef Inventaire < handle
    %INVENTAIRE Summary of this class goes here
    %   Detailed explanation goes here
    properties (Access = public)
        voiture Voiture;
        consommation Consommation;
    end
    
    methods (Access = public)
        %Charger l'inventaire
        function monInv = Inventaire()
            % Initialisation des variables
            i = 1;
            %voiture = [];
            % Ouvrir data.txt
            fid = fopen('data.txt','r');
            if fid ~= -1
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

                    monInv.consommation(i) = Consommation(combinee,ville,autoroute);
                    monInv.voiture(i) = Voiture(nbVoiture,marque,modele,annee,monInv.consommation(i));

                   
                    i = i + 1;
                end
                fclose(fid);
            else
                error('Error Message');
            end
        end
    end
    
    methods (Access = public)
      % Ajouter une voiture
      function voiture = creerVoiture(monInv,nbVoiture,marque,modele,annee,combinee,ville,autoroute)         
          consommation = Consommation(combinee,ville,autoroute);
          voiture = Voiture(nbVoiture,marque,modele,annee,consommation);
          monInv.voiture = [monInv.voiture;voiture];
      end
    end
    
    methods (Access = public)
      % Supprimer une voiture
      function supprimerVoiture(mon_inv,nbVoiture)
          Voiture = mon_inv.voiture(nbVoiture,1);
          setNbVoiture(Voiture,"NULL")
          
          for i = nbVoiture+1:1:size(mon_inv.voiture,1)
              Voiture = mon_inv.voiture(i,1);
              nouveauNum = getNbVoiture(Voiture);
              setNbVoiture(Voiture,(nouveauNum-1))
          end
      end
      
    end
    
    methods (Access = public)
    %Modifier une voiture
      
    function modifierVoiture(monInv, nbVoiture)
        i =1;
        
            
        
        
        
        
        
        end
    
      
      
      
      
      
      
      
      
      
      
    end
    
    methods (Access = public)
      %Sauvegarder l'inventaire de voiture
      
    end
    
    methods (Access = public)
        % Afficher l'inventaire de voiture
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

