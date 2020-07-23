classdef Consommation < handle
     
    properties (Access = private)
        combinee;
        ville;
        autoroute;
    end
    
    methods (Access = public)
        %Constructeur
        function Consommation = Consommation(combinee,ville,autoroute)
            Consommation.combinee = combinee;
            Consommation.ville = ville;
            Consommation.autoroute = autoroute;
        end
        
        %Accesseur
        function combinee = getCombinee(Consommation)
            combinee = Consommation.combinee;
        end
        function ville = getVille(Consommation)
            ville = Consommation.ville;
        end
        function autoroute = getAutoroute(Consommation)
            autoroute = Consommation.autoroute;
        end
        

        %Mutateur
        function setCombinee(Consommation,combinee)
            Consommation.combinee = combinee;
        end
        function setVille(Consommation,ville)
            Consommation.ville = ville;
        end
        function setAutoroute(Consommation,autoroute)
            Consommation.autoroute = autoroute;
        end
        
    end
end

