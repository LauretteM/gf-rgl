concrete AdverbSBantuZul of AdverbSBantu = CatZul,CatSBantuZul ** open ResZul, Prelude, ParamX in {

  lin

    InstrAdv np =
    let
      pref = instrPref!(initNP np.isPron np.agr)
    in {
      s = pref ++BIND++ (np.s!NReduced) ;
      reqLocS = False
    } ;

    JustLikeAdv np =
    let
      pref = eqPref!(initNP np.isPron np.agr)
    in {
      s = pref ++BIND++ (np.s!NReduced) ;
      reqLocS = False
    } ;

    -- locative kwa
    PlaceLocAdv np = {
      s = (poss_concord_agr!(Third C17 Sg)!np.i) ++BIND++ (np.s!NReduced) ;
      reqLocS = False
    } ;

    -- locative ku
    PersonLocAdv np = {
      s = case np.isPron of {
        True => LOC_KI ;
        False => case (initNP np.isPron np.agr) of {
          RO  => LOC_KO ;
          RA  => LOC_KW ;
          _   => LOC_KU
        }
      }
      ++BIND++ (np.s!NReduced) ;
      reqLocS = False
    } ;

    AssocAdv np = {
      s = withPref ! (initNP np.isPron np.agr) ++BIND++ (np.s!NReduced) ;
      reqLocS = False
    } ;

    LocAdvAdv l = l ** { reqLocS = False } ;

    LocAdvNP adv np = {
      s = adv.s ++ (poss_concord_agr!(Third C17 Sg)!np.i) ++BIND++ (np.s!NReduced) ;
      reqLocS = False
    } ; -- ngaphezu kwamahora amabili adlule

    LocNAdv locn = locn ** { reqLocS = False } ;

    LocNPNgaAdv np = {
      s = ADV_NGA ++BIND++ LOC_S ++BIND++ np.s!NLoc ;
      reqLocS = False
    } ;

    LocNPJustLikeAdv np = {
      s = eqPref!RC ++BIND++ LOC_S ++BIND++ np.s!NLoc ;
      reqLocS = False
    } ;

    LocNNgaAdv locn = {
      s = ADV_NGA ++BIND++ locn.s ;
      reqLocS = False
    } ;

    LocativisedNounAdv np = {
      s = np.s!NLoc ;
      reqLocS = case <np.isPron,np.agr> of {
        <False,Third C1a_2a _> => False ;
        <False,Third C1_2 _> => False ;
        <False,_> => True ;
        <True,_> => False -- ki-
      } ;
    } ;

    NPAdv np = {
      s = case np.proDrop of {
        False => np.s!NFull ;
        True => nonExist -- "*" ++ np.s!NFull
      } ;
      reqLocS = False
    } ;

    ConjNAdv conj s = {
      s = conj.s ++ s.s!SInd;
      reqLocS = False
    } ;
}
