concrete AdverbSBantuNso of AdverbSBantu = CatNso,CatSBantuNso ** open ResNso, Prelude, ParamX in {

  lin

    --  a mmotoro
    InstrAdv np = {
        s = "ka" ++ np.s!Absolute 
    } ;

    --  le mpša
    AssocAdv np = {
        s = "le" ++ np.s!Absolute 
    } ;

    -- ComparAdv :	NP -> Adv ; -- N/A

    --  vanilla: go moruti, nltong, etc.
    LocativisedNounAdv np = {
        s = case np.nt of {
            HumanN => "go" ++ np.s!Locative ;
            _ => np.s!Locative
        }
    } ;

    --  Pretoria
    PlaceNameAdv np = {
        s = np.s!Locative
    } ;

    --  go moruti
    PersonLocAdv np = {
        s = "go" ++ np.s!Locative
    } ;

    --  ga moruti
    PlaceLocAdv np = {
        s = "ga" ++ np.s!Locative 
    } ;

    --  mo ntlong
    SurfaceLocAdv locadv = {
        s = "mo" ++ locadv.s
    } ;

    --  ka ntlong
    InsideLocAdv locadv ={
        s = "ka" ++ locadv.s
    } ;

    --  FarLocAdv :	LocAdv -> LocAdv ; -- kua ntlong
    FarLocAdv locadv = {
        s = "kua" ++ locadv.s
    } ;

    --  morago as adverb he walks behind
    LocNAdv locn = {
        s = locn.s
    } ;

    LocAdvAdv locadv = locadv ;

    LocAdvNP adv np = {
        s = adv.s ++ (possConc C17 Sg) ++ (np.s!Absolute) -- removed BIND
    } ;

    -- NPAdv : NP -> Adv ; -- sonke lesi sikhathi
    NPAdv np = {
      s = case np.proDrop of {
        False => np.s!Absolute ;
        True => nonExist -- "*" ++ np.s!NFull
      }
    } ;

}
