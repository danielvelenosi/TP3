%--------------------------------------------------------------------------
% FICHIER       : TP3.m
% PAR           : Daniel Velenosi, Simon Tremblay, Daniele Sciascia et
%                 Alvin Le
% DATE          : 24/07/2020
% DESCRIPTION   : TP3 qui gère la classe inventaire
%--------------------------------------------------------------------------

function TP3()
addpath('Inventaire.m');
addpath('Voiture');
addpath('Consommation');
addpath('utilitaires');
addpath('Constantes');


%Initialisation des variables
%Variable qui sert à vérifier si l'inventaire à été chargé
invCharger = false;
%Variable pour s'avoir si on quitte le programme
quit = false;

    %Tant que l'utilisateur n'a pas choisi 9 (qui active quit = true)
    while quit ~= 1
        
        %On affiche le menu
        affichageMenu();
        %On convertit le choix de l'utilisateur en nombre
        choix = str2num(saisirChoix('#'));

        switch choix

            case 1 % Charger inventaire
                monInv = Inventaire();
                %Quand l'inventaire à été chargé, on active la variable
                invCharger = true;
                fprintf('L''inventaire à été chargé\n')


            case 2 % Afficher les caractéristiques d'une voiture
                
                %Pour s'assurer que l'inventaire à été chargé (même chose
                %pour tous les cas)
                if invCharger == true
                    %Choisir la voiture à afficher
                    nbVoiture = str2num(saisirChoix('Quelle voiture voulez-vous voir ? '));
                    %Afficher la voiture
                    disp(monInv.voiture(nbVoiture))
                    
                else
                    %Si l'inventaire n'a pas été chargé, on affiche un
                    %message
                    fprintf('L''inventaire doit être préalablement chargé\n')
                end


            case 3 % Afficher les caractéristiques de toutes les voitures
                
                if invCharger == true
                    %Afficher tout l'inventaire
                    disp(monInv)
                    
                else
                    fprintf('L''inventaire doit être préalablement chargé\n')
                end



            case 4 % Ajouter un véhicule
                
                if invCharger == true
                    
                    %On met automatique la voiture à la fin de l'inventaire
                    %Il faut entrer toutes les autres informations de la
                    %voiture
                    nbVoiture = numel(monInv.voiture) + 1;
                    marque = saisirChoix('Marque: ');
                    modele = saisirChoix('Modele: ');
                    annee = saisirChoix('Année: ');
                    combinee = str2num(saisirChoix('Consommation combinée: '));
                    ville = str2num(saisirChoix('Consommation en ville: '));
                    autoroute = str2num(saisirChoix('Consommation sur l''autoroute: '));
                    
                    %On utilise la fonction d'inventaire pour créer la
                    %nouvelle voiture
                    creerVoiture(monInv,nbVoiture,marque,modele,annee,combinee,ville,autoroute);
                    
                else
                    fprintf('L''inventaire doit être préalablement chargé\n')
                end


            case 5 % Supprimer un véhicule
                
                if invCharger == true
                    
                    %Choisir la voiture à supprimer et utiliser la fonction
                    %dans inventaire pour mettre son numéro de voiture à
                    %"NULL"
                    nbVoiture = str2num(saisirChoix('Quel voiture voulez-vous supprimer? '));
                    monInv.supprimerVoiture(nbVoiture);
                    fprintf('La voiture a bien été supprimée\n')
                    
                      %On voulait s'assurer que la voiture était bien à
                      %NULL, mais nous pensons que la manière dont nous
                      %appelions la fonction dans inventaire faisait briser
                      %le code et supprimer voiture ne fonctionnait plus.
                      %Nous l'avons donc laissé en commentaire
                      
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
                    
                    %Trouver la voiture qu'on veut modifier
                    nbVoiture = str2num(saisirChoix('Quelle voiture voulez-vous modifier? '));
                    %Afficher cette voiture
                    disp(monInv.voiture(nbVoiture))
                    %Utiliser la fonction dans inventaire pour modifier les
                    %propriétés de la voiture choisie
                    monInv.modifierVoiture(nbVoiture)

                else
                    fprintf('L''inventaire doit être préalablement chargé\n')
                end

            case 7 % Sauvegarder l''inventaire
                
                if invCharger == true
                    
                    %On utilise la fonction dans inventaire pour
                    %sauvegarder l'inventaire
                    monInv.sauvegardeMonInv()
                    fprintf('Le fichier à été enregistré\n');
                    
                else
                    fprintf('L''inventaire doit être préalablement chargé\n')
                end


            case 8 % Afficher k meilleur
                
                if invCharger == true
                    
                    %On demande à l'utilisateur quelle consommation il veut
                    %voir
                    fprintf('\n1:Combinee')
                    fprintf('\n2:Ville')
                    fprintf('\n3:Autoroute\n')
                    genreConsommation = saisirChoix('#', 1, 3);
                    %On lui demande combien de voitures il veut voir
                    combienVoiture = saisirChoix('Combien de voitures voulez-vous avoir dans votre liste ? ');
                    
                    %On fait un tableau avec le nombre de voiture qu'il
                    %voulait voir avec les meilleures consommation selon
                    %celle choisie. Par contre, cette fonction ne
                    %fonctionne pas, nous ne somme pas capable de faire
                    %afficher les voitures. Nous avons créé un tableau avec
                    %les meilleures voitures. C'est peut-être dans la
                    %manière que nous appelons la fonction.
                    
                    voituresTriees = trouverMeilleuresVoiture(monInv, combienVoiture, genreConsommation);
                    afficherMeilleuresVoitures(monInv,voituresTriees);

                else
                    fprintf('L''inventaire doit être préalablement chargé\n')
                end


            case 9 % Quitter
                
                %On active la variable quit pour faire fermer le programme
                %et ne pas réafficher le menu
                quit = true;
                
                %On demande à l'utilisateur s'il veut sauvegarder son
                %inventaire
                choix_quit = saisirChoix('Voulez-vous sauvegarder avant de quitter? (O/N) ');
                
                while choix_quit ~= "O" && choix_quit ~= "o" && choix_quit ~= "N" && choix_quit ~= "n"
                    %Si le choix de l'utilisateur est différent de O,o,n,N,
                    %on lui montre un message d'erreur pour qu'il entre une
                    %de ces lettres
                    gravite = 0;
                    gestionErreurs('Vous devez choisir entre Y et N', gravite);
                    choix_quit = saisirChoix('Voulez-vous sauvegarder avant de quitter? (O/N) ');
                end
                
                if choix_quit == "O" || choix_quit == "o"
                    %Si le choix est oui, on enregistre le fichier
                    monInv.sauvegardeMonInv()
                    
                elseif choix_quit == "N" || choix_quit == "n"
                    %Si non, on ne fait rien

                end
        end
    end
rmpath('Inventaire');
rmpath('Voiture');
rmpath('Consommation');
rmpath('Constantes');
rmpath('utilitaires');    
end



