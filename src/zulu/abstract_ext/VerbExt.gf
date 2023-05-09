abstract VerbExt = Cat,CatExt ** {

  fun

    CopAP : AP -> VP ;
    CopNP : NP -> VP ;
    CopNPAssoc : NP -> VP ;
    CopLocative : Loc -> VP ;

    CopPoss : NP -> VP ;
    CopQuant : QuantStem -> VP ;

    -- BecomeAP : AP -> VP ;
    -- BecomeNP : NP -> VP ;
    -- BecomeNPAssoc : NP -> VP ;
    -- BecomeLoc : Loc -> VP ;

    UseVStative : V -> VP ;
    ComplV2Nonspec : V2 -> NP -> VP ;

    ApplV : V -> V ; -- el
    CausV : V -> V ; -- is
    IntensV : V -> V ; -- isis
    ComplV : V -> V ; -- elel
    NeutV : V -> V ; -- ek
    PassV : V -> V ; -- w
    RecipV : V -> V ; -- an

}
