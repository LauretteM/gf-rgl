abstract SentenceSBantu = Cat,CatSBantu ** {

  fun
    
    ExistNP : NP -> S ;
    ExistAppos : NP -> NP -> S ;
    GreetSg : Utt ;
    GreetPl : Utt ;

    UseClProg : Temp -> Pol -> Cl -> S ;
    UseClExcl : Temp -> Pol -> Cl -> S ;

    UseRClProg : Temp -> Pol -> RCl -> RS ;
    UseRClExcl : Temp -> Pol -> RCl -> RS ;
    SConjS : S -> Conj -> S -> S ;
    ConjSS : Conj -> S -> S -> S ;
    ImpConjS : Imp -> Conj -> S -> Imp ; -- help the aunt before she cries 
    
}
