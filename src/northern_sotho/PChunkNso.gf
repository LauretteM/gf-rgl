concrete PChunkNso of PChunk = CatNso, CatSBantuNso, SymbolNso [Symb] **
  open
    Prelude, ResNso, ParamX,
    (R = ResNso), (P = ParadigmsNso) in {

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
    AP_Chunker c = c ;
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
    AP_Chunk pron ap = {
      s = pron.s!Absolute ++ case pron.a of {
      Third C9_10 _ => ap.s!AF2 ;
      Third C7_8 Pl => ap.s!AF2 ;
      (First _ | Second _ | Third _ _) => ap.s!AF1
      } 
    } ;
    Adv_Chunk a = { s = a.s } ;
    Imp_Sg_Pos_Chunk i = { s = i.s!Sg!Pos } ;
    Imp_Sg_Neg_Chunk i = { s = i.s!Sg!Neg } ;
    Imp_Pl_Pos_Chunk i = { s = i.s!Pl!Pos } ;
    Imp_Pl_Neg_Chunk i = { s = i.s!Pl!Neg } ;
    S_Chunk s = { s = s.s!IndicMS } ;
    RS_Chunk pron rs = { s = pron.s!Absolute ++ rs.s!pron.a } ;
    QS_Chunk s = { s = nonExist } ;
    VP_RelYo_Chunk temp pol pron vp = {
      s = temp.s ++ pol.s ++ pron.s!Absolute ++ vp.s!RelCl!pron.a!pol.p!temp.t!True
    } ;
    VP_Rel_Chunk temp pol pron vp = {
      s = temp.s ++ pol.s ++ pron.s!Absolute ++ vp.s!RelCl!pron.a!pol.p!temp.t!False
    } ;
    VP_Main_Chunk temp pol pron vp = {
      s = temp.s ++ pol.s ++ pron.s!Absolute ++ vp.s!IndicCl!pron.a!pol.p!temp.t!False
    } ;
    VP_Main_Short_Chunk temp pol pron vp = {
      s = temp.s ++ pol.s ++ pron.s!Absolute ++ vp.s!IndicCl!pron.a!pol.p!temp.t!True
    } ;
    VP_Inf_Chunk pol vp = {
      s = pol.s ++ vp.inf_s!pol.p
    } ;
    V_a_Chunk v = {
      s = v.s!VPreReg!VS_a
    } ;
    V_ile_Chunk v = {
      s = v.s!VPreReg!VS_ile
    } ;
    V_e_Chunk v = {
      s = v.s!VPreReg!VS_e
    } ;
    V_i_Chunk v = {
      s = nonExist
    } ;
    V_anga_Chunk v = {
      s = nonExist
    } ;
    CN_Sg_Chunk cn = {
      s = cn.s!Sg!Absolute
    } ;
    CN_Pl_Chunk cn = {
      s = cn.s!Pl!Absolute
    } ;
    NP_Nom_Chunk np = {
      s = np.s!Absolute
    } ;
    NP_Nom_Reduced_Chunk np = {
      s =
          nonExist
    } ;
    NP_Loc_Chunk np = {
      s = np.s!Locative
    } ;
    NP_Gen_Chunk pron np = let
      cg = case pron.a of {
        First _ | Second _ => C1_2 ;
        Third c _ => c 
      } ;
      num = case pron.a of {
        First n => n ;
        Second n => n ;
        Third _ n => n
      }
    in {
      s = pron.s!Absolute ++ (possConc cg num) ++ np.s!Possessive
    } ;

    NP_PossLoc_Chunk pron np = let
    cg = case pron.a of {
        First _ | Second _ => C1_2 ;
        Third c _ => c 
      } ;
      num = case pron.a of {
        First n => n ;
        Second n => n ;
        Third _ n => n
      }
    in {
      s = pron.s!Absolute ++ (possConc cg num) ++ np.s!Locative
    } ;

    AP_Mod_Chunk pron ap = {
      s = pron.s!Absolute ++ compl_ap ap pron.a  
    } ;

    Predet_Chunk pron predet = {
      s = pron.s!Absolute ++ predet.s!pron.a
    } ;
    Postdet_Chunk pron postdet = {
      s = pron.s!Absolute ++ postdet.s!pron.a
    } ;
    N_Sg_Chunk n = {
      s = n.s!Sg!Absolute
    } ;
    N_Pl_Chunk n = {
      s = n.s!Pl!Absolute
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
