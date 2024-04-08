concrete NounExtSsw of NounExt = CatSsw,CatExtSsw ** open ResSsw, Prelude, ParamX in {

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

    PostdetCN cn postdet det = let
      agr = Third cn.c det.n
    in {
      empty = cn.empty ;
      -- s = \\nform => cn.s!det.n!nform ++ cn.mod!det.n ++ postdet.s!agr ;
      s = \\nform => cn.s!det.n!nform ++ postdet.s!agr ++ det.s ;
      agr = agr ;
      i = nominit!agr ;
      proDrop = False ;
      isPron = False ;
      heavy = True
    } ;

    RelN rs n = {
      empty = n.empty ;
      s = \\num,nform => rs.s!(Third n.c num) ++ n.s!num!nform ;
      -- mod = \\_ => [] ;
      c = n.c ;
      predet = False
    } ;

    -- TODO : check mod
    ApposCN cn n = {
      s = \\num,nform => cn.s!num!nform ++ n.s!num!NFull ;
      -- mod = \\num => n.s!num!Full ++ cn.mod!num ;
      c = cn.c ; -- takes agr of cn
      empty = cn.empty ;
      predet = cn.predet
    } ;

    -- TODO : check mod
    ApposN cn n = {
      s = \\num,nform => cn.s!num!nform ++ n.s!num!NFull ;
      -- mod = \\num => n.s!num!Full ++ cn.mod!num ;
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
      -- mod = \\_ => [] ;
      c = n.c ;
      empty = n.empty ;
      predet = True
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
      -- mod = \\num => pron_stem!(Third cn.c num) ++BIND++ "na" ++ cn.mod!num ;
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

    -- Deverb15 v =
    -- let
    --   agr = Third C15 Sg ;
    -- in
    -- {
    --   s = \\_ => table {
    --     NFull => case v.r of {
    --       RC => "uku"++BIND++(v.s!R_a) ;
    --       (RA|RE) => "ukw"++BIND++(v.s!R_a) ;
    --       _ => "uk"++BIND++(v.s!R_a)
    --     } ;
    --     NReduced => case v.r of {
    --       RC => "ku"++BIND++(v.s!R_a) ;
    --       (RA|RE) => "kw"++BIND++(v.s!R_a) ;
    --       _ => "k"++BIND++(v.s!R_a)
    --     } ;
    --     NPoss => case v.r of {
    --       RC => "ku"++BIND++(v.s!R_a) ;
    --       (RA|RE) => "kw"++BIND++(v.s!R_a) ;
    --       _ => "k"++BIND++(v.s!R_a)
    --     } ;
    --     NLoc => case v.r of {
    --       RC => "eku"++BIND++(v.s!R_e)++BIND++"ni" ;
    --       (RA|RE) => "ekw"++BIND++(v.s!R_e)++BIND++"ni" ;
    --       _ => "ek"++BIND++(v.s!R_e)++BIND++"ni"
    --     }
    --   } ;
    --   c = C15 ;
    --   empty = []
    -- } ;

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

    LocNP np = {
      s = table {
        MainCl => \\a,p,t => let
          vform = VFIndic MainCl p t ;
          pcp = ap_cop_pref vform a RelType ; -- u- / uzoba / akazukuba
          cop_base = loc_n_cop_base np vform
        in
          case vform of {
            VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
            VFIndic _ _ _ => pcp ++ cop_base
          } ;
        RelCl => \\a,p,t => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o- / onge-
          pcp = ap_cop_pref vform a RelType ; -- u- / uzoba / akazukuba
          cop_base = loc_n_cop_base np vform
        in
          case vform of {
            VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
            VFIndic _ _ _ => rcp ++ pcp ++ cop_base
          }
      } ;
    } ;

    -- LocNLoc locn = {
    --   s = table {
    --     MainCl => \\a,p,t => let
    --       vform = VFIndic MainCl p t ;
    --       pcp = ap_cop_pref vform a RelType ; -- u- / uzoba / akazukuba
    --       cop_base = locn.s
    --     in
    --       case vform of {
    --         VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
    --         VFIndic _ _ _ => pcp ++ cop_base
    --       } ;
    --     RelCl => \\a,p,t => let
    --       vform = VFIndic RelCl p t ;
    --       rcp = (relConcCop vform a RC) ; -- o- / onge-
    --       pcp = ap_cop_pref vform a RelType ; -- u- / uzoba / akazukuba
    --       cop_base = locn.s
    --     in
    --       case vform of {
    --         VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
    --         VFIndic _ _ _ => rcp ++ pcp ++ cop_base
    --       }
    --   } ;
    -- } ;

    -- LocNPossNP locn np = {
    --   s = locn.s ++ poss_concord_agr!(Third C17 Sg)!(np.i) ++BIND++ np.s!NPoss;
    -- } ;

    LocAdvLoc locadv = {
      s = table {
        MainCl => \\a,p,t => let
          vform = VFIndic MainCl p t ;
          pcp = ap_cop_pref vform a RelType ; -- u- / uzoba / akazukuba
          s = case locadv.reqLocS of {
            True => LOC_S++BIND ;
            False => []
          } ;
          cop_base = locadv.s
        in
          case vform of {
            VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
            VFIndic _ _ _ => pcp ++ s ++ cop_base ;
            VFConsec _ => nonExist ; -- "*consec" ;
            VFSubjunct _ => nonExist -- "*subjunct"
          } ;
        RelCl => \\a,p,t => let
          vform = VFIndic RelCl p t ;
          rcp = (relConcCop vform a RC) ; -- o- / onge-
          pcp = ap_cop_pref vform a RelType ; -- u- / uzoba / akazukuba
          s = case locadv.reqLocS of {
            True => LOC_S++BIND ;
            False => []
          } ;
          cop_base = locadv.s
        in
          case vform of {
            VFIndic _ Neg PresTense => (kho_cop vform a) ++ cop_base;
            VFIndic _ _ _ => rcp ++ pcp ++ s ++ cop_base ;
            VFConsec _ => nonExist ; -- "*consec" ;
            VFSubjunct _ => nonExist -- "*subjunct"
          }
      } ;
      imp_s = table {
        Sg => table {
          Pos => COP_YI++BIND++BA ++ LOC_S++BIND++ locadv.s ;
          Neg => IMP_NEG_PREF_SG++BIND++BI ++ LOC_S++BIND++ locadv.s
        } ;
        Pl => table {
          Pos => COP_YI++BIND++BA++BIND++PL_NI ++ LOC_S++BIND++ locadv.s ;
          Neg => IMP_NEG_PREF_PL++BIND++BI ++ LOC_S++BIND++ locadv.s
        }
      } ;
      -- inf_s = table {
      --   Pos => "ukuba" ++ "s"++BIND++ locadv.s ;
      --   Neg => "ukungabi" ++ "s"++BIND++ locadv.s
      -- } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL++BIND++BA ++ LOC_S++BIND++ locadv.s ;
          Neg => INF_PREF_FULL++BIND++NEG_NGA++BI ++ LOC_S++BIND++ locadv.s
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED++BIND++BA ++ LOC_S++BIND++ locadv.s ;
          Neg => INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ LOC_S++BIND++ locadv.s
        } ;
        NLoc => table {
          Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_REDUCED++BIND++BA ++ LOC_S++BIND++ locadv.s ;
          Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++INF_PREF_REDUCED++BIND++NEG_NGA++BI ++ LOC_S++BIND++ locadv.s
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          pcp = ap_cop_pref vform a RelType ; -- u- / uzoba / akazukuba
          s = case locadv.reqLocS of {
            True => LOC_S++BIND ;
            False => []
          } ;
          cop_base = locadv.s
        in
          case vform of {
            VFIndic _ Neg PresTense => nonExist ; -- "*indic";
            VFConsec Neg => (kho_cop vform a) ++ cop_base;
            VFSubjunct Neg => (kho_cop vform a) ++ cop_base;

            VFIndic _ _ _ => nonExist ; --"*indic" ;
            VFConsec _ => pcp ++ s ++ cop_base ;
            VFSubjunct _ => pcp ++ s ++ cop_base 
          } ;
    } ;

    PossNPLoc cn np = {
      empty = np.empty ;
      s = \\n,nform => cn.s!n!nform ++ poss_concord!cn.c!n!(Third C1a_2a Sg) ++BIND++LOC_S++BIND++ (loc_NP np);
      c = cn.c ;
      predet = cn.predet
    } ;

    ExtConjNP np1 conj np2 = {
      s = \\nform => np1.s!nform ++ conj.s!np2.agr ++ np2.s!NReduced ;
      agr = compAgr np1.agr np2.agr ;
      i = np1.i ;
      proDrop = andB np1.proDrop np2.proDrop ;
      isPron = np1.isPron ;
      heavy = orB np1.heavy np2.heavy ;
      empty = np1.empty ++ np2.empty
    } ;


}
