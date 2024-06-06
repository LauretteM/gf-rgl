-- All functions are explicitly inherited, in order to allow useful probabilities

concrete SBantuGrammarSsw of SBantuGrammar =
  NounSsw [DetCN, UsePron, DetQuant, NumSg, NumPl, UseN, AdjCN, RelCN, PossNP,UsePN, RelNP, PredetNP,AdvNP], -- MassNP, AdvCN,AdvNP,
  VerbSsw [UseV, ComplVS, ComplVA, SlashV2a, UseComp, AdvVP, CompAP, CompNP, CompAdv, ComplSlash, ComplVV],
  AdjectiveSsw [PositA, AdAP],
  AdverbSsw [PositAdvAdj, SubjS],
  NumeralExtSsw [NumeralAP,NumeralNP],
  SentenceSsw [PredVP, ImpVP, UseCl, UseQCl, UseRCl,AdvS],
  QuestionSsw [QuestCl, QuestIAdv, QuestIComp],
  RelativeSsw [RelVP, IdRP],
  -- ConjunctionSsw,
  PhraseSsw [PhrUtt, UttS, UttQS, UttImpSg, UttImpPl, NoPConj, NoVoc, VocNP],
  TextX - [Temp,Adv,IAdv],
  StructuralSsw [and_Conj,how_IAdv,how8much_IAdv,i_Pron,youSg_Pron,he_Pron,she_Pron,we_Pron,youPl_Pron,they_Pron,this_Quant,that_Quant,all_Predet,only_Predet,very_AdA,here_Adv,there_Adv],
  -- Idiom,
  TenseX [PPos,PNeg],
  -- Transfer ,
  TempExtSsw -- [TPresTemp, TPerfTemp, TPastTemp, TFutTemp, TPastPresTemp, TFutPresTemp, TPerfPerfTemp, TFutPerfTemp, TPerfPresTemp]
  ** open ResSsw, Prelude in {

flags startcat = Phr ; unlexer = text ; lexer = text ;

} ;
