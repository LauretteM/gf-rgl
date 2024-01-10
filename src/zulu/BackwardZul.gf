concrete BackwardZul of Backward = CatZul ** open ResZul,Prelude,ParamX in {

  flags optimize=all_subs ;

  lin

-- A repository of obsolete constructs, needed for backward compatibility.
-- They create spurious ambiguities if used in combination with Lang.

-- from Verb 19/4/2008

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
          vpref_with_oc = verb_prefix_with_oc vform l a s ;
          tp = tensePref vform v2.r v2.syl ; -- [] / zo- / zuku-
          -- oc = objConc np.agr v2.r v2.syl ; -- [] / m -
          -- longform = case np.heavy of {
          --   True => False ;
          --   False => True
          -- } ;
          r = v2.s!(rform (VFIndic MainCl p t) l) ; -- bona / boni
          -- obj = np.s!NFull -- [] / inkomo
        in case np.proDrop of {
          True => vpref_with_oc ++ tp ++ oc ++ r ++ obj ;
          False => vpref_no_oc ++ tp ++ r ++ obj
        } ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          rc = relConc vform a v2.r ; -- o- / onga-
          tp = tensePref vform v2.r v2.syl ; -- [] / zo- / zuku-
          -- oc = objConc np.agr v2.r v2.syl ; -- [] / m -
          -- longform = case np.heavy of {
          --   True => False ;
          --   False => True
          -- } ;
          r = v2.s!(rform vform l) ; -- bona / boni
          suf = case l of {
            True => relSuf vform s ;
            False => []
          } ;
          -- obj = np.s!NFull -- [] / inkomo
        in case np.proDrop of {
          True => rc ++ tp ++ oc ++ r ++ suf ++ obj ;
          False => rc ++ tp ++ r ++ suf ++ obj
        }
      } ;
      imp_s = table {
        Sg => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++ obj ;
            False => v2.s!R_a ++ obj
          } ;
          Neg => case np.proDrop of {
            True => "unga" ++BIND++ oc ++ v2.s!R_i ++ obj ;
            False => "unga" ++BIND++ v2.s!R_i ++ obj
          }
        } ;
        Pl => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++BIND++"ni" ++ obj ;
            False => v2.s!R_a ++BIND++"ni" ++ obj
          } ;
          Neg => case np.proDrop of {
            True => "ninga" ++BIND++ oc ++ v2.s!R_i ++ obj ;
            False => "ninga" ++BIND++ v2.s!R_i ++ obj
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
          Pos => "uku" ++BIND++ inf_oc ++ v2.s!R_a ++ obj ;
          Neg => "uku" ++BIND++ "nga" ++BIND++ inf_oc ++ v2.s!R_i ++ obj
        } ;
        NReduced | NPoss => table {
          Pos => "ku" ++BIND++ inf_oc ++ v2.s!R_a ++ obj ;
          Neg => "ku" ++BIND++ "nga" ++BIND++ inf_oc ++ v2.s!R_i ++ obj
        } ;
        NLoc => table {
          Pos => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++ "uku"++BIND++inf_oc ++ v2.s!R_a ++ obj ;
          Neg => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++ "uku"++BIND++"nga"++BIND++inf_oc ++ v2.s!R_a ++ obj
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_no_oc = verb_prefix_no_oc vform False v2.r a Null v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform False a Null ;
          tp = tensePref vform v2.r v2.syl ; -- [] / zo- / zuku-
          r = v2.s!(rform vform False) ; -- bona / boni
          -- obj = np.s!NFull -- [] / inkomo
        in case np.proDrop of {
          True => vpref_with_oc ++ tp ++ oc ++ r ++ obj ;
          False => vpref_no_oc ++ tp ++ r ++ obj
        } ;
      iadv, advs, comp = [] ;
      ap_comp = \\_ => [] ;
      hasComp = np.heavy ;
      r = v2.r ;
      syl = v2.syl ;
      vptype = VNPCompl
    } ;

    ComplV3 v2 np1 np2 = let
      oc = objConc np1.agr v2.r v2.syl ;
      longform = case np1.heavy of {
        True => False ;
        False => True
      } ;
      obj1 = np1.s!NFull ;
      obj2 = case np2.proDrop of {
        False => np2.s!NFull ;
        True => "*" ++ np2.s!NFull
      } ;
    in {
      s = table {
        MainCl => \\a,p,t,s,l => let
          vform = (VFIndic MainCl p t) ;
          vpref_no_oc = verb_prefix_no_oc vform l v2.r a s v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform l a s ;
          tp = tensePref vform v2.r v2.syl ; -- [] / zo- / zuku-
          -- oc = objConc np.agr v2.r v2.syl ; -- [] / m -
          -- longform = case np.heavy of {
          --   True => False ;
          --   False => True
          -- } ;
          r = v2.s!(rform (VFIndic MainCl p t) l) ; -- bona / boni
          -- obj = np.s!NFull -- [] / inkomo
        in case np1.proDrop of {
          True => vpref_with_oc ++ tp ++ oc ++ r ++ obj1 ++ obj2 ;
          False => vpref_no_oc ++ tp ++ r ++ obj1 ++ obj2
        } ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          rc = relConc vform a v2.r ; -- o- / onga-
          tp = tensePref vform v2.r v2.syl ; -- [] / zo- / zuku-
          -- oc = objConc np.agr v2.r v2.syl ; -- [] / m -
          -- longform = case np.heavy of {
          --   True => False ;
          --   False => True
          -- } ;
          r = v2.s!(rform vform l) ; -- bona / boni
          -- obj = np.s!NFull -- [] / inkomo
        in case np1.proDrop of {
          True => rc ++ tp ++ oc ++ r ++ obj1 ++ obj2 ;
          False => rc ++ tp ++ r ++ obj1 ++ obj2
        }
      } ;
      imp_s = table {
        Sg => table {
          Pos => case np1.proDrop of {
            True => oc ++ v2.s!R_e ++ obj1 ++ obj2 ;
            False => v2.s!R_a ++ obj1 ++ obj2
          } ;
          Neg => case np1.proDrop of {
            True => "unga" ++BIND++ oc ++ v2.s!R_i ++ obj1 ++ obj2 ;
            False => "unga" ++BIND++ v2.s!R_i ++ obj1 ++ obj2
          }
        } ;
        Pl => table {
          Pos => case np1.proDrop of {
            True => oc ++ v2.s!R_e ++BIND++"ni" ++ obj1 ++ obj2 ;
            False => v2.s!R_a ++BIND++"ni" ++ obj1 ++ obj2
          } ;
          Neg => case np1.proDrop of {
            True => "ninga" ++BIND++ oc ++ v2.s!R_i ++ obj1 ++ obj2 ;
            False => "ninga" ++BIND++ v2.s!R_i ++ obj1 ++ obj2
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
          Pos => "uku" ++BIND++ inf_oc ++ v2.s!R_a ++ obj1 ++ obj2 ;
          Neg => "uku" ++BIND++ "nga" ++BIND++ inf_oc ++ v2.s!R_i ++ obj1 ++ obj2
        } ;
        NReduced | NPoss => table {
          Pos => "ku" ++BIND++ inf_oc ++ v2.s!R_a ++ obj1 ++ obj2 ;
          Neg => "ku" ++BIND++ "nga" ++BIND++ inf_oc ++ v2.s!R_i ++ obj1 ++ obj2
        } ;
        NLoc => table {
          Pos => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++ "uku"++BIND++inf_oc ++ v2.s!R_a ++ obj1 ++ obj2 ;
          Neg => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++ "uku"++BIND++"nga"++BIND++inf_oc ++ v2.s!R_a ++ obj1 ++ obj2
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_no_oc = verb_prefix_no_oc vform False v2.r a Null v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform False a Null ;
          tp = tensePref vform v2.r v2.syl ; -- [] / zo- / zuku-
          r = v2.s!(rform vform False) ; -- bona / boni
        in case np1.proDrop of {
          True => vpref_with_oc ++ tp ++ oc ++ r ++ obj1 ++ obj2 ;
          False => vpref_no_oc ++ tp ++ r ++ obj1 ++ obj2
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
          vpref_with_oc = verb_prefix_with_oc vform l a s ;
          tp = tensePref vform v2.r v2.syl ; -- [] / zo- / zuku-
          -- oc = objConc np.agr v2.r v2.syl ; -- [] / m -
          -- longform = case np.heavy of {
          --   True => False ;
          --   False => True
          -- } ;
          r = v2.s!(rform (VFIndic MainCl p t) l) ; -- bona / boni
          -- obj = np.s!NFull -- [] / inkomo
        in case np.proDrop of {
          True => vpref_with_oc ++ tp ++ oc ++ r ++ obj ++ vp.inf_s!NFull!Pos ;
          False => vpref_no_oc ++ tp ++ r ++ obj ++ vp.inf_s!NFull!Pos
        } ;
        RelCl => \\a,p,t,s,l => let
          vform = (VFIndic RelCl p t) ;
          rc = relConc vform a v2.r ; -- o- / onga-
          tp = tensePref vform v2.r v2.syl ; -- [] / zo- / zuku-
          -- oc = objConc np.agr v2.r v2.syl ; -- [] / m -
          -- longform = case np.heavy of {
          --   True => False ;
          --   False => True
          -- } ;
          r = v2.s!(rform vform l) ; -- bona / boni
          -- obj = np.s!NFull -- [] / inkomo
        in case np.proDrop of {
          True => rc ++ tp ++ oc ++ r ++ obj ++ vp.inf_s!NFull!Pos ;
          False => rc ++ tp ++ r ++ obj ++ vp.inf_s!NFull!Pos
        }
      } ;
      imp_s = table {
        Sg => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++ obj ++ vp.inf_s!NFull!Pos ;
            False => v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos
          } ;
          Neg => case np.proDrop of {
            True => "unga" ++BIND++ oc ++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos ;
            False => "unga" ++BIND++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos
          }
        } ;
        Pl => table {
          Pos => case np.proDrop of {
            True => oc ++ v2.s!R_e ++BIND++"ni" ++ obj ++ vp.inf_s!NFull!Pos ;
            False => v2.s!R_a ++BIND++"ni" ++ obj ++ vp.inf_s!NFull!Pos
          } ;
          Neg => case np.proDrop of {
            True => "ninga" ++BIND++ oc ++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos ;
            False => "ninga" ++BIND++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos
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
          Pos => "uku" ++BIND++ inf_oc ++ v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos ;
          Neg => "uku" ++BIND++ "nga" ++BIND++ inf_oc ++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos
        } ;
        NReduced | NPoss => table {
          Pos => "ku" ++BIND++ inf_oc ++ v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos ;
          Neg => "ku" ++BIND++ "nga" ++BIND++ inf_oc ++ v2.s!R_i ++ obj ++ vp.inf_s!NFull!Pos
        } ;
        NLoc => table {
          Pos => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++ "uku"++BIND++inf_oc ++ v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos ;
          Neg => "ku"++BIND++poss_pron_stem!(Third C15 Sg) ++ "uku"++BIND++"nga"++BIND++inf_oc ++ v2.s!R_a ++ obj ++ vp.inf_s!NFull!Pos
        }
      } ;
      consubj_s = \\m,a,p => let 
          vform = case m of {
            ConsecCl => VFConsec p ;
            SubjCl => VFSubjunct p 
          } ;
          vpref_no_oc = verb_prefix_no_oc vform False v2.r a Null v2.syl ;
          vpref_with_oc = verb_prefix_with_oc vform False a Null ;
          tp = tensePref vform v2.r v2.syl ; -- [] / zo- / zuku-
          r = v2.s!(rform vform False) ; -- bona / boni
        in case np.proDrop of {
          True => vpref_with_oc ++ tp ++ oc ++ r ++ obj ++ vp.inf_s!NFull!Pos ;
          False => vpref_no_oc ++ tp ++ r ++ obj ++ vp.inf_s!NFull!Pos
        } ;
      iadv, advs, comp = [] ;
      ap_comp = \\_ => [] ;
      hasComp = True ;
      r = v2.r ;
      syl = v2.syl ;
      vptype = VNPCompl
    } ;

--     ComplV2V v np vp =
--       insertObj (\\a => infVP v.isAux vp False Simul CPos a)
--         (insertObj (\\_ => v.c2 ++ np.s ! Acc) (predV v)) ;
--     ComplV2S v np s =
--       insertObj (\\_ => conjThat ++ s.s)
--         (insertObj (\\_ => v.c2 ++ np.s ! Acc) (predV v)) ;
--     ComplV2Q v np q =
--       insertObj (\\_ => q.s ! QIndir)
--         (insertObj (\\_ => v.c2 ++ np.s ! Acc) (predV v)) ;
--     ComplV2A v np ap =
--       insertObj (\\_ => v.c2 ++ np.s ! Acc ++ ap.s ! np.a) (predV v) ;
--
--     ReflV2 v = insertObj (\\a => v.c2 ++ reflPron ! a) (predV v) ;
--
-- -- from Sentence 19/4/2008
--
--     SlashV2 np v2 =
--       mkClause (np.s ! Nom) np.a (predV v2) ** {c2 = v2.c2} ;
--
--     SlashVVV2 np vv v2 =
--       mkClause (np.s ! Nom) np.a
--         (insertObj (\\a => infVP vv.isAux (predV v2) False Simul CPos a) (predVV vv))  **
--         {c2 = v2.c2} ;
--
-- -- from Noun 19/4/2008
--
--     NumInt n = {s = n.s ; n = Pl} ;
--     OrdInt n = {s = n.s ++ "th"} ; --- DEPRECATED
--
--     DetSg quant ord = {
--       s = quant.s ! Sg ++ ord.s ;
--       n = Sg
--       } ;
--
--     DetPl quant num ord = {
--       s = quant.s ! num.n ++ num.s ++ ord.s ;
--       n = num.n
--       } ;
--
--     NoNum = {s = []; n = Pl } ;
--
--     DefArt = {s = \\_ => artDef} ;
--
--     IndefArt = {
--       s = table {
--         Sg => artIndef ;
--         Pl => []
--         }
--       } ;
--
--     MassDet = {s = \\_ => []} ;
--
--
--
-- -- from Structural 19/4/2008
--
--     that_NP = regNP "that" Sg ;
--     these_NP = regNP "these" Pl ;
--     this_NP = regNP "this" Sg ;
--     those_NP = regNP "those" Pl ;

}
