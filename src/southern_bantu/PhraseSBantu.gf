abstract PhraseSBantu = Cat,CatSBantu ** {

  fun

    -- direct speech
    DirectSpeech: Phr -> Temp -> V -> NP -> Phr ;
    DirectSpeechNP : NP -> Temp -> V -> NP -> Phr ;
    DirectSpeechAdv : Adv -> Temp -> V -> NP -> Phr ;
    SBantuPhrConj : Phr -> Phr -> Phr ;

    ConsecS : S -> Utt ;
    SubjunctS : S -> Utt ;
 
}
