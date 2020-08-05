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
      function supprimerVoiture(monInv,nbVoiture)
          Voiture = monInv.voiture(nbVoiture);
          setNbVoiture(Voiture,"NULL")
          
          %Pour replacer toutes les voitures dans l'ordre sans qu'il y ait
          %de "trou" dans les numéros
          for i = nbVoiture+1:1:size(monInv.voiture,1)
              Voiture = monInv.voiture(i,1);
              nouveauNum = getNbVoiture(Voiture);
              setNbVoiture(Voiture,(nouveauNum-1))
          end
      end
      
    end
    
    methods (Access = public)
        %Modifier une voiture
        
        function modifierVoiture(monInv, nbVoiture)
                     
                     %Affichage du mini menu pour choisir l'attribut à
                     %modifier
                     fprintf('***** MODIFICATION D''ATTRIBUT *****\n');
                     fprintf('1) Marque\n');
                     fprintf('2) Modèle\n');
                     fprintf('3) Année\n');
                     fprintf('4) Consommation combinée\n');
                     fprintf('5) Consommation en ville\n');
                     fprintf('6) Consommation sur l''autoroute\n');
                     fprintf('7) Quitter\n');
                     choix = input('Quel attribut voulez-vous modifier? ');
                    
                    switch choix
                        case MARQUE
                            marque = input('Entrer la nouvelle marque: ','s');
                            monInv.voiture(nbVoiture).setMarque(marque)
                            
                        case MODELE
                            modele = input('Entrer le nouveau modèle: ','s');
                            monInv.voiture(nbVoiture).setModele(modele)                            
                            
                        case ANNEE
                            annee = input('Entrer la nouvelle année: ','s');
                            monInv.voiture(nbVoiture).setAnnee(annee)
                            
                        case COMBINEE
                            combinee = input('Entrer la nouvelle consommation combinée: ','s');
                            monInv.consommation(nbVoiture).setCombinee(combinee)
                            
                        case VILLE
                            ville = input('Entrer la nouvelle consommation en ville: ','s');
                            monInv.consommation(nbVoiture).setVille(ville)
                            
                        case AUTOROUTE
                            input('Entrer la nouvelle consommation sur l''autoroute: ','s');
                            monInv.consommation(nbVoiture).setAutoroute(autoroute)
                            
                        case QUITTER
                            fprintf('Fin des modifications\n')
                            
                    end            
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
      function voituresTriees = trouverMeilleuresVoiture(monInv, nbVoitures, consommation)
          
          %Si on veut la consommation combinée
          if consommation == 1
              
              %Initialisation du tableau
              voituresTriees = zeros(size(consommation(combinee),1),2);
              
              %On remplie le tableau
              for i = 1 : numel(monInv.consommation)
                  voituresTriees(i,1) = i;
                  voituresTriees(i,2) = consommation(1,2);
              end
              
              %On fait appel à une fonction pour trier les consommations
              voituresTriees = trierResultat(voituresTriees);
              
              %On affiche le nombre de voitures selon l'entrée
              voituresTriees(1:nbVoitures,1:2);
              
          elseif consommation == 2
              
              %Initialisation du tableau
              voituresTriees = zeros(size(consommation(ville),1),2);
              
              %On remplie le tableau
              for i = 1 : numel(monInv.consommation)
                  voituresTriees(i,1) = i;
                  voituresTriees(i,2) = consommation(1,2);
              end
              
              %On fait appel à une fonction pour trier les consommations
              voituresTriees = trierResultat(voituresTriees);
              
              %On affiche le nombre de voitures selon l'entrée
              voituresTriees(1:nbVoitures,1:2);
              
          elseif consommation == 3
              %Initialisation du tableau
              voituresTriees = zeros(size(consommation(autoroute),1),2);
              
              %On remplie le tableau
              for i = 1 : numel(monInv.consommation)
                  voituresTriees(i,1) = i;
                  voituresTriees(i,2) = consommation(1,2);
              end
              
              %On fait appel à une fonction pour trier les consommations
              voituresTriees = trierResultat(voituresTriees);
              
              %On affiche le nombre de voitures selon l'entrée
              voituresTriees(1:nbVoitures,1:2);
              
          end
      end
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