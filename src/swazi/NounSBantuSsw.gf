concrete NounSBantuSsw of NounSBantu = CatSsw,CatSBantuSsw ** open ResSsw, Prelude, ParamX in {

  lin

    ProDrop pron = {
      s = table {
        NFull => case pron.proDrop of {
          True => nonExist ; -- "*" ++ pron.s!NFull ;
          False => pron.empty
        } ;
        nform => nonExist -- "*" ++ pron.s!nform
      } ;
      agr = pron.agr ;
      empty = pron.empty ;
      proDrop = True
    } ;

    -- Quant is used for demonstratives, and QuantStem for all/only

    PronPostdetNP pron postdet = {
      empty = pron.empty ;
      s = \\nform => 
      let
        pron_str = case pron.proDrop of {
          True => pron.empty;
          False => pron.s!nform
        }
      in
        pron_str ++ postdet.s!pron.agr ;
      agr = pron.agr ;
      i = RC ;
      proDrop = False ;
      isPron = True ;
      heavy = True
    } ;

    QuantPostdet q = {
      s = \\a => q.s!a
    } ;

    DemPostdet q = {
      s = \\a => case q.dist of {
        Dem1 => dem1_full!a ;
        _ => q.s!True!a
      }
    } ;

    QuantDemPostdet q d = {
      s = \\a => q.s!a ++ d.s!True!a
    } ;

    DemQuantPostdet d q = {
      s = \\a => d.s!True!a ++ q.s!a
    } ;

    DetNum n = n ; -- ** { spec = Spec } ;

    -- NonspecDet n = n ** { spec = Nonspec } ;

    RelN rs n = {
      empty = n.empty ;
      s = \\num,nform => rs.s!(Third n.c num) ++ n.s!num!nform ;
      c = n.c ;
      predet = False
    } ;

    -- TODO : check mod
    ApposCN cn n = {
      s = \\num,nform => cn.s!num!nform ++ n.s!num!NFull ;
      c = cn.c ; -- takes agr of cn
      empty = cn.empty ;
      predet = cn.predet
    } ;

    -- TODO : check mod
    ApposN cn n = {
      s = \\num,nform => cn.s!num!nform ++ n.s!num!NFull ;
      c = n.c ; -- takes agr of n
      empty = cn.empty ;
      predet = cn.predet
    } ;

    PredetN predet n = {
      s = case predet.hasDem of {
        True => \\num => table {
          NFull | NReduced | NPoss => predet.s!(Third n.c num) ++ n.s!num!NReduced ;
          NLoc => LOC_KU ++BIND++ predet.s!(Third n.c num) ++ n.s!num!NReduced
        } ;
        False => \\num,nform => predet.s!(Third n.c num) ++ n.s!num!nform
      } ;
      c = n.c ;
      empty = n.empty ;
      predet = True
    } ;

    PostdetCN postdet n = {
      s = \\num,nform => n.s!num!nform ++ postdet.s!(Third n.c num) ;
      c = n.c ;
      empty = n.empty ;
      predet = False
    } ;

    QuantPredet q = {
      s = \\a => q.s!a ;
      hasDem = False
    } ;

    DemPredet q = {
      s = \\a => q.s!False!a ;
      hasDem = True
    } ;

    QuantDemPredet q d = {
      s = \\a => q.s!a ++ d.s!False!a ;
      hasDem = True
    } ;

    EmphCN cn = {
      s = \\num => table {
        NFull => pron_stem!(Third cn.c num) ++BIND++ PRON_NA ++ cn.s!num!NFull ;
        NReduced => pron_stem!(Third cn.c num) ++ cn.s!num!NFull ;
        NPoss => poss_pron_stem!(Third cn.c num) ++ cn.s!num!NFull ;
        NLoc => LOC_KU ++BIND++ pron_stem!(Third cn.c num) ++ cn.s!num!NFull
      } ;
      -- mod = cn.mod ;
      c = cn.c ;
      empty = cn.empty ;
      predet = True
    } ;

    ContrastCN cn = {
      s = \\num,nform => cn.s!num!nform ++ pron_stem!(Third cn.c num) ++BIND++ PRON_NA ;
      c = cn.c ;
      empty = cn.empty ;
      predet = cn.predet
    } ;

    UsePNPl pn = let
      agr = Third pn.c Pl
    in {
      empty = pn.empty ;
      s = pn.s!Pl ;
      agr = agr ;
      i = nominit!agr ;
      proDrop = False ;
      isPron = False ;
      heavy = True
    } ;

    -- not built to work for copulative VPs for now (specifically for agreement)
    Deverb15 pol vp =
      let
        agr = Third C15 Sg
      in
      {
        s = \\nform => vp.inf_s!nform!pol.p ++ pol.s ;
        agr = agr ;
        i = RU ;
        proDrop = False ;
        isPron = False ;
        heavy = True ;
        empty = []
    } ;

    LocNNP locn = {
      empty = [] ;
      s = \\_ => locn.s ;
      agr = Third C17 Sg ;
      i = RC ;
      proDrop = False ;
      isPron = False ;
      heavy = True
    } ;

    LocNNgaNP locn = {
      empty = [] ;
      s = \\_ => ADV_NGA++BIND++locn.s ;
      agr = Third C17 Sg ;
      i = RC ;
      proDrop = False ;
      isPron = False ;
      heavy = True
    } ;

    PossNPLoc cn np = {
      empty = np.empty ;
      s = \\n,nform => cn.s!n!nform ++ poss_concord!cn.c!n!(Third C1a_2a Sg) ++BIND++LOC_S++BIND++ (loc_NP np);
      c = cn.c ;
      predet = cn.predet
    } ;

    SBantuConjNP np1 conj np2 = {
      s = table {
        NLoc => np1.s!NLoc ++ conj.s!RC++LOC_S++BIND++ np2.s!NLoc ;
        nform => case conj.fix of {
          True => np1.s!nform ++ conj.s!(initNP np2.isPron np2.agr) ++ np2.s!NReduced ;
          False => np1.s!nform ++ conj.s!(initNP np2.isPron np2.agr) ++ np2.s!NFull 
        }
      } ;
      agr = compAgr np1.agr np2.agr ;
      i = np1.i ;
      proDrop = andB np1.proDrop np2.proDrop ;
      isPron = np1.isPron ;
      heavy = orB np1.heavy np2.heavy ;
      empty = np1.empty ++ np2.empty
    } ;

    AdjPron ap pron = nonExist_Pron ;
    NomRel cn1 cn2 = nonExist_CN ;
    PossLocN locn np = nonExist_LocN ;


}
