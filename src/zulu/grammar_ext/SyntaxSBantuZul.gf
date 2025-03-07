--# -path=.:../zulu:../abstract

resource SyntaxSBantuZul =
  GrammarSBantuZul **
  SyntaxSBantu with
    (Grammar=GrammarSBantuZul),
    (Backward=BackwardZul),
    (TempSBantu=TempSBantuZul) ;
