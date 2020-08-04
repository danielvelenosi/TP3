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

addpath('Inventaire');
addpath('Voiture');
addpath('Consommation');

% Affichage du menu
fprintf('**************** GESTIONNAIRE D''INVENTAIRE ****************');
fprintf('\n1) Charger inventaire');
fprintf('\n2) Afficher les caractéristiques d''une voiture');
fprintf('\n3) Afficher les caractéristiques de toutes les voitures');
fprintf('\n4) Ajouter un véhicule');
fprintf('\n5) Supprimer un véhicule');
fprintf('\n6) Modifier un véhicule');
fprintf('\n7) Sauvegarder l''inventaire');
fprintf('\n8) Afficher k meilleur');
fprintf('\n9) Quitter');

% Gestion du menu
% One of these below
% 1) Charger l'inventaire
inventaire = lireData();
% voiture = lireData();

% Fonction Gestion des erreurs

% Afficher le menu tant que le choix n’est pas de quitter le programme.

% Lorsqu’on quitte, le programme propose de sauvegarder l’inventaire si une modification a été faite à l’inventaire.

% Afficher k meilleure propose de sauvegarder les résultats dans un fichier texte.

% Enregistrer les meilleures voitures
% Fonction qui reçoit l’inventaire ainsi que le tableau des résultats obtenus par la fonction trouver les meilleures voitures. 
% Elle enregistre les résultats dans un fichier texte. Voir l’annexe pour avoir une idée du résultat attendu.

choix = input('# ');

    switch choix
        if choix ~= 2
            fprintf('L''inventaire doit préalablement être chargé\n');
            affichageMenu()
        else
            case 1 % Charger inventaire
                
            case 2 % Afficher les caractéristiques d'une voiture
                
            case 3 % Afficher les caractéristiques de toutes les voitures
                
            case 4 % Ajouter un véhicule
                
            case 5 % Supprimer un véhicule
                
            case 6 % Modifier un véhicule
                
            case 7 % Sauvegarder l''inventaire
                
            case 8 % Afficher k meilleur
                
            case 9 % Quitter
                choix_quit = input('Voulez-vous sauvegarder avant de quitter? (O/N) ');
                if choix == O || choix == o
                    
                else
                end

            otherwise
        end
    end
%rmpath
end