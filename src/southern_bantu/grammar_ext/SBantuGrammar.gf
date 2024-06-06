-- All functions are explicitly inherited, in order to allow useful probabilities

abstract SBantuGrammar =
  Noun [DetCN, UsePron, DetQuant, NumSg, NumPl, UseN, AdjCN, RelCN, PossNP,UsePN, RelNP, PredetNP,AdvNP], -- MassNP,AdvCN, AdvNP,
  Verb [UseV, ComplVS, ComplVA, SlashV2a, UseComp, AdvVP, CompAP, CompNP, CompAdv, ComplSlash, ComplVV],
  Adjective [PositA, AdAP],
  Adverb [PositAdvAdj, SubjS],
  NumeralSBantu [NumeralAP,NumeralNP],
  Sentence [PredVP, ImpVP, UseCl, UseQCl, UseRCl,AdvS],
  Question [QuestCl, QuestIAdv, QuestIComp],
  Relative [RelVP, IdRP],
  -- Conjunction,
  Phrase [PhrUtt, UttS, UttQS, UttImpSg, UttImpPl, NoPConj, NoVoc, VocNP],
  Text - [Temp,Adv,IAdv],
  Structural [and_Conj,how_IAdv,how8much_IAdv,i_Pron,youSg_Pron,he_Pron,she_Pron,we_Pron,youPl_Pron,they_Pron,this_Quant,that_Quant,all_Predet,only_Predet,very_AdA,here_Adv,there_Adv],
  -- Idiom,
  Tense [PPos, PNeg],
  -- Transfer ,
  TempSBantu -- [TPresTemp, TPerfTemp, TPastTemp, TFutTemp, TPastPresTemp, TFutPresTemp, TPerfPerfTemp, TFutPerfTemp, TPerfPresTemp]
  ;
