concrete LexiconMay of Lexicon = CatMay **
  open ParadigmsMay, ResMay in {

----
-- A

-- lin add_V3 = mkV3 "tambah"  ;
lin airplane_N = mkN "kapal terbang" ;
-- lin alas_Interj = mkInterj "" ;
lin already_Adv = mkA "sudah" ;
lin animal_N = mkN "haiwan" ;
-- lin answer_V2S = mkV2S "jawab" ;
lin apartment_N = mkN "pangsapuri" ;
lin apple_N = mkN "epal" ;
lin art_N = mkN "seni" ;
lin ashes_N = mkN "abu" ;
lin ask_V2Q = mkV2 "tanya" ;

----
-- B

lin baby_N = mkN "bayi" Animate ;
lin back_N = mkN "belakang" ;
-- lin bad_A = mkA "" ;
lin bank_N = mkN "bank" ;
-- lin bark_N = mkN "" ;
lin beautiful_A = mkA "cantik" ;
-- lin become_VA = mkVA "jadi" ;
lin beer_N = mkN "bir" ;
-- lin beg_V2V = mkV2 "" ;
-- lin belly_N = mkN "" ;
lin big_A = mkA "besar" ;
lin bike_N = mkN "basikal" ;
lin bird_N = mkN "burung" ;
-- lin bite_V2 = mkV2 "" ;
lin black_A = mkA "hitam" ;
lin blood_N = mkN "darah" ;
-- lin blow_V = mkV "" ;
lin blue_A = mkA "biru" ;
lin boat_N = mkN "perahu" ;
lin bone_N = mkN "tulang" ;
-- lin boot_N = mkN "" ;
-- lin boss_N = mkN "" ;
lin book_N = mkN "buku" ;
-- lin boy_N = mkN "" ;
lin bread_N = mkN "roti" ;
lin break_V2 = mkV4 "patah" "kan"; -- TODO figure out if -kan needs to be separated
-- lin breast_N = mkN "" ;
-- lin breathe_V = mkV "" ;
-- lin broad_A = mkA "" ;
-- lin brother_N2 = mkN "abang" Animate;
-- lin brown_A = mkA "" ;
lin burn_V = mkV "bakar" ;
lin butter_N = mkN "mentega" ;
lin buy_V2 = mkV2 "beli" ;

----
-- C

-- lin camera_N = mkN "" ;
-- lin cap_N = mkN "" ;
lin car_N = mkN "kereta" ;
-- lin carpet_N = mkN "" ;
lin cat_N = mkN "kucing" ;
-- lin ceiling_N = mkN "" ;
-- lin chair_N = mkN "" ;
-- lin cheese_N = mkN "" ;
-- lin child_N = mkN "" ;
-- lin church_N = mkN "" ;
-- lin city_N = mkN "" ;
lin clean_A = mkA "bersih" ;
-- lin clever_A = mkA "" ;
-- lin close_V2 = mkV2 "" ;
lin cloud_N = mkN "awan" ;
-- lin coat_N = mkN "" ;
-- lin cold_A = mkA "" ;
lin come_V = mkV "datang" ;
-- lin computer_N = mkN "" ;
-- lin correct_A = mkA "" ;
-- lin count_V2 = mkV2 "" ;
-- lin country_N = mkN "" ;
-- lin cousin_N = mkN "" ;
lin cow_N = mkN "embu" ;
-- lin cut_V2 = mkV2 "" ;

----
-- D

-- lin day_N = mkN "" ;
-- lin die_V = mkV "" ;
-- lin dig_V = mkV "" ;
-- lin dirty_A = mkA "" ;
-- lin distance_N3 = mkN "" ;
-- lin do_V2 = lin V2 egin_V ;
-- lin doctor_N = mkN "" ;
lin dog_N = mkN "anjing" ;
lin door_N = mkN "pintu" ;
lin drink_V2 = let drink' : V2 = mkV2 "minum" in drink' ** {
  s = \\_ => "minum" ;
};
-- lin dry_A = mkA "" ;
-- lin dull_A = mkA "" ;
-- lin dust_N = mkN "" ;

----
-- E

-- lin ear_N = mkN "" ;
-- lin earth_N = mkN "" ;
lin eat_V2 = let eat' : V2 = mkV2 "makan" in eat' ** {
  s = \\_ => "makan" ;
};
-- lin egg_N = mkN "" ;
-- lin empty_A = mkA "" ;
-- lin enemy_N = mkN "" ;
-- lin eye_N = mkN "" ;

----
-- F

-- lin factory_N = mkN "" ;
-- lin fall_V = mkV "" ;
-- lin far_Adv = mkA "" ;
-- lin fat_N = mkN "" ;
lin father_N2 = mkN2 "bapa" ;
-- lin fear_V2 = mkV2 "" ;
-- lin fear_VS = mkVS "" ;
-- lin feather_N = mkN "" ;
-- lin fight_V2 = mkV2 "" ;
-- lin find_V2 = mkV2 "" ;
-- lin fingernail_N = mkN "" ;
-- lin fire_N = mkN "" ;
-- lin fish_N = mkN "" ;
-- lin float_V = mkV "" ;
-- lin floor_N = mkN "" ;
-- lin flow_V = mkV "" ;
-- lin flower_N = mkN "" ;
-- lin fly_V = mkV "" ;
-- lin fog_N = mkN "" ;
-- lin foot_N = mkN "" ;
-- lin forest_N = mkN "" ;
-- lin forget_V2 = mkV2 "" ;
-- lin freeze_V = mkV "" ;
-- lin fridge_N = mkN "" ;
-- lin friend_N = mkN "" ;
-- lin fruit_N = mkN "" ;
-- lin full_A = mkA "" ;
-- --lin fun_AV

----
-- G

-- lin garden_N = mkN "" ;
-- lin girl_N = mkN "" ;
lin give_V3 = mkV3 (mkV "beri" Meng) emptyPrep datPrep ; -- memberi for living and memberikan for nonliving
-- lin glove_N = mkN "" ;
lin go_V = mkV "pergi" ;
-- lin gold_N = mkN "" ;
-- lin good_A = mkA "" ;
-- lin grammar_N = mkN "" ;
-- lin grass_N = mkN "" ;
lin green_A = mkA "hijau" ;

----
-- H

-- lin hair_N = mkN "" ;
-- lin hand_N = mkN "" ;
-- lin harbour_N = mkN "" ;
-- lin hat_N = mkN "" ;
-- lin hate_V2 = mkV2 "" ;
-- lin head_N = mkN "" ;
-- lin hear_V2 = mkV2 "" ;
-- lin heart_N = mkN "" ;
-- lin heavy_A = mkA "" ;
-- lin hill_N = mkN "" ;
lin hit_V2 = mkV2 "pukul" ;
-- lin hold_V2 = mkV2 "" ;
-- lin hope_VS = mkV "" ;
-- lin horn_N = mkN "" ;
-- lin horse_N = mkN "" ;
-- lin hot_A = mkA "" ;
lin house_N = mkN "rumah" ;
-- lin hunt_V2 = mkV2 "" ;
-- lin husband_N = mkN "" ;

--------
-- I - K

-- lin ice_N = mkN "" ;
-- lin industry_N = mkN "" ;
-- lin iron_N = mkN "" ;
lin john_PN = mkPN "Yohanes" ;
-- lin jump_V = mkV "" ;
-- lin kill_V2 = mkV2 "" ;
lin king_N = mkN "raja" ;
-- lin knee_N = mkN "" ;
-- lin know_V2 = mkV2 "" ;
-- lin know_VQ = mkVQ "" ;
-- lin know_VS = mkV "" ;


----
-- L

-- lin lake_N = mkN "" ;
-- lin lamp_N = mkN "" ;
-- lin language_N = mkN "" ;
-- lin laugh_V = mkV "" ;
-- lin leaf_N = mkN "" ;
lin learn_V2 = mkV2 (prefixV (mkV "ajar" Ber)) emptyPrep ;
-- lin leather_N = mkN "" ;
-- lin leave_V2 = mkV2 "" ;
-- lin leg_N = mkN "" ;
-- lin lie_V = mkV "" ;
lin like_V2 = let like' : V2 = mkV2 "suka" in like' ** {
  s = \\_ => "suka" ;
  passive = "disukai" ;
} ;
-- lin listen_V2 = mkV2 "" ;
-- lin live_V = mkV "";
-- lin liver_N = mkN "" ;
lin long_A = mkA "panjang" ;
-- lin lose_V2 = mkV2 "" ;
-- lin louse_N = mkN "" ;
-- lin love_N = mkN "" ;
-- lin love_V2 = let love' : V2 = mkV2 "cinta" in love' ** {
--   s = \\_ => "mencintai" ;
--   passive = "dicintai" ;
-- } ;
lin love_V2 = mkV4 "cinta" "i";

----
-- M

lin man_N = mkN "lelaki" ;
-- lin married_A2 = mkA "" ;
lin meat_N = mkN "daging" ;
lin milk_N = mkN "susu" ;
-- lin moon_N = mkN "" ;
lin mother_N2 = mkN2 "ibu" ;
-- lin mountain_N = mkN "" ;
-- lin mouth_N = mkN "" ;
-- lin music_N = mkN "" ;

----
-- N

-- lin name_N = mkN "" ;
-- lin narrow_A = mkA "" ;
-- lin near_A = mkA "" ;
-- lin neck_N = mkN "" ;
-- lin new_A = mkA "" ;
-- lin newspaper_N = mkN "" ;
-- lin night_N = mkN "" ;
-- lin nose_N = mkN "" ;
lin now_Adv = mkAdv "sekarang" ;
-- lin number_N = mkN "" ;

--------
-- O - P


-- lin oil_N = mkN "" ;
lin old_A = mkA "tua" ;
lin open_V2 = mkV2 "buka" ;
lin paint_V2A = mkV2 "cat" ;
-- lin paper_N = mkN "" ;
-- lin paris_PN = mkPN "Paris" ;
-- lin peace_N = mkN "" ;
-- lin pen_N = mkN "" ;
lin person_N = mkN "orang" ;
-- lin planet_N = mkN "" ;
-- lin plastic_N = mkN "" ;
-- lin play_V = mkV "" ;
-- lin policeman_N = mkN "" ;
-- lin priest_N = mkN "" ;
-- lin pull_V2 = mkV2 "" ;
-- lin push_V2 = mkV2 "" ;
-- lin put_V2 = mkV2 "" ;

--------
-- Q - R


lin queen_N = mkN "ratu" ;
-- lin question_N = mkN "" ;
-- lin radio_N = mkN "" ;
lin rain_N = mkN "hujan" ;
lin rain_V0 = mkV "hujan" ;
lin read_V2 = mkV2 "baca" ;
-- lin ready_A = mkA "" ;
-- lin reason_N = mkN "" ;
-- lin red_A = mkA "" ;
-- lin religion_N = mkN "" ;
-- lin restaurant_N = mkN "" ;
-- lin river_N = mkN "" ;
-- lin road_N = mkN "" ;
-- lin rock_N = mkN "" ;
-- lin roof_N = mkN "" ;
-- lin root_N = mkN "" ;
-- lin rope_N = mkN "" ;
-- lin rotten_A = mkA "" ;
-- lin round_A = mkA "" ;
-- lin rub_V2 = mkV2 "" ;
-- lin rubber_N = mkN "" ;
lin rule_N = mkN "peraturan" ;
-- lin run_V = mkV "" ;

----
-- S

-- lin salt_N = mkN "" ;
-- lin sand_N = mkN "" ;
-- lin say_VS = mkVS "" ;
lin school_N = mkN "sekolah" ;
lin science_N = mkN "sains" ;
-- lin scratch_V2 = mkV2 "" ;
-- lin sea_N = mkN "" ;
lin see_V2 = mkV2 "lihat" ;
-- lin seed_N = mkN "" ;
-- lin seek_V2 = mkV2 "" ;
-- lin sell_V3 = mkV3 (mkV "jual" Meng) emptyPrep emptyPrep ; -- TODO
-- lin send_V3 = mkV3 "" ;
-- lin sew_V = mkV "" ;
-- lin sharp_A = mkA "" ;
-- lin sheep_N = mkN "" fem ;
-- lin ship_N = mkN "" ;
-- lin shirt_N = mkN "" ;
-- lin shoe_N = mkN "" ;
-- lin shop_N = mkN "" ;
-- lin short_A = mkA "" ;
-- lin silver_N = mkN "" ;
lin sing_V = mkV "nyanyi" ;
-- lin sister_N = mkN "" ;
-- lin sit_V = mkV "" ;
-- lin skin_N = mkN "" ;
-- lin sky_N = mkN "" ;
-- lin sleep_V = mkV "" ;
lin small_A = mkA "kecil" ;
-- lin smell_V = mkV "" ;
-- lin smoke_N = mkN "" ;
-- lin smooth_A = mkA "" ;
-- lin snake_N = mkN "" ;
-- lin snow_N = mkN "" ;
-- lin sock_N = mkN "" ;
lin song_N = mkN "lagu" ;
-- lin speak_V2 = mkV2 "" ;
-- lin spit_V = mkV "" ;
-- lin split_V2 = mkV2 "" ;
-- lin squeeze_V2 = mkV2 "" ;
-- lin stab_V2 = mkV2 "" ;
-- lin stand_V = mkV "" ;
-- lin star_N = mkN "" ;
-- lin steel_N = mkN "" ;
-- lin stick_N = mkN "" ;
-- lin stone_N = mkN "" ;
lin stop_V =  mkV "henti" ;
-- lin stove_N = mkN "" ;
-- lin straight_A = mkA "" ;
-- lin student_N = mkN "" ;
-- lin stupid_A = mkA "" ;
-- lin suck_V2 = mkV2 "" ;
-- lin sun_N = mkN "" ;
-- lin swell_V = mkV "" ;
-- lin swim_V = mkV "" ;

----
-- T


-- lin table_N = mkN "" ;
-- lin tail_N = mkN "" ;
lin talk_V3 = mkV3 (mkV "cakap" Ber) (mkPrep "tentang") (mkPrep "dengan") ;
lin teach_V2 = mkV2 "ajar" ;
-- lin teacher_N = mkN "" ;
-- lin television_N = mkN "" ;
-- lin thick_A = mkA "" ;
-- lin thin_A = mkA "" ;
-- lin think_V = mkV "" ;
-- lin throw_V2 = mkV2 "" ;
-- lin tie_V2 = mkV2 "" ;
-- lin today_Adv = mkA "" ;
-- lin tongue_N = mkN "" ;
-- lin tooth_N = mkN "" ;
-- lin train_N = mkN "" ;
-- lin travel_V = mkV "" ;
-- lin tree_N = mkN "" ;
-- lin turn_V = mkV "" ;

--------
-- U - V

lin ugly_A = mkA "jelek" ;
-- lin uncertain_A = mkA "" ;
-- lin understand_V2 = mkV2 "" ;
-- lin university_N = mkN "" ;
-- lin village_N = mkN "" ;
-- lin vomit_V = mkV2 "" ;

--------
-- W - Y

-- lin wait_V2 = mkV2 "" ;
lin walk_V = mkV "jalan" ;
-- lin war_N = mkN "" ;
-- lin warm_A = mkA "" ;
-- lin wash_V2 = mkV2 "" ;
-- lin watch_V2 = mkV2 "" ;
-- lin water_N = mkNoun "" ;
-- lin wet_A = mkA "" ;
-- lin white_A = mkA "" ;
-- lin wide_A = mkA "" ;
-- lin wife_N = mkN "" ;
-- lin win_V2 = mkV2 "" ;
-- lin wind_N = mkN "" ;
-- lin window_N = mkN "" ;
-- lin wine_N = mkN "" ;
-- lin wing_N = mkN "" ;
-- lin wipe_V2 = mkV2 "" ;
lin woman_N = mkN "perempuan" ;
-- lin wonder_VQ = mkVQ "" ;
-- lin wood_N = mkN "" ;
-- lin worm_N = mkN "" ;
lin write_V2 = mkV2 "tulis" ;
-- lin year_N = mkN "" ;
-- lin yellow_A = mkA "" ;
lin young_A = mkA "muda" ;

}
