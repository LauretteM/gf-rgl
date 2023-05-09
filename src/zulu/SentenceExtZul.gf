concrete SentenceExtZul of SentenceExt = CatZul,CatExtZul ** open ResZul, Prelude, ParamX in {

  lin
    
    ExistNP np = {
      s = let
          cp = (id_cop_pref np.agr) ; -- ng-
          cop_base = np.s!NFull -- umfundi
        in
          case np.proDrop of {
            False => cp ++ cop_base ;
            True => "*" ++ cp ++ cop_base
          }
    } ;
    GreetSg = {
      s = "sawubona"
    } ;
    GreetPl = {
      s = "sanibonani"
    } ;
}
