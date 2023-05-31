concrete AdverbExtSsw of AdverbExt = CatSsw,CatExtSsw ** open ResSsw, Prelude, ParamX in {

  lin

    InstrNPAdv np =
    let
      pref = instrPref!(initNP np.isPron np.agr)
    in {
      s = pref ++BIND++ (np.s!NReduced) ;
      -- asp = Null ;
      reqLocS = False
    } ;

    InstrAdvNPAdv adv np =
    let
      pref = instrPref!(initNP np.isPron np.agr)
    in {
      s = adv.s ++ pref ++BIND++ (np.s!NReduced) ;
      -- asp = adv.asp ;
      reqLocS = False
    } ;

    LocAdvNPAdv adv np = {
      s = adv.s ++ (np.s!NLoc) ;
      -- asp = adv.asp ;
      reqLocS = False
    } ;

    -- locative kwa
    KwaNPAdv np = {
      s = (poss_concord_agr!(Third C17 Sg)!np.i) ++BIND++ (np.s!NReduced) ;
      -- asp = Null ;
      reqLocS = False
    } ;

    -- locative ku
    KuNPAdv np = {
      s = case np.isPron of {
        True => "ki" ;
        False => case (initNP np.isPron np.agr) of {
          -- RI  => "ki" ;
          RO  => "ko" ;
          RA  => "kw" ;
          _   => "ku"
        }
      }
      ++BIND++ (np.s!NReduced) ;
      -- asp = Null ;
      reqLocS = False
    } ;

    KuAdvNPAdv adv np = {
      s = adv.s ++
        case np.proDrop of {
          True => "ki" ;
          False => case (initNP np.isPron np.agr) of {
            RI  => "ki" ;
            RO  => "ko" ;
            RA  => "kw" ;
            _   => "ku"
          }
        }
      ++BIND++ (np.s!NReduced) ;
      -- asp = Null ;
      reqLocS = False
    } ;

    NaNPAdv np = {
      s = withPref ! (initNP np.isPron np.agr) ++BIND++ (np.s!NReduced) ;
      -- asp = Null ;
      reqLocS = False
    } ;

    LocAdvAdv l = l ** { reqLocS = False } ;

    LocAdvNP adv np = {
      s = adv.s ++ (poss_concord_agr!(Third C17 Sg)!np.i) ++BIND++ (np.s!NReduced) ;
      reqLocS = False
    } ; -- ngaphezu kwamahora amabili adlule

    LocNAdv locn = locn ** { reqLocS = False } ;

    LocNNgaAdv locn = {
      s = "nga" ++BIND++ locn.s ;
      reqLocS = False
    } ;

    LocNPAdv np = {
      s = np.s!NLoc ;
      -- asp = Null ;
      reqLocS = case np.isPron of {
        False => True ;
        True => False -- ki-
      } ;
    } ;

    NPAdv np = {
      s = case np.proDrop of {
        False => np.s!NFull ;
        True => "*" ++ np.s!NFull
      } ;
      reqLocS = False
    } ;

    ConjNAdv conj s = {
      s = conj.s ++ s.s;
      -- asp = Null ;
      reqLocS = False
    } ;

    -- IAdjIAdv np iadj = {
    --   s = (np.s!Loc) ++ adjConcLookup!np.agr ++BIND++ iadj.s!(aformN np.agr) ;
    --   postIAdv = False
    -- } ;
}
