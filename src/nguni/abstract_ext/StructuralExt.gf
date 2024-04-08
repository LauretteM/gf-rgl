abstract StructuralExt = Cat, CatExt ** {

  fun

    only_QuantStem : QuantStem ;
    all_QuantStem : QuantStem ;

    it3_Pron : Pron ;
    they4_Pron : Pron ;
    it5_Pron : Pron ;
    they6_Pron : Pron ;
    it7_Pron : Pron ;
    they8_Pron : Pron ;
    it9_Pron : Pron ;
    they10_Pron : Pron ;
    it11_Pron : Pron ;
    it14_Pron : Pron ;
    it15_Pron : Pron ;
    it17_Pron : Pron ;

    yonder_Quant : Quant ;

    inside_LocN : LocN ;
    below_LocN : LocN ;
    on_the_other_side_LocN : LocN ;
    outside_LocN : LocN ;
    in_front_LocN : LocN ;
    ahead_LocN : LocN ;
    forever_LocN : LocN ;
    above_LocN : LocN ;
    on_top_LocN : LocN ;

    lapha_Loc : Loc ;
    khona_Loc : Loc ;

    at_which_IAdv : NP -> IAdv ;
    what_IAdv : IAdv ;
    how_many_IAdj : IAdj ;

    ngemuva_LocAdv : LocAdv ;
    emuva_LocAdv : LocAdv ;
    ecaleni_LocAdv : LocAdv ;
    ngaphezu_LocAdv : LocAdv ;
    ngaphezulu_LocAdv : LocAdv ;
    ngaphandle_LocAdv : LocAdv ;
    ngaphansi_LocAdv : LocAdv ;

    much_Adv : Adv ;

    with_Conj : Conj ;
    together_with_Conj : Conj ;
    and_then_Conj: Conj ;
    but_also_Conj : Conj ;
    in_comparison_with_Conj : Conj ;
    while_Conj : Conj ;
    however_Conj : Conj ;

    where_ConjAdv : ConjAdv ;

    how_IComp : IComp ; -- -njani
    where_IComp : IComp ; -- -phi
    how_much_IComp : IComp ; -- -ngakanani

    one_Enum : A ;

}
