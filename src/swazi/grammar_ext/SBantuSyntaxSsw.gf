--# -path=.:../swazi:../abstract

resource SBantuSyntaxSsw =
  SBantuGrammarSsw ** 
  SBantuSyntax with
    (Grammar=SBantuGrammarSsw),
    (Backward=BackwardSsw),
    (TempExt=TempExtSsw) ;
