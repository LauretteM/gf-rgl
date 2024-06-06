abstract AdverbSBantu = Cat,CatSBantu ** {

  fun

    InstrAdv : NP -> Adv ; -- ngokuhlinzwa
    -- InstrAdvNPAdv : Adv -> NP -> Adv ; -- cishe ngehora

    AssocAdv : NP -> Adv ;
    ComparAdv :	NP -> Adv ; -- N/A
    LocativisedNounAdv : NP -> LocAdv ;   -- emahoreni
    PlaceNameAdv : NP -> LocAdv ; -- Pretoria
    PersonLocAdv : NP -> LocAdv ; -- go moruti
    PlaceLocAdv :	NP -> LocAdv ; -- ga moruti
    PlaceCapLocAdv : NP -> LocAdv ; -- gaMdjadji
    SurfaceLocAdv :	LocAdv -> LocAdv ; -- mo ntlong
    InsideLocAdv : LocAdv -> LocAdv ; -- ka ntlong
    FarLocAdv :	LocAdv -> LocAdv ; -- kua ntlong
    LocNAdv :	LocN -> LocAdv ; -- morago as adverb 

    JustLikeAdv : NP -> Adv ;

    LocAdvAdv : LocAdv -> Adv ;
    LocAdvNP : LocAdv -> NP -> LocAdv ; -- ngaphezu kwamahora amabili adlule
    -- LocAdvNPAdv : Adv -> NP -> Adv ;   -- cishe emahoreni amabili
    -- KuAdvNPAdv : Adv -> NP -> Adv ; -- ngaphezu kwamahora amabili adlule
    -- LocNAdv : LocN -> LocAdv ;
    LocNNgaAdv : LocN -> LocAdv ;
    LocNPNgaAdv : NP -> LocAdv ; -- ngasekhaya
    LocNPJustLikeAdv : NP -> LocAdv ; -- njengasekhaya
    

    NPAdv : NP -> Adv ; -- sonke lesi sikhathi

    -- ConjNAdv : ConjN -> S -> Adv ; -- lapho kunobuhlungu khona

    


}
