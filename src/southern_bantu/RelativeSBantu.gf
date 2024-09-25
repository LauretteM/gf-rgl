--1 Relative clauses and pronouns

abstract RelativeSBantu = Cat ** {

  fun

    RelVPShort  : RP -> VP -> RCl ;      -- who loves John
    NomRel : NP -> RS ;

    Dem2RP : RP ;
    Dem3RP : RP ;
    PronRP : RP ;

}
