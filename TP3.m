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
function [outputArg1,outputArg2] = TP3(inputArg1,inputArg2)

%addpath

% Affichage du menu
% **************** GESTIONNAIRE D'INVENTAIRE ****************
% 1) Charger l'inventaire
% 2) Afficher les caractéristiques d'une voiture
% 3) Afficher les caractéristiques de toutes les voitures
% 4) Ajouter un véhicule
% 5) Supprimer un véhicule
% 6) Modifier un véhicule
% 7) Sauvegarder l'inventaire
% 8) Afficher k meilleur
% 9) Quitter

% Gestion du menu
% One of these below
inventaire = lireData();
voiture = lireData();

% Fonction Gestion des erreurs

% Afficher le menu tant que le choix n’est pas de quitter le programme.

% Lorsqu’on quitte, le programme propose de sauvegarder l’inventaire si une modification a été faite à l’inventaire.

% Afficher k meilleure propose de sauvegarder les résultats dans un fichier texte.

% Enregistrer les meilleures voitures
% Fonction qui reçoit l’inventaire ainsi que le tableau des résultats obtenus par la fonction trouver les meilleures voitures. 
% Elle enregistre les résultats dans un fichier texte. Voir l’annexe pour avoir une idée du résultat attendu.



%rmpath

end

