function [maj] = enMajuscule(chaine)
% -------------------------------------------------------------------------
% FICHIER       : enMajuscule.m
% PAR           : Daniel Velenosi, Simon Tremblay, Daniele Sciascia et
%                 Alvin Le
% DATE          : 30/07/2020
% DESCRIPTION   : Fonction qui reçoit une chaîne de caractère et retourne 
%                 cette chaîne en majuscules.
% -------------------------------------------------------------------------
% Ici, nous voulons que la chaîne à la fin soit le maj; qui est 
% la réponse finale   
maj = chaine;
    % Cela va scanner la chaîne de la première entrée à la dernière
    for i = 1:numel(chaine)
        % S'ils reconnaissent des lettres minuscules de a à z...
        if (chaine(i) >= 'a' && chaine(i) <= 'z')
            % Transformez les lettres en majuscules dans toute la chaîne
            maj(i) = 'A' + chaine(i) - 'a';
        end
    end
end
