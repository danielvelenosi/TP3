function tableauTrie = trierResultat(tableau2D)
%-------------------------------------------------------------------------------
% Fonction qui reçoit un tableau 2D de plusieurs lignes et de deux colonnes
% et le trie.
%-------------------------------------------------------------------------------
% PARAMÈTRES :
%    tableau2D      : Tableau regroupant les informations de consommation
%                     des voitures ainsi que leur numéro d'identifiant.
%
% RETOUR :
%    tableauTrie    : Tableau des voitures trié selon leur consommation.
%-------------------------------------------------------------------------------
% VARIABLES UTILISÉES :
%   temp            : Matrice temporaire pour garder des valeurs en
%                     mémoire.
%   i,j             : Compteurs dans les boucles.
%-------------------------------------------------------------------------------

% Initialisation des constantes
COLONNE1 = 1;
COLONNE2 = 2;

% Initialisation du trableau trié
tableauTrie = tableau2D;

% Calculer le nombre de lignes totales du tableau
nbLignes = size(tableau2D, 1);

    % Boucle pour trier les informations (colonne 2)
    for i = nbLignes : -1 : 1
        for j = 1 : nbLignes - 1
            if tableauTrie(j + 1, COLONNE2) < tableauTrie(j, COLONNE2)

                % On garde les valeurs que l'on veut échanger dans une variable
                % temporaire
                temp = [tableauTrie(j + 1, COLONNE1), tableauTrie(j + 1, COLONNE2)];

                % On remplace la plus petite valeur par la plus grande pour la
                % consommation.
                tableauTrie(j + 1, COLONNE2) = tableauTrie(j, COLONNE2);

                % On remplace l'identifiant de la voiture.
                tableauTrie(j + 1, COLONNE1) = tableauTrie(j, COLONNE1);
                tableauTrie(j, COLONNE1) = temp(1,COLONNE1);

                % On remplace la nouvelle valeur et le nouveau identifiant à
                % partir de la matrice temporaire.
                tableauTrie(j, COLONNE2) = temp(1, COLONNE2);
            end
        end
    end
end
            
