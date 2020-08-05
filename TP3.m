%--------------------------------------------------------------------------
% FICHIER       : TP3.m
% PAR           : Daniel Velenosi, Simon Tremblay, Daniele Sciascia et
%                 Alvin Le
% DATE          : 24/07/2020
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
function TP3()

% addpath('Inventaire.m');
% addpath('Voiture');
% addpath('Consommation');
% addpath('Constantes');
monInventaire = Inventaire();

% Affichage du menu
affichageMenu();
choix = input('# ');
% Gestion du menu
% One of these below
% 1) Charger l'inventaire
%inventaire = lireData();
% voiture = lireData();

% Fonction Gestion des erreurs

% Afficher le menu tant que le choix n’est pas de quitter le programme.

% Lorsqu’on quitte, le programme propose de sauvegarder l’inventaire si une modification a été faite à l’inventaire.

% Afficher k meilleure propose de sauvegarder les résultats dans un fichier texte.

% Enregistrer les meilleures voitures
% Fonction qui reçoit l’inventaire ainsi que le tableau des résultats obtenus par la fonction trouver les meilleures voitures.
% Elle enregistre les résultats dans un fichier texte. Voir l’annexe pour avoir une idée du résultat attendu.

while choix ~= 1
    fprintf('L''inventaire doit préalablement être chargé\n');
    affichageMenu();
    choix = input('# ');
end   

if choix == 1
    switch choix
        
        case 1 % Charger inventaire
            monInv = Inventaire();
            affichageMenu();
            choix = input('# ');
            
    end
        if choix ~= 1
            switch choix
                case 2 % Afficher les caractéristiques d'une voiture
                    fprintf('#2 \n');
                    i = input('Quelle voiture voulez vous voir? ');
                    disp(monInv(i))
                    affichageMenu()
                    
                case 3 % Afficher les caractéristiques de toutes les voitures
                    fprintf('#3 \n');
                    disp(monInv.voiture)                  
                    affichageMenu()
                    
                case 4 % Ajouter un véhicule
                    fprintf('#4 \n');
                    nbVoiture = input('Numéro d''identification: \n');
                    marque = input('Marque: \n');
                    modele = input('Modele: \n');
                    annee = input('Année: \n');
                    combinee = input('Consommation combinée: \n');
                    ville = input('Consommation en ville: \n');
                    autoroute = input('Consommation sur l''autoroute: \n');
                    creerVoiture(monInv,nbVoiture,marque,modele,annee,combinee,ville,autoroute);
                    affichageMenu()
                    
                case 5 % Supprimer un véhicule
                    fprintf('#5 \n');
                    nbVoiture = input('Quel voiture voulez-vous supprimer? ');
                    supprimerVoiture(monInv,nbVoiture);
                    fprintf('La voiture à bien été supprimée\n')
                    affichageMenu()
                    
                case 6 % Modifier un véhicule
                    fprintf('#6 \n');
                    nbVoiture = input('Quelle voiture voulez-vous modifier? \n');
                    i = input('Quel attribut voulez-vous modifier? \n');
                    disp(monInv(i))
                    %choix = saisirChoix('Quel attribut voulez-vous modifier?',1,7);
                    modifierVoiture(monInv,nbVoiture)
                    affichageMenu()
                    
                case 7 % Sauvegarder l''inventaire
                    fprintf('#7 \n');
                    sauvegardeMonInv(monInv)
                    fprintf('Le fichier à été enregistré');
                    affichageMenu()
                    
                case 8 % Afficher k meilleur
                    fprintf('#8 \n');
                    
                case 9 % Quitter
                    choix_quit = input('Voulez-vous sauvegarder avant de quitter? (O/N) ');
                    if choix == O || choix == o
                        sauvegardeMonInv(monInv)
                    else
                    end
                    
                otherwise
            end
        end
    end
    
% else
%     fprintf('L''inventaire doit préalablement être chargé\n');
%     TP3();
% rmpath('Inventaire');
% rmpath('Voiture');
% rmpath('Consommation');
% rmpath('Constantes');
end