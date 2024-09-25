concrete RelativeSBantuNso of RelativeSBantu = CatNso ** open ResNso,Prelude,ParamX in {

lin
--  RelVPShort  : RP -> VP -> RCl ;      -- who loves John

    NomRel np = {
        s = \\a => dem_pron!Dem1!a ++ np.s!Absolute
    } ;

    Dem2RP = {
      s = dem_pron!Dem2 ;
    } ;

    Dem3RP = {
      s = dem_pron!Dem3 ;
    } ;

    PronRP = {
      s = abs_pron ;
    } ;

}
