concrete PhraseExtNso of PhraseExt = CatNso,CatExtNso ** open ResNso, Prelude, ParamX in {

  lin

    ConsecS s = {
      s = s.s!ConsecMS
    } ;

    SubjunctS s = {
      s = s.s!SubjunctMS 
    } ;

    ExtPhrConj p1 p2 = {
      s = p1.s ++ p2.s
    } ;

}
