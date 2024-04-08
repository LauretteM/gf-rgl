concrete PhraseExtSsw of PhraseExt = CatSsw,CatExtSsw ** open ResSsw, Prelude, ParamX in {

  lin
    ConsecS sent = { s = sent.s!SConsec } ;
    SubjunctS sent = { s = sent.s!SSub } ;

    DirectSpeech phr t v np = {
      s = let
        vform = case t.t of {
          PastTense => v.s!R_e ;
          PresTense => v.s!R_a ;
          _ => nonExist -- v.s!R_a ++ "*"
        } ;
      in
        phr.s ++ SC_17 ++ BIND ++ vform ++ np.s!NFull ++ t.s
    } ;

    DirectSpeechNP np1 t v np2 = {
      s = let
        vform = case t.t of {
          PastTense => v.s!R_e ;
          PresTense => v.s!R_a ;
          _ => nonExist -- v.s!R_a ++ "*"
        } ;
      in
        np1.s!NFull ++ SC_17 ++ BIND ++ vform ++ np2.s!NFull ++ t.s
    } ;

    DirectSpeechAdv adv t v np = {
      s = let
        vform = case t.t of {
          PastTense => v.s!R_e ;
          PresTense => v.s!R_a ;
          _ => nonExist -- v.s!R_a ++ "*"
        } ;
      in
        adv.s ++ SC_17 ++ BIND ++ vform ++ np.s!NFull ++ t.s
    } ;

    ExtPhrConj p1 p2 = {
      s = p1.s ++ p2.s
    } ;

}
