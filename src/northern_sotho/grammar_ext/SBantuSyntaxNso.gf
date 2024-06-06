--# -path=.:../northern_sotho:../abstract

resource SBantuSyntaxNso =
  SBantuGrammarNso **
  SBantuSyntax with
    (Grammar=SBantuGrammarNso),
    (Backward=BackwardNso),
    (TempExt=TempExtNso) ;
