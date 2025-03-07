-- All functions are explicitly inherited, in order to allow useful probabilities

concrete SBantuGrammarXho of SBantuGrammar =
  NounXho [DetCN, UsePron, DetQuant, NumSg, NumPl, UseN, AdjCN, RelCN, PossNP,UsePN, RelNP, PredetNP,AdvNP], -- MassNP, AdvCN,AdvNP,
  VerbXho [UseV, ComplVS, ComplVA, SlashV2a, UseComp, AdvVP, CompAP, CompNP, CompAdv, ComplSlash, ComplVV],
  AdjectiveXho [PositA, AdAP],
  AdverbXho [PositAdvAdj, SubjS],
  NumeralSBantuXho [NumeralAP,NumeralNP],
  SentenceXho [PredVP, ImpVP, UseCl, UseQCl, UseRCl,AdvS],
  QuestionXho [QuestCl, QuestIAdv, QuestIComp],
  RelativeXho [RelVP, IdRP],
  -- ConjunctionXho,
  PhraseXho [PhrUtt, UttS, UttQS, UttImpSg, UttImpPl, NoPConj, NoVoc, VocNP],
  TextX - [Temp,Adv,IAdv],
  StructuralXho [and_Conj,how_IAdv,how8much_IAdv,i_Pron,youSg_Pron,he_Pron,she_Pron,we_Pron,youPl_Pron,they_Pron,this_Quant,that_Quant,all_Predet,only_Predet,very_AdA,here_Adv,there_Adv],
  -- Idiom,
  TenseX [PPos,PNeg],
  -- Transfer ,
  TempSBantuXho -- [TPresTemp, TPerfTemp, TPastTemp, TFutTemp, TPastPresTemp, TFutPresTemp, TPerfPerfTemp, TFutPerfTemp, TPerfPresTemp]
  ** open ResXho, Prelude in {

flags startcat = Phr ; unlexer = text ; lexer = text ;

} ;
