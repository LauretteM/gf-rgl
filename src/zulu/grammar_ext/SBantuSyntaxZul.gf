--# -path=.:../zulu:../abstract

resource SBantuSyntaxZul =
  SBantuGrammarZul **
  SBantuSyntax with
    (Grammar=SBantuGrammarZul),
    (Backward=BackwardZul),
    (TempSBantu=SBantuExtZul) ;
