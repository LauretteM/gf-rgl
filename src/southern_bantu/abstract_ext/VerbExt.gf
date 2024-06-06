abstract VerbExt = Cat,CatExt ** {

  fun

    CopAP : AP -> VP ;
    CopNP : NP -> VP ;
    CopNPAssoc : NP -> VP ;
    CopNPEq : NP -> VP ;
    CopNPEqSize : NP -> VP ;
    CopLocative : Loc -> VP ;

    UseVRefl : V -> VP ;

    ComplV2Light : V2 -> NP -> VP ; -- Amadoda ayawubona umuzi.
    ComplV2Refl : V2 -> NP -> VP ; -- Ngizishaya umunwe.
    AdvVPLight : VP -> Adv -> VP ; -- Phandle komile namuhla.

    CopPoss : NP -> VP ;
    CopQuant : QuantPron -> VP ;

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

    -- IAdvVP : VP -> IAdv -> VP ; -- kushisa kangakanani eGoli

}
