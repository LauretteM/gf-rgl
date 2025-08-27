abstract StructuralSBantu = Cat, CatSBantu ** {

  fun

    -- adjective stems
    bad_A : A ; -- bi
    big_A : A ; -- khulu
    many_A : A ; -- many
    old_A : A ; -- dala
    beautiful_A : A ; -- hle
    long_A : A ; -- de
    ugly_A : A ; -- bana
    small_A : A ; -- ncane
    how_much_A : A ; --ngaki?
    other_A : A ; 
    new_A : A ; -- sha
    short_A : A ; --fishane
    may_A : A ; -- ningi
    two_A : A ; -- bili
    three_A : A ; -- thathu
    four_A : A ; -- ne
    five_A : A ; -- hlanu
    very_small_A : A ;
        
    -- relative stems
    black_R : A ; -- mnyama
    few_R : A ; -- mbalwa
    heavy_R : A ; -- nzima
    honest_R : A ; -- qotho
    tasty_R : A ; -- mnandi
    nice_R : A ; -- mnandi
    white_R : A ; -- mhlophe
    green_R : A ; -- luhlaza
    dangerous_A : A ;
    red_R : A ; -- bomvu
    yellow_R : A ; -- phuzi
    thin_R : A ;
    how_R : A ; --njani?
    hard_R : A ;
    thick_R : A ; 
    brown_R : A ; -- nsundu
    grey_R : A ;
    soft_R : A ; -- ntofontofo
    raw_R : A ;
    crooked_R : A ;
    so_big_R : A ;
    spotted_R : A ;
    blue_R : A ;
    better_R : A ;
    very_thin_R : A ;

   -- enumerative stems
    different_Enum : A ; -- zul: mbe; nso: -šele
    some_A : A ; -- zul: nye 
    which_Enum : A ; -- nso: -fe
    one_Enum : A ; -- nso: -tee
    cruel_Enum : A ; -- nso: -šoro

    -- adverbs
    when_Adv : Adv ;
    how_Adv : Adv ;

    today_Adv : Adv ;
    yesterday_Adv : Adv ;
    -- well_Adv : Adv ;
    now_Adv : Adv ;
    night_Adv : Adv ;
    tomorrow_Adv : Adv ;
    tomorrow_2_Adv : Adv ;
    winter_Adv : Adv ;
    evening_Adv : Adv ;
    really_Adv : Adv ;
    -- often_Adv : Adv ;
    -- especially_Adv : Adv ;
    -- thrice_Adv : Adv ;
    -- somewhat_Adv : Adv ;
    -- badly_Adv : Adv ;
    painful_Adv : Adv ;
    ten_times_Adv : Adv ;
    once_Adv : Adv ;
    so_Adv : Adv ;
    how_Adv : Adv ;
    day_before_yesterday_Adv : Adv ;
    just_Adv : Adv ;
    simultaneously_Adv : Adv ;
    always_Adv : Adv ;
    long_ago_Adv : Adv ;
    twice_Adv : Adv ;
    far_Adv : Adv ;
    nearby_Adv : Adv ;
    across_Adv : Adv ;
    like_this_Adv : Adv ;
    only_Adv : Adv ;
    in_the_afternoon_Adv : Adv ;
    quickly_Adv : Adv ;
    again_Adv : Adv ;
    better_Adv : Adv ;
    perhaps_Adv : Adv ;
    peaceful_Adv : Adv ;
    
    -- locative adverbs
    where_LocAdv : LocAdv ;
    far_LocAdv : LocAdv ;
    nearby_LocAdv : LocAdv ;
    across_LocAdv : LocAdv ;
    at_the_back_LocAdv : LocAdv ;
    behind_LocAdv : LocAdv ;
    on_the_side_LocAdv : LocAdv ;
    above_LocAdv : LocAdv ;
    above_2_LocAdv : LocAdv ;
    on_the_outside_LocAdv : LocAdv ;
    below_LocAdv : LocAdv ;
    down_LocAdv : LocAdv ;
    inside_LocAdv : LocAdv ;
    outside_LocAdv : LocAdv ;
    yonder_LocAdv : LocAdv ;

     -- locative class nouns
    below_LocN : LocN ;
    place_LocN : LocN ;
    little_place_LocN : LocN ;
    above_LocN : LocN ;
    behind_LocN : LocN ;
    on_the_other_side_LocN : LocN ;
    across_LocN : LocN ;
    outside_LocN : LocN ;
    this_side_LocN : LocN ;
    in_front_LocN : LocN ;
    ahead_LocN : LocN ;
    forever_LocN : LocN ;
    inside_LocN : LocN ;
    on_top_LocN : LocN ;
    central_LocN : LocN ; -- gare
    place_LocN : LocN ;
    elsewhere_LocN : LocN ;
    next_to_LocN : LocN ;
    under_LocN : LocN ;
    far_LocN : LocN ;
    near_LocN : LocN ;
    long_ago_LocN : LocN ;
    home_LocN : LocN ;
    ages_ago_LocN : LocN ;
    the_whole_LocN : LocN ;
    after_a_while_LocN : LocN ;

    -- quantitative pronouns 
    only_QuantPron : QuantPron ;
    all_QuantPron : QuantPron ;

    -- absolute pronouns
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
    
    is_present_Loc : Loc ;
    here_Loc : Loc ;
    there_Loc : Loc ;

    at_which_IAdv : NP -> IAdv ;
    what_IAdv : IAdv ;
    how_many_IAdj : IAdj ;

    -- conjunctions
    with_ConjN : ConjN ; -- na in Zul; le in Nso
    or_ConjN : ConjN ;
    together_with_ConjN : ConjN ; -- kanye na in Zul
    but_also_ConjN : ConjN ;
    with_Conj : Conj ;
    and_then_Conj: Conj ;
    but_also_Conj : Conj ;
    in_comparison_with_Conj : Conj ;
    while_Conj : Conj ;
    however_Conj : Conj ;
    if_Conj : Conj ; -- ge
    even_though_Conj : Conj ; -- le ge
    so_that_Conj : Conj ; -- gore
    but_Conj : Conj ; --fela
    then_Conj : Conj ; --ebile
    because_Conj : Conj ; -- ka gobane
    because_2_Conj : Conj ; -- gobane
    whereas_Conj : Conj ;
    and_2_Conj : Conj ; --le

    where_ConjAdv : ConjAdv ;

    how_IComp : IComp ; -- -njani
    where_IComp : IComp ; -- -phi
    how_much_IComp : IComp ; -- -ngakanani

 

}
