% -------------------------------------------------------------------------
% FICHIER       : Voiture.m
% PAR           : Daniel Velenosi, Simon Tremblay, Daniele Sciascia
% DATE          : 22/07/2020
% DESCRIPTION   : classe Voiture qui peut ajouter des objets voiture 
%                 avec les paramètres suivants:
% -------------------------------------------------------------------------
classdef Voiture < handle
    properties (Access = private)
        nbVoiture;
        marque;
        modele;
        annee;
        consommation Consommation;
%         cons_comb;
%         cons_ville;
%         cons_autoroute;
	end
	
	methods (Access = public)
        % Construnteur
	    function voiture = Voiture(marque,modele,annee,consommation)
        %function voiture = Voiture(marque,modele,annee,cons_comb,cons_ville,cons_autoroute)
		    nouveau.marque = marque;
		    nouveau.modele = modele;
		    nouveau.annee = annee;
            nouveau.consommation.combinee = consommation.combinee;
            nouveau.consommation.ville = consommation.ville;
            nouveau.consommation.autoroute = consommation.autoroute;
%             nouveau.cons_comb = cons_comb;
%             nouveau.cons_ville = cons_ville;
%             nouveau.cons_autoroute = cons_autoroute;
        end
		
        % Accesseur
        function nbVoiture = getNbVoiture(voiture)
            nbVoiture = voiture.nbVoiture;
        end
        
        function marque = getMarque(voiture)
            marque = voiture.marque;
        end
        
        function modele = getModele(voiture)
            modele = voiture.modele;
        end
        
        function annee = getAnnee(voiture)
            annee = voiture.annee;
        end
        
        % Mutateurs
        function setNbVoiture(voiture)
            voiture.nbVoiture  = nbVoiture;
        end
        
        function setMarque(voiture)
            voiture.marque  = marque;
        end
        
        function setModele(voiture)
            voiture.modele  = modele;
        end
        
        function setAnnee(voiture)
            voiture.annee  = annee;
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