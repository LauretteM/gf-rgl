abstract PChunk = Cat, CatSBantu, Symbol [Symb] ** {

cat
  Chunks ;
  Chunk ;
  Chunk_Phr ;
  Chunk_AP ;
  Chunk_Adv ;
  Chunk_Imp ;
  Chunk_S ;
  Chunk_RS ;
  Chunk_QS ;
  Chunk_VP ;
  Chunk_V ;
  Chunk_CN ;
  Chunk_NP ;
  Chunk_N ;
  Chunk_Predet ;
  Chunk_Postdet ;
  Chunk_Symb ;
  VC ;

fun
  OneChunk : Chunk -> Chunks ;
  PlusChunk : Chunk -> Chunks -> Chunks ;
  ChunkPhr : Chunks -> Phr ;

  Phr_Chunker : Chunk_Phr -> Chunk ;
  -- AP_Chunker : Chunk_AP -> Chunk ;
  Adv_Chunker : Chunk_Adv -> Chunk ;
  Imp_Chunker : Chunk_Imp -> Chunk ;
  S_Chunker : Chunk_S -> Chunk ;
  RS_Chunker : Chunk_RS -> Chunk ;
  QS_Chunker : Chunk_QS -> Chunk ;
  VP_Chunker : Chunk_VP -> Chunk ;
  V_Chunker : Chunk_V -> Chunk ; -- wordnet
  CN_Chunker : Chunk_CN -> Chunk ;
  NP_Chunker : Chunk_NP -> Chunk ;
  N_Chunker : Chunk_N -> Chunk ;
  Predet_Chunker : Chunk_Predet -> Chunk ;
  Postdet_Chunker : Chunk_Postdet -> Chunk ;
  Symb_Chunker : Chunk_Symb -> Chunk ;

  Phr_Chunk : Phr -> Chunk_Phr ;
  AP_Chunk  : AP  -> Chunk_AP ;
  Adv_Chunk : Adv -> Chunk_Adv ;
  Imp_Sg_Pos_Chunk : Imp -> Chunk_Imp ;
  Imp_Sg_Neg_Chunk : Imp -> Chunk_Imp ;
  Imp_Pl_Pos_Chunk : Imp -> Chunk_Imp ;
  Imp_Pl_Neg_Chunk : Imp -> Chunk_Imp ;
  S_Chunk      : S   -> Chunk_S ;
  RS_Chunk     : Pron -> RS -> Chunk_RS ;
  QS_Chunk     : QS  -> Chunk_QS ;
  VP_RelYo_Chunk : Temp -> Pol -> Pron -> VP -> Chunk_VP ;
  VP_Rel_Chunk : Temp -> Pol -> Pron -> VP -> Chunk_VP ;
  VP_Main_Chunk : Temp -> Pol -> Pron -> VP -> Chunk_VP ;
  VP_Main_Short_Chunk : Temp -> Pol -> Pron -> VP -> Chunk_VP ;
  VP_Inf_Chunk : Pol -> VP -> Chunk_VP ;
  V_a_Chunk : V -> Chunk_V ;
  V_ile_Chunk : V -> Chunk_V ;
  V_e_Chunk : V -> Chunk_V ;
  V_i_Chunk : V -> Chunk_V ;
  V_anga_Chunk : V -> Chunk_V ;
  CN_Pl_Chunk  : CN -> Chunk_CN ;
  CN_Sg_Chunk  : CN -> Chunk_CN ;
  NP_Nom_Chunk : NP -> Chunk_NP ;
  NP_Nom_Reduced_Chunk : NP -> Chunk_NP ;
  NP_Loc_Chunk : NP -> Chunk_NP ;
  NP_Gen_Chunk : Pron -> NP -> Chunk_NP ;
  NP_PossLoc_Chunk : Pron -> NP -> Chunk_NP ;
  -- NP_Gen_Chunk : NP -> Chunk_NP ;
  Predet_Chunk : Pron -> Predet -> Chunk_Predet ;
  Postdet_Chunk : Pron -> Postdet -> Chunk_Postdet ;
  N_Sg_Chunk : N -> Chunk_N ;
  N_Pl_Chunk : N -> Chunk_N ;

-- for unknown words that are not names

  Symb_Chunk : Symb -> Chunk_Symb ;

-- chunks for punctuation marks
  fullstop_Chunk : Chunk ;
  exclmark_Chunk : Chunk ;
  questmark_Chunk : Chunk ;
  comma_Chunk : Chunk ;
  colon_Chunk : Chunk ;
  semicolon_Chunk : Chunk ;
  quote_Chunk : Chunk ;
  lpar_Chunk : Chunk ;
  rpar_Chunk : Chunk ;
  dash_Chunk : Chunk ;

}
