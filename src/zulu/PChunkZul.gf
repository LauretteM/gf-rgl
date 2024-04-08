concrete PChunkZul of PChunk = CatZul, CatExtZul, SymbolZul [Symb] **
  open
    Prelude, ResZul, ParamX,
    (R = ResZul), (P = ParadigmsZul) in {

  -- Chunks are implemented without variants in order to enable recovery of the linearisation

  lincat
    Chunks = {s : Str} ;
    Chunk = {s : Str};
    Chunk_Phr, Chunk_AP, Chunk_Adv, Chunk_Imp, Chunk_S, Chunk_RS, Chunk_QS, Chunk_VP, Chunk_V, Chunk_CN, Chunk_NP, Chunk_N, Chunk_Symb = {s: Str} ;

    VC = V ;

  lin
    OneChunk c = c ;
    PlusChunk c cs = cc2 c cs ;
    ChunkPhr c = ss ("*" ++ c.s) | c ;

    Phr_Chunker c = c ;
    Adv_Chunker c = c ;
    Imp_Chunker c = c ;
    S_Chunker c = c ;
    RS_Chunker c = c ;
    QS_Chunker c = c ;
    VP_Chunker c = c ;
    V_Chunker c = c ;
    CN_Chunker c = c ;
    NP_Chunker c = c ;
    N_Chunker c = c ;
    Predet_Chunker c = c ;
    Postdet_Chunker c = c ;
    Symb_Chunker c = c ;

    Phr_Chunk p = {s = p.s } ;
    Adv_Chunk a = { s = a.s } ;
    Imp_Sg_Pos_Chunk i = { s = i.s!Sg!Pos } ;
    Imp_Sg_Neg_Chunk i = { s = i.s!Sg!Neg } ;
    Imp_Pl_Pos_Chunk i = { s = i.s!Pl!Pos } ;
    Imp_Pl_Neg_Chunk i = { s = i.s!Pl!Neg } ;
    S_Chunk s = { s = s.s!SInd } ;
    RS_Chunk pron rs = { s = pron.s!NFull ++ rs.s!pron.agr } ;
    QS_Chunk s = { s = s.qword_pre ++ s.s ++ s.qword_post } ;
    VP_RelYo_Chunk temp pol pron vp = {
      s = temp.s ++ pol.s ++ pron.s!NFull ++ vp.s!RelCl!pron.agr!pol.p!temp.t!Null!True ++ vp.comp ++ vp.advs
    } ;
    VP_Rel_Chunk temp pol pron vp = {
      s = temp.s ++ pol.s ++ pron.s!NFull ++ vp.s!RelCl!pron.agr!pol.p!temp.t!Null!False ++ vp.comp ++ vp.advs
    } ;
    VP_Main_Chunk temp pol pron vp = {
      s = temp.s ++ pol.s ++ pron.s!NFull ++ vp.s!MainCl!pron.agr!pol.p!temp.t!Null!False ++ vp.comp ++ vp.advs
    } ;
    VP_Main_Short_Chunk temp pol pron vp = {
      s = temp.s ++ pol.s ++ pron.s!NFull ++ vp.s!MainCl!pron.agr!pol.p!temp.t!Null!True ++ vp.comp ++ vp.advs
    } ;
    VP_Inf_Chunk pol vp = {
      s = pol.s ++ vp.inf_s!NFull!pol.p ++ vp.comp ++ vp.advs
    } ;
    V_a_Chunk v = {
      s = v.s!R_a
    } ;
    V_ile_Chunk v = {
      s = v.s!R_ile
    } ;
    V_e_Chunk v = {
      s = v.s!R_e
    } ;
    V_i_Chunk v = {
      s = v.s!R_i
    } ;
    V_anga_Chunk v = {
      s = v.s!R_anga
    } ;
    CN_Sg_Chunk cn = {
      s = cn.s!Sg!NFull
    } ;
    CN_Pl_Chunk cn = {
      s = cn.s!Pl!NFull
    } ;
    NP_Nom_Chunk np = {
      s = np.s!NFull
    } ;
    NP_Nom_Reduced_Chunk np = {
      s =
          np.s!NReduced
    } ;
    NP_Loc_Chunk np = {
      s = np.s!NLoc
    } ;
    NP_Gen_Chunk pron np = let
    i = case np.agr of {
      (First Pl) | (Second Pl) => RI ;
      (First _ | Second _ | Third _ _ ) => np.i
    }
    in {
      s = pron.s!NFull ++ poss_concord_agr!pron.agr!i ++BIND++ np.s!NPoss
    } ;

    NP_PossLoc_Chunk pron np = {
      s = pron.s!NFull ++ poss_concord_agr!pron.agr!RC ++BIND++"s"++BIND++ (loc_NP np)
    } ;
    Predet_Chunk pron predet = {
      s = pron.s!NFull ++ predet.s!pron.agr
    } ;
    Postdet_Chunk pron postdet = {
      s = pron.s!NFull ++ postdet.s!pron.agr
    } ;
    N_Sg_Chunk n = {
      s = n.s!Sg!NFull
    } ;
    N_Pl_Chunk n = {
      s = n.s!Pl!NFull
    } ;

  -- for unknown words that are not names
    Symb_Chunk symb = { s = symb.s } ;

    fullstop_Chunk = sbSS "." ;
    exclmark_Chunk = sbSS "!" ;
    questmark_Chunk = sbSS "?" ;
    comma_Chunk = sbSS "," ;
    colon_Chunk = sbSS ":" ;
    semicolon_Chunk = sbSS ";" ;
    quote_Chunk = variants {sbSS "\"" ; ss ("\"" ++ SOFT_BIND) } ;
    lpar_Chunk = ss ("(" ++ SOFT_BIND) ;
    rpar_Chunk = sbSS ")" ;
    dash_Chunk = sbSS "-" ;

    oper

      sbSS : Str -> SS = \s -> ss (SOFT_BIND ++ s) ;

      bool_vars : Bool = variants { True | False } ;

}
