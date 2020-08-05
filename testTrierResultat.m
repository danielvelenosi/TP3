%On test la fonction trierResultat

assert(isequal(trierResultat([1,3;2,2;3,0]),[3,0;2,2;1,3]));

assert(isequal(trierResultat([5,7;3,4;2,8;1,4;4,9]),[3,4;1,4;5,7;2,8;4,9]));