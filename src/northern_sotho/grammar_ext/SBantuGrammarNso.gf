-- All functions are explicitly inherited, in order to allow useful probabilities

concrete SBantuGrammarNso of SBantuGrammar =
  NounNso [DetCN, UsePron, DetQuant, NumSg, NumPl, UseN, AdjCN, RelCN, PossNP,UsePN, RelNP, PredetNP,AdvNP], -- MassNP, AdvCN,AdvNP,
  VerbNso [UseV, ComplVS, ComplVA, SlashV2a, UseComp, AdvVP, CompAP, CompNP, CompAdv, ComplSlash, ComplVV],
  AdjectiveNso [PositA, AdAP],
  AdverbNso [PositAdvAdj, SubjS],
  NumeralSBantuNso [NumeralAP,NumeralNP],
  SentenceNso [PredVP, ImpVP, UseCl, UseQCl, UseRCl,AdvS],
  QuestionNso [QuestCl, QuestIAdv, QuestIComp],
  RelativeNso [RelVP, IdRP],
  -- ConjunctionNso,
  PhraseNso [PhrUtt, UttS, UttQS, UttImpSg, UttImpPl, NoPConj, NoVoc, VocNP],
  TextX - [Temp,Adv,IAdv],
  StructuralNso [and_Conj,how_IAdv,how8much_IAdv,i_Pron,youSg_Pron,he_Pron,she_Pron,we_Pron,youPl_Pron,they_Pron,this_Quant,that_Quant,all_Predet,only_Predet,very_AdA,here_Adv,there_Adv],
  -- Idiom,
  TenseX [PPos,PNeg],
  -- Transfer ,
  TempSBantuNso -- [TPresTemp, TPerfTemp, TPastTemp, TFutTemp, TPastPresTemp, TFutPresTemp, TPerfPerfTemp, TFutPerfTemp, TPerfPresTemp]
  ** open ResNso, Prelude in {

flags startcat = Phr ; unlexer = text ; lexer = text ;

} ;
