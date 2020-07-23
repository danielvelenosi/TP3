% -------------------------------------------------------------------------
% FICHIER       : Voiture.m
% PAR           : Daniel Velenosi, Simon Tremblay, Daniele Sciascia
% DATE          : 22/07/2020
% DESCRIPTION   : classe Voiture qui peut ajouter des objets voiture 
%                 avec les paramètres suivants:
% -------------------------------------------------------------------------
classdef Voiture < handle
    properties (Access = private)
        marque;
        modele;
        annee;
%         consommation = Consommation();
%         cons_comb;
%         cons_ville;
%         cons_autoroute;
	end
	
	methods (Access = public)
        % Construnteur
	    function voiture = Voiture(marque,modele,annee)
        %function voiture = Voiture(marque,modele,annee,cons_comb,cons_ville,cons_autoroute)
		    nouveau.marque = marque;
		    nouveau.modele = modele;
		    nouveau.annee = annee;
%             nouveau.cons_comb = cons_comb;
%             nouveau.cons_ville = cons_ville;
%             nouveau.cons_autoroute = cons_autoroute;
		end
		
% 	    function setVitesse(lui, vitesse)
% 		    lui.vitesse = vitesse;
%         end
		
% 	    function actualiserPosition(voiture)
% 		    voiture.direction = voiture.direction+randn/4;
% 		    voiture.position(1) = voiture.position(1)+voiture.vitesse*0.01*cos(voiture.direction);
% 		    voiture.position(2) = voiture.position(2)+voiture.vitesse*0.01*sin(voiture.direction);
% 		end
		
% 	    function disp(voiture)
% 		    figure(1);
% 			hold on;
% 			scatter(voiture.position(1),voiture.position(2),'b');
%         end
    end
end