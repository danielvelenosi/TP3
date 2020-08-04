%--------------------------------------------------------------------------
% FICHIER       : Intra_1_Simon_Tremblay.m
% PAR           : Simon Tremblay
% DATE          : 18/06/2020
% DESCRIPTION   : Été 2020- Intra #1
%--------------------------------------------------------------------------
%Affichage du titre
fprintf('*******SUPER EXAMEN*******\n*Fait par: Simon Tremblay*\n**************************\n');
fprintf('1) Calculer les taxes\n');
fprintf('2) Nombre de billets reçu et le reste\n');
fprintf('3) Nombre magique\n');
fprintf('4) Produit scalaire de deux vecteurs\n');
fprintf('5) Séparer le tableau\n');
fprintf('6) Quitter\n');

%On demande à l'utilisateur de choisir un programme
choix = input('Sur quel programme voulez-vous travailler? ');

    switch choix
        %Dans le cas 1, on utilise la fonction calculerTaxe
        case 1
            %L'utilisateur choisi le montant pour lequel il veut calculer
            %les taxes
            montant = input('Entrez le montant à calculer: ');
            %On assigne une valeur aux variables via le programme
            %calculerTaxe
            [total,tps,tvq] = calculerTaxe(montant);
            %On affiche le montant de la tps, tvq et le total final
            fprintf('tps: %g$\n',tps);
            fprintf('tvq: %g$\n',tvq);
            fprintf('Le cout total est de %g$\n',total);
            %Réaffichage du menu
            Intra_1_Simon_Tremblay()
            
        %Dans le cas 2, on utilise la fonction caissier    
        case 2
            %L'utilisateur choisi le montant pour lequel il veut savoir
            %combien de billets et de dollars il lui reviendra
            montant = input('Entrez le montant à calculer: ');
            %On assigne une valeur aux variables via le programme caissier
            [billets,reste] = caissier(montant);
            %On affiche le nombre de billet et de dollars
            fprintf('Vous aurez %d billets\n', billets);
            fprintf('Vous aurez un reste de %d dollars\n', reste); 
            %On réaffiche le menu
            Intra_1_Simon_Tremblay()
            
        %Dans le cas 3, on utilise le programme nombreMagique    
        case 3 
            %L'utilisateur choisi le nombre qu'il veut tester
            nombre = input('Quel nombre voulez-vous tester? ');
            %On assigne une valeur au résultat
            resultat = nombreMagique(nombre);
            %Si le programme sort un resultat = true, cela veut dire que le
            %nombre est magique et on affiche OUI
            if resultat == true
                fprintf('OUI\n')
            %Si le programme sort un resultat = false, cela veut dire que le
            %nombre n'est pas magique et on affiche NON
            elseif resultat == false
                fprintf('NON\n')
            end 
            %On réaffiche le menu
            Intra_1_Simon_Tremblay()
            
        %Dans le cas 4, on utilise le programme produitScalaire    
        case 4
            %On calcul automatiquement l'exemple donné dans l'énoncé
            scalaire = produitScalaire([1,2,3], [4,5,6]);
            %On affiche la valeur du premier produit scalaire
            fprintf('Le 1er produit scalaire est de %d\n', scalaire);
            %On efface la valeur de scalaire pour pouvoir réutiliser cette
            %variable dans la prochaine boucle
            clear scalaire
            %On recalcul automatiquement un produit scalaire, cette fois-ci
            %avec la valeur de notre choix
            scalaire = produitScalaire ([3,7,4], [1,9,2]);
            %On affiche la valeur du produit scalaire
            fprintf('Le 2e produit scalaire est de %d\n', scalaire);
            %On réaffiche le menu
            Intra_1_Simon_Tremblay()
         
        %Dans le cas 5, on utilise le programme separerTableau    
        case 5
            %On sépare automatiquement le tableau avec l'exemple fournie
            %dans l'énoncé. On assigne une valeur aux variables
            [tabPositif, tabNegatif, nbZero] = separerTableau([1 -5 -2 9 0 0 0 -1]);
            %La seule façon que j'ai trouvée pour afficher les vecteurs
            %avec des [] est de cette manière, en mettant des %g pour le
            %nombre de chiffre positif et negatif à l'avance. Sinon, Matlab
            %me l'afficher en tableau mais sans les [].
            fprintf('[%g %g]\t',tabPositif);
            fprintf('[%g %g %g]\t ',tabNegatif);
            fprintf('Il y a %d zéros dans le tableau\n',nbZero);
            %On efface les variables pour pouvoir les réutiliser dans la
            %prochaine boucle
            clear tabPositif tabNegatif nbZero
            %On assigne des valeurs aux variables grâce au programme
            %separerTableau
            [tabPositif, tabNegatif, nbZero] = separerTableau([7 -9 3 -7 4 0 0]);
            %Affichage des tableaux et du nombre de 0
            fprintf('[%g %g %g]\t',tabPositif);
            fprintf('[%g %g]\t ',tabNegatif);
            fprintf('Il y a %d zéros dans le tableau\n',nbZero);  
            %On réaffiche le menu
            Intra_1_Simon_Tremblay()
        
        %Dans le cas 6, on quitte le programme    
        case 6
            %Si l'utilisateur choisi 6, on quitte le programme et ne
            %réaffiche pas le menu
            fprintf('Fin du programme\n')
           
        otherwise
            %Si l'utilisateur n'entre pas un chiffre entre 1 et 6, on lui
            %envoie un message d'erreur puis lui réaffiche la tableau
            fprintf('Choix invalide, veuillez entrer un numero de programme valide\n')
            Intra_1_Simon_Tremblay()
    end
    
    
    
%Libération des variables    
clear total tps tvq choix montant nombre resultat billets reste
clear scalaire tabPositif tabNegatif nbZero


   
    