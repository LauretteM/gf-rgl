abstract AdverbExt = Cat,CatExt ** {

  fun

    InstrNPAdv : NP -> Adv ; -- ngokuhlinzwa
    InstrAdvNPAdv : Adv -> NP -> Adv ; -- cishe ngehora

    LocAdvNPAdv : Adv -> NP -> Adv ;   -- cishe emahoreni amabili
    KwaNPAdv : NP -> Adv ; -- kwa-Laurette
    KuNPAdv : NP -> Adv ; -- kwixesha [elingangeyure enye egqithileyo]
    KuAdvNPAdv : Adv -> NP -> Adv ; -- ngaphezu kwamahora amabili adlule
    NaNPAdv : NP -> Adv ;

    LocAdvAdv : LocAdv -> Adv ;
    LocAdvNP : LocAdv -> NP -> LocAdv ; -- ngaphezu kwamahora amabili adlule
    LocNAdv : LocN -> LocAdv ;
    LocNNgaAdv : LocN -> LocAdv ;
    LocNPAdv : NP -> LocAdv ;   -- emahoreni

    NPAdv : NP -> Adv ; -- sonke lesi sikhathi

    ConjNAdv : ConjN -> S -> Adv ; -- lapho kunobuhlungu khona

}
