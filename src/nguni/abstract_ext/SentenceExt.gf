abstract SentenceExt = Cat,CatExt ** {

  fun
    
    ExistNP : NP -> S ;
    GreetSg : Utt ;
    GreetPl : Utt ;

    ExtConjS : S -> Conj -> S -> S ;
}
