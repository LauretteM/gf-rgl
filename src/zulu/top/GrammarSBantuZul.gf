-- All functions are explicitly inherited, in order to allow useful probabilities

concrete GrammarSBantuZul of GrammarSBantu =
  NounZul [DetCN, UsePron, DetQuant, NumSg, NumPl, UseN, AdjCN, RelCN, PossNP,UsePN, RelNP, PredetNP,AdvNP], -- MassNP, AdvCN,AdvNP,
  VerbZul [UseV, ComplVS, ComplVA, SlashV2a, UseComp, AdvVP, CompAP, CompNP, CompAdv, ComplSlash, ComplVV],
  AdjectiveZul [PositA, AdAP],
  AdverbZul [PositAdvAdj, SubjS],
  NumeralSBantuZul [NumeralAP,NumeralNP],
  SentenceZul [PredVP, ImpVP, UseCl, UseQCl, UseRCl,AdvS],
  QuestionZul [QuestCl, QuestIAdv, QuestIComp],
  RelativeZul [RelVP, IdRP],
  -- ConjunctionZul,
  PhraseZul [PhrUtt, UttS, UttQS, UttImpSg, UttImpPl, NoPConj, NoVoc, VocNP],
  TextX - [Temp,Adv,IAdv],
  StructuralZul [and_Conj,how_IAdv,how8much_IAdv,i_Pron,youSg_Pron,he_Pron,she_Pron,we_Pron,youPl_Pron,they_Pron,this_Quant,that_Quant,all_Predet,only_Predet,very_AdA,here_Adv,there_Adv],
  -- Idiom,
  TenseX [PPos,PNeg],
  -- Transfer ,
  TempSBantuZul, -- [TPresTemp, TPerfTemp, TPastTemp, TFutTemp, TPastPresTemp, TFutPresTemp, TPerfPerfTemp, TFutPerfTemp, TPerfPresTemp]
  BackwardZul[ComplV2,ComplV3,ComplV2V],
  AdverbSBantuZul,
  NounSBantuZul,
  PhraseSBantuZul,
  RelativeSBantuZul,
  SentenceSBantuZul,
  StructuralSBantuZul,
  VerbSBantuZul
  ** open ResZul, Prelude in {

flags startcat = Phr ; unlexer = text ; lexer = text ;

} ;
