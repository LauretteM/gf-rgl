concrete DevLexZul of DevLex = CatZul ** open ResZul,ParadigmsZul in {

   lin
   -- adjective stems
   ugly_A = mkA "bana" ;
   bad_A = mkA "bi" ;
   two_A = mkA "bili" ;
   old_A = mkA "dala" ;
   pretty_A = mkA "hle" ;
   big_A = mkA "khulu" ;
   many_A = mkA "ningi" ;
   tall_A = mkA "de" ;

   -- relative stems
   tasty_R = mkRelA "mnandi" ;
   heavy_R = mkRelA "nzima" ;
   few_R = mkRelA "mbalwa" ;
   honest_R = mkRelA "qotho" ;
   white_R = mkRelA "mhlophe" ;
   black_R = mkRelA "mnyama" ;

   -- enumerative stems
   different_A = mkA "mbe" ;
   some_A = mkA "nye" ;

   -- noun stems
   person_N = mkN "ntu" C1_2 ;
   boy_N = mkN "fana" C1_2 ;
   student_N = mkN "fundi" C1_2 ;
   lion_N = mkN "bhubesi" C5_6 ;
   policeman_N = mkN "phoyisa" C5_6 ;
   jail_N = mkN "jele" "ejele" "emajele" C5_6 ;
   branch_N = mkN "hlahla" C7_8 ;
   book_N = mkN "ncwadi" C9_10 ;
   house_N = mkN "ndlu" C9_10 ;
   cow_N = mkN "komo" C9_10 ;
   mountain_N = mkN "taba" C9_10 ;
   friend_N = mkN "ngane" C9_10 ;
   man_N = mkN "doda" C9_10 ;
   car_N = mkN "moto" C9_10 ;
   John_PN = mkPN "John" C1a_2a ;
   calf_N = mkN "nkonyana" C5_6 ;
   animal_N = mkN "lwane" C7_8 ;
   tail_N = mkN "sila" C3_4 ;
   owl_N = mkN "khova" C7_8 ;
   girl_N = mkN "tombi" C9_10 ;
   home_N = mkELocN "khaya" C5_6 ;

   Tatjana_PN = mkPN "Tatjana" C1a_2a ;
   medal_N = mkN "dondo" C9_10 ;
   gold_N = mkN "golide" C5_6 ;
   day_N = mkN "suku" C11_10 ;
   swimmer_N = mkN "hlambi" C9_10 ;
   majority_N = mkN "ningi" C5_6 ;

   -- verb roots
   share_V = mkV "ab" ;
   share_V2 = mkV2 "ab" ;
   -- aban_V = mkV "aban" ;
   -- aban_V2 = mkV2 "aban" ;
   see_V2 = mkV2 "bon" ;
   walk_V = mkV "hamb" ;
   burn_V = mkV "sh" ;
   say_VS = mkVS "th" "thi" SInd ;
   see_VS = mkVS "bon" SInd ;
   jump_V = mkV "eq" ;
   descend_V = mkV "ehl" ;
   die_V = mkV "f" ;

   be_hot_V = mkV "shis" ;
   be_healthy_V = mkV "phil" ;
   be_fast_V = mkV "shes" ;

   win_V2 = mkV2 "zuz" ;

   above_Adv = mkAdv "ngaphezu" ;
   very_AdA = { s = "kakhulu" } ;

   there_Adv = mkAdv "lapho" ;
}
