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
monInv = Inventaire();

% Affichage du menu
affichageMenu();
choix = input('# ');


while choix ~= 1
    fprintf('L''inventaire doit préalablement être chargé\n');
    affichageMenu();
    choix = saisirChoix('#');
end   

if choix == 1
    switch choix
        
        case 1 % Charger inventaire
            monInv = Inventaire();
            affichageMenu();
            choix = saisirChoix('#');
            
    end
        if choix ~= 1
            switch choix
                case 2 % Afficher les caractéristiques d'une voiture
                    
                    nbVoiture = saisirChoix('Quelle voiture voulez-vous voir ? '); 
                    disp(monInv,nbVoiture)
                    affichageMenu()
                    
                case 3 % Afficher les caractéristiques de toutes les voitures
                    
                    disp(monInv)                  
                    affichageMenu()
     
                case 4 % Ajouter un véhicule
                    
                    nbVoiture = saisirChoix('Numéro d''identification: ');
                    marque = saisirChoix('Marque: ');
                    modele = saisirChoix('Modele: ');
                    annee = saisirChoix('Année: ');
                    combinee = saisirChoix('Consommation combinée: ');
                    ville = saisirChoix('Consommation en ville: ');
                    autoroute = saisirChoix('Consommation sur l''autoroute: ');
                    creerVoiture(monInv,nbVoiture,marque,modele,annee,combinee,ville,autoroute);
                    affichageMenu()                   
                    
                case 5 % Supprimer un véhicule
                    
                    nbVoiture = saisirChoix('Quel voiture voulez-vous supprimer? ');
                    supprimerVoiture(monInv,nbVoiture);
                    fprintf('La voiture à bien été supprimée\n')
                    affichageMenu()
                    
                case 6 % Modifier un véhicule
                    
                    nbVoiture = saisirChoix('Quelle voiture voulez-vous modifier? \n');
                    %i = saisirChoix('Quel attribut voulez-vous modifier? \n');
                    %disp(monInv(i))
                    modifierVoiture(monInv,nbVoiture)
                    affichageMenu()
                    
                case 7 % Sauvegarder l''inventaire
                    
                    sauvegardeMonInv(monInv)
                    fprintf('Le fichier à été enregistré');
                    affichageMenu()
                    
                case 8 % Afficher k meilleur
                    
                    
                case 9 % Quitter
                    choix_quit = saisirChoix('Voulez-vous sauvegarder avant de quitter? (O/N) ');
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