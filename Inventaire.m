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
          monInv.voiture = [monInv.voiture voiture];
      end
    end
    
    methods (Access = public)
      % Supprimer une voiture
      function supprimerVoiture(mon_inv,nbVoiture)
          Voiture = mon_inv.voiture(nbVoiture,1);
          setNbVoiture(Voiture,"NULL")
          
          %Pour replacer toutes les voitures dans l'ordre sans qu'il y ait
          %de "trou" dans les numéros
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
            while i < ATTRIBUTS
                if monInv.voiture(i).getNbVoiture == nbVoiture
                    choixModAttribut()
                    choix = saisirChoix();
                    
                    switch choix
                        case MARQUE
                            monInv.voiture(i).setMarque(input('Entrer la nouvelle marque: \n','s'))
                            
                        case MODELE
                            monInv.voiture(i).setModele(input('Entrer le nouveau modèle: \n','s'))
                            
                        case ANNEE
                            monInv.voiture(i).setAnnee(input ...
                            ('Entrer la nouvelle année: \n','s'))
                            
                        case COMBINEE
                            monInv.consommation(i).setCombinee(input ... 
                            ('Entrer la nouvelle consommation combinée: \n','s'))
                            
                        case VILLE
                            monInv.consommation(i).setVille(input ...
                            ('Entrer la nouvelle consommation en ville: \n','s'))
                            
                        case AUTOROUTE
                            monInv.consommation(i).setAutoroute(input ...
                            ('Entrer la nouvelle consommation sur l''autoroute: \n','s'))
                            
                        case QUITTER
                            fprintf('Fin des modifications\n')
                            i = 7;
                    end
                end
            end
            i = i + 1;
        end
        
    end
    
    methods (Access = public)
      %Sauvegarder l'inventaire de voiture
      function sauvegardeMonInv(monInv)
          fid = fopen('data.txt','w');
            if fid == -1
                error('Le fichier n''a pu être sauvegardé.');
            end
            fclose(fid); 
      end
    end
    
    methods (Access = public)
        % Afficher l'inventaire de voiture
        function disp(monInv)
            for i = 1:numel(monInv.voiture)
                fprintf('*********************** VOITURE #%d ***********************\n',i);
                disp(monInv.voiture(i))                
            end
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

