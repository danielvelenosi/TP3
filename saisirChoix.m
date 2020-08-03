function reponse = saisirChoix(question, min, max)
%-------------------------------------------------------------------------------
% Fonction qui reçoit une question à poser à l'utilisateur et retourne la
% réponse. La fonction peut aussi recevoir deux entiers représentant le
% minimum et le maximum. Dans ce cas, la fonction ne fait pas seulement que
% poser la question, elle s'assure que la réponse de l'utilisateur est
% entre les valeurs reçues avant de retourner la réponse.
%-------------------------------------------------------------------------------
% PARAMÈTRES :
%   question    : Question à poser à l'utilisateur.
%   max         : Valeur maximum
%   min         : Valeur minimum
%-------------------------------------------------------------------------------
% RETOUR :
%   reponse     : Réponse à la question.
%-------------------------------------------------------------------------------
% VARIABLES UTILISÉES :
%
%-------------------------------------------------------------------------------

% S'il y a un argument
if nargin == 1
    
    % On pose la question et on retourne la réponse numérique.
    reponse = str2num(input(question,'s'));
    
    % S'il y a 3 arguments
elseif nargin == 3
    
    % Initialisation de la validité
    valide = false;
    
    % Tant que l'utilisateur n'est pas dans les bornes min et max on repose
    % la question.
    while valide == 0
        reponse = str2num(input(question,'s'));
        
        % Si la réponse est dans le borne, on sort de la boucle et on
        % retourne la réponse.
        if reponse >= min || reponse <= max
            valide = true;
        else
            valide = false;
        end
    end
end
end
