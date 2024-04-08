concrete AdjectiveSsw of Adjective = CatSsw ** open ResSsw, Prelude in {

  lin

    PositA adj = adj ;

    AdAP ada ap = {
      s = \\a => ap.s!a ++ ada.s ;
      b = ap.b ;
      empty = ap.empty ;
      t = ap.t
    } ;

}
