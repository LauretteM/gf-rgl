concrete DevLexSsw of DevLex = CatSsw ** open ResSsw,ParadigmsSsw in {

   lin
   -- adjective stems
   ugly_A = mkA "bana[zul]" ;
   bad_A = mkA "bi" ;
   two_A = mkA "bili" ;
   old_A = mkA "dzala" ;
   pretty_A = mkA "hle" ;
   big_A = mkA "khulu" ;
   many_A = mkA "nengi" ;
   tall_A = mkA "dze" ;

   -- relative stems
   tasty_A = mkRelA "mnandzi" ;
   heavy_A = mkRelA "ndzima[zul]" ;
   few_A = mkRelA "mbalwa" ;
   honest_A = mkRelA "cotfo" ;
   white_A = mkRelA "mhlophe" ;
   black_A = mkRelA "mnyama" ;

   -- enumerative stems
   different_A = mkA "mbe[zul]" ;
   some_A = mkA "nye" ;

   -- noun stems
   person_N = mkN "ntfu" C1_2 ;
   boy_N = mkN "fana" C1_2 ;
   student_N = mkN "fundzi" C1_2 ;
   lion_N = mkN "bhubesi" C5_6 ;
   policeman_N = mkN "phoyisa" C5_6 ;
   jail_N = mkN "jele" "ejele" "emajele" C5_6 ;
   branch_N = mkN "hlahla" C7_8 ;
   book_N = mkN "bhuku" C5_6 ;
   house_N = mkELocN "khaya" C5_6 ;
   cow_N = mkN "khomo" C9_10 ;
   mountain_N = mkN "ntsaba" C9_10 ;
   friend_N = mkN "ngani" C1_2 ;
   man_N = mkN "doda[zul]" C9_10 ;
   car_N = mkN "moti" C9_10 ;
   John_PN = mkPN "John" C1a_2a ;
   calf_N = mkN "nkhonyane" C5_6 ;
   animal_N = mkN "lwane" C7_8 ;
   tail_N = mkN "sila" C3_4 ;
   owl_N = mkN "khova" C7_8 ;
   girl_N = mkN "ntfombatane" C9_10 ;
   home_N = mkELocN "khaya" C5_6 ;

   Tatjana_PN = mkPN "Tatjana" C1a_2a ;
   medal_N = mkN "dondo" C9_10 ;
   gold_N = mkN "golide" C5_6 ;
   day_N = mkN "suku" C11_10 ;
   swimmer_N = mkN "hlambi" C9_10 ;
   majority_N = mkN "ningi" C5_6 ;

   -- verb roots
   share_V = mkV "abelan" ;
   share_V2 = mkV2 "abelan" ;
   -- aban_V = mkV "aban" ;
   -- aban_V2 = mkV2 "aban" ;
   see_V2 = mkV2 "bon" ;
   walk_V = mkV "hamb" ;
   burn_V = mkV "sh" ;
   say_VS = mkVS "ts" "tsi" ;
   jump_V = mkV "zub" ;
   descend_V = mkV "ehl[zul]" ;
   die_V = mkV "f[zul]" ;

   be_hot_V = mkV "shis[zul]" ;
   be_healthy_V = mkV "phil[zul]" ;
   be_fast_V = mkV "shes[zul]" ;

   win_V2 = mkV2 "phumelel" ;

   above_Adv = mkAdv "ngetulu" ;
   very_AdA = { s = "kakhulu" } ;

   there_Adv = mkAdv "lapho" ;
}
