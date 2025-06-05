abstract StructuralSBantu = Cat, CatSBantu ** {

  fun

    -- adjective stems
    bad_A : A ; -- bi
    big_A : A ; -- khulu
    many_A : A ; -- many
    old_A : A ; -- dala
    pretty_A : A ; -- hle
    tall_A : A ; -- de
    ugly_A : A ; -- bana
    small_A : A ;
    how_much_A : A ;
    other_A : A ;
    two_A : A ; -- bili
    three_A : A ; -- thathu
    four_A : A ; -- ne
    five_A : A ; -- hlanu
      
    -- relative stems
    black_R : A ; -- mnyama
    few_R : A ; -- mbalwa
    heavy_R : A ; -- nzima
    honest_R : A ; -- qotho
    tasty_R : A ; -- mnandi
    nice_R : A ; -- mnandi
    white_R : A ; -- mhlophe
    green_R : A ;
    dangerous_A : A ;

    -- adverbs
    today_Adv : Adv ;
    yesterday_Adv : Adv ;
    well_Adv : Adv ;
    now_Adv : Adv ;
    yesterday_Adv : Adv ;
    well_Adv : Adv ;
    now_Adv : Adv ;
 
    only_QuantPron : QuantPron ;
    all_QuantPron : QuantPron ;

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
    it16_Pron : Pron ;
    it17_Pron : Pron ;
    it18_Pron : Pron ;

    yonder_Quant : Quant ;
    
    below_LocN : LocN ;
    above_LocN : LocN ;
    behind_LocN : LocN ;
    on_the_other_side_LocN : LocN ;
    outside_LocN : LocN ;
    in_front_LocN : LocN ;
    ahead_LocN : LocN ;
    forever_LocN : LocN ;
    inside_LocN : LocN ;
    on_top_LocN : LocN ;

    central_LocN : LocN ; -- gare
    
    is_present_Loc : Loc ;
    here_Loc : Loc ;
    there_Loc : Loc ;

    at_which_IAdv : NP -> IAdv ;
    what_IAdv : IAdv ;
    how_many_IAdj : IAdj ;

    at_the_back_LocAdv : LocAdv ;
    behind_LocAdv : LocAdv ;
    on_the_side_LocAdv : LocAdv ;
    above_LocAdv : LocAdv ;
    above_2_LocAdv : LocAdv ;
    on_the_outside_LocAdv : LocAdv ;
    below_LocAdv : LocAdv ;

    much_Adv : Adv ;

    with_ConjN : ConjN ; -- na in Zul; le in Nso
    together_with_ConjN : Conj ; -- kanye na in Zul
    but_also_ConjN : ConjN ;
    with_Conj : Conj ;
    and_then_Conj: Conj ;
    but_also_Conj : Conj ;
    in_comparison_with_Conj : Conj ;
    while_Conj : Conj ;
    however_Conj : Conj ;
    if_Conj : Conj ; -- ge
    so_that_Conj : Conj ; -- gore
    but_Conj : Conj ; --fela

    where_ConjAdv : ConjAdv ;

    how_IComp : IComp ; -- -njani
    where_IComp : IComp ; -- -phi
    how_much_IComp : IComp ; -- -ngakanani

    -- enumerative stems
    different_Enum : A ; -- zul: mbe; nso: -šele
    some_A : A ; -- zul: nye 
    which_Enum : A ; -- nso: -fe
    one_Enum : A ; -- nso: -tee
    cruel_Enum : A ; -- nso: -šoro

}
