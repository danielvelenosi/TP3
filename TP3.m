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
addpath('Constantes')




% monInv = Inventaire();
%
% % Affichage du menu
% affichageMenu();
% choix = input('# ');


% while choix ~= 1
%     fprintf('L''inventaire doit préalablement être chargé\n');
%     affichageMenu();
%     choix = saisirChoix('#');
% end

%Initialisation des variables
invCharger = false;
sauvegarder = false;
quit = false;

while quit ~= 1
    affichageMenu();
    choix = str2num(saisirChoix('#'));
    
    switch choix
        %         while invCharger == false
        %             fprintf('L''inventaire doit être préalablement chargé\n')
        
        
        case 1 % Charger inventaire
            monInv = Inventaire();
            invCharger = true;
            fprintf('L''inventaire à été chargé\n')
            
            
        case 2 % Afficher les caractéristiques d'une voiture
            if invCharger == true
                nbVoiture = str2num(saisirChoix('Quelle voiture voulez-vous voir ? '));
                disp(monInv.voiture(nbVoiture))
            else
                fprintf('L''inventaire doit être préalablement chargé\n')
            end
            
            
        case 3 % Afficher les caractéristiques de toutes les voitures
            if invCharger == true
                disp(monInv)
            else
                fprintf('L''inventaire doit être préalablement chargé\n')
            end
            
            
            
        case 4 % Ajouter un véhicule
            if invCharger == true
                nbVoiture = numel(monInv.voiture) + 1;
                marque = saisirChoix('Marque: ');
                modele = saisirChoix('Modele: ');
                annee = saisirChoix('Année: ');
                combinee = str2num(saisirChoix('Consommation combinée: '));
                ville = str2num(saisirChoix('Consommation en ville: '));
                autoroute = str2num(saisirChoix('Consommation sur l''autoroute: '));
                creerVoiture(monInv,nbVoiture,marque,modele,annee,combinee,ville,autoroute);
            else
                fprintf('L''inventaire doit être préalablement chargé\n')
            end
            
            
        case 5 % Supprimer un véhicule
            if invCharger == true  
                 nbVoiture = str2num(saisirChoix('Quel voiture voulez-vous supprimer? '));
                 monInv.supprimerVoiture(nbVoiture);
%                     if maVoiture.getNbVoiture == "NULL"
%                         fprintf('La voiture a bien été supprimée\n')
%                     else
%                         fprintf('La voiture n''a pas été supprimée\n')
%                     end
                
            else
                fprintf('L''inventaire doit être préalablement chargé\n')
            end
            
            
        case 6 % Modifier un véhicule
            if invCharger == true
                nbVoiture = str2num(saisirChoix('Quelle voiture voulez-vous modifier? '));
                disp(monInv.voiture(nbVoiture))
                monInv.modifierVoiture(nbVoiture)
                
            else
                fprintf('L''inventaire doit être préalablement chargé\n')
            end
            
        case 7 % Sauvegarder l''inventaire
            if invCharger == true
                monInv.sauvegardeMonInv()
                sauvegarder = true;
                fprintf('Le fichier à été enregistré\n');
            else
                fprintf('L''inventaire doit être préalablement chargé\n')
            end
            
            
        case 8 % Afficher k meilleur
            if invCharger == true
               fprintf('\n1:Combinee')
                fprintf('\n2:Ville')
                fprintf('\n3:Autoroute\n')
                genreConsommation = saisirChoix('#', 1, 3);
                combienVoiture = saisirChoix('Combien de voitures voulez-vous avoir dans votre liste ? ');
                voituresTriees = trouverMeilleuresVoiture(monInv, combienVoiture, genreConsommation);
                afficherMeilleuresVoitures(monInv,voituresTriees); 
                
            else
                fprintf('L''inventaire doit être préalablement chargé\n')
            end
            
            
        case 9 % Quitter
            quit = true;
            choix_quit = saisirChoix('Voulez-vous sauvegarder avant de quitter? (O/N) ');
            while choix_quit ~= "O" && choix_quit ~= "o" && choix_quit ~= "N" && choix_quit ~= "n"
                gravite = 0;
                gestionErreurs('Vous devez choisir entre Y et N', gravite);
                choix_quit = saisirChoix('Voulez-vous sauvegarder avant de quitter? (O/N) ');
            end
            if choix_quit == "O" || choix_quit == "o"
                monInv.sauvegardeMonInv()
            elseif choix_quit == "N" || choix_quit == "n"
                
            end
    end
    
    % rmpath('Inventaire');
    % rmpath('Voiture');
    % rmpath('Consommation');
    %rmpath('Constantes')
    
end
end

% else
%     fprintf('L''inventaire doit préalablement être chargé\n');
%     TP3();

