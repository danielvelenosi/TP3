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
       choix = saisirChoix('#');
  
    switch choix
%         while invCharger == false 
%             fprintf('L''inventaire doit être préalablement chargé\n')


                case 1 % Charger inventaire
                monInv = Inventaire();
                invCharger = true;
                fprintf('L''inventaire à été chargé\n')


                case 2 % Afficher les caractéristiques d'une voiture
                    if invCharger == true
                    nbVoiture = saisirChoix('Quelle voiture voulez-vous voir ? '); 
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
                    nbVoiture = saisirChoix('Numéro d''identification: ');
                    marque = saisirChoix('Marque: ');
                    modele = saisirChoix('Modele: ');
                    annee = saisirChoix('Année: ');
                    combinee = saisirChoix('Consommation combinée: ');
                    ville = saisirChoix('Consommation en ville: ');
                    autoroute = saisirChoix('Consommation sur l''autoroute: ');
                    creerVoiture(monInv,nbVoiture,marque,modele,annee,combinee,ville,autoroute);
                    else 
                      fprintf('L''inventaire doit être préalablement chargé\n')  
                    end


                case 5 % Supprimer un véhicule
                    if invCharger == true
                    nbVoiture = saisirChoix('Quel voiture voulez-vous supprimer? ');
                    supprimerVoiture(monInv,nbVoiture);
                    fprintf('La voiture à bien été supprimée\n')
                    else 
                      fprintf('L''inventaire doit être préalablement chargé\n')  
                    end


                case 6 % Modifier un véhicule
                    if invCharger == true
                    nbVoiture = saisirChoix('Quelle voiture voulez-vous modifier? \n');
                    %i = saisirChoix('Quel attribut voulez-vous modifier? \n');
                    %disp(monInv(i))
                    modifierVoiture(monInv,nbVoiture)
                    else 
                      fprintf('L''inventaire doit être préalablement chargé\n')  
                    end

                case 7 % Sauvegarder l''inventaire
                    if invCharger == true
                    sauvegardeMonInv(monInv)
                    sauvegarder = true;
                    fprintf('Le fichier à été enregistré');
                    else 
                      fprintf('L''inventaire doit être préalablement chargé\n')  
                    end


                case 8 % Afficher k meilleur
                    if invCharger == true
                        
                        
                    else 
                      fprintf('L''inventaire doit être préalablement chargé\n')  
                    end  
                        

                case 9 % Quitter
                     quit = true;
%                             choix_quit = saisirChoix('Voulez-vous sauvegarder avant de quitter? (O/N) ');
%                             if choix == O || choix == o
%                                 sauvegardeMonInv(monInv)
%                            else
    end 
 
    
 end
                 
end
%end
        
% else
%     fprintf('L''inventaire doit préalablement être chargé\n');
%     TP3();
% rmpath('Inventaire');
% rmpath('Voiture');
% rmpath('Consommation');
% rmpath('Constantes');
