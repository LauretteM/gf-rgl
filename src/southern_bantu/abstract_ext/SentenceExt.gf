abstract SentenceExt = Cat,CatExt ** {

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
}
