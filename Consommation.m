classdef Consommation < handle
    properties (Access = public)
        combinee;
        ville;
        autoroute;
    end
    
    methods (Access = public)
        %Constructeur
        function consommation = Consommation(combinee,ville,autoroute)
            consommation.combinee = combinee;
            consommation.ville = ville;
            consommation.autoroute = autoroute;
        end
        
        %Accesseur
        function combinee = getCombinee(consommation)
            combinee = consommation.combinee;
        end
        
        function ville = getVille(consommation)
            ville = consommation.ville;
        end
        
        function autoroute = getAutoroute(consommation)
            autoroute = consommation.autoroute;
        end
        
        %Mutateur
        function setCombinee(consommation,combinee)
            consommation.combinee = combinee;
        end
        
        function setVille(consommation,ville)
            consommation.ville = ville;
        end
        
        function setAutoroute(consommation,autoroute)
            consommation.autoroute = autoroute;
        end        
      
        %Affichage
        function disp(consommation)
          fprintf('\t Consommation combinée             : %.2f kWh/100km \n', (consommation.combinee));
          fprintf('\t Consommation en ville             : %.2f kWh/100km \n', (consommation.ville));
          fprintf('\t Consommation sur l''autoroute      : %.2f kWh/100km \n', (consommation.autoroute));
        end
    end
end
