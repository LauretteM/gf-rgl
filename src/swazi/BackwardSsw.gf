concrete BackwardSsw of Backward = CatSsw ** open ResSsw,Prelude,ParamX in {

  flags optimize=all_subs ;

  lin

    ComplV2 v2 np = let
      oc = objConc np.agr v2.r v2.syl ;
      longform = case np.heavy of {
        True => False ;
        False => True
      } ;
      obj = np.s!NFull
    in {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = (VFIndic MainCl p t) ;
          vpref_no_oc = verb_prefix_no_oc vform l v2.r a s v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform (VFIndic MainCl p t) l) ; -- bona / boni
        in case np.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj ;
          False => vpref_no_oc ++ r ++ obj
        } ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          vpref_no_oc = verb_prefix_no_oc vform l v2.r a s v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          oc = objConc np.agr v2.r v2.syl ; -- [] / m -
          longform = case np.heavy of {
            True => False ;
            False => True
          } ;
          r = v2.s!(rform vform l) ; -- bona / boni
          suf = case l of {
            True => relSuf vform s ;
            False => []
          } ;
        in case np.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ suf ++ obj ;
          False => vpref_no_oc ++ r ++ suf ++ obj
        }
      } ;
      imp_s = table {
        Sg => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++ obj ;
            False => v2.s!R_a ++ obj
          } ;
          Neg => case <np.proDrop,v2.r> of {
            <True,_> => IMP_NEG_PREF_SG ++BIND++ oc ++ v2.s!R_i ++ obj ;
            <False,RC> => IMP_NEG_PREF_SG ++BIND++ v2.s!R_i ++ obj ;
            <False,_> => IMP_NEG_PREF_SG_REDUCED ++BIND++ v2.s!R_i ++ obj
          }
        } ;
        Pl => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++BIND++PL_NI ++ obj ;
            False => v2.s!R_a ++BIND++PL_NI ++ obj
          } ;
          Neg => case <np.proDrop,v2.r> of {
            <True,_> => IMP_NEG_PREF_PL ++BIND++ oc ++ v2.s!R_i ++ obj ;
            <False,RC> => IMP_NEG_PREF_PL ++BIND++ v2.s!R_i ++ obj ;
            <False,_> => IMP_NEG_PREF_PL_REDUCED ++BIND++ v2.s!R_i ++ obj
          }
        }
      } ;
      inf_s = let
        inf_oc = case np.proDrop of {
          True => oc ;
          False => []
        }
      in
      table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ inf_oc ++ v2.s!R_a ++ obj ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ inf_oc ++ v2.s!R_a ++ obj ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj
        } ;
        NLoc => table {
          Pos => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++inf_oc ++ v2.s!R_a ++ obj ;
          Neg => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++NEG_NGA++BIND++inf_oc ++ v2.s!R_a ++ obj
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_no_oc = verb_prefix_no_oc vform False v2.r a Null v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform False v2.r a Null v2.syl ;
          r = v2.s!(rform vform False) ; -- bona / boni
        in case np.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj ;
          False => vpref_no_oc ++ r ++ obj
        } ;
      iadv, advs, comp = [] ;
      ap_comp = \\_ => [] ;
      hasComp = np.heavy ;
      r = v2.r ;
      syl = v2.syl ;
      vptype = VNPCompl
    } ;

    ComplV3 v2 np1 np2 = let
      oc = case <np1.proDrop,np2.proDrop> of {
        <True,True> => objConc np2.agr v2.r v2.syl ; -- it (the letter) to him (the king)
        <True,False> => objConc np1.agr v2.r v2.syl ; -- it (the letter) to the king
        <False,True> => objConc np2.agr v2.r v2.syl ; -- the letter to him (the king)
        <False,False> => []
      } ;
      oc_present = case <np1.proDrop,np2.proDrop> of {
        <True,True> => True ; -- it (the letter) to him (the king)
        <True,False> => True ; -- it (the letter) to the king
        <False,True> => True ; -- the letter to him (the king)
        <False,False> => False
      } ;
      obj1 = case <np1.proDrop,np2.proDrop> of {
        <True,True> => pron_stem!np1.agr ++BIND++ "na" ; -- it (the letter) to him (the king)
        <True,False> => np1.s!NFull ; -- [should be empty] it (the letter) to the king
        <False,_> => np1.s!NFull
      } ;
      obj2 = case <np1.proDrop,np2.proDrop> of {
        <True,True> => [] ;-- it (the letter) to him (the king)
        <_,False> => np2.s!NFull ; -- it/the letter to the king
        <False,True> => [] -- the letter to him (the king)
      } ;
    in {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = (VFIndic MainCl p t) ;
          vpref_no_oc = verb_prefix_no_oc vform l v2.r a s v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform (VFIndic MainCl p t) l) ; -- bona / boni
        in case np1.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj1 ++ obj2 ;
          False => vpref_no_oc ++ r ++ obj1 ++ obj2
        } ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          vpref_no_oc = verb_prefix_no_oc vform l v2.r a s v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform vform l) ; -- bona / boni
        in case np1.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj1 ++ obj2 ;
          False => vpref_no_oc ++ r ++ obj1 ++ obj2
        }
      } ;
      imp_s = table {
        Sg => table {
          Pos => case np1.proDrop of {
            True => oc ++ v2.s!R_e ++ obj1 ++ obj2 ;
            False => v2.s!R_a ++ obj1 ++ obj2
          } ;
          Neg => case <np1.proDrop,v2.r> of {
            <True,_> => IMP_NEG_PREF_SG ++BIND++ oc ++ v2.s!R_i ++ obj1 ++ obj2 ;
            <False,RC> => IMP_NEG_PREF_SG ++BIND++ v2.s!R_i ++ obj1 ++ obj2 ;
            <False,_> => IMP_NEG_PREF_SG_REDUCED ++BIND++ v2.s!R_i ++ obj1 ++ obj2
          }
        } ;
        Pl => table {
          Pos => case np1.proDrop of {
            True => oc ++ v2.s!R_e ++BIND++PL_NI ++ obj1 ++ obj2 ;
            False => v2.s!R_a ++BIND++PL_NI ++ obj1 ++ obj2
          } ;
          Neg => case <np1.proDrop,v2.r> of {
            <True,_> => IMP_NEG_PREF_PL ++BIND++ oc ++ v2.s!R_i ++ obj1 ++ obj2 ;
            <False,RC> => IMP_NEG_PREF_PL ++BIND++ v2.s!R_i ++ obj1 ++ obj2 ;
            <False,_> => IMP_NEG_PREF_PL_REDUCED ++BIND++ v2.s!R_i ++ obj1 ++ obj2
          }
        }
      } ;
      inf_s = let
        inf_oc = case np1.proDrop of {
          True => oc ;
          False => []
        }
      in
      table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ inf_oc ++ v2.s!R_a ++ obj1 ++ obj2 ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj1 ++ obj2
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ inf_oc ++ v2.s!R_a ++ obj1 ++ obj2 ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj1 ++ obj2
        } ;
        NLoc => table {
          Pos => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++inf_oc ++ v2.s!R_a ++ obj1 ++ obj2 ;
          Neg => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++NEG_NGA++BIND++inf_oc ++ v2.s!R_a ++ obj1 ++ obj2
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_no_oc = verb_prefix_no_oc vform False v2.r a Null v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform False v2.r a Null v2.syl ;
          r = v2.s!(rform vform False) ; -- bona / boni
        in case np1.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj1 ++ obj2 ;
          False => vpref_no_oc ++ r ++ obj1 ++ obj2
        } ;
      iadv, advs, comp = [] ;
      ap_comp = \\_ => [] ;
      hasComp = True ;
      r = v2.r ;
      syl = v2.syl ;
      vptype = VNPCompl
    } ;

    ComplV2V v2 np vp = let
      oc = objConc np.agr v2.r v2.syl ;
      longform = False ;
      obj = np.s!NFull
    in {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = (VFIndic MainCl p t) ;
          vpref_no_oc = verb_prefix_no_oc vform l v2.r a s v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform (VFIndic MainCl p t) l) ; -- bona / boni
        in case np.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj ++ vp.inf_s!NFull!Pos ;
          False => vpref_no_oc ++ r ++ obj ++ vp.inf_s!NFull!Pos
        } ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          vpref_no_oc = verb_prefix_no_oc vform l v2.r a s v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform l v2.r a s v2.syl ;
          r = v2.s!(rform vform l) ; -- bona / boni
        in case np.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj ++ vp.inf_s!NFull!Pos ;
          False => vpref_no_oc ++ r ++ obj ++ vp.inf_s!NFull!Pos
        }
      } ;
      imp_s = table {
        Sg => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++ obj ++ vp.inf_s!NFull!Pos ;
            False => v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos
          } ;
          Neg => case <np.proDrop,v2.r> of {
            <True,_> => IMP_NEG_PREF_SG ++BIND++ oc ++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos ;
            <False,RC> => IMP_NEG_PREF_SG ++BIND++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos ;
            <False,_> => IMP_NEG_PREF_SG_REDUCED ++BIND++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos
          }
        } ;
        Pl => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++BIND++PL_NI ++ obj ++ vp.inf_s!NFull!Pos ;
            False => v2.s!R_a ++BIND++PL_NI ++ obj ++ vp.inf_s!NFull!Pos
          } ;
          Neg => case <np.proDrop,v2.r> of {
            <True,_> => IMP_NEG_PREF_PL ++BIND++ oc ++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos ;
            <False,RC> => IMP_NEG_PREF_PL ++BIND++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos ;
            <False,_> => IMP_NEG_PREF_PL_REDUCED ++BIND++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos
          }
        }
      } ;
      inf_s = let
        inf_oc = case np.proDrop of {
          True => oc ;
          False => []
        }
      in
      table {
        NFull => table {
          Pos => INF_PREF_FULL ++BIND++ inf_oc ++ v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos ;
          Neg => INF_PREF_FULL ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos
        } ;
        NReduced | NPoss => table {
          Pos => INF_PREF_REDUCED ++BIND++ inf_oc ++ v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos ;
          Neg => INF_PREF_REDUCED ++BIND++ NEG_NGA ++BIND++ inf_oc ++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos
        } ;
        NLoc => table {
          Pos => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++inf_oc ++ v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos ;
          Neg => INF_PREF_REDUCED++BIND++poss_pron_stem!(Third C15 Sg) ++ INF_PREF_FULL++BIND++NEG_NGA++BIND++inf_oc ++ v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_no_oc = verb_prefix_no_oc vform False v2.r a Null v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform False v2.r a Null v2.syl ;
          r = v2.s!(rform vform False) ; -- bona / boni
        in case np.proDrop of {
          True => vpref_with_oc ++ oc ++ r ++ obj ++ vp.inf_s!NFull!Pos ;
          False => vpref_no_oc ++ r ++ obj ++ vp.inf_s!NFull!Pos
        } ;
      iadv, advs, comp = [] ;
      ap_comp = \\_ => [] ;
      hasComp = True ;
      r = v2.r ;
      syl = v2.syl ;
      vptype = VNPCompl
    } ;

}
