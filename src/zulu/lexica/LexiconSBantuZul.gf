concrete LexiconSBantuZul of LexiconSBantu = CatZul ** open ResZul,ParadigmsZul in {

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
   

   animal_N = mkN "lwane" C7_8 ; -- lwane_7_8
   apple_N = mkN "hhabhula" C5_6 ;
   axe_N = mkN "bazo" C9_10 ;
   badness_N = mkN "bi" C14 ;
   beauty_N = mkN "hle" C14 ;
   book_N = mkN "ncwadi" C9_10 ; -- ncwadi_9_10
   boy_N = mkN "fana" C1_2 ; -- fana 1 2
   branch_N = mkN "hlahla" C7_8 ; -- hlahla_7_8
   -- bravery_N = mkN "" C1_2 ;
   bridge_N = mkN "" C1_2 ; -- leporogo
   calf_N = mkN "nkonyana" C5_6 ; -- nkonyana_5_6
   capital_N = mkN "hlokodolobha" C9_10 ;
   -- car_2_N = mkN "" C1_2 ;
   car_N = mkN "moto" C9_10 ; -- moto_9_10
   child_N = mkN "ntwana" C1_2 ;
   cleverness_N = mkN "qili" C14 ;
   cloud_N = mkN "fu" C5_6 ;
   cow_N = mkN "komo" C9_10 ; -- komo_9_10
   danger_N = mkN "ngozi" C9_10 ;
   day_N = mkN "suku" C11_10 ;
   doctor_N = mkN "dokotela" C1a_2a ;
   dog_N = mkN "nja" C9_10 ;
   door_N = mkN "cabha" C7_8 ;
   farmer_N = mkN "limi" C1_2 ;
   father_N = mkN "baba" C1a_2a ;
   field_N = mkN "simu" C9_6 ;
   food_N = mkN "dla" C15 ;
   foot_N = mkN "nyawo" C11_10 ;
   friend_N = mkN "ngane" C9_10 ; -- ngane_9_10
   girl_2_N = mkN "ntombazana" C9_6 ;
   girl_N = mkN "tombi" C9_10 ; -- tombi_9_10
   gold_N = mkN "golide" C5_6 ;
   -- greatness_N = mkN "" C1_2 ;
   herdboy_N = mkN "umalusi" "kumalusi" "abelusi" "kubelusi" C1_2 ;
   hill_N = mkN "gquma" C5_6 ;
   home_N = mkELocN "khaya" C5_6 ;
   horse_N = mkN "hhashi" C5_6 ;
   house_N = mkN "ndlu" C9_10 ; -- ndlu_9_10
   injury_N = mkN "ngozi" C9_10 ;
   jail_N = mkN "jele" C5_6 ; -- jele_5_6
   king_N = mkN "khosi" C9_6 ;
   kitchen_N = mkN "khishi" C5_6 ;
   knife_N = mkN "mese" C3_4 ;
   kraal_N = mkN "zi" C3_4 ;
   lecturer_N = mkN "fundisi" C1_2 ;
   letter_N = mkN "ncwadi" C9_10 ;
   lion_N = mkN "bhubesi" C5_6 ; -- bhubesi_5_6
   majority_N = mkN "ningi" C5_6 ;
   man_N = mkN "doda" C9_10 ; -- doda_9_10
   meat_N = mkN "nyama" C9_10 ;
   medal_N = mkN "dondo" C9_10 ;
   milk_N = mkN "bisi" C11_10 ;
   money_N = mkN "mali" C5_6 ;
   mosquito_N = mkN "miyane" C1a_2a ;
   mountain_N = mkN "taba" C9_10 ; -- taba_9_10
   old_man_N = mkN "xhegu" C5_6 ;
   old_woman_N = mkN "alukazi" C7_8 ;
   owl_N = mkN "khova" C7_8 ; -- khova_7_8
   page_N = mkN "khasi" C5_6 ;
   pastor_N = mkN "fundisi" C1_2 ;
   pedi_N = mkN "Pedi" C7_8 ;
   person_N = mkN "ntu" C1_2 ; -- ntu 1 2
   pleasantness_N = mkN "mnandi" C14 ;
   pocket_N = mkN "khukhu" C5_6 ;
   policeman_N = mkN "phoyisa" C5_6 ; -- phoyisa_5_6
   Polokwane_N = mkLN "Polokwane" ;
   possession_N = mkN "phahla" C9_10 ;
   pot_N = mkN "bhodwe" C5_6 ;
   power_N = mkN "andla" C5_6 ;
   Pretoria_N = mkN "Pretoria" ;
   pumpkin_porridge_N = mkN "dudu" C7_8 ;
   residence_N = mkN "khaya" C5_6 ;
   road_N = mkN "gwaqo" C3_4 ;
   room_N = mkN "gumbi" C5_6 ;
   school_N = mkN "kole" C7_8 ;
   shop_N = mkN "tolo" C7_8 ;
   sister_N = mkN "sisi" C1a_2a ;
   speed_N = mkN "jubane" C5_6 ;
   student_N = mkN "fundi" C1_2 ; -- fundi 1 2
   sun_N = mkN "langa" C5_6 ;
   -- sunset_N = mkN "" C1_2 ;
   swimmer_N = mkN "hlambi" C9_10 ;
   table_N = mkN "tafula" C5_6 ;
   tail_N = mkN "sila" C3_4 ; -- sila_3_4
   teacher_N = mkN "thisha" C1a_2a ;
   thief_N = mkN "ebi" C7_8 ;
   time_N = mkN "khathi" C7_8 ;
   train_N = mkN "timela" C7_8 ;
   tree1_N = mkN "thi" C3_4 ;
   tree2_N = mkN "hlahla" C7_8 ;
   uncle_N = mkN "malume" C1a_2a ;
   vegetable_N = mkN "bhido" C3_4 ;
   vehicle_N = mkN "moto" C9_10 ;
   village_N = mkN "zi" C3_4 ;
   water_N = mkN "nzi" C5_6 ;
   weight_N = mkN "nzima" C14 ;
   -- what_N = mkN "" C1_2 ;
   -- who_N = mkN "" C1_2 ;
   wisdom_N = mkN "hlakanipho" C9_10 ;
   woman_N = mkN "fazi" C1_2 ;
   wood_N = mkN "khuni" C11_10 ;
   work_N = mkN "sebenzi" C3_4 ;
   world_N = mkN "hlaba" C3_4 ;
   young_man_N = mkN "nsizwa" C9_10 ;

   Tatjana_PN = mkPN "Tatjana" C1a_2a ;
   John_PN = mkPN "John" C1a_2a ;

   -- verb roots

   -- ask_V2 : V2 ;
   -- ask_V3 : V3 ;
   -- ask_V : V ;
   -- bark_V : V ;
   -- be_broken_V : V ;
   be_fast_V = mkV "shes" ;
   be_healthy_V = mkV "phil" ;
   be_hot_V = mkV "shis" ;
   -- be_ill_V : V ;
   -- be_lazy_V : V ;
   -- boil_V2 : V2 ;
   -- boil_V : V ;
   -- build_V2 : V2 ;
   burn_V = mkV "sh" ;
   -- burn_2_V : V ; -- sh
   -- buy_V2 : V2 ;
   -- call_V2 : V2 ;
   -- come_V : V ;
   -- cook_V2 : V2 ;
   -- cook_V3 : V3 ;
   -- cook_V : V ;
   -- cross_over_V : V ;
   -- cross_over_V2 : V2 ;
   descend_V = mkV "ehl" ;
   die_V = mkV "f" ;
   -- donate_V2 : V2 ;
   -- do_V2 : V2 ;
   -- drink_V2 : V2 ;
   -- drink_V : V ;
   -- dry_V2 : V2 ;
   -- dry_V : V;
   -- earn_V2 : V2 ;
   -- eat_V : V ;
   -- eat_V2 : V2 ;
   -- exhaust_V2 : V2 ;
   -- exhaust_V : V ;
   -- fall_towards_V2 : V2 ;
   -- fall_V : V ;
   -- flee_V : V ;
   -- fly_V : V ;
   -- get_thin_V : V ;
   -- give_V2 : V2 ;
   -- give_V3 : V3 ;
   -- go_2_V : V ;
   -- go_V : V ;
   -- happen_V : V ;
   -- help_V2 : V2 ;
   -- insert_V2 : V2 ;
   -- insert_V2 : V2 ;
   jump_V = mkV "eq" ;
   -- kill_V2 : V2 ;
   -- know_V2 : V2 ;
   -- know_VS : VS ;
   -- know_V : V ;
   -- live_V : V ;
   -- lock_V2 : V2 ;
   -- love_V2 : V2 ;
   -- pack_V2 : V2 ;
   -- place_V2 : V2 ;
   -- play_V2 : V2 ;
   -- play_V : V ;
   -- plough_V2 : V2 ;
   -- point_at_V : V ;
   -- point_at_V2 : V2 ;
   -- pour_into_V3 : V3 ;
   -- pour_V2 : V2 ;
   -- put_into_V2 : V2 ;
   -- read_V2 : V2 ;
   -- read_VS : VS ;
   -- read_V : V ;
   -- receive_V2 : V2 ;
   -- remember_V2 : V2 ;
   -- return2_V : V ;
   -- return_to_V : V ;
   -- return_V : V ;
   -- run_V : V ;
   -- run_V2 : V2 ;
   say_VS = mkVS "th" "thi" SInd ;
   say_2_VS = mkVS "sh" "sho" SInd ;
   see_V2 = mkV2 "bon" ;
   see_VS = mkVS "bon" SInd ;
   -- sell_to_each_other_V2 : V2 ;
   -- sell_V2 : V2 ;
   -- sell_V : V ;
   -- set_V : V ;
   share_V = mkV "ab" ;
   share_V2 = mkV2 "ab" ;
   -- share_with_each_other_V2 : V2 ; --aban
   -- share_with_each_other_V : V ; -- aban
   -- sit_V : V ;
   -- sleep_V : V;
   -- speak_V2 : V2 ;
   -- speak_V : V ;
   -- stay_V : V ;
   -- steal_V : V ;
   -- surprise_V2 : V2 ;
   -- take_away_V2 : V2 ;
   -- thank_V : V ;
   -- teach_V : V ;
   -- teach_V2 : V2 ;
   -- transfer_V2 : V2 ;
   -- try_V : V ;
   -- try_VV : VV ;
   -- turn_back_V : V ;
   -- understand_V2 : V2 ;
   -- understand_V : V ;
   -- use_V2 : V2 ;
   -- use_V2V : V2V ;
   -- visit_V2 : V2 ;
   -- visit_V : V ;
   -- wake_up_V : V ;
   walk_V = mkV "hamb" ;
   -- want_V2 : V2 ;
   -- want_VS : VS ;
   -- want_V : V ;
   -- want_VV : VV ;
   win_V2 = mkV2 "zuz" ;
   -- work_V : V ;
   -- write_V : V ;
   -- write_V2 : V2 ;
   write_V3 = mkV3 "bhal" ;

   above_Adv = mkAdv "ngaphezu" ;
   very_AdA = { s = "kakhulu" } ;

   there_Adv = mkAdv "lapho" ;
}
