% -------------------------------------------------------------------------
% FICHIER       : Voiture.m
% PAR           : Daniel Velenosi, Simon Tremblay, Daniele Sciascia
% DATE          : 22/07/2020
% DESCRIPTION   : classe Voiture qui peut ajouter des objets voiture 
%                 avec les paramètres suivants:
% -------------------------------------------------------------------------
classdef Voiture < handle
    properties (Access = public)
        nbVoiture;
        marque;
        modele;
        annee;
        consommation Consommation;
	end
	
	methods (Access = public)
        % Constructeur
	    function voiture = Voiture(nbVoiture,marque,modele,annee,consommation)
		    voiture.nbVoiture = nbVoiture;
            voiture.marque = marque;
		    voiture.modele = modele;
		    voiture.annee = annee;
            voiture.consommation = consommation;


%             nouveau.consommation.ville = consommation.ville;
%             nouveau.consommation.autoroute = consommation.autoroute;
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
        
%         function combinee = getCombinee(voiture)
%             combinee = voiture.consommation.combinee;
%         end
                
       %Mutateur
        function setNbVoiture(voiture,nbVoiture)
            voiture.nbVoiture  = nbVoiture;
        end
       
       function setMarque(voiture,marque)
            voiture.marque  = marque;
        end
        
        function setModele(voiture,modele)
            voiture.modele  = modele;
        end
        
        function setAnnee(voiture,annee)
            voiture.annee  = annee;
        end
        
        function setConsommation(voiture,combinee)
            voiture.consommation = combinee;
        end
        

        % Affichage
        function disp(voiture)
          fprintf('\t Marque                            : %s \n', (voiture.marque));
          fprintf('\t Modele                            : %s \n', (voiture.modele));
          fprintf('\t Annee                             : %s \n', (voiture.annee));
          fprintf('\t Consommation combinée             : %.2f kWh/100km \n', (voiture.consommation.combinee));
          fprintf('\t Consommation en ville             : %.2f kWh/100km \n', (voiture.consommation.ville));
          fprintf('\t Consommation sur l''autoroute      : %.2f kWh/100km \n', (voiture.consommation.autoroute));
        end		
    end
end