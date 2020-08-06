% -------------------------------------------------------------------------
% FICHIER       : Inventaire.m
% PAR           : Daniel Velenosi, Simon Tremblay, Daniele Sciascia, Alvin Le
% DATE          : 22/07/2020
% DESCRIPTION   : classe Inventaire qui reçoit des voitures et des
%                 consommations
% -------------------------------------------------------------------------
classdef Inventaire < handle

    properties (Access = public)
        %On appelle la classe Voiture
        voiture Voiture;
        
        %On appelle la classe Consommation
        consommation Consommation;
    end
    
    methods (Access = public)
        
        %Charger l'inventaire
        function monInv = Inventaire()
            
            % Initialisation des variables
            i = 1;
            %Ouvrir le texte 'data.txt' dans la constante DATA avec
            %permission 'read'
            fid = fopen(DATA,'r');
            
            %Si on a réussi à ouvrir le fichier
            if fid ~= -1
                
                while ~feof(fid)
                    
                    ligne = fgetl(fid);
                    [data] = textscan(ligne,'%s %s %s %s %s %s %s','delimiter',';');
                    %On enregistre les informations dans des constantes
                    %correspondantes aux classes
                    nbVoiture = double(string(data(1)));
                    marque = string(data(2));
                    modele = string(data(3));
                    annee = string(data(4));
                    combinee = double(string(data(5)));
                    ville = double(string(data(6)));
                    autoroute = double(string(data(7)));
                    
                    %On crée un inventaire pour les consommations
                    monInv.consommation(i) = Consommation(combinee,ville,autoroute);
                    %On crée un inventaire pour les voitures contenants
                    %l'inventaire de consommations
                    monInv.voiture(i) = Voiture(nbVoiture,marque,modele,annee,monInv.consommation(i));
                    
                    %On recommence la boucle pour toutes les informations
                    %du fichier
                    i = i + 1;
                end
                fclose(fid);
            else
                %Si le fichier n'a pu être ouvert, on envoit un message
                %d'erreur
                error('Error Message');
            end
        end
    end
    
    methods (Access = public)
        % Ajouter une voiture
        %On crée une voiture avec toutes les informations des classes qu'on
        %va chercher dans inventaire
        
        function voiture = creerVoiture(monInv,nbVoiture,marque,modele,annee,combinee,ville,autoroute)
            %La consommation est ajoutée dans leur propre objet
            consommation = Consommation(combinee,ville,autoroute);
            %La voiture est ajouté dans son propre objet, contennant la
            %consommation
            voiture = Voiture(nbVoiture,marque,modele,annee,consommation);
            %On ajoute la nouvelle voiture à la fin de l'inventaire
            monInv.voiture = [monInv.voiture voiture];
        end
    end
    
    methods (Access = public)
        % Supprimer une voiture
        %On va chercher la voiture qu'on veut dans l'inventaire
        
        function supprimerVoiture(monInv,nbVoiture)
            maVoiture = monInv.voiture(nbVoiture);
            %On met l'identifiant de la voiture à "NULL" pour ne pas qu'elle
            %soit enregistrée
            
            maVoiture.setNbVoiture("NULL")
            %Pour replacer toutes les voitures dans l'ordre sans qu'il y ait
            %de "trou" dans les numéros
            
            for i = numel(monInv.voiture):1
                % Nous cherchons le long de la ligne 1
                maVoiture = monInv.voiture(1,i);
                nouveauNum = getNbVoiture(maVoiture);
                maVoiture.setNbVoiture(nouveauNum+1)
            end
        end
        
    end
    
    methods (Access = public)
        %Modifier une voiture
        %On va chercher la voiture qu'on veut modifier dans l'inventaire
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
                    %Changer la marque de la voiture
                    marque = input('Entrer la nouvelle marque: ','s');
                    monInv.voiture(nbVoiture).setMarque(marque)
                    
                case MODELE
                    %Changer le modèle de la voiture
                    modele = input('Entrer le nouveau modèle: ','s');
                    monInv.voiture(nbVoiture).setModele(modele)
                    
                case ANNEE
                    %Changer l'annee de la voiture
                    annee = input('Entrer la nouvelle année: ','s');
                    monInv.voiture(nbVoiture).setAnnee(annee)
                    
                case COMBINEE
                    %Changer la consommation combinée de la voiture
                    combinee = input('Entrer la nouvelle consommation combinée: ','s');
                    monInv.consommation(nbVoiture).setCombinee(combinee)
                    
                case VILLE
                    %Changer la consommation en ville de la voiture
                    ville = input('Entrer la nouvelle consommation en ville: ','s');
                    monInv.consommation(nbVoiture).setVille(ville)
                    
                case AUTOROUTE
                    %Changer la consommation sur l'autoroute de la voiture
                    input('Entrer la nouvelle consommation sur l''autoroute: ','s');
                    monInv.consommation(nbVoiture).setAutoroute(autoroute)
                    
                case QUITTER
                    %Quitter la modification de la voiture
                    fprintf('Fin des modifications\n')
                    
            end
        end
        
    end
    
    methods (Access = public)
        %Sauvegarder l'inventaire de voiture
        
        function sauvegardeMonInv(monInv)
            %Ouvrir le texte 'data.txt' dans la constante DATA avec
            %permission 'write' 
            fid = fopen(DATA,'w');
            %Si on a réussi à ouvrir le fichier
            if fid ~= -1
                
                for i = 1:numel(monInv.voiture)
                    voiture = monInv.voiture(i);
                    % VERIFIER PAR NULL
                    % Nous remplaçons les lignes dans DATA jusqu'à ce que 
                    % notre boucle 'for' rencontre une entrée "NULL"
                    if string(monInv.voiture(i).getNbVoiture()) == "NULL"
                        
                    else
                        nbVoiture = monInv.voiture(i).getNbVoiture();
                        marque = monInv.voiture(i).getMarque();
                        modele = monInv.voiture(i).getModele();
                        annee = monInv.voiture(i).getAnnee();
                        conso = monInv.voiture(i).getConsommation();
                        combinee = conso.getCombinee();
                        ville = conso.getVille();
                        autoroute = conso.getAutoroute();
                        
                        fprintf(fid,'%d;%s;%s;%s;%.2f;%.2f;%.2f\n',nbVoiture,marque,modele,annee,combinee,ville,autoroute);
                    end
                end
            else
                error('Le fichier n''a pu être sauvegardé.');
            end
            fclose(fid);
        end
    end
    
    methods (Access = public)
        % Afficher l'inventaire de voiture
        
        function disp(monInv)
            %Disp l'inventaire pour toutes les voitures présentes
            
            for i = 1:numel(monInv.voiture)
                %Afficher une entête avec le numéro de chaque voiture
                fprintf('*********************** VOITURE #%d ***********************\n',i);
                disp(monInv.voiture(i))
            end
        end
    end
    
    
    methods (Access = public)
        
        %Trouver les meilleures voitures
        function voituresTriees = trouverMeilleuresVoiture(monInv, nbVoitures, consommation)
            
            %Initialisation du tableau avec des zéros.
            voituresNonTriees = zeros(size(monInv.voiture,1));
            % On parcourt un boucle pour remplir le tableau de haut vers le
            % bas.
            
            for i = 1 : size(monInv.voiture,1)
                %On va chercher les voitures pour remplir le tableau
                Voiture = monInv.voiture(i,1);
                
                %Si la consommation est combinée
                if consommation == 1
                    %On remplie la 2e colonne du tableau avec la consommation
                    %combinée
                    voituresNonTriees(i,2) = getCombinee(Voiture);
                    
                %Si la consommation est de ville
                elseif consommation == 2
                    %On remplie la 2e colonne du tableau avec la consommation
                    %de ville
                    voituresNonTriees(i,2) = getVille(Voiture);
                    
                %Si la consommation est d'autoroute
                elseif consommation == 3
                    %On remplie la 2e colonne du tableau avec la consommation
                    %autoroute
                    voituresNonTriees(i,2) = getAutoroute(Voiture);
                end
            end
            
            % On trie le tableau avec la consommation choisie
            voituresTriees = trierResultat(voituresNonTriees);

            % On affiche le nombre de voitures selon l'entrée
            voituresTriees(1:nbVoitures,1:2);
            
        end
    end
    
    methods (Access = public)
        
        %Afficher meilleures voitures
        function afficherMeilleuresVoitures(monInv, tableauTrie)
            
            for i = 1 : numel(tableauTrie)
                maVoiture = monInv.tableau(maVoiture(i,1),1);
                fprintf("%d)\t\t\t\t%s\t%s\t\t(%.2f)\n",getNbVoiture(maVoiture),...
                getMarque(maVoiture),getModele(maVoiture),Tableau(i,2))
            end
        end
    end    
end
