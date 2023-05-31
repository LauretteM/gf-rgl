--# -path=.:../Sswu:../abstract

resource NguniSyntaxSsw =
  GrammarSsw,
  ExtraSsw ** --- inheriting everything from Grammar, not just Cat and Structural
  NguniSyntax with
    (Grammar=GrammarSsw),
    (ExtraSswAbs=ExtraSsw),
    (Backward=BackwardSsw),
    (TempAbs=TempSsw) ;
