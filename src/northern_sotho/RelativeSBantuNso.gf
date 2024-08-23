concrete RelativeSBantuNso of RelativeSBantu = CatNso ** open ResNso,Prelude,ParamX in {

lin
--  RelVPShort  : RP -> VP -> RCl ;      -- who loves John
--  NomRel : NP -> RS ;

NomRel np = {
            s = \\a => dem_pron!Dem1!a ++ np.s!Absolute
        } ;
}
