function erreur = gestionErreurs(message, gravite)
%-------------------------------------------------------------------------------
% Fonction qui reçoit une chaîne de caractères représentant le message
% d'erreur à afficher ainsi que la gravité de l'erreur. Si l'erreur est
% grave (1), on affiche le message d'erreur avec error(). Si le message
% n'est pas grave, on affiche l'erreur avec fprintf()
%-------------------------------------------------------------------------------
% PARAMÈTRES :
%       message : Chaîne de charactères représentant le message d'erreur à
%                 afficher et la gravité de l'erreur.
%-------------------------------------------------------------------------------
% RETOUR :
%       erreur : Message d'erreur.
%-------------------------------------------------------------------------------
% VARIABLES UTILISÉES :
%       n/a
%-------------------------------------------------------------------------------

% Si l'erreur est grave
if gravite == 1
    
    %On affiche le message d'erreur avec error() et on arrête le programme
    error('ERREUR GRAVE : %s\n',message);
    %Si l'erreur n'est pas grave
elseif gravite == 0
    
    % On affiche l'erreur avec fprintf() et le programme continue
    erreur = fprintf('\nPetite erreur : %s\n', message);
    
end
end