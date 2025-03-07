--# -path=.:../swazi:../abstract

resource SyntaxSBantuSsw =
  GrammarSBantuSsw ** 
  SyntaxSBantu with
    (Grammar=GrammarSBantuSsw),
    (Backward=BackwardSsw),
    (TempSBantu=TempSBantuSsw) ;
