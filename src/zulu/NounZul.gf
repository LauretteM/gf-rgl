concrete NounZul of Noun = CatZul ** open ResZul, Prelude, ParamX in {

  flags optimize=all_subs ;

  lin
    DetCN det cn = let
      agr = Third cn.c det.n ;
    in {
      empty = cn.empty ;
      s = \\nform => det.s ++ cn.s ! det.n ! nform ;
      agr = agr ;
      phonInit = case cn.predet of {
        False => nominit!agr ;
        True => PhonC
      } ;
      proDrop = False ;
      isPron = False ;
      heavy = True
    } ;

    UsePN pn = let
      agr = Third pn.c Sg ;
    in {
      empty = pn.empty ;
      s = pn.s!Sg ;
      agr = agr ;
      phonInit = nominit!agr ;
      proDrop = False ;
      isPron = False ;
      heavy = True
    } ;

    UsePron pron = {
      empty = pron.empty ;
      s = pron.s ;
      agr = pron.agr ;
      phonInit = PhonC ;
      proDrop = pron.proDrop ;
      isPron = True ;
      heavy = case pron.proDrop of {
        True => False ;
        False => True
      }
    } ;

    -- PredetNP, PPartNP, ExtAdvNP : not implemented

    AdvNP np adv = {
      empty = np.empty ;
      s = \\nform => np.s!nform ++ adv.s ;
      agr = np.agr ;
      phonInit = np.phonInit ;
      proDrop = False ; -- probably right?
      isPron = np.isPron ;
      heavy = True
    } ;

    RelNP np rs = {
      empty = np.empty ;
      s = \\nform => np.s!nform ++ rs.s!np.agr ;
      agr = np.agr ;
      phonInit = np.phonInit ;
      proDrop = False ; -- probably right?
      isPron = np.isPron ;
      heavy = True
    } ;

    -- DetNP, DetQuant, DetQuantOrd : not implemented

    NumSg = { s = [] ; n = Sg } ;
    NumPl = { s = [] ; n = Pl } ;

    -- NumCard, NumNumeral, AdNum, OrdNumeral, OrdSuperl, OrdNumeralSuperl : not implemented
    -- NumDigits, OrdDigits : not yet implemented

    -- DefArt, IndefArt, MassNP, PossPron : not implemented

    UseN n = n ** { predet = False } ;

    -- ComplN2, ComplN3, UseN2, Use2N3, Use3N3 : not implemented

    -- RelCN, AdvCN, SentCN, ApposCN : not implemented
    AdjCN cn ap = variants {} ;

    -- flashing of the lights / ukukhanya kwezibani
    PossNP cn np = {
      empty = cn.empty ;
      s = \\num,nform => case np.agr of {
        Third C1a_2a Sg => cn.s!num!nform ++ poss_concord_c1a!cn.c!num ++BIND++ np.s!NPoss ;
        (First Pl | Second Pl ) => cn.s!num!nform ++ poss_concord!cn.c!num!PhonI ++BIND++ np.s!NPoss ;
        (First _ | Second _ | Third _ _) => cn.s!num!nform ++ poss_concord!cn.c!num!np.phonInit ++BIND++ np.s!NPoss
      }  ;
      c = cn.c ;
      predet = cn.predet
    } ;

    -- PartNP, CountNP, AdjDAP, DetDAP : not implemented

}
