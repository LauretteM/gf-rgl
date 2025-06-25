abstract NounSBantu = Cat,CatSBantu ** {

  fun

    ProDrop : Pron -> Pron ;

    -- Quant is used for demonstratives, and QuantPron for all/only

    PronPostdetNP : Pron -> Postdet -> NP ;

    QuantPostdet : QuantPron -> Postdet ;

    DemPostdet : Quant -> Postdet ;

    QuantDemPostdet : QuantPron -> Quant -> Postdet ;

    DemQuantPostdet : Quant -> QuantPron -> Postdet ;

    DetNum : Num -> Det ;

    RelN : RS -> N -> CN ;

    ApposCN : CN -> N -> CN ; -- (takes agr of CN)

    ApposN : CN -> N -> CN ; -- (takes agr of N)

    PredetN : Predet -> N -> CN ;

    PostdetCN : Postdet -> CN -> CN ; -- ntlo ye yohle

    QuantPredet : QuantPron -> Predet ;

    DemPredet : Quant -> Predet ;

    QuantDemPredet : QuantPron -> Quant -> Predet ;

    EmphCN : CN -> CN ; -- prepends emphatic pronoun

    ContrastCN : CN -> CN ; -- inserts contrastive pronoun

    UsePNPl : PN -> NP ;

    Deverb15 : Pol -> VP -> NP ;
    -- DeverbV215 : Pol -> V2 -> NP -> NP ;

    LocNNP : LocN -> NP ;
    LocNNgaNP : LocN -> NP ;
    PossLocN : LocN -> NP -> LocN ; -- phezu kwamahora...

    -- LocNLoc : LocN -> Loc ;

    -- LocNPossNP : LocN -> NP -> LocN ;

    PossNPLoc : CN -> NP -> CN ; -- zasepulazini

    SBantuConjNP : NP -> ConjN -> NP -> NP ;

    -- Added November 2024

    AdjPron : AP -> Pron -> Pron ;

    NomRel : CN -> CN -> CN ;


}
