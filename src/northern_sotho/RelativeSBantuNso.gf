concrete RelativeSBantuNso of RelativeSBantu = CatNso ** open ResNso,Prelude,ParamX in {

lin
--  RelVPShort  : RP -> VP -> RCl ;      -- who loves John
    RelVPShort rp vp = nonExist_RCl ;
   
    Dem2RP = {
      s = dem_pron!Dem2 ;
    } ;

    Dem3RP = {
      s = dem_pron!Dem3 ;
    } ;

    PronRP = {
      s = abs_pron ;
    } ;

    SBantuConjRS rs1 conj rs2 = nonExist_RS ;

}
