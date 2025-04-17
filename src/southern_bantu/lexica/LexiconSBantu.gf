abstract LexiconSBantu = Cat ** {

   fun
   -- adjective stems
   bad_A : A ; -- bi
   big_A : A ; -- khulu
   many_A : A ; -- many
   old_A : A ; -- dala
   pretty_A : A ; -- hle
   tall_A : A ; -- de
   two_A : A ; -- bili
   ugly_A : A ; -- bana
   small_A : A ;
   how_much_A : A ;
   other_A : A ;
      
   -- relative stems
   black_R : A ; -- mnyama
   few_R : A ; -- mbalwa
   heavy_R : A ; -- nzima
   honest_R : A ; -- qotho
   tasty_R : A ; -- mnandi
   nice_R : A ; -- mnandi
   white_R : A ; -- mhlophe
   green_R : A ;
   dangerous_A : A ;

   -- enumerative stems
   different_Enum : A ; -- mbe
   which_Enum : A ; -- nso: -fe
   one_Enum : A ; -- nso: -tee
   cruel_Enum : A ; -- nso: -šoro

   -- adverbs
   today_Adv : Adv ;
   yesterday_Adv : Adv ;
   well_Adv : Adv ;
   now_Adv : Adv ;
   yesterday_Adv : Adv ;
   well_Adv : Adv ;
   now_Adv : Adv ;
 
   -- -- proper names
   John_PN : PN ;
   Tatjana_PN : PN ;

   -- -- noun stems   
   animal_N : N ; -- lwane_7_8
   apple_N : N ; 
   ax_N : N ;
   badness_N : N ;
   beauty_N : N ;
   book_N : N ; -- ncwadi_9_10
   boy_N : N ; -- fana 1 2
   branch_N : N ; -- hlahla_7_8
   bravery_N : N ; 
   bridge_N : N ; -- leporogo
   calf_N : N ; -- nkonyana_5_6
   capital_N : N ;
   car_2_N : N ;
   car_N : N ; -- moto_9_10
   child_N : N ;
   cleverness_N : N ;
   cloud_N : N ;
   cow_N : N ; -- komo_9_10
   danger_N : N ;
   day_N : N ;
   doctor_N : N ;
   dog_N : N ;
   door_N : N ;
   farmer_N : N ;
   father_N : N ;
   field_N : N ;
   food_N : N ;
   foot_N : N ;
   friend_N : N ; -- ngane_9_10
   girl_2_N : N ;
   girl_N : N ; -- tombi_9_10
   gold_N : N ;
   greatness_N : N ;
   herdboy_N : N ;
   hill_N : N ;
   home_N : N ; -- khaya_5_6
   house_N : N ; -- ndlu_9_10
   injury_N : N ;
   jail_N : N ; -- jele_5_6
   king_N : N ;
   kitchen_N : N ;
   knife_N : N ;
   lecturer_N : N ;
   letter_N : N ;
   lion_N : N ; -- bhubesi_5_6
   majority_N : N ;
   man_N : N ; -- doda_9_10
   meat_N : N ;
   medal_N : N ;
   milk_N : N ;
   money_N : N ;
   mosquito_N : N ;
   mountain_N : N ; -- taba_9_10
   old_man_N : N ;
   old_woman_N : N ;
   owl_N : N ; -- khova_7_8
   page_N : N ;
   pastor_N : N ;
   pedi_N : N ;
   person_N : N ; -- ntu 1 2
   pleasantness_N : N ;
   pocket_N : N ;
   policeman_N : N ; -- phoyisa_5_6
   Polokwane_N : N ;
   possession_N : N ;
   pot_N : N ; 
   power_N : N ;
   Pretoria_N : N ;
   pumpkin_porridge_N : N ;
   residence_N : N ; 
   road_N : N ;
   room_N : N ;
   school_N : N ;
   shop_N : N ;
   sister_N : N ;
   student_N : N ; -- fundi 1 2
   sun_N : N ;
   sunset_N : N ;
   swimmer_N : N ;
   table_N : N ;
   tail_N : N ; -- sila_3_4
   teacher_N : N ;
   thief_N : N ;
   train_N : N ; 
   tree1_N : N ;
   tree2_N : N ;
   uncle_N : N ;
   vegetable_N : N ;
   vehicle_N : N ;
   village_N : N ;
   water_N : N ;
   weight_N : N ;
   what_N : N ;
   who_N : N ;
   wisdom_N : N ;
   woman_N : N ;
   wood_N : N ;
   work_N : N ;
   world_N : N ;
   young_man_N : N ;

   -- -- verb roots
   ask_V2 : V2 ;
   ask_V3 : V3 ;
   ask_V : V ;
   be_broken_V : V ;
   be_fast_V : V ;
   be_healthy_V : V ;
   be_hot_V : V ;
   be_ill_V : V ;
   be_lazy_V : V ;
   boil_V2 : V2 ;
   boil_V : V ;
   build_V2 : V2 ;
   burn_V : V ; 
   burn_2_V : V ; -- sh
   buy_V2 : V2 ; 
   call_V2 : V2 ;
   come_V : V ; 
   cook_V2 : V2 ; 
   cook_V3 : V3 ;
   cook_V : V ; 
   descend_V : V ; -- ehl
   die_V : V ; -- f
   donate_V2 : V2 ;
   do_V2 : V2 ;
   drink_V2 : V2 ; 
   drink_V : V ; 
   dry_V2 : V2 ; 
   dry_V : V;
   earn_V2 : V2 ;
   eat_V : V ; 
   exhaust_V2 : V2 ; 
   exhaust_V : V ; 
   fall_towards_V2 : V2 ;
   fall_V : V ;
   flee_V : V ;
   fly_V : V ; 
   get_thin_V : V ;
   give_V2 : V2 ; 
   give_V3 : V3 ;
   go_2_V : V ;
   go_V : V ;
   happen_V : V ;
   help_V2 : V2 ;
   insert_V2 : V2 ;
   insert_V2 : V2 ; 
   jump_V : V ; -- eq
   kill_V2 : V2 ;
   know_V2 : V2 ;
   know_VS : VS ;
   know_V : V ;
   live_V : V ;
   lock_V2 : V2 ;
   love_V2 : V2 ; 
   pack_V2 : V2 ;
   place_V2 : V2 ; 
   play_V2 : V2 ;
   play_V : V ;
   plough_V2 : V2 ;
   pour_into_V3 : V3 ;
   pour_V2 : V2 ;
   put_into_V2 : V2 ;
   read_V2 : V2 ; 
   read_VS : VS ;
   read_V : V ;
   receive_V2 : V2 ;
   remember_V2 : V2 ;
   return2_V : V ;
   return_to_V : V ;
   return_V : V ; 
   say_VS : VS ;
   say_2_VS : VS ;
   see_V2 : V2 ; -- bon
   see_VS : VS ;
   sell_to_each_other_V2 : V2 ; 
   sell_V2 : V2 ;
   sell_V : V ;
   set_V : V ;
   share_V2 : V2 ;
   share_V : V ; -- ab
   share_with_each_other_V2 : V2 ; --aban
   share_with_each_other_V : V ; -- aban
   sit_V : V ;
   sleep_V : V;
   speak_V2 : V2 ;
   speak_V : V ;
   stay_V : V ;
   steal_V : V ;
   surprise_V2 : V2 ;
   take_away_V2 : V2 ;
   thank_V : V ;
   transfer_V2 : V2 ;
   try_V : V ;
   try_VV : VV ;
   turn_back_V : V ;
   understand_V2 : V2 ;
   understand_V : V ;
   use_V2 : V2 ; 
   use_V2V : V2V ;
   visit_V2 : V2 ;
   visit_V : V ;
   wake_up_V : V ;
   walk_V : V ; -- hamb
   want_V2 : V2 ;
   want_VS : VS ;
   want_V : V ;
   want_VV : VV ;
   win_V2 : V2 ;
   work_V : V ;
   write_V3 : V3 ;

   -- -- RGL lexicon
  add_V3 : V3 ;
  airplane_N : N ;
  alas_Interj : Interj ;
  already_Adv : Adv ;
  -- animal_N : N ;
  answer_V2S : V2S ;
  apartment_N : N ;
  -- apple_N : N ;
  art_N : N ;
  ashes_N : N ;
  ask_V2Q : V2Q ;
  baby_N : N ;
  back_N : N ;
  -- bad_A : A ;
  bank_N : N ;
  bark_N : N ;
  beautiful_A : A ;
  become_VA : VA ;
  beer_N : N ;
  beg_V2V : V2V ;
  belly_N : N ;
  -- big_A : A ;
  bike_N : N ;
  bird_N : N ;
  bite_V2 : V2 ;
  -- black_A : A ;
  blood_N : N ;
  blow_V : V ;
  blue_A : A ;
  boat_N : N ;
  bone_N : N ;
  -- book_N : N ;
  boot_N : N ;
  boss_N : N ;
  -- boy_N : N ;
  bread_N : N ;
  break_V2 : V2 ;
  breast_N : N ;
  breathe_V : V ;
  broad_A : A ;
  brother_N2 : N2 ;
  brown_A : A ;
  -- burn_V : V ;
  butter_N : N ;
  -- buy_V2 : V2 ;
  camera_N : N ;
  cap_N : N ;
  -- car_N : N ;
  carpet_N : N ;
  cat_N : N ;
  ceiling_N : N ;
  chair_N : N ;
  cheese_N : N ;
  -- child_N : N ;
  church_N : N ;
  city_N : N ;
  clean_A : A ;
  clever_A : A ;
  close_V2 : V2 ;
  -- cloud_N : N ;
  coat_N : N ;
  cold_A : A ;
  -- come_V : V ;
  computer_N : N ;
  correct_A : A ;
  country_N : N ;
  count_V2 : V2 ;
  cousin_N : N ;
  -- cow_N : N ;
  cut_V2 : V2 ;
  -- day_N : N ;
  -- die_V : V ;
  dig_V : V ;
  dirty_A : A ;
  distance_N3 : N3 ;
  -- doctor_N : N ;
  -- dog_N : N ;
  -- door_N : N ;
  -- do_V2 : V2 ;
  -- drink_V2 : V2 ;
  dry_A : A ;
  dull_A : A ;
  dust_N : N ;
  ear_N : N ;
  earth_N : N ;
  easy_A2V : A2 ;
  eat_V2 : V2 ;
  egg_N : N ;
  empty_A : A ;
  enemy_N : N ;
  eye_N : N ;
  factory_N : N ;
  -- fall_V : V ;
  far_Adv : Adv ;
  father_N2 : N2 ;
  fat_N : N ;
  fear_VS : VS ;
  fear_V2 : V2 ;
  feather_N : N ;
  fight_V2 : V2 ;
  find_V2 : V2 ;
  fingernail_N : N ;
  fire_N : N ;
  fish_N : N ;
  float_V : V ;
  floor_N : N ;
  flower_N : N ;
  flow_V : V ;
  -- fly_V : V ;
  fog_N : N ;
  -- foot_N : N ;
  forest_N : N ;
  forget_V2 : V2 ;
  freeze_V : V ;
  fridge_N : N ;
  -- friend_N : N ;
  fruit_N : N ;
  full_A : A ;
  fun_AV : A ;
  garden_N : N ;
  -- girl_N : N ;
  -- give_V3 : V3 ;
  glove_N : N ;
  -- gold_N : N ;
  good_A : A ;
  -- go_V : V ;
  grammar_N : N ;
  grass_N : N ;
  green_A : A ;
  guts_N : N ;
  hair_N : N ;
  hand_N : N ;
  harbour_N : N ;
  hate_V2 : V2 ;
  hat_N : N ;
  head_N : N ;
  heart_N : N ;
  hear_V2 : V2 ;
  heavy_A : A ;
  -- hill_N : N ;
  hit_V2 : V2 ;
  hold_V2 : V2 ;
  hope_VS : VS ;
  horn_N : N ;
  horse_N : N ;
  hot_A : A ;
  -- house_N : N ;
  hunt_V2 : V2 ;
  husband_N : N ;
  ice_N : N ;
  important_A : A ;
  industry_N : N ;
  iron_N : N ;
  john_PN : PN ;
  -- jump_V : V ;
  kill_V2 : V2 ;
  -- king_N : N ;
  knee_N : N ;
  -- know_V2 : V2 ;
  know_VQ : VQ ;
  know_VS : VS ;
  lake_N : N ;
  lamp_N : N ;
  language_N : N ;
  laugh_V : V ;
  leaf_N : N ;
  learn_V2 : V2 ;
  leather_N : N ;
  leave_V2 : V2 ;
  left_Ord : Ord ;
  leg_N : N ;
  lie_V : V ;
  like_V2 : V2 ;
  listen_V2 : V2 ;
  liver_N : N ;
  -- live_V : V ;
  long_A : A ;
  lose_V2 : V2 ;
  louse_N : N ;
  love_N : N ;
  -- love_V2 : V2 ;
  -- man_N : N ;
  married_A2 : A2 ;
  -- meat_N : N ;
  milk_N : N ;
  moon_N : N ;
  mother_N2 : N2 ;
  -- mountain_N : N ;
  mouth_N : N ;
  music_N : N ;
  name_N : N ;
  narrow_A : A ;
  near_A : A ;
  neck_N : N ;
  new_A : A ;
  newspaper_N : N ;
  night_N : N ;
  nose_N : N ;
  -- now_Adv : Adv ;
  number_N : N ;
  oil_N : N ;
  -- old_A : A ;
  open_V2 : V2 ;
  paint_V2A : V2A ;
  paper_N : N ;
  paris_PN : PN ;
  peace_N : N ;
  pen_N : N ;
  -- person_N : N ;
  planet_N : N ;
  plastic_N : N ;
  -- play_V2 : V2 ;
  -- play_V : V ;
  -- policeman_N : N ;
  priest_N : N ;
  probable_AS : A ;
  pull_V2 : V2 ;
  push_V2 : V2 ;
  put_V2 : V2 ;
  queen_N : N ;
  question_N : N ;
  radio_N : N ;
  rain_N : N ;
  rain_V0 : V ;
  -- read_V2 : V2 ;
  ready_A : A ;
  reason_N : N ;
  red_A : A ;
  religion_N : N ;
  restaurant_N : N ;
  right_Ord : Ord ;
  river_N : N ;
  -- road_N : N ;
  rock_N : N ;
  roof_N : N ;
  root_N : N ;
  rope_N : N ;
  rotten_A : A ;
  round_A : A ;
  rubber_N : N ;
  rub_V2 : V2 ;
  rule_N : N ;
  run_V : V ;
  salt_N : N ;
  sand_N : N ;
  -- say_VS : VS ;
  -- school_N : N ;
  science_N : N ;
  scratch_V2 : V2 ;
  sea_N : N ;
  seed_N : N ;
  seek_V2 : V2 ;
  -- see_V2 : V2 ;
  sell_V3 : V3 ;
  send_V3 : V3 ;
  sew_V : V ;
  sharp_A : A ;
  sheep_N : N ;
  ship_N : N ;
  shirt_N : N ;
  shoe_N : N ;
  -- shop_N : N ;
  short_A : A ;
  silver_N : N ;
  sing_V : V ;
  -- sister_N : N ;
  -- sit_V : V ;
  skin_N : N ;
  sky_N : N ;
  -- sleep_V : V ;
  -- small_A : A ;
  smell_V : V ;
  smoke_N : N ;
  smooth_A : A ;
  snake_N : N ;
  snow_N : N ;
  sock_N : N ;
  song_N : N ;
  -- speak_V2 : V2 ;
  spit_V : V ;
  split_V2 : V2 ;
  squeeze_V2 : V2 ;
  stab_V2 : V2 ;
  stand_V : V ;
  star_N : N ;
  steel_N : N ;
  stick_N : N ;
  stone_N : N ;
  stop_V : V ;
  stove_N : N ;
  straight_A : A ;
  -- student_N : N ;
  stupid_A : A ;
  suck_V2 : V2 ;
  -- sun_N : N ;
  swell_V : V ;
  swim_V : V ;
  switch8off_V2 : V2 ;
  switch8on_V2 : V2 ;
  table_N : N ;
  -- tail_N : N ;
  talk_V3 : V3 ;
  -- teacher_N : N ;
  teach_V2 : V2 ;
  television_N : N ;
  thick_A : A ;
  thin_A : A ;
  think_V : V ;
  throw_V2 : V2 ;
  tie_V2 : V2 ;
  -- today_Adv : Adv ;
  tongue_N : N ;
  tooth_N : N ;
  -- train_N : N ;
  travel_V : V ;
  tree_N : N ;
  turn_V : V ;
  -- ugly_A : A ;
  uncertain_A : A ;
  -- understand_V2 : V2 ;
  university_N : N ;
  -- village_N : N ;
  vomit_V : V ;
  wait_V2 : V2 ;
  -- walk_V : V ;
  warm_A : A ;
  war_N : N ;
  wash_V2 : V2 ;
  watch_V2 : V2 ;
  -- water_N : N ;
  wet_A : A ;
  white_A : A ;
  wide_A : A ;
  wife_N : N ;
  wind_N : N ;
  window_N : N ;
  wine_N : N ;
  wing_N : N ;
  -- win_V2 : V2 ;
  wipe_V2 : V2 ;
  -- woman_N : N ;
  wonder_VQ : VQ ;
  -- wood_N : N ;
  worm_N : N ;
  write_V2 : V2 ;
  year_N : N ;
  yellow_A : A ;
  young_A : A ;

}
