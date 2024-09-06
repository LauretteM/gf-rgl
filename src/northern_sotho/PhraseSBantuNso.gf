concrete PhraseSBantuNso of PhraseSBantu = CatNso,CatSBantuNso ** open ResNso, Prelude, ParamX in {

  lin

    SBantuPhrConj p1 p2 = {
      s = p1.s ++ p2.s
    } ;


    ConsecS s = {
      s = s.s!ConsecMS
    } ;

    SubjunctS s = {
      s = s.s!SubjunctMS 
    } ;

}
