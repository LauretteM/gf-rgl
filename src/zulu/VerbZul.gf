concrete VerbZul of Verb = CatZul ** open ResZul, Prelude, ParamX in {

  flags optimize=all_subs ;

  lin
    UseV v = {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = VFIndic MainCl p t ;
          vpref = verb_prefix_no_oc vform l v.r a s v.syl ;
          r = v.s!(rform vform l) -- hamba
        in vpref ++ r ;
        RelCl => \\a,p,t,s,l => let
          vform = VFIndic RelCl p t ;
          vpref = verb_prefix_no_oc vform l v.r a s v.syl ;
          r = v.s!(rform vform l) ; -- hamba
          suf = case l of {
            True => relSuf vform s ;
            False => []
          } ;
        in vpref ++ r ++ suf
      } ;
      imp_s = table {
        Sg => table {
          Pos => case <v.syl,v.r> of {
            <SylMono,RC> => COP_YI++BIND++v.s!R_a ;
            <SylMono,_> => COP_Y++BIND++v.s!R_a ;
            <SylMult,_> => v.s!R_a
          } ;
          Neg => case v.r of {
            RC => IMP_NEG_PREF_SG ++BIND++ v.s!R_i ;
            _  => IMP_NEG_PREF_SG_REDUCED ++BIND++ v.s!R_i
          }
        } ;
        Pl => table {
          Pos => case <v.syl,v.r> of {
            <SylMono,RC> => COP_YI++BIND++v.s!R_a ++BIND++PL_NI ;
            <SylMono,_> => COP_Y++BIND++v.s!R_a ++BIND++PL_NI ;
            <SylMult,_> => v.s!R_a ++BIND++PL_NI
          } ;
          Neg => case v.r of {
            RC => IMP_NEG_PREF_PL ++BIND++ v.s!R_i ;
            _  => IMP_NEG_PREF_PL_REDUCED ++BIND++ v.s!R_i
          }
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ v.s!R_a ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ v.s!R_i
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ v.s!R_a ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ v.s!R_i
        } ;
        NLoc => table {
          Pos => LOC_KU ++BIND++ INF_PREF_REDUCED++BIND++v.s!R_e ++BIND++ ADV_NI ;
          Neg => LOC_KU ++BIND++ INF_PREF_REDUCED++BIND++NEG_NGA++BIND++v.s!R_e ++BIND++ ADV_NI
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref = verb_prefix_no_oc vform False v.r a Null v.syl ;
          r = v.s!(rform vform False)
        in vpref ++ r ;
      iadv, advs, comp = [] ;
      -- ap_comp = \\_ => [] ;
      hasComp = False ;
      r = v.r ;
      syl = v.syl ;
      vptype = NoComp
    } ;

    ComplVV v vp = {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = VFIndic MainCl p t ;
          vpref = verb_prefix_no_oc vform l v.r a s v.syl ;
          r = v.s!(rform (VFIndic MainCl p t) l) -- hamba
        in vpref ++ r ++ vp.inf_s!NFull!Pos ;
        RelCl => \\a,p,t,s,l => let
          vform = VFIndic RelCl p t ;
          vpref = verb_prefix_no_oc vform l v.r a s v.syl ;
          r = v.s!(rform vform l) ; -- hamba
          suf = case l of {
            True => relSuf vform s ;
            False => []
          } ;
        in vpref ++ r ++ vp.inf_s!NFull!Pos
      } ;
      imp_s = table {
        Sg => table {
          Pos => case <v.syl,v.r> of {
            <SylMono,RC> => COP_YI++BIND++v.s!R_a ++ vp.inf_s!NFull!Pos ;
            <SylMono,_> => COP_Y++BIND++v.s!R_a ++ vp.inf_s!NFull!Pos ;
            <SylMult,_> => v.s!R_a ++ vp.inf_s!NFull!Pos
          } ;
          Neg => case v.r of {
            RC => IMP_NEG_PREF_SG ++BIND++ v.s!R_i ++ vp.inf_s!NFull!Pos ;
            _  => IMP_NEG_PREF_SG_REDUCED ++BIND++ v.s!R_i ++ vp.inf_s!NFull!Pos
          }
        } ;
        Pl => table {
          Pos => case <v.syl,v.r> of {
            <SylMono,RC> => COP_YI++BIND++v.s!R_a ++BIND++PL_NI ++ vp.inf_s!NFull!Pos ;
            <SylMono,_> => COP_Y++BIND++v.s!R_a ++BIND++PL_NI ++ vp.inf_s!NFull!Pos ;
            <SylMult,_> => v.s!R_a ++BIND++PL_NI ++ vp.inf_s!NFull!Pos
          } ;
          Neg => case v.r of {
            RC => IMP_NEG_PREF_PL ++BIND++ v.s!R_i ++ vp.inf_s!NFull!Pos ;
            _  => IMP_NEG_PREF_PL_REDUCED ++BIND++ v.s!R_i ++ vp.inf_s!NFull!Pos
          }
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ v.s!R_a ++ vp.inf_s!NFull!Pos ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ v.s!R_i ++ vp.inf_s!NFull!Pos
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ v.s!R_a ++ vp.inf_s!NFull!Pos ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ v.s!R_i ++ vp.inf_s!NFull!Pos
        } ;
        NLoc => table {
          Pos => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++v.s!R_a ++ vp.inf_s!NFull!Pos ;
          Neg => LOC_KU++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++NEG_NGA++BIND++v.s!R_i ++ vp.inf_s!NFull!Pos
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref = verb_prefix_no_oc vform False v.r a Null v.syl ;
          r = v.s!(rform vform False)
        in vpref ++ r ++ vp.inf_s!NFull!Pos ;
      iadv, advs, comp = [] ;
      -- ap_comp = \\_ => [] ;
      hasComp = True ;
      r = v.r ;
      syl = v.syl ;
      vptype = VNPCompl
    } ;

    ComplVS v s = {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = VFIndic MainCl p t ;
          vpref = verb_prefix_no_oc vform l v.r a s v.syl ;
          r = v.s!(rform vform l) -- hamba
        in vpref ++ r ;
        RelCl => \\a,p,t,s,l => let
          vform = VFIndic RelCl p t ;
          vpref = verb_prefix_no_oc vform l v.r a s v.syl ;
          r = v.s!(rform vform l) ; -- hamba
          suf = case l of {
            True => relSuf vform s ;
            False => []
          } ;
        in vpref ++ r ++ suf
      } ;
      imp_s = table {
        Sg => table {
          Pos => case <v.syl,v.r> of {
            <SylMono,RC> => COP_YI++BIND++v.s!R_a ++ s.s!v.s_type ;
            <SylMono,_> => COP_Y++BIND++v.s!R_a ++ s.s!v.s_type ;
            <SylMult,_> => v.s!R_a ++ s.s!v.s_type
          } ;
          Neg => case v.r of {
            RC => IMP_NEG_PREF_SG ++BIND++ v.s!R_i ++ s.s!v.s_type ;
            _  => IMP_NEG_PREF_SG_REDUCED ++BIND++ v.s!R_i ++ s.s!v.s_type
          }
        } ;
        Pl => table {
          Pos => case <v.syl,v.r> of {
            <SylMono,RC> => COP_YI++BIND++v.s!R_a ++BIND++PL_NI ++ s.s!v.s_type ;
            <SylMono,_> => COP_Y++BIND++v.s!R_a ++BIND++PL_NI ++ s.s!v.s_type ;
            <SylMult,_> => v.s!R_a ++BIND++PL_NI ++ s.s!v.s_type
          } ;
          Neg => case v.r of {
            RC => IMP_NEG_PREF_PL ++BIND++ v.s!R_i ++ s.s!v.s_type ;
            _  => IMP_NEG_PREF_PL_REDUCED ++BIND++ v.s!R_i ++ s.s!v.s_type
          }
        }
      } ;
      inf_s = table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ v.s!R_a ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA++BIND++ v.s!R_i
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ v.s!R_a ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA++BIND++ v.s!R_i
        } ;
        NLoc => table {
          Pos => LOC_E ++BIND++ INF_PREF_REDUCED++BIND++v.s!R_e ++BIND++ ADV_NI ;
          Neg => LOC_E ++BIND++ INF_PREF_REDUCED++BIND++NEG_NGA++BIND++v.s!R_e ++BIND++ ADV_NI
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref = verb_prefix_no_oc vform False v.r a Null v.syl ;
          r = v.s!(rform vform False)
        in vpref ++ r ;
      iadv, advs = [] ;
      comp = s.s!v.s_type ;
      hasComp = True ;
      r = v.r ;
      syl = v.syl ;
      vptype = NoComp
    } ;

    AdvVP vp adv = vp ** {
      advs = vp.advs ++ adv.s ;
      hasComp = True
    } ;
}
