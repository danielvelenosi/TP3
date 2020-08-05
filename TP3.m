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
affichageMenu();
fprintf('L''inventaire doit préalablement être chargé\n');
    choix = input('# ');
end   

if choix == 1
    switch choix
        
        case 1 % Charger inventaire
            %monInventaire = Inventaire();
            lesVoiture = monInventaire.voiture();
            affichageMenu();
            choix = input('# ');
            
    end
        if choix ~= 1
            switch choix
                case 2 % Afficher les caractéristiques d'une voiture
                    fprintf('You clicked 2 \n');
                    
                case 3 % Afficher les caractéristiques de toutes les voitures
                    fprintf('You clicked 3 \n');
                    
                case 4 % Ajouter un véhicule
                    fprintf('You clicked 4 \n');
                    
                case 5 % Supprimer un véhicule
                    fprintf('You clicked 5 \n');
                    
                case 6 % Modifier un véhicule
                    fprintf('You clicked 6 \n');
                    
                case 7 % Sauvegarder l''inventaire
                    fprintf('You clicked 7 \n');
                    
                case 8 % Afficher k meilleur
                    fprintf('You clicked 8 \n');
                    
                case 9 % Quitter
                    choix_quit = input('Voulez-vous sauvegarder avant de quitter? (O/N) ');
                    if choix == O || choix == o
                        
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
end