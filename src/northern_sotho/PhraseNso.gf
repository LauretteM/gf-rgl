concrete PhraseNso of Phrase = CatNso ** open Prelude, ParamX, ResNso in {

  lin
    PhrUtt pconj utt voc = {s = pconj.s ++ utt.s ++ opt_comma ++ voc.s} ;
  --
    UttS s = {
      s = s.s!IndicMS
    } ;
    UttImpSg pol imp = {
      s = imp.s!Sg!pol.p 
    } ;
    UttImpPl pol imp = {
      s = imp.s!Pl!pol.p
    } ;

    NoPConj = {s = []} ;
  --   PConjConj conj = {s = conj.s2} ; ---

    NoVoc = {s = []} ;
    VocNP np = {s = np.s ! Absolute } ;

    oper
      opt_comma : Str = variants { [] ; SOFT_BIND++"," } ;

}
