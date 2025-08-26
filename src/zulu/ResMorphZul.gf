--# -path=.:../abstract:../common:../../prelude

resource ResZul = open Prelude,Predef,ParamX in {

  param
    ClassGender = C1_2 | C1a_2a | C3_4 | C5_6 | C7_8 | C9_10 | C11_10 | C9_6 | C14 | C15 | C17 ;
    SemanticType = Human | Animate | Misc ;
    NForm = NFull | NReduced | NPoss | NLoc ;
    -- ClForm = ClFull | ClReduced ;
    Agr = First Number | Second Number | Third ClassGender Number ; -- | LocAgr ;

    -- SMood = SIndic | SPot | SSubj ; -- | SConsec ;
    -- DMood = Princ | Part ; -- mood dimension that depends on grammatical context: principal and participial
    CType = MainCl | RelCl ; -- | SitCl ;
    DMType = SubjCl | ConsecCl ;
    Aspect = Null | Prog | Excl ;
    BasicTense = PresTense | FutTense | PastTense | RemFutTense | RemPastTense ;
    -- ImpForm = Imper | Polite ;
    -- Polarity = Pos | Neg ;

    -- NOTE: Although Poulos+Msimang use "verb form" instead of mood,
    -- we use VForm (verb form) to indicate combination of all parameters
    -- regarding the verb, and hence will use use "mood" for convenience.

    -- replacing BasicTense with Tense, just for now
    -- VForm = VFIndic DMood Polarity BasicTense Aspect | VFPot DMood Polarity Aspect | VFSubj Polarity ;
    -- VForm = VFIndic DMood Polarity BasicTense Aspect | VFPot DMood Polarity Aspect | VFSubj Polarity ;
    VForm = VFIndic CType Polarity BasicTense | VFConsec Polarity | VFSubjunct Polarity ;
    VPType = CopIdent | CopAssoc | CopDescr | CopEq | VNPCompl | NoComp | VSCompl | AdvComp | CopLoc ; -- VACompl |
    AuxType = SitAux ; -- TODO: add SubjAux, InfAux, ConsecAux etc (p327)
    AType = AdjType | RelType | EnumType ;
    LocAdvType = KwaAdv | NaAdv ;
    SType = SInd | SSub | SConsec ;

    AForm = AF1 | AF2 | AF3 ; -- two forms for implementing sound changes Poulos+Msimang p143, one for monosyllabic
    SCForm = SC | SCVow | SCNeg | SCNegVow | SCPS | SCPT | SCVowP | SCBe | SCRP | SCSe ;
    OCForm = OC | OCAE | OCIOU | OCMono | OCThing ;
    RCForm = RelC | RelCA ;

    -- verb root characteristics
    RForm = R_a | R_ile | R_e | R_i | R_anga ;
    RInit = RA | RE | RI | RO | RU | RC ;
    Syl = SylMono | SylMult ;
    Voice = Active | Passive ;

    QuantDef = Article Specificity | Demonstrative Distance ;
    -- Definiteness = Indef | Def ;
    Specificity = Spec | Nonspec ;
    Distance = Dem1 | Dem2 | Dem3 ;

  oper

    ADV_KA : Str = "ka[Adv]" ;
    ADV_NGA : Str = "nga[Adv]" ;
    ADV_KHONA : Str = "khona[Adv]" ;
    ADV_LAPHA : Str = "lapha[Adv]" ;
    ADV_NI : Str = "ni[Adv]" ;
    ADV_PHI : Str = "phi[Adv]" ;

    BA : Str = "ba[AuxV]" ;
    BI : Str = "bi[AuxV]" ;
    COP_YI : Str = "yi[CopPre]" ;
    COP_Y : Str = "y[CopPre]" ;
    IMP_YI : Str = "yi[ImpPre]" ;
    IMP_Y : Str = "y[ImpPre]" ;

    IMP_NEG_PREF_SG : Str = "u[SC][2ps]nga[NegPre]" ;
    IMP_NEG_PREF_PL : Str = "ni[SC][2pp]nga[NegPre]" ;

    IMP_NEG_PREF_SG_REDUCED : Str = "u[SC][2ps]ng[NegPre]" ;
    IMP_NEG_PREF_PL_REDUCED : Str = "ni[SC][2pp]ng[NegPre]" ;

    INF_PREF_FULL : Str = "uku[NPre][15]" ;
    INF_PREF_REDUCED : Str = "ku[NPre][15]" ;

    LOC_IMP_SG_POS : Str = "yi[ImpPre]ba[AuxV]" ;
    LOC_IMP_SG_NEG : Str = "u[SC][2ps]nga[NegPre]bi[AuxV]" ;
    -- LOC_IMP_PL_POS : Str = "yi[ImpPre]ba[AuxV]ni[ImpSuf]" ;
    -- LOC_IMP_PL_NEG : Str = "ni[SC][2pp]nga[NegPre]bi[ImpSuf]" ;

    LOC_E : Str = "e[LocPre]" ;

    LOC_KI : Str = "ki[LocPre]" ;
    LOC_KO : Str = "ko[LocPre]" ;
    LOC_KW : Str = "kw[LocPre]" ;
    LOC_KU : Str = "ku[LocPre]" ;

    LOC_S : Str = "s[PreLoc-s]" ;

    LONG_YA : Str = "ya[LongPres]" ;

    NEG_NGA : Str = "nga[NegPre]" ;
    NEG_NG : Str = "ng[NegPre]" ;

    PL_NI : Str = "ni[ImpSuf]" ;

    QUESTION_NA : Str = "na[QPart]" ;

    REFL_PRON : Str = "zi[ReflPre]" ;

    SC_17 : Str = "ku[SC][17]" ;

    TEMP_PREF_FUT : Str = "zo[Fut]" ;
    TEMP_PREF_REMFUT : Str = "yo[Fut]" ;
    TEMP_PREF_FUT_NEG : Str = "zu[FutNeg]" ;
    TEMP_PREF_REMFUT_NEG : Str = "yu[FutNeg]" ;

    TEMP_PREF_PAST : Str = "a[Past]" ;

    PROG_SE = "se[ProgPre]" ;
    PROG_SA = "sa[ProgPre]" ;
    PROG_S = "s[ProgPre]" ;

    EXCL_KA = "ka[ExclNeg]" ;
    EXCL_K = "k[ExclNeg]" ;
    EXCL_SE = "se[ExclPre]" ;
    EXCL_S = "s[ExclPre]" ;

    prefix_nasal_no_tag : Str -> Str = \r -> case r of {
      "ph"+x => "mp" + x ;
      "Ph"+x => "mP" + x ;
      "bh"+x => "mb" + x ;
      "Bh"+x => "mB" + x ;
      (#nasal_de_asp|#nasal_de_asp_cap)+"h"+x => "n"+(take 1 r) + x ;
      "hl"+x => "nhl"+x ;
      "Hl"+x => "Nhl"+x ;
      "h"+x => "nk"+x ;
      "H"+x => "Nk"+x ;
      "sh"+x => "ntsh"+x ;
      "Sh"+x => "Ntsh"+x ;
      "l"+x => "nd"+x ;
      "L"+x => "Nd"+x ;
      #nasal_m+x => "m"+r ;
      #nasal_m_cap+x => "M"+r ;
      #nasal_ng+x => "ng"+r ;
      #nasal_ng_cap+x => "Ng"+r ;
      #nasal+x => r ;
      #nasal_cap+x => r ;
      "p"+x => "mp" + x ;
      "P"+x => "Mp" + x ;
      #vowel_cap+x => "N" + r ;
      #cons_cap+x => "N" + r ;
      _ => "n"+r
    } ;

    prefix_nasal : Str -> ClassGender -> Number -> Str = \r,classgender,number -> let 
      class_tag = noun_prefix_tag classgender number ;
    in 
      case r of {
      "ph"+x => "m[NPre]"+class_tag+"p" + x ;
      "Ph"+x => "m[NPre]"+class_tag+"P" + x ;
      "bh"+x => "m[NPre]"+class_tag+"b" + x ;
      "Bh"+x => "m[NPre]"+class_tag+"B" + x ;
      (#nasal_de_asp|#nasal_de_asp_cap)+"h"+x => "n[NPre]"+class_tag+(take 1 r) + x ;
      "hl"+x => "n[NPre]"+class_tag+"hl"+x ;
      "Hl"+x => "N[NPre]"+class_tag+"hl"+x ;
      "h"+x => "n[NPre]"+class_tag+"k"+x ;
      "H"+x => "N[NPre]"+class_tag+"k"+x ;
      "sh"+x => "n[NPre]"+class_tag+"tsh"+x ;
      "Sh"+x => "N[NPre]"+class_tag+"tsh"+x ;
      "l"+x => "n[NPre]"+class_tag+"d"+x ;
      "L"+x => "N[NPre]"+class_tag+"d"+x ;
      #nasal_m+x => "m[NPre]"+class_tag+r ;
      #nasal_m_cap+x => "M[NPre]"+class_tag+r ;
      #nasal_ng+x => "ng[NPre]"+class_tag+r ;
      #nasal_ng_cap+x => "Ng[NPre]"+class_tag+r ;
      #nasal+x => "[NPre]"+class_tag+r ;
      #nasal_cap+x => "[NPre]"+class_tag+r ;
      "p"+x => "m[NPre]"+class_tag+"p" + x ;
      "P"+x => "M[NPre]"+class_tag+"p" + x ;
      #vowel_cap+x => "N[NPre]"+class_tag+r ;
      #cons_cap+x => "N[NPre]"+class_tag+r ;
      _ => "n[NPre]"+class_tag+r
    } ;
    --------------
    -- PRONOUNS --
    --------------
    -- mkFullPron : Str -> Agr -> { s : NForm => Str ; agr : Agr ; empty : Str ; proDrop : Bool } = \s,agr -> {
    --   s = s ;
    --   agr = agr ;
    --   empty = [] ;
    --   proDrop = False
    -- } ;

    only_QuantPron_table : Agr => Str = table {
        Third C1_2 Sg => "ye[QC][1]dwa[QuantStem]" ;
        Third C1_2 Pl => "bo[QC][2]dwa[QuantStem]" ;
        Third C1a_2a Sg => "ye[QC][1a]dwa[QuantStem]" ;
        Third C1a_2a Pl => "bo[QC][2a]dwa[QuantStem]" ;
        Third C3_4 Sg  => "wo[QC][3]dwa[QuantStem]" ;
        Third C3_4 Pl => "yo[QC][4]dwa[QuantStem]" ;
        Third C5_6 Sg => "lo[QC][5]dwa[QuantStem]" ;
        Third C5_6 Pl => "o[QC][6]dwa[QuantStem]" ;
        Third C7_8 Sg => "so[QC][7]dwa[QuantStem]" ;
        Third C7_8 Pl => "zo[QC][8]dwa[QuantStem]" ;
        Third C9_10 Sg => "yo[QC][9]dwa[QuantStem]" ;
        Third C9_10 Pl => "zo[QC][10]dwa[QuantStem]" ;
        Third C11_10 Sg => "lo[QC][11]dwa[QuantStem]" ;
        Third C11_10 Pl => "zo[QC][10]dwa[QuantStem]" ;
        Third C9_6 Sg => "yo[QC][9]dwa[QuantStem]" ;
        Third C9_6 Pl => "o[QC][6]dwa[QuantStem]" ;
        Third C14 _ => "bo[QC][14]dwa[QuantStem]" ;
        Third C15 _ => "ko[QC][15]dwa[QuantStem]" ;
        Third C17 _ => "ko[QC][17]dwa[QuantStem]" ;
        First Sg => "nge[QC][1ps]dwa[QuantStem]" ;
        First Pl => "so[QC][1pp]dwa[QuantStem]" ;
        Second Sg  => "we[QC][2ps]dwa[QuantStem]" ;
        Second Pl => "no[QC][2pp]dwa[QuantStem]"
    } ;

    all_QuantPron_table : Agr => Str = table {
        Third C1_2 Sg => "wo[QC][1]nke[QuantStem]" ;
        Third C1_2 Pl => "bo[QC][2]nke[QuantStem]" ;
        Third C1a_2a Sg => "wo[QC][1a]nke[QuantStem]" ;
        Third C1a_2a Pl => "bo[QC][2a]nke[QuantStem]" ;
        Third C3_4 Sg  => "wo[QC][3]nke[QuantStem]" ;
        Third C3_4 Pl => "yo[QC][4]nke[QuantStem]" ;
        Third C5_6 Sg => "lo[QC][5]nke[QuantStem]" ;
        Third C5_6 Pl => "o[QC][6]nke[QuantStem]" ;
        Third C7_8 Sg => "so[QC][7]nke[QuantStem]" ;
        Third C7_8 Pl => "zo[QC][8]nke[QuantStem]" ;
        Third C9_10 Sg => "yo[QC][9]nke[QuantStem]" ;
        Third C9_10 Pl => "zo[QC][10]nke[QuantStem]" ;
        Third C11_10 Sg => "lo[QC][11]nke[QuantStem]" ;
        Third C11_10 Pl => "zo[QC][10]nke[QuantStem]" ;
        Third C9_6 Sg => "yo[QC][9]nke[QuantStem]" ;
        Third C9_6 Pl => "o[QC][6]nke[QuantStem]" ;
        Third C14 _ => "bo[QC][14]nke[QuantStem]" ;
        Third C15 _ => "ko[QC][15]nke[QuantStem]" ;
        Third C17 _ => "ko[QC][17]nke[QuantStem]" ;
        First Sg => "nge[QC][1ps]nke[QuantStem]" ;
        First Pl => "so[QC][1pp]nke[QuantStem]" ;
        Second Sg  => "we[QC][2ps]nke[QuantStem]" ;
        Second Pl => "no[QC][2pp]nke[QuantStem]"
    } ;

    mkPron : Agr -> { s : NForm => Str ; agr : Agr ; empty : Str ; proDrop : Bool } = \agr -> {
      s = table {
        NFull => full_pron_stem!agr ;
        NReduced => pron_stem!agr ;
        NPoss => poss_pron_stem!agr ;
        NLoc => case agr of {
          First _ | Second Pl => "ki[PronStem]" ++BIND++ pron_stem!agr ;
          _ => "ku[PronStem]" ++BIND++ pron_stem!agr
        }
      } ;
      agr = agr ;
      empty = [] ;
      proDrop = False
    } ;

    full_pron_stem : Agr => Str = table {
      First Sg => "mi[PronStem][1ps]na[PronSuf]" ;
      First Pl => "thi[PronStem][1pp]na[PronSuf]" ;
      Second Sg => "we[PronStem][2ps]na[PronSuf]" ;
      Second Pl => "ni[PronStem][2pp]na[PronSuf]" ;
      Third C1_2 Sg => "ye[PronStem][1]na[PronSuf]" ;
      Third C1_2 Pl => "bo[PronStem][2]na[PronSuf]" ;
      Third C1a_2a Sg => "ye[PronStem][1a]na[PronSuf]" ;
      Third C1a_2a Pl => "bo[PronStem][2a]na[PronSuf]" ;
      Third C3_4 Sg  => "wo[PronStem][3]na[PronSuf]" ;
      Third C3_4 Pl => "yo[PronStem][4]na[PronSuf]" ;
      Third C5_6 Sg => "lo[PronStem][5]na[PronSuf]" ;
      Third C5_6 Pl => "wo[PronStem][6]na[PronSuf]" ;
      Third C7_8 Sg => "so[PronStem][7]na[PronSuf]" ;
      Third C7_8 Pl => "zo[PronStem][8]na[PronSuf]" ;
      Third C9_10 Sg => "yo[PronStem][9]na[PronSuf]" ;
      Third C9_10 Pl => "zo[PronStem][10]na[PronSuf]" ;
      Third C11_10 Sg => "lo[PronStem][11]na[PronSuf]" ;
      Third C11_10 Pl => "zo[PronStem][10]na[PronSuf]" ;
      Third C9_6 Sg => "yo[PronStem][9]na[PronSuf]" ;
      Third C9_6 Pl => "wo[PronStem][6]na[PronSuf]" ;
      Third C14 _ => "bo[PronStem][14]na[PronSuf]" ;
      Third C15 _ => "kho[PronStem][15]na[PronSuf]" ;
      Third C17 _ => "kho[PronStem][17]na[PronSuf]"
    } ;

    pron_stem : Agr => Str = table {
      First Sg => "mi[PronStem][1ps]" ;
      First Pl => "thi[PronStem][1pp]" ;
      Second Sg => "we[PronStem][2ps]" ;
      Second Pl => "ni[PronStem][2pp]" ;
      Third C1_2 Sg => "ye[PronStem][1]" ;
      Third C1_2 Pl => "bo[PronStem][2]" ;
      Third C1a_2a Sg => "ye[PronStem][1a]" ;
      Third C1a_2a Pl => "bo[PronStem][2a]" ;
      Third C3_4 Sg  => "wo[PronStem][3]" ;
      Third C3_4 Pl => "yo[PronStem][4]" ;
      Third C5_6 Sg => "lo[PronStem][5]" ;
      Third C5_6 Pl => "wo[PronStem][6]" ;
      Third C7_8 Sg => "so[PronStem][7]" ;
      Third C7_8 Pl => "zo[PronStem][8]" ;
      Third C9_10 Sg => "yo[PronStem][9]" ;
      Third C9_10 Pl => "zo[PronStem][10]" ;
      Third C11_10 Sg => "lo[PronStem][11]" ;
      Third C11_10 Pl => "zo[PronStem][10]" ;
      Third C9_6 Sg => "yo[PronStem][9]" ;
      Third C9_6 Pl => "wo[PronStem][6]" ;
      Third C14 _ => "bo[PronStem][14]" ;
      Third C15 _ => "kho[PronStem][15]" ;
      Third C17 _ => "kho[PronStem][17]"
    } ;

    poss_pron_stem : Agr => Str = table {
      First Sg => "mi[PronStem][1ps]" ;
      First Pl => "thu[PronStem][1pp]" ;
      Second Sg => "kho[PronStem][2ps]" ;
      Second Pl => "nu[PronStem][2pp]" ;
      Third C1_2 Sg => "khe[PronStem][1]" ;
      Third C1_2 Pl => "bo[PronStem][2]" ;
      Third C1a_2a Sg => "khe[PronStem][1a]" ;
      Third C1a_2a Pl => "bo[PronStem][2a]" ;
      Third C3_4 Sg  => "wo[PronStem][3]" ;
      Third C3_4 Pl => "yo[PronStem][4]" ;
      Third C5_6 Sg => "lo[PronStem][5]" ;
      Third C5_6 Pl => "wo[PronStem][6]" ;
      Third C7_8 Sg => "so[PronStem][7]" ;
      Third C7_8 Pl => "zo[PronStem][8]" ;
      Third C9_10 Sg => "yo[PronStem][9]" ;
      Third C9_10 Pl => "zo[PronStem][10]" ;
      Third C11_10 Sg => "lo[PronStem][11]" ;
      Third C11_10 Pl => "zo[PronStem][10]" ;
      Third C9_6 Sg => "yo[PronStem][9]" ;
      Third C9_6 Pl => "wo[PronStem][6]" ;
      Third C14 _ => "bo[PronStem][14]" ;
      Third C15 _ => "kho[PronStem][15]" ;
      Third C17 _ => "kho[PronStem][17]"
    } ;

    dem_pron : Distance => Agr => Str = table {
      Dem1 => table {
        First Sg => "lo[Dem][1ps][Pos1]" ;
        First Pl => "laba[Dem][1pp][Pos1]" ;
        Second Sg => "lo[Dem][2ps][Pos1]" ;
        Second Pl => "laba[Dem][2pp][Pos1]" ;
        Third C1_2 Sg => "lo[Dem][1][Pos1]" ;
        Third C1_2 Pl => "laba[Dem][2][Pos1]" ;
        Third C1a_2a Sg => "lo[Dem][1a][Pos1]" ;
        Third C1a_2a Pl => "laba[Dem][2a][Pos1]" ;
        Third C3_4 Sg => "lo[Dem][3][Pos1]" ;
        Third C3_4 Pl => "le[Dem][4][Pos1]" ;
        Third C5_6 Sg => "leli[Dem][5][Pos1]" ;
        Third C5_6 Pl => "la[Dem][6][Pos1]" ;
        Third C7_8 Sg => "lesi[Dem][7][Pos1]" ;
        Third C7_8 Pl => "lezi[Dem][8][Pos1]" ;
        Third C9_10 Sg => "le[Dem][9][Pos1]" ;
        Third C9_10 Pl => "lezi[Dem][10][Pos1]" ;
        Third C11_10 Sg => "lolu[Dem][11][Pos1]" ;
        Third C11_10 Pl => "lezi[Dem][10][Pos1]" ;
        Third C9_6 Sg => "le[Dem][9][Pos1]" ;
        Third C9_6 Pl => "la[Dem][6][Pos1]" ;
        Third C14 _ => "lobu[Dem][14][Pos1]" ;
        Third C15 _ => "lokhu[Dem][15][Pos1]" ;
        Third C17 _ => "lokhu[Dem][17][Pos1]" ;
        LocAgr => "lapha[Dem][Pos1]"
      } ;
      Dem2 => table {
        First Sg => "lowo[Dem][1ps][Pos2]" ;
        First Pl => "labo[Dem][1pp][Pos2]" ;
        Second Sg => "lowo[Dem][2ps][Pos2]" ;
        Second Pl => "labo[Dem][2pp][Pos2]" ;
        Third C1_2 Sg => "lowo[Dem][1][Pos2]" ;
        Third C1_2 Pl => "labo[Dem][2][Pos2]" ;
        Third C1a_2a Sg => "lowo[Dem][1a][Pos2]" ;
        Third C1a_2a Pl => "labo[Dem][2a][Pos2]" ;
        Third C3_4 Sg => "lowo[Dem][3][Pos2]" ;
        Third C3_4 Pl => "leyo[Dem][4][Pos2]" ;
        Third C5_6 Sg => "lelo[Dem][5][Pos2]" ;
        Third C5_6 Pl => "lawo[Dem][6][Pos2]" ;
        Third C7_8 Sg => "leso[Dem][7][Pos2]" ;
        Third C7_8 Pl => "lezo[Dem][8][Pos2]" ;
        Third C9_10 Sg => "leyo[Dem][9][Pos2]" ;
        Third C9_10 Pl => "lezo[Dem][10][Pos2]" ;
        Third C11_10 Sg => "lolo[Dem][11][Pos2]" ;
        Third C11_10 Pl => "lezo[Dem][10][Pos2]" ;
        Third C9_6 Sg => "leyo[Dem][9][Pos2]" ;
        Third C9_6 Pl => "lawo[Dem][6][Pos2]" ;
        Third C14 _ => "lobo[Dem][14][Pos2]" ;
        Third C15 _ => "lokho[Dem][15][Pos2]" ;
        Third C17 _ => "lapho[Dem][17][Pos2]"
      } ;
      Dem3 => table {
        First Sg => "loya[Dem][1ps][Pos3]" ;
        First Pl => "labaya[Dem][1pp][Pos3]" ;
        Second Sg => "loya[Dem][2ps][Pos3]" ;
        Second Pl => "labaya[Dem][2pp][Pos3]" ;
        Third C1_2 Sg => "loya[Dem][1][Pos3]" ;
        Third C1_2 Pl => "labaya[Dem][2][Pos3]" ;
        Third C1a_2a Sg => "loya[Dem][1a][Pos3]" ;
        Third C1a_2a Pl => "labaya[Dem][2a][Pos3]" ;
        Third C3_4 Sg => "loya[Dem][3][Pos3]" ;
        Third C3_4 Pl => "leya[Dem][4][Pos3]" ;
        Third C5_6 Sg => "leliya[Dem][5][Pos3]" ;
        Third C5_6 Pl => "lawaya[Dem][6][Pos3]" ;
        Third C7_8 Sg => "lesiya[Dem][7][Pos3]" ;
        Third C7_8 Pl => "leziya[Dem][8][Pos3]" ;
        Third C9_10 Sg => "leya[Dem][9][Pos3]" ;
        Third C9_10 Pl => "leziya[Dem][10][Pos3]" ;
        Third C11_10 Sg => "loluya[Dem][11][Pos3]" ;
        Third C11_10 Pl => "leziya[Dem][10][Pos3]" ;
        Third C9_6 Sg => "leya[Dem][9][Pos3]" ;
        Third C9_6 Pl => "lawaya[Dem][6][Pos3]" ;
        Third C14 _ => "lobuya[Dem][14][Pos3]" ;
        Third C15 _ => "lokhuya[Dem][15][Pos3]" ;
        Third C17 _ => "laphaya[Dem][17][Pos3]"
      }
    } ;

    dem_pron_na : Agr => Str = table {
        First Sg => BIND++"na[PronSuf]" ;
        First Pl => [] ;
        Second Sg => BIND++"na[PronSuf]" ;
        Second Pl => [] ;
        Third C1_2 Sg => BIND++"na[PronSuf]" ;
        Third C1_2 Pl => [] ;
        Third C1a_2a Sg => BIND++"na[PronSuf]" ;
        Third C1a_2a Pl => [] ;
        Third C3_4 Sg => BIND++"na[PronSuf]" ;
        Third C3_4 Pl => BIND++"na[PronSuf]" ;
        Third C5_6 Sg => [] ;
        Third C5_6 Pl => BIND++"na[PronSuf]" ;
        Third C7_8 Sg => [] ;
        Third C7_8 Pl => [] ;
        Third C9_10 Sg => BIND++"na[PronSuf]" ;
        Third C9_10 Pl => [] ;
        Third C11_10 Sg => [] ;
        Third C11_10 Pl => [] ;
        Third C9_6 Sg => BIND++"na[PronSuf]" ;
        Third C9_6 Pl => BIND++"na[PronSuf]" ;
        Third C14 _ => [] ;
        Third C15 _ => [] ;
        Third C17 _ => []
    } ;

    -----------
    -- VERBS --
    -----------
    regVerb : Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice ; root : Str ; lemma : Str } = \root ->
    {
      s = table {
        R_a => root +"[VRoot]"+ "a[VT]" ;
        R_ile => case root of {
          _+"el" => root+"[VRoot]" + "e[VTPerf]" ;
          (#cons+"al") | (#cons+#cons+"al") | (#cons+#cons+#cons+"al") => root+"[VRoot]" + "e[VTPerf]" ;
          _+"al" => (tk 2 root) + "el[VRoot]" + "e[VTPerf]" ;
          _+"an" => (tk 2 root) + "en[VRoot]" + "e[VTPerf]" ;
          -- _+"ath" => (tk 3 root) + "eth[VRoot]" + "e[VTPerf]" ;
          _+"w" => root+"[VRoot]" + "e[VTPerf]" ;
          _ => root+"[VRoot]" + "ile[VTPerf]"
        } ;
        R_e => case root of {
          _+"an" => (tk 2 root) + "en[VRoot]" + "e[VTPerf]" ;
          _+"al" => (tk 2 root) + "el[VRoot]" + "e[VTPerf]" ;
          -- _+"ath" => (tk 3 root) + "eth[VRoot]" + "e[VTPerf]" ;
          _ => root+"[VRoot]" + "e[VTPerf]"
        } ;
        R_i => case root of {
          _+"w" => root+"[VRoot]" + "a[VTNeg]" ;
          _ => root+"[VRoot]" + "i[VTNeg]"
        } ;
        R_anga => case root of {
          _+"al" => (tk 2 root) + "el[VRoot]" + "anga[VTNeg]" ;
          _+"an" => (tk 2 root) + "en[VRoot]" + "anga[VTNeg]" ;
          -- _+"ath" => (tk 3 root) + "eth[VRoot]" + "anga[VTNeg]" ;
          _ => root+"[VRoot]"+ "anga[VTNeg]"
        }
      } ;
      r = case root of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case root of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Active ;
      root = root ;
      lemma = root+"a"
    } ;

    th_Verb : Str -> Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice ; root : Str ; lemma : Str } = \th,thi ->
    {
      s = table {
        R_a => (tk 1 thi) +"[VRoot]"+(take 1 thi)+"[VT]"  ;
        R_ile => th +"[VRoot]"+ "ile[VTPerf]" ;
        R_e => th +"[VRoot]"+ "e[VTPerf]" ;
        R_i => th +"[VRoot]"+ "i[VTNeg]" ;
        R_anga => th +"[VRoot]"+ "anga[VTNeg]"
      } ;
      r = case th of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case th of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Active ;
      root = th ;
      lemma = thi
    } ;

    three_Verb : Str -> Str -> Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice ; root : Str ; lemma : Str } = \root,r_a,r_ile -> {
      s = table {
        R_a => r_a ++BIND++ "[VRoot+VT]" ;
        R_ile => r_ile ++BIND++ "[VRoot+VTPerf]" ;
        R_e => root ++BIND++"[VRoot]"++BIND++ "e[VTPerf]" ;
        R_i => root ++BIND++"[VRoot]"++BIND++ "i[VTNeg]" ;
        R_anga => root ++BIND++"[VRoot]"++BIND++ "anga[VTNeg]"
      } ;
      r = case root of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case root of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Active ;
      root = root ;
      lemma = r_a
    } ;

    four_Verb : Str -> Str -> Str -> Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice ; root : Str ; lemma : Str } = \root,r_a,r_ile,r_e -> {
      s = table {
        R_a => root+"[VRoot]"+"a[VT]" ;
        R_ile => root+"[VRoot]"+"ile[VTPerf]" ;
        R_e => root+"[VRoot]"+"e[VTPerf]" ;
        R_i => root +"[VRoot]"+"i[VTNeg]" ;
        R_anga => root +"[VRoot]"+"anga[VTNeg]"
      } ;
      r = case root of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case root of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Active ;
      root = root ;
      lemma = r_a
    } ;

    -- irregVerb : Str -> Str -> Str -> Str -> Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice } = \hamba,hambile,hambe,hambi,hambanga -> {
    --   s = table {
    --     R_a => hamba ;
    --     R_ile => hambile ;
    --     R_e => hambe ;
    --     R_i => hambi ;
    --     R_anga => hambanga
    --   } ;
    --   r = case root of {
    --     "a"+_ => RA ;
    --     "e"+_ => RE ;
    --     "i"+_ => RI ;
    --     "o"+_ => RO ;
    --     "u"+_ => RU ;
    --     _ => RC
    --   } ;
    --   syl = case root of {
    --     _+#cons+#vowel+#cons+_ => SylMult ;
    --     _ => SylMono
    --   } ;
    --   voice = Active
    -- } ;

    passiveVerb : Str -> { s : RForm => Str ; r : RInit ; syl : Syl ; voice : Voice ; root : Str ; lemma : Str } = \root ->
    {
      s = table {
        R_a => root +"[VRoot]"+ "a[VT]" ;
        R_ile => root +"[VRoot]"+ "ile[VTPerf]" ;
        R_e => root +"[VRoot]"+ "e[VTPerf]" ;
        R_i => root +"[VRoot]"+ "i[VTNeg]" ;
        R_anga => root +"[VRoot]"+ "anga[VTNeg]"
      } ;
      r = case root of {
        "a"+_ => RA ;
        "e"+_ => RE ;
        "i"+_ => RI ;
        "o"+_ => RO ;
        "u"+_ => RU ;
        _ => RC
      } ;
      syl = case root of {
        _+#cons+#vowel+#cons+_ => SylMult ;
        _ => SylMono
      } ;
      voice = Passive ;
      root = root ;
      lemma = root+"a"
    } ;

    -- Determine which form of the verb root to use
    -- we're keeping the case statement for when we add back -e and -ile
    rform : VForm -> Bool -> RForm = \vform,longform -> case longform of {
      True => case vform of {
        VFIndic _ Pos PresTense => R_a ;
        VFIndic MainCl Neg PresTense => R_i ;
        VFIndic RelCl Neg PresTense => R_i ;
        VFIndic _ _ FutTense => R_a ;
        VFIndic _ _ RemFutTense => R_a ;
        VFIndic _ Pos PastTense => R_ile ;
        VFIndic _ Neg PastTense => R_anga ;
        VFIndic _ Pos RemPastTense => R_a ;
        VFIndic _ Neg RemPastTense => R_anga ;
        VFConsec _ => R_a ;
        VFSubjunct Pos => R_e ;
        VFSubjunct Neg => R_i
      } ;
      False => case vform of {
        VFIndic _ Pos PresTense => R_a ;
        VFIndic MainCl Neg PresTense => R_i ;
        VFIndic RelCl Neg PresTense => R_i ;
        VFIndic _ _ FutTense => R_a ;
        VFIndic _ _ RemFutTense => R_a ;
        VFIndic _ Pos PastTense => R_e ;
        VFIndic _ Neg PastTense => R_anga ;
        VFIndic _ Pos RemPastTense => R_a ;
        VFIndic _ Neg RemPastTense => R_anga ;
        VFConsec _ => R_a ;
        VFSubjunct Pos => R_e ;
        VFSubjunct Neg => R_i
      } 
    } ;

    longform_ya : VForm -> Bool -> RInit -> Aspect -> Str =
    \vform,longform,rinit,aspect -> case <vform,longform,rinit,aspect> of {
      <VFIndic MainCl Pos PresTense,True,RC,(Null|Excl)> => "ya[LongPres]"++BIND ;
      <VFIndic MainCl Pos PresTense,True,_,(Null|Excl)>  => "y[LongPres]"++BIND ;
      <VFIndic _ _ _,_,_,_> => [] ;
      <VFConsec _,_,_,_> => [] ;
      <VFSubjunct _,_,_,_> => [] 
    } ;

    verb_prefix_stative : VForm -> Agr -> RInit -> Syl -> Str = \vform,agr,rinit,syl -> case vform of {
      VFIndic MainCl Pos PresTense => case <rinit,agr> of {
        <(RA | RE | RI | RO | RU),Third C5_6 Pl> => [] ;
        <(RA | RE | RI | RO | RU), (Third _ _ | Second _ | First _)> => subjConcLookup!agr!SCVow ;
        <RC,(Third _ _ | Second _ | First _)> => subjConcLookup!agr!SC ++BIND
      } ;
      VFIndic MainCl Pos PastTense => subjConcLookup!agr!SCBe ++BIND ;
      VFIndic MainCl Pos RemPastTense => subjConcLookup!agr!SCRP ++BIND ;
      VFIndic MainCl Pos FutTense => subjConcLookup!agr!SC ++BIND++ TEMP_PREF_FUT ++BIND ;
      VFIndic MainCl Pos RemFutTense => subjConcLookup!agr!SC ++BIND++ TEMP_PREF_REMFUT ++BIND ;

      VFIndic MainCl Neg PresTense => "a[NegPre]" ++BIND++ subjConcLookup!agr!SCVowP ++BIND ;
      VFIndic MainCl Neg PastTense => subjConcLookup!agr!SCBe ++BIND++ NEG_NGA ++BIND ;
      VFIndic MainCl Neg RemPastTense => subjConcLookup!agr!SCRP ++BIND++ NEG_NGA ++BIND ;
      VFIndic MainCl Neg FutTense => "a[NegPre]" ++BIND++ subjConcLookup!agr!SCVowP ++BIND ++ (tensePref vform rinit syl) ;
      VFIndic MainCl Neg RemFutTense => "a[NegPre]" ++BIND++ subjConcLookup!agr!SCVowP ++BIND ++ (tensePref vform rinit syl) ;

      VFIndic RelCl Pos PresTense => relConcLookup!agr!rinit ;
      VFIndic RelCl Pos PastTense => relCopConcBeLookup!agr ;
      VFIndic RelCl Pos RemPastTense => relCopConcRemPastLookup!agr ;
      VFIndic RelCl Pos FutTense => relConcLookup!agr!rinit ++ (tensePref vform rinit syl) ;
      VFIndic RelCl Pos RemFutTense => relConcLookup!agr!rinit ++ (tensePref vform rinit syl) ;

      VFIndic RelCl Neg PresTense => relConcLookup!agr!RC ++ NEG_NGA ++BIND ;
      VFIndic RelCl Neg PastTense => relCopConcBeLookup!agr ++ NEG_NGA ++BIND ;
      VFIndic RelCl Neg RemPastTense => relCopConcRemPastLookup!agr ++ NEG_NGA ++BIND ;
      VFIndic RelCl Neg FutTense => relConcLookup!agr!RC ++ NEG_NGA ++BIND ++ (tensePref vform rinit syl) ;
      VFIndic RelCl Neg RemFutTense => relConcLookup!agr!RC ++ NEG_NGA ++BIND ++ (tensePref vform rinit syl) ;
      VFConsec Pos => nonExist ; -- "*consec" ++ subjConcLookup!agr!SCRP ++BIND ;
      VFConsec Neg => nonExist ; -- "*consec" ++ subjConcLookup!agr!SCRP ++BIND++ "nga" ++BIND ;
      VFSubjunct Pos => nonExist ; -- "*subjunct" ++ subjConcLookup!agr!SC ++BIND ;
      VFSubjunct Neg => nonExist -- "*subjunct" ++ "a" ++BIND++ subjConcLookup!agr!SCVowP ++BIND
    } ;

    rform_stative : VForm -> RForm = \vform -> case vform of {
      VFIndic _ _ PresTense => R_ile ;
      VFIndic _ _ PastTense => R_ile ;
      VFIndic _ _ RemPastTense => R_ile ;
      VFIndic _ _ FutTense => R_a ;
      VFIndic _ _ RemFutTense => R_a ;
      VFConsec _ => R_a ;
      VFSubjunct Pos => R_e ;
      VFSubjunct Neg => R_i
    } ;

    verb_prefix_no_oc : VForm -> Bool -> RInit -> Agr -> Aspect -> Syl -> Str = \vform,longform,rinit,agr,aspect,syl -> let
      sc = case <vform,longform,rinit,aspect> of {
        -- null aspect, main clause
        <VFIndic MainCl Pos PresTense,False,RC,Null> => subjConcLookup!agr!SC ++BIND ;
        <VFIndic MainCl Pos PresTense,False,_,Null> => subjConc vform agr True rinit ;

        <VFIndic MainCl Pos PresTense,True,_,Null> => subjConcLookup!agr!SC ++BIND ;
        <VFIndic MainCl Neg PresTense,_,RC,Null> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND ;
        <VFIndic MainCl Neg PresTense,_,_,Null> => (negPref vform) ++ subjConcLookup!agr!SCNegVow ++BIND ;

        <VFIndic MainCl Pos PastTense,_,RC,Null> => subjConcLookup!agr!SC ++BIND ;
        <VFIndic MainCl Pos PastTense,_,_,Null> => subjConc vform agr True rinit ;

        <VFIndic MainCl Neg PastTense,_,RC,Null> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND ;
        <VFIndic MainCl Neg PastTense,_,_,Null> => (negPref vform) ++ subjConcLookup!agr!SCNegVow ++BIND ;

        <VFIndic MainCl Pos RemPastTense,_,_,Null> => (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- wahamba

        <VFIndic MainCl Neg RemPastTense,_,RC,Null> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND ;
        <VFIndic MainCl Neg RemPastTense,_,_,Null> => (negPref vform) ++ subjConcLookup!agr!SCNegVow ++BIND ;

        <VFIndic MainCl Pos _,_,_,Null> => subjConcLookup!agr!SC ++BIND ++ (tensePref vform rinit syl) ; -- uzohamba
        <VFIndic MainCl Neg _,_,_,Null> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND ++ (tensePref vform rinit syl) ; -- akazuhamba

        -- null aspect, relative clause
        <VFIndic RelCl Pos RemPastTense,_,_,Null> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ; -- owahamba
        <VFIndic RelCl Pos (FutTense|RemFutTense),_,_,Null> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ; -- ozohamba
        <VFIndic RelCl Neg (FutTense|RemFutTense),_,_,Null> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ; -- ongazuhamba
        <VFIndic RelCl _ _,_,_,Null> => (relConc vform agr rinit) ;

        -- progressive, main clause
        <VFIndic MainCl Pos PresTense,_,RC,Prog> => subjConcLookup!agr!SC ++BIND++ PROG_SA ++BIND ; -- usahamba
        <VFIndic MainCl Pos PresTense,_,_,Prog> => subjConcLookup!agr!SC ++BIND++ PROG_S ++BIND ; -- useqa
        
        <VFIndic MainCl Neg PresTense,_,RC,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_SA ++BIND ; -- akasahambi
        <VFIndic MainCl Neg PresTense,_,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_S ++BIND ; -- akaseqi

        <VFIndic MainCl Pos PastTense,_,RC,Prog> => subjConcLookup!agr!SC ++BIND++ PROG_SA ++BIND ; -- usahambile
        <VFIndic MainCl Pos PastTense,_,_,Prog> => subjConcLookup!agr!SC ++BIND++ PROG_S ++BIND ; -- useqile

        <VFIndic MainCl Neg PastTense,_,RC,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_SA ++BIND ; -- akasahambile
        <VFIndic MainCl Neg PastTense,_,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_S ++BIND ; -- akaseqile

        <VFIndic MainCl Pos RemPastTense,_,RC,Prog> => (subjConc vform agr True rinit) ++ (tensePref vform RC syl) ++ PROG_SA ++BIND ; -- wasahamba
        <VFIndic MainCl Pos RemPastTense,_,_,Prog> => (subjConc vform agr True rinit) ++ (tensePref vform RC syl) ++ PROG_S ++BIND ; -- waseqa

        <VFIndic MainCl Neg RemPastTense,_,RC,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_SA ++BIND ; -- akasahambanga
        <VFIndic MainCl Neg RemPastTense,_,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_S ++BIND ; -- akaseqanga

        <VFIndic MainCl Pos _,_,_,Prog> => subjConcLookup!agr!SC ++BIND++ PROG_SA ++BIND++ (tensePref vform rinit syl) ; -- usazohamba
        <VFIndic MainCl Neg _,_,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_SA ++BIND++ (tensePref vform rinit syl) ; -- akasazuhamba

        -- progressive, relative clause
        <VFIndic RelCl Pos RemPastTense,_,RC,Prog> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ++ PROG_SA ++BIND ;
        <VFIndic RelCl Pos RemPastTense,_,_,Prog> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ++ PROG_S ++BIND ;

        <VFIndic RelCl Pos (FutTense|RemFutTense),_,_,Prog> => (relConc vform agr rinit) ++ PROG_SA ++BIND++ (tensePref vform rinit syl) ;

        <VFIndic RelCl Neg (FutTense|RemFutTense),_,_,Prog> => (relConc vform agr rinit) ++ PROG_SE ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic RelCl _ _,_,RC,Prog> => (relConc vform agr rinit) ++ PROG_SA ++BIND ;
        <VFIndic RelCl _ _,_,_,Prog> => (relConc vform agr rinit) ++ PROG_S ++BIND ;

        -- exclusive, main clause
        <VFIndic MainCl Pos PresTense,_,RC,Excl> => subjConcLookup!agr!SCSe ++BIND ; -- sewuhamba
        <VFIndic MainCl Pos PresTense,_,_,Excl> => EXCL_SE ++BIND++ (subjConc vform agr True rinit) ; -- seweqa

        <VFIndic MainCl Neg PresTense,_,RC,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ EXCL_KA ++ BIND ; -- akakahambi
        <VFIndic MainCl Neg PresTense,_,_,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNegVow ++BIND++ EXCL_K ++ BIND ; -- akakeqi

        <VFIndic MainCl Pos PastTense,_,RC,Excl> => subjConcLookup!agr!SCSe ++BIND ; -- sewuhambile
        <VFIndic MainCl Pos PastTense,_,_,Excl> => EXCL_SE ++BIND++ (subjConc vform agr True rinit) ; -- seweqile

        <VFIndic MainCl Neg PastTense,_,RC,Excl> => nonExist ;
        <VFIndic MainCl Neg PastTense,_,_,Excl> => nonExist ;

        <VFIndic MainCl Pos RemPastTense,_,RC,Excl> => EXCL_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- sewahamba
        <VFIndic MainCl Pos RemPastTense,_,_,Excl> => EXCL_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- seweqa

        <VFIndic MainCl Neg RemPastTense,_,RC,Excl> => nonExist ;
        <VFIndic MainCl Neg RemPastTense,_,_,Excl> => nonExist ;

        <VFIndic MainCl Pos _,_,_,Excl> => subjConcLookup!agr!SCSe ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic MainCl Neg _,_,_,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ EXCL_KA ++BIND++ (tensePref vform rinit syl) ;

        -- exclusive, relative clause
        <VFIndic RelCl Pos PresTense,_,RC,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND ; -- engiseyahamba
        <VFIndic RelCl Pos PresTense,_,_,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND ; -- engiseyeqa

        <VFIndic RelCl Neg PresTense,_,RC,Excl> => (relConc vform agr rinit) ++ EXCL_KA ++ BIND ; -- engingakahambi
        <VFIndic RelCl Neg PresTense,_,_,Excl> => (relConc vform agr RC) ++ EXCL_K ++ BIND ; -- engingakeqi

        <VFIndic RelCl Pos PastTense,_,RC,Excl> => shortRelConc!agr ++ EXCL_SE ++BIND++ subjConcLookup!agr!SC ++BIND ; -- esengihambile
        <VFIndic RelCl Pos PastTense,_,_,Excl> => shortRelConc!agr ++ EXCL_SE ++BIND++ (subjConc vform agr True rinit) ; -- esengeqile

        <VFIndic RelCl Neg PastTense,_,RC,Excl> => nonExist ;
        <VFIndic RelCl Neg PastTense,_,_,Excl> => nonExist ;

        <VFIndic RelCl Pos RemPastTense,_,RC,Excl> => shortRelConc!agr ++ EXCL_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- osewahamba
        <VFIndic RelCl Pos RemPastTense,_,_,Excl> => shortRelConc!agr ++ EXCL_SE ++BIND++ (subjConc vform agr True rinit) ; -- oseweqa

        <VFIndic RelCl Neg RemPastTense,_,RC,Excl> => nonExist ;
        <VFIndic RelCl Neg RemPastTense,_,_,Excl> => nonExist ;

        <VFIndic RelCl Pos _,_,_,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic RelCl Neg _,_,_,Excl> => (relConc vform agr rinit) ++ EXCL_KA ++BIND++ (tensePref vform rinit syl) ;
        <VFConsec Pos,_,_,_> => let
          vow = case rinit of {
            RC => False ;
            _ => True
          }
        in (subjConc vform agr vow rinit) ;
        <VFConsec _,_,RC,_> => (subjConc vform agr False RC) ++ (negPrefNga vform False) ;
        <VFConsec _,_,r,_> => (subjConc vform agr False r) ++ (negPrefNga vform True) ;
        <VFSubjunct _,_,RC,_> => (subjConc vform agr False RC) ++ (negPrefNga vform False) ;
        <VFSubjunct _,_,r,_> => (subjConc vform agr True r) ++ (negPrefNga vform True)  
      } ;
      ya = longform_ya vform longform rinit aspect ;
    in
      sc ++
      ya ;
    
    verb_prefix_with_oc : VForm -> Bool -> RInit -> Agr -> Aspect -> Syl -> Str = \vform,longform,rinit,agr,aspect,syl -> let
      sc = case <vform,longform,aspect> of {
        -- null aspect, main clause
        <VFIndic MainCl Pos PresTense,False,Null> => subjConcLookup!agr!SC ++BIND ;

        <VFIndic MainCl Pos PresTense,True,Null> => subjConcLookup!agr!SC ++BIND ;
        <VFIndic MainCl Neg PresTense,_,Null> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND ;

        <VFIndic MainCl Pos PastTense,_,Null> => subjConcLookup!agr!SC ++BIND ;

        <VFIndic MainCl Neg PastTense,_,Null> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND ;

        <VFIndic MainCl Pos RemPastTense,_,Null> => (subjConc vform agr True rinit) ++ (tensePref vform rinit syl)  ; -- wahamba

        <VFIndic MainCl Neg RemPastTense,_,Null> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND ;

        <VFIndic MainCl Pos _,_,Null> => subjConcLookup!agr!SC ++BIND ++ (tensePref vform rinit syl) ; -- uzohamba
        <VFIndic MainCl Neg _,_,Null> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND ++ (tensePref vform rinit syl) ; -- akazuhamba

        -- null aspect, relative clause
        <VFIndic RelCl Pos RemPastTense,_,Null> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ++BIND ; -- owahamba
        <VFIndic RelCl Pos (FutTense|RemFutTense),_,Null> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ; -- ozohamba
        <VFIndic RelCl Neg (FutTense|RemFutTense),_,Null> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ; -- ongazuhamba
        <VFIndic RelCl _ _,_,Null> => (relConc vform agr rinit) ;

        -- progressive, main clause
        <VFIndic MainCl Pos PresTense,_,Prog> => subjConcLookup!agr!SC ++BIND++ PROG_SA ++BIND ; -- usahamba
        
        <VFIndic MainCl Neg PresTense,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_SA ++BIND ; -- akasahambi

        <VFIndic MainCl Pos PastTense,_,Prog> => subjConcLookup!agr!SC ++BIND++ PROG_SA ++BIND ; -- usahambile

        <VFIndic MainCl Neg PastTense,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_SA ++BIND ; -- akasahambile

        <VFIndic MainCl Pos RemPastTense,_,Prog> => (subjConc vform agr True rinit) ++ (tensePref vform RC syl) ++ PROG_SA ++BIND ; -- wasahamba

        <VFIndic MainCl Neg RemPastTense,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_SA ++BIND ; -- akasahambanga

        <VFIndic MainCl Pos _,_,Prog> => subjConcLookup!agr!SC ++BIND++ PROG_SA ++BIND++ (tensePref vform rinit syl) ; -- usazohamba
        <VFIndic MainCl Neg _,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ PROG_SA ++BIND++ (tensePref vform rinit syl) ; -- akasazuhamba

        -- progressive, relative clause
        <VFIndic RelCl Pos RemPastTense,_,Prog> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ++ PROG_SA ++BIND ;

        <VFIndic RelCl Pos (FutTense|RemFutTense),_,Prog> => (relConc vform agr rinit) ++ PROG_SA ++BIND++ (tensePref vform rinit syl) ;

        <VFIndic RelCl Neg (FutTense|RemFutTense),_,Prog> => (relConc vform agr rinit) ++ PROG_SE ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic RelCl _ _,_,Prog> => (relConc vform agr rinit) ++ PROG_SA ++BIND ;

        -- exclusive, main clause
        <VFIndic MainCl Pos PresTense,_,Excl> => subjConcLookup!agr!SCSe ++BIND ; -- sewuhamba

        <VFIndic MainCl Neg PresTense,_,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ EXCL_KA ++ BIND ; -- akakahambi

        <VFIndic MainCl Pos PastTense,_,Excl> => subjConcLookup!agr!SCSe ++BIND ; -- sewuhambile

        <VFIndic MainCl Neg PastTense,_,Excl> => nonExist ;

        <VFIndic MainCl Pos RemPastTense,_,Excl> => EXCL_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- sewahamba

        <VFIndic MainCl Neg RemPastTense,_,Excl> => nonExist ;

        <VFIndic MainCl Pos _,_,Excl> => subjConcLookup!agr!SCSe ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic MainCl Neg _,_,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ EXCL_KA ++BIND++ (tensePref vform rinit syl) ;

        -- exclusive, relative clause
        <VFIndic RelCl Pos PresTense,_,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND ; -- engiseyahamba

        <VFIndic RelCl Neg PresTense,_,Excl> => (relConc vform agr rinit) ++ EXCL_KA ++ BIND ; -- engingakahambi

        <VFIndic RelCl Pos PastTense,_,Excl> => shortRelConc!agr ++ EXCL_SE ++BIND++ subjConcLookup!agr!SC ++BIND ; -- esengihambile

        <VFIndic RelCl Neg PastTense,_,Excl> => nonExist ;

        <VFIndic RelCl Pos RemPastTense,_,Excl> => shortRelConc!agr ++ EXCL_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- osewahamba

        <VFIndic RelCl Neg RemPastTense,_,Excl> => nonExist ;

        <VFIndic RelCl Pos _,_,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic RelCl Neg _,_,Excl> => (relConc vform agr rinit) ++ EXCL_KA ++BIND++ (tensePref vform rinit syl) ;
        <VFConsec Pos,_,_> => let
          vow = case rinit of {
            RC => False ;
            _ => True
          }
        in (subjConc vform agr vow rinit) ;
        <VFConsec _,_,_> => (subjConc vform agr False rinit) ++ (negPrefNga vform False) ;
        <VFSubjunct _,_,_> => (subjConc vform agr False rinit) ++ (negPrefNga vform False)
      } ;
      ya = longform_ya vform longform rinit aspect ;
    in
      sc ++
      ya ;

    -- verb_prefix_with_oc_ : VForm -> Bool -> Agr -> Aspect -> Str = \vform,longform,agr,aspect -> let
    --   pre_pref = case <vform,aspect> of {
    --     <VFIndic _ Pos PresTense,Prog> => (negPref vform) ++ subjConcLookup!agr!SC ++BIND++ "sa" ++BIND ;
    --     <VFIndic _ Pos RemPastTense,Prog> => (negPref vform) ++ subjConcLookup!agr!SC ++BIND++ "s" ++BIND ;
    --     <VFIndic _ Neg (FutTense|RemFutTense),Prog> => (negPref vform) ++ subjConcLookup!agr!SC ++BIND++ "se" ;
    --     <VFIndic _ Pos _,Prog> => (negPref vform) ++ subjConcLookup!agr!SC ++BIND++ "sa" ++BIND ;
    --     <VFIndic _ Neg _,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ "sa" ++BIND  ;
    --     <VFConsec _,Prog> => nonExist ;
    --     <VFSubjunct _,Prog> => nonExist ;

    --     <VFIndic _ Pos _,Excl> => "se" ++BIND++ subjConcLookup!agr!SC ++BIND ;
    --     <VFIndic _ Neg _,Excl> => (negPref vform) ++ subjConcLookup!agr!SC ++BIND++ PROG_KA ++BIND ;
    --     <VFConsec _,Prog> => nonExist ;
    --     <VFSubjunct _,Prog> => nonExist ;

    --     <VFIndic MainCl Pos PresTense,Null> => (negPref vform) ++ subjConcLookup!agr!SC ++BIND ;
    --     <VFIndic MainCl Pos RemPastTense,_> => (negPref vform) ++ (subjConc vform agr True RA)++BIND++ (tensePref vform RC SylMult) ;
    --     <VFIndic _ Pos _,_> => (negPref vform) ++ subjConcLookup!agr!SC ++BIND++ (tensePref vform RC SylMult) ;
    --     <VFIndic _ Neg _,_> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ (tensePref vform RC SylMult) ;
    --     <VFConsec _,_> => (subjConc vform agr False RC) ++ (negPrefNga vform False);
    --     <VFSubjunct _,_> => (subjConc vform agr False RC) ++ (negPrefNga vform False)
    --   } ;
    --   ya = longform_ya vform longform RC aspect
    -- in
    --   pre_pref ++
    --   ya ;

    -- rform : VForm -> Bool -> RInit -> RForm = \vform,longform,rinit -> case longform of {
    --   True => case vform of {
    --     VFIndic _ Pos PresTense => case rinit of {
    --       RC => "ya" ++BIND++ R_a ;
    --       _  => "y" ++BIND++ R_a
    --     } ;
    --     VFIndic MainCl Neg PresTense => R_i ;
    --     VFIndic RelCl Neg PresTense => R_i ;
    --     VFIndic _ _ FutTense => R_a ;
    --     VFIndic _ _ RemFutTense => R_a ;
    --     VFIndic _ Pos PastTense => R_ile ;
    --     VFIndic _ Neg PastTense => R_anga ;
    --     VFIndic _ Pos RemPastTense => R_a ;
    --     VFIndic _ Neg RemPastTense => R_anga
    --   } ;
    --   False => case vform of {
    --     VFIndic _ Pos PresTense => R_a ;
    --     VFIndic MainCl Neg PresTense => R_i ;
    --     VFIndic RelCl Neg PresTense => R_i ;
    --     VFIndic _ _ FutTense => R_a ;
    --     VFIndic _ _ RemFutTense => R_a ;
    --     VFIndic _ Pos PastTense => R_e ;
    --     VFIndic _ Neg PastTense => R_anga ;
    --     VFIndic _ Pos RemPastTense => R_a ;
    --     VFIndic _ Neg RemPastTense => R_anga
    --   }
    -- } ;

    -- VERB MORPHEMES --

    -- tense prefix
    tensePref : VForm -> RInit -> Syl -> Str = \vform,r,syl ->
      case <r,vform,syl> of {
        <RC,VFIndic _ Pos FutTense,SylMono> => TEMP_PREF_FUT++BIND++"ku[FutExt]" ++BIND ;
        <RC,VFIndic _ Pos FutTense,_> => TEMP_PREF_FUT ++BIND ;
        <_,VFIndic _ Pos FutTense,_> => TEMP_PREF_FUT++BIND++"kw[FutExt]" ++BIND ;
        <RC,VFIndic _ Neg FutTense,_> => TEMP_PREF_FUT_NEG++BIND++"ku[FutExt]" ++BIND ;
        <_,VFIndic _ Neg FutTense,_> => TEMP_PREF_FUT_NEG++BIND++"kw[FutExt]" ++BIND ;

        <RC,VFIndic _ Pos RemFutTense,SylMono> => TEMP_PREF_REMFUT++BIND++"ku[FutExt]" ++BIND ;
        <RC,VFIndic _ Pos RemFutTense,_> => TEMP_PREF_REMFUT ++BIND ;
        <_,VFIndic _ Pos RemFutTense,_> => TEMP_PREF_REMFUT++BIND++"kw[FutExt]" ++BIND ;
        <RC,VFIndic _ Neg RemFutTense,_> => TEMP_PREF_REMFUT_NEG++BIND++"ku[FutExt]" ++BIND ;
        <_,VFIndic _ Neg RemFutTense,_> => TEMP_PREF_REMFUT_NEG++BIND++"kw[FutExt]" ++BIND ;

        <(RA|RE),VFIndic _ _ RemPastTense> => [] ;
        <_,VFIndic _ Pos RemPastTense> => TEMP_PREF_PAST ++BIND ;
        <_,VFIndic _ _ _,_> => [] ;
        <_,VFConsec _,_> => [] ;
        <_,VFSubjunct Pos,_> => [] ;
        <_,VFSubjunct Neg,_> => []
      } ;

    -- negative prefix
    negPref : VForm -> Str = \vform ->
      case vform of {
        VFIndic _ Neg _ => "a[NegPre]"++BIND ;
        VFIndic _ _ _ => [] ;
        VFConsec _ => [] ;
        VFSubjunct _ => []
      } ;

      -- TODO : sound rules to choose between nge and nga
    -- negPref2 : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic Part Neg FutTense Null => "nga" ++BIND ; -- sometimes nge? p274
    --     -- VFIndic Part Neg _ _ => pre { "z" => "nge" ; _ => "nga" } ++BIND ;
    --     VFIndic Part Neg _ _ => "nga" ++BIND ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFPot _ _ _ => [] ;
    --     VFSubj Neg => pre { "z" => "nge" ; _ => "nga" } ++BIND ;
    --     VFSubj Pos => []
    --   } ;

    negPrefNga : VForm -> Bool -> Str = \vform,vow -> case <vform,vow> of {
      <VFIndic _ Neg _,False> => "nga[NegPre]" ++BIND ;
      <VFIndic _ Neg _,_> => "ng[NegPre]" ++BIND ;
      <VFConsec Neg,False> => "nga[NegPre]" ++BIND ;
      <VFConsec Neg,_> => "ng[NegPre]" ++BIND ;
      <VFIndic _ Pos _,_> => [] ;
      <VFConsec Pos,_> => [] ;
      <VFSubjunct Neg,False> => "nga[NegPre]" ++BIND ;
      <VFSubjunct Neg,_> => "ng[NegPre]" ++BIND ;
      <VFSubjunct Pos,_> => []
    } ;

    negPrefNge : VForm -> Bool -> Str = \vform,vow -> case <vform,vow> of {
      <VFIndic _ Neg _,False> => "nge[NegPre]" ++BIND ;
      <VFIndic _ Neg _,_> => "ng[NegPre]" ++BIND ;
      <VFConsec Neg,False> => "nge[NegPre]" ++BIND ;
      <VFConsec Neg,_> => "ng[NegPre]" ++BIND ;
      <VFIndic _ Pos _,_> => [] ;
      <VFConsec Pos,_> => [] ;
      <VFSubjunct Neg,False> => "nge[NegPre]" ++BIND ;
      <VFSubjunct Neg,_> => "ng[NegPre]" ++BIND ;
      <VFSubjunct Pos,_> => []
    } ;

    icompNeg1 : VForm -> Str = \vform -> case vform of {
      VFIndic _ Neg PresTense => "a[NegPre]"++BIND ;
      VFIndic _ _ _ => [] ;
      VFConsec Neg => "a[NegPre]" ;
      VFConsec Pos => [] ;
      VFSubjunct Neg => "a[NegPre]" ;
      VFSubjunct Pos => []
    } ;

    icompNeg2 : VForm -> Str = \vform -> case vform of {
      VFIndic _ Neg _ => "nga[NegPre]"++BIND ;
      VFIndic _ _ _ => [] ;
      VFConsec Neg => "nga[NegPre]" ;
      VFConsec Pos => [] ;
      VFSubjunct Neg => "nga[NegPre]" ;
      VFSubjunct Pos => []
    } ;

    -- -- progressive prefix
    -- progPref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic _ Pos PastTense Prog => nonExist ; -- progressive past does not occur
    --     VFIndic _ Pos PastTense _ => [] ;
    --     VFIndic _ Pos _ Prog => "sa" ++BIND ;
    --     VFIndic _ Pos _ _ => [] ;
    --     VFIndic _ Neg FutTense Prog => "se" ++BIND ;
    --     VFIndic _ Neg _ Prog => "sa" ++BIND ;
    --     VFIndic _ _ _ Prog => nonExist ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFPot _ _ Prog => "se" ++BIND ;
    --     VFPot _ _ _ => [] ;
    --     VFSubj _ => []
    --
    --   } ;

    -- progressive prefix
    -- progPref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic _ Pos PastTense _ => nonExist ; -- progressive past does not occur
    --     -- VFIndic _ Pos PastTense _ => [] ;
    --     VFIndic _ Pos _ _ => "sa" ++BIND ;
    --     -- VFIndic _ Pos _ _ => [] ;
    --     VFIndic _ Neg FutTense _ => "se" ++BIND ;
    --     VFIndic _ Neg _ _ => "sa" ++BIND ;
    --     VFIndic _ _ _ _ => nonExist ;
    --     -- VFIndic _ _ _ _ => [] ;
    --     VFPot _ _ _ => "se" ++BIND ;
    --     -- VFPot _ _ _ => [] ;
    --     VFSubj _ => nonExist
    --
    --   } ;

    -- exclusive se prefix
    -- exclSePref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic _ Pos _ Excl => "se"++BIND ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFPot _ Pos Excl => "se"++BIND ;
    --     VFPot _ _ _ => [] ;
    --     VFSubj _ => []
    --   } ;
    --
    -- -- exclusive ka prefix
    -- exclKaPref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFIndic _ Neg (PresTense | FutTense) Excl => PROG_KA ++BIND ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFPot _ _ _ => [] ;
    --     VFSubj _ => []
    --   } ;

    -- potential prefix
    -- potPref : VForm -> Str = \vform ->
    --   case vform of {
    --     VFPot _ Pos _ => "nga" ++BIND ;
    --     VFPot _ Neg _ => "nge" ++BIND ;
    --     VFIndic _ _ _ _ => [] ;
    --     VFSubj _ => []
    --   } ;

    -------------
    -- ADVERBS --
    -------------
    regAdv : Str -> { s : Str ; asp : Aspect ; reqLocS : Bool } = \adv ->
    {
      s = adv+"[Adv]" ;
      asp = Null ;
      reqLocS = False
    } ;

    aspAdv : Str -> Aspect -> { s : Str ; asp : Aspect ; reqLocS : Bool } = \adv,asp ->
    {
      s = adv+"[Adv]" ;
      asp = asp ;
      reqLocS = False
    } ;

    -- together with
    withPref : RInit => Str = table {
      RU => "no[AdvPre]" ;
      RI => "ne[AdvPre]" ;
      RO => "no[AdvPre]" ;
      _  => "na[AdvPre]"
    } ;

    -- just like
    eqPref : RInit => Str = table {
      RU => "njengo[AdvPre]" ;
      RI => "njenge[AdvPre]" ;
      RO => "njengo[AdvPre]" ;
      _  => "njenga[AdvPre]"
    } ;

    -- as big as
    eqSizePref : RInit => Str = table {
      RU => "ngango[AdvPre]" ;
      RI => "ngange[AdvPre]" ;
      RO => "ngango[AdvPre]" ;
      _  => "nganga[AdvPre]"
    } ;

    -- with
    instrPref : RInit => Str = table {
      RU => "ngo[AdvPre]" ;
      RI => "nge[AdvPre]" ;
      RO => "ngo[AdvPre]" ;
      _  => "nga[AdvPre]"
    } ;

    regLocN : Str -> { s : Str } = \s -> ss (s+"[LocNStem]");
    regLocAdv : Str -> { s : Str ; reqLocS : Bool } = \s -> ss (s+"[LocAdv]") ** { reqLocS = False };

    --------------------
    -- QUALIFICATIVES --
    --------------------
    regAdj : Str -> { s : AForm => Str ; empty : Str ; t : AType } = \a ->
    {
      s = table {
        AF1 => a+"[AdjStem]" ;
        AF2 => prefix_nasal_no_tag a+"[AdjStem]" ;
        AF3 => case a of {
          #cons+#cons*+#vowel => "u[Phon]"+a+"[AdjStem]" ;
          _ => a+"[AdjStem]"
        }
      } ;
      -- b = case a of {
      --   ("kh"|"th"|"sh"|"b"|"f"|"hl")+_ => True ;
      --   ("m"|"n")+_ => True ;
      --   _ => False
      -- } ;
      empty = [] ;
      t = AdjType
    } ;

    relAdj : Str -> { s : AForm => Str ; empty : Str ; t : AType } = \a ->
    {
      s = \\_ => a+"[RelStem]" ;
      -- b = case a of {
      --   ("kh"|"th"|"sh"|"b"|"f"|"hl")+_ => True ;
      --   ("m"|"n")+_ => True ;
      --   _ => False
      -- } ;
      empty = [] ;
      t = RelType
    } ;

    enumAdj : Str -> { s : AForm => Str ; empty : Str ; t : AType } = \a ->
    {
      s = \\_ => a+"[EnumStem]" ;
      empty = [] ;
      t = EnumType
    } ;

    rel_yo_2 : Str = BIND++"yo[RelSuf]" ;

    relSuf : VForm -> Aspect -> Str = \vform,aspect -> case <vform,aspect> of {
      <VFIndic RelCl Pos PresTense,(Null|Prog)> => rel_yo_2 ;
      <VFIndic RelCl Pos PastTense,(Null|Prog)> => rel_yo_2 ;
      <VFIndic _ _ _,_> => [] ;
      <VFConsec Neg,_> => [] ;
      <VFConsec Pos,_> => [] ;
      <VFSubjunct Neg,_> => [] ;
      <VFSubjunct Pos,_> => []
    } ;

    -- chooses the form of the root to use for N-prefixes
    aformN : Agr -> AForm = \agr ->
      case agr of {
        Third C1_2 Sg => AF3 ;
        Third C1a_2a Sg => AF3 ;
        Third C3_4 Sg => AF3 ;
        Third C7_8 Pl => AF2 ;
        Third C9_10 Sg => AF2 ;
        Third C9_10 Pl => AF2 ;
        Third C9_6 Sg => AF2 ;
        Third C11_10 Pl => AF2 ;
        _ => AF1
      } ;

    -- TODO: check ; RInit is used to indicate what precedes the adj pref
    adjPrefLookup : Agr => VForm => Str =
      table {
        Third C1_2 Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m[AdjPre][1]"++BIND } ;
        Third C1_2 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ba[AdjPre][2]"++BIND } ;
        Third C1a_2a Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m[AdjPre][1a]"++BIND } ;
        Third C1a_2a Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ba[AdjPre][2a]"++BIND } ;
        Third C3_4 Sg  => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m[AdjPre][3]"++BIND } ;
        Third C3_4 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "mi[AdjPre][4]"++BIND } ;
        Third C5_6 Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "li[AdjPre][5]"++BIND } ;
        Third C5_6 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ma[AdjPre][6]"++BIND } ;
        Third C7_8 Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "si[AdjPre][7]"++BIND } ;
        Third C7_8 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "zi[AdjPre][8]"++BIND } ; -- nasal for 8,9,10 assumed to be fixed to root
        Third C9_10 Sg => table {
          VFIndic MainCl Pos PresTense => "yi[AdjPre][9]" ++BIND ;
          VFIndic _ Pos PresTense => [] ;
          VFIndic RelCl Neg PresTense => [] ;
          VFIndic _ _ FutTense => "yi[AdjPre][9]"++BIND ;
          VFIndic _ _ RemFutTense => "yi[AdjPre][9]"++BIND ;
          VFIndic _ _ PastTense => "yi[AdjPre][9]" ++BIND ;
          VFIndic _ _ RemPastTense => "yi[AdjPre][9]" ++BIND ;
          VFIndic _ _ _ => "i[AdjPre][9]"++BIND ;
          VFConsec _ => "yi[AdjPre][9]" ;
          VFSubjunct _ => "yi[AdjPre][9]"
        } ;
        Third C9_10 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "zi[AdjPre][10]"++BIND } ;
        Third C11_10 Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "lu[AdjPre][11]"++BIND } ;
        Third C11_10 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "zi[AdjPre][10]"++BIND } ;
        Third C9_6 Sg => table {
          VFIndic MainCl Pos PresTense => "yi[AdjPre][9]" ++BIND ;
          VFIndic _ Pos PresTense => [] ;
          VFIndic RelCl Neg PresTense => [] ;
          VFIndic _ _ FutTense => "yi[AdjPre][9]"++BIND ;
          VFIndic _ _ RemFutTense => "yi[AdjPre][9]"++BIND ;
          VFIndic _ _ PastTense => "yi[AdjPre][9]" ++BIND ;
          VFIndic _ _ RemPastTense => "yi[AdjPre][9]" ++BIND ;
          VFIndic _ _ _ => "i[AdjPre][9]"++BIND ;
          VFConsec _ => "yi[AdjPre][9]" ;
          VFSubjunct _ => "yi[AdjPre][9]"
        } ;
        Third C9_6 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ma[AdjPre][6]"++BIND } ;
        Third C14 _ => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "bu[AdjPre][14]"++BIND } ;
        Third C15 _ => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ku[AdjPre][15]"++BIND } ;
        Third C17 _ => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ku[AdjPre][17]"++BIND } ;
        First Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m[AdjPre][1ps]"++BIND } ;
        First Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ba[AdjPre][1pp]"++BIND } ;
        Second Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m[AdjPre][2ps]"++BIND } ;
        Second Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "om[AdjPre][2pp]"++BIND }
      } ;

      adjPref : Agr -> VForm -> Str = \agr,vform -> case vform of {
        VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => adjPrefLookup!agr!vform
      } ;

    atwhichPhiPref : Agr => Str =
      table {
        Third C1_2 Sg => "mu[EC][1]" ;
        Third C1_2 Pl => "ba[EC][2]" ;
        Third C1a_2a Sg => "mu[EC][1a]" ;
        Third C1a_2a Pl => "ba[EC][2a]" ;
        Third C3_4 Sg  => "mu[EC][3]" ;
        Third C3_4 Pl => "mi[EC][4]" ;
        Third C5_6 Sg => "li[EC][5]" ;
        Third C5_6 Pl => "ma[EC][6]" ;
        Third C7_8 Sg => "si[EC][7]" ;
        Third C7_8 Pl => "zi[EC][8]" ;
        Third C9_10 Sg => "yi[EC][9]" ;
        Third C9_10 Pl => "zi[EC][10]" ;
        Third C11_10 Sg => "lu[EC][11]" ;
        Third C11_10 Pl => "zi[EC][10]" ;
        Third C9_6 Sg => "yi[EC][9]" ;
        Third C9_6 Pl => "ma[EC][6]" ;
        Third C14 _ => "bu[EC][14]" ;
        Third C15 _ => "ku[EC][15]" ;
        Third C17 _ => "ku[EC][17]" ;
        First Sg => "mu[EC][1ps]" ;
        First Pl => "ba[EC][1pp]" ;
        Second Sg => "mu[EC][2ps]" ;
        Second Pl => "om[EC][2pp]"
      } ;

    -----------
    -- NOUNS --
    -----------

    noun_stem_tag : ClassGender -> Str = \c -> case c of {
      C1_2 => "[NStem][1-2]" ;
      C1a_2a => "[NStem][1a-2a]" ;
      C3_4 => "[NStem][3-4]" ;
      C5_6 => "[NStem][5-6]" ;
      C7_8 => "[NStem][7-8]" ;
      C9_10 => "[NStem][9-10]" ;
      C11_10 => "[NStem][11-10]" ;
      C9_6 => "[NStem][9-6]" ;
      C14 => "[NStem][14]" ;
      C15 => "[NStem][15]" ;
      C17 => "[NStem][17]"
    } ;

    noun_prefix_tag : ClassGender -> Number -> Str = \c,n -> case <c,n> of {
      <C1_2,Sg> => "[1]" ;
      <C1_2,Pl> => "[2]" ;
      <C1a_2a,Sg> => "[1a]" ;
      <C1a_2a,Pl> => "[2a]" ;
      <C3_4,Sg> => "[3]" ;
      <C3_4,Pl> => "[4]" ;
      <C5_6,Sg> => "[5]" ;
      <C5_6,Pl> => "[6]" ;
      <C7_8,Sg> => "[7]" ;
      <C7_8,Pl> => "[8]" ;
      <C9_10,Sg> => "[9]" ;
      <C9_10,Pl> => "[10]" ;
      <C11_10,Sg> => "[11]" ;
      <C11_10,Pl> => "[10]" ;
      <C9_6,Sg> => "[9]" ;
      <C9_6,Pl> => "[6]" ;
      <C14,_> => "[14]" ;
      <C15,_> => "[15]" ;
      <C17,_> => "[17]"
    } ;

    -- worst case
    mkNoun : (noms,nomp,locs,locp,lemma : Str) -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str ; lemma : Str } =
      \noms,nomp,locs,locp,lemma,cg ->
      let
        sg_agr = Third cg Sg ;
        pl_agr = Third cg Pl ;
      in
      {
        s = table {
          Sg => table {
            NFull => noms ;
            NReduced => (drop_init_vowel noms) ;
            NPoss => (drop_init_vowel noms) ;
            NLoc => locs
        } ;
          Pl => table {
            NFull => nomp ;
            NReduced => (drop_init_vowel nomp) ;
            NPoss => (drop_init_vowel nomp) ;
            NLoc => locp
          }
        } ;
        c = cg ;
        empty = [] ;
        lemma = lemma
      } ;

    semiRegNoun : (root,locs,locp : Str) -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str ; lemma : Str } =
      \root,locs,locp,cg ->
      let
        noms : Str = nomNoun root Sg cg ;
        nomp : Str = nomNoun root Pl cg ;
      in
      mkNoun noms nomp locs locp root cg ;

    mkELocN : (root : Str) -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str ; lemma : Str } =
      \root,cg ->
      let
        noms : Str = nomNoun root Sg cg ;
        nomp : Str = nomNoun root Pl cg ;
        locs : Str = onlyLocPrefix root Sg cg ;
        locp : Str = onlyLocPrefix root Pl cg ;
      in
      mkNoun noms nomp locs locp root cg ;

    regNoun : Str -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str ; lemma : Str } =
      \root,cg ->
      let
        noms : Str = nomNoun root Sg cg ;
        nomp : Str = nomNoun root Pl cg ;
        locs : Str = locNoun root Sg cg ;
        locp : Str = locNoun root Pl cg ;
        empty = []
      in
      mkNoun noms nomp locs locp root cg ;
    
    mkN_abe : Str -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str ; lemma : Str } = \root -> {
      s = table {
          Sg => table {
            NFull => "um[NPre][1]"+root+"[NStem][1-2]" ;
            NReduced => "m[NPre][1]"+root+"[NStem][1-2]" ;
            NPoss => "m[NPre][1]"+root+"[NStem][1-2]" ;
            NLoc => "k[LocPre]um[NPre][1]"+root+"[NStem][1-2]"
        } ;
          Pl => table {
            NFull => "ab[NPre][2]e"+(drop 1 root)+"[NStem][1-2]" ;
            NReduced => "b[NPre][2]e"+(drop 1 root)+"[NStem][1-2]" ;
            NPoss => "b[NPre][2]e"+(drop 1 root)+"[NStem][1-2]" ;
            NLoc => "ku[LocPre]b[NPre][2]e"+(drop 1 root)+"[NStem][1-2]"
          }
        } ;
        c = C1_2 ;
        empty = [] ;
        lemma = root
    } ;

    irregN : Str -> Str -> Str -> Str -> Str -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str ; lemma : Str } = 
    \root,sgpf,sgr,plpf,plr,cg -> {
      s = table {
        Sg => table {
            NFull => sgpf+"[NPre]"+(noun_prefix_tag cg Sg)+sgr+(noun_stem_tag cg) ;
            NReduced => (drop 1 sgpf)+"[NPre]"+(noun_prefix_tag cg Sg)+sgr+(noun_stem_tag cg) ;
            NPoss => (drop 1 sgpf)+"[NPre]"+(noun_prefix_tag cg Sg)+sgr+(noun_stem_tag cg) ;
            NLoc => locNoun root Sg cg
        } ;
        Pl => table {
          NFull => plpf+"[NPre]"+(noun_prefix_tag cg Pl)+plr+(noun_stem_tag cg) ;
          NReduced => (drop 1 plpf)+"[NPre]"+(noun_prefix_tag cg Pl)+plr+(noun_stem_tag cg) ;
          NPoss => (drop 1 plpf)+"[NPre]"+(noun_prefix_tag cg Pl)+plr+(noun_stem_tag cg) ;
          NLoc => locNoun root Pl cg
        }
        } ;
        c = cg ;
        empty = [] ;
        lemma = root
    } ;

    kwaProperName : Str -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str ; lemma : Str } =
    \root,cg ->
    let
      noms : Str = nomNoun root Sg cg ;
      nomp : Str = nomNoun root Sg cg ;
      locs : Str = "Kwa[LocPre]"+root+(noun_stem_tag cg) ;
      locp : Str = "Kwa[LocPre]"+root+(noun_stem_tag cg) ;
    in
      mkNoun noms nomp locs locp root cg ;

    initNP : Bool -> Agr -> RInit = \ispron,agr -> case ispron of {
      True => RC ;
      False => nominit!agr
    } ;

    nominit : Agr => RInit =
    table {
      Third C1_2 Sg => RU ;
      Third C1_2 Pl => RA ;
      Third C1a_2a Sg => RU ;
      Third C1a_2a Pl => RO ;
      Third C3_4 Sg  => RU ;
      Third C3_4 Pl => RI ;
      Third C5_6 Sg => RI ;
      Third C5_6 Pl => RA ;
      Third C7_8 Sg => RI ;
      Third C7_8 Pl => RI ;
      Third C9_10 Sg => RI ;
      Third C9_10 Pl => RI ;
      Third C11_10 Sg => RU ;
      Third C11_10 Pl => RI ;
      Third C9_6 Sg => RI ;
      Third C9_6 Pl => RA ;
      Third C14 _ => RU ;
      Third C15 _ => RU ;
      Third C17 _ => RU ;
      (First _ | Second _ )  => RC
    } ;

    locinit : Agr => RInit =
    table {
      Third C1_2 Sg => RC ;
      Third C1_2 Pl => RC ;
      Third C1a_2a Sg => RC ;
      Third C1a_2a Pl => RC ;
      Third _ _  => RE ;
      (First _ | Second _ )  => RC
    } ;

    onlyLocPrefix : Str -> Number -> ClassGender -> Str = \root,n,cg ->
    case <cg,n> of
    {
      <C1_2,Sg> => case root of {
        _+#cons+#vowel+#cons+_+#vowel+_ => "ku[LocPre]m[NPre][1]"+root+(noun_stem_tag cg) ;
        _ => "ku[LocPre]mu[NPre][1]"+root+(noun_stem_tag cg)
      } ; -- umu for single syllables, um for the rest
      <C1_2,Pl> => "ku[LocPre]ba[NPre][2]"+root+(noun_stem_tag cg) ; -- abe for tribes or guilds
      <C1a_2a,Sg> => "k[LocPre]u[NPre][1a]"+root+(noun_stem_tag cg) ;
      <C1a_2a,Pl> => "k[LocPre]o[NPre][2a]"+root+(noun_stem_tag cg) ;
      <C3_4,Sg> => case root of {
        ("m"|"M")+_ => "e[LocPre][NPre][3]"+root+(noun_stem_tag cg) ;
        _ => "e[LocPre]m[NPre][3]"+root+(noun_stem_tag cg)
      } ;
      <C3_4,Pl> => "e[LocPre]mi[NPre][4]"+root+(noun_stem_tag cg) ;
      <C5_6,Sg> => case root of {
        ("i"|"I")+_ => "e[LocPre][NPre][5]" + (last root)+(noun_stem_tag cg)  ;
        (#vowel|#vowel_cap)+_ => "e[LocPre]l[NPre][5]" + root+(noun_stem_tag cg) ;
        _ => "e[LocPre][NPre][5]"+root+(noun_stem_tag cg) -- ili long form (not used?)
      } ;
      <C5_6,Pl> => case root of {
        (#vowel|#vowel_cap)+_ => "e[LocPre]m[NPre][6]"+root+(noun_stem_tag cg) ;
        _ => "e[LocPre]ma[NPre][6]"+root+(noun_stem_tag cg)
      } ; 
      <C7_8,Sg> => case root of {
        (#vowel|#vowel_cap)+_ => "e[LocPre]s[NPre][7]"+root+(noun_stem_tag cg);
        _ => "e[LocPre]si[NPre][7]"+root+(noun_stem_tag cg)
      } ; -- is for roots starting with vowel
      <C7_8,Pl> => case root of {
        (#vowel|#vowel_cap)+_ => "e[LocPre]z[NPre][8]"+root+(noun_stem_tag cg) ;
        _ => "e[LocPre]zi[NPre][8]"+root+(noun_stem_tag cg)  -- iz for roots starting with vowel
      } ;
      <C9_10,Sg> => "e[LocPre]"+(prefix_nasal root cg Sg)+(noun_stem_tag cg) ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
      <C9_10,Pl> => "e[LocPre]zi"+(prefix_nasal root cg Pl)+(noun_stem_tag cg) ; -- izim for labial, izin for alveolar (TODO: does this correctly split options?)
      <C11_10,Sg> => case root of {
        (#vowel|#vowel_cap)+_ => "o[LocPre]lw[NPre][11]" + root+(noun_stem_tag cg) ;
        ("w"|"W")+_ => "o[LocPre]l[NPre][11]"+root+(noun_stem_tag cg) ;
        _ => "o[LocPre][NPre][11]"+root+(noun_stem_tag cg)
      } ;
      <C11_10,Pl> => "e[LocPre]zi"+(prefix_nasal root cg Pl)+(noun_stem_tag cg) ; -- izim for labial, izin for alveolar, izi(n|m)k for roots starting with kh
      <C9_6,Sg> => "e[LocPre]"+(prefix_nasal root cg Sg)+(noun_stem_tag cg) ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
      <C9_6,Pl> => case root of {
        (#vowel|#vowel_cap)+_ => "e[LocPre]m[NPre][6]"+root+(noun_stem_tag cg) ;
        _ => "e[LocPre]ma[NPre][6]"+root+(noun_stem_tag cg)
      } ; 
      <C14,_> => "e[LocPre]bu[NPre][14]"+root+(noun_stem_tag cg) ;
      <C15,_> => case root of {
        ("a"|"e"|"A"|"E")+_ => "e[LocPre]kw[NPre][15]"+root+(noun_stem_tag cg) ;
        (#cons|"y"|#cons_cap|"Y")+_ => "e[LocPre]ku[NPre][15]"+root+(noun_stem_tag cg) ;
        _ => "e[LocPre]k[NPre][15]"+root+(noun_stem_tag cg)
        } ; -- ukw for roots starting with a/e, uk for roots starting with o
      <C17,_> => "e[LocPre]ku[NPre][17]"+root+(noun_stem_tag cg)  -- sometimes ukw
    } ;

    -- Src: Doke, Linda Hall
    addLocSuffix : Str -> ClassGender -> Str = \root,cg -> let
        tag = noun_stem_tag cg
      in
      case root of
      {
        _+"mbo" => (tk 3 root) + "nj" + tag + "eni[LocSuf]" ;
        _+"mbu" => (tk 3 root) + "nj" + tag + "ini[LocSuf]" ;
        _+"pho" => (tk 3 root) + "sh" + tag + "eni[LocSuf]" ;
        _+"bho" => (tk 3 root) + "j" + tag + "eni[LocSuf]" ;
        _+"phu" => (tk 3 root) + "sh" + tag + "ini[LocSuf]" ;
        _+"bhu" => (tk 3 root) + "j" + tag + "ini[LocSuf]" ;
        _+"bo" => (tk 2 root) + "tsh" + tag + "eni[LocSuf]" ;
        _+"bu" => (tk 2 root) + "tsh" + tag + "ini[LocSuf]" ;
        _+"mo" => (tk 2 root) + "ny" + tag + "eni[LocSuf]" ;
        _+"mu" => (tk 2 root) + "ny" + tag + "ini[LocSuf]" ;
        _+("a"|"e") => (init root)+"e" + tag + "ni[LocSuf]" ;
        _+"i" => (init root)+"i" + tag + "ni[LocSuf]" ;
        _+"wu" => (init root)+"i" + tag + "ni[LocSuf]" ;
        _+"wo" => (init root)+"e" + tag + "ni[LocSuf]" ;
        _+"o" => (init root)+"w" + tag + "eni[LocSuf]" ;
        _+"u" => (init root)+"w" + tag + "ini[LocSuf]" ;
        _ => root+ tag + "ini[LocSuf]"
      } ;

    drop_init_vowel : Str -> Str = \s ->
    case s of {
      ("a"|"e"|"i"|"o"|"u")+_ => (drop 1 s) ;
      _ => s
    } ;

    vowel : pattern Str = #("a"|"e"|"i"|"o"|"u") ;
    vowel_cap : pattern Str = #("A"|"E"|"I"|"O"|"U") ;
    cons : pattern Str = #("b"|"c"|"d"|"f"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"t"|"v"|"w"|"x"|"y"|"z") ;
    cons_cap : pattern Str = #("B"|"C"|"D"|"F"|"G"|"H"|"J"|"K"|"L"|"M"|"N"|"P"|"Q"|"R"|"S"|"T"|"V"|"W"|"X"|"Y"|"Z") ;
    labial_cons : pattern Str = #("p"|"b"|"f"|"v"|"w") ;
    alveolar_cons : pattern Str = #("s"|"d"|"t"|"z") ;
    nasal_de_asp : pattern Str = #("t"|"k"|"x"|"c"|"q") ;
    nasal_de_asp_cap : pattern Str = #("T"|"K"|"X"|"C"|"Q") ;
    nasal_m : pattern Str = #("v"|"f"|"b") ;
    nasal_m_cap : pattern Str = #("V"|"F"|"B") ;
    nasal_ng : pattern Str = #("x"|"c"|"q") ;
    nasal_ng_cap : pattern Str = #("X"|"C"|"Q") ;
    nasal : pattern Str = #("n"|"m") ;
    nasal_cap : pattern Str = #("N"|"M") ;

    nomNoun : Str -> Number -> ClassGender -> Str = \root,n,cg ->
      case <cg,n> of
      {
        <C1_2,Sg> => case root of {
          (#vowel|#vowel_cap)+_ => "um[NPre][1]"+root+(noun_stem_tag cg) ;
          _+#cons+#vowel+#cons+_+#vowel+_ => "um[NPre][1]"+root+(noun_stem_tag cg) ;
          _ => "umu[NPre][1]"+root+(noun_stem_tag cg)
        } ; -- umu for single syllables, um for the rest
        <C1_2,Pl> => case root of {
          (#vowel|#vowel_cap)+_ => "ab[NPre][2]"+root+(noun_stem_tag cg) ;
          _ => "aba[NPre][2]"+root+(noun_stem_tag cg)  -- abe for tribes or guilds
        } ;
        <C1a_2a,Sg> => "u[NPre][1a]"+root+(noun_stem_tag cg) ;
        <C1a_2a,Pl> => "o[NPre][2a]"+root+(noun_stem_tag cg) ;
        <C3_4,Sg> => case root of {
          ("m"|"M")+_+#vowel+#cons+_+#vowel+_ => "u[NPre][3]"+root+(noun_stem_tag cg) ;
          ("n"|"N")+_+#vowel+#cons+_+#vowel+_ => "u[NPre][3]"+root+(noun_stem_tag cg) ;
          _+(#cons|"y")+#vowel+#cons+_+#vowel+_ => "um[NPre][3]"+root+(noun_stem_tag cg) ;
          ("o"|"O")+_ => "um[NPre][3]"+root+(noun_stem_tag cg) ;
          _ => "umu[NPre][3]"+root+(noun_stem_tag cg)
        } ; -- umu for single syllables, um for the rest
        <C3_4,Pl> => "imi[NPre][4]"+root+(noun_stem_tag cg) ;
        <C5_6,Sg> => case root of {
          ("i"|"I")+_ => "[NPre][5]"+root+(noun_stem_tag cg) ;
          (#vowel|#vowel_cap)+_ => "il[NPre][5]"+root+(noun_stem_tag cg) ;
          _ => "i[NPre][5]"+root+(noun_stem_tag cg)  -- ili long form (not used?)
        } ;
        <C5_6,Pl> => case root of {
          ("i"|"I")+_ => "am[NPre][6]"+root+(noun_stem_tag cg) ;
          (#vowel|#vowel_cap)+_ => "am[NPre][6]"+root+(noun_stem_tag cg) ;
          _ => "ama[NPre][6]"+root+(noun_stem_tag cg)
        } ; 
        <C7_8,Sg> => case root of {
          (#vowel|#vowel_cap)+_ => "is[NPre][7]"+root+(noun_stem_tag cg) ;
          _ => "isi[NPre][7]"+root+(noun_stem_tag cg)
        } ; -- is for roots starting with vowel
        <C7_8,Pl> => case root of {
          (#vowel|#vowel_cap)+_ => "iz[NPre][8]"+root+(noun_stem_tag cg) ;
          _ => "izi[NPre][8]" + root+(noun_stem_tag cg)
        } ;
        <C9_10,Sg> => "i" + (prefix_nasal root cg Sg)+(noun_stem_tag cg) ;
        <C9_10,Pl> => "izi" + (prefix_nasal root cg Pl)+(noun_stem_tag cg) ;
        <C11_10,Sg> => case root of {
          (#vowel|#vowel_cap)+_ => "ulw[NPre][11]"+root+(noun_stem_tag cg) ;
          ("w"|"W")+_ => "ul[NPre][11]"+root+(noun_stem_tag cg) ;
          _ => "u[NPre][11]"+root+(noun_stem_tag cg)
        } ;
        <C11_10,Pl> => "izi" + (prefix_nasal root cg Pl)+(noun_stem_tag cg) ;
        <C9_6,Sg> => "i" + (prefix_nasal root cg Sg)+(noun_stem_tag cg) ;
        <C9_6,Pl> => case root of {
          (#vowel|#vowel_cap)+_ => "am[NPre][6]"+root+(noun_stem_tag cg) ;
          _ => "ama[NPre][6]"+root+(noun_stem_tag cg)
        } ; 
        <C14,_> => "ubu[NPre][14]"+root+(noun_stem_tag cg) ;
        <C15,_> => case root of {
          ("a"|"e"|"A"|"E")+_ => "ukw[NPre][15]"+root+(noun_stem_tag cg) ;
          (#cons|#cons_cap|"y"|"Y")+_ => "uku[NPre][15]"+root+(noun_stem_tag cg) ;
          _ => "uk[NPre][15]"+root+(noun_stem_tag cg)
        } ; -- ukw for roots starting with a/e, uk for roots starting with o
        <C17,_> => "uku[NPre][17]"+root+(noun_stem_tag cg)  -- sometimes ukw
      } ;

    locNoun : Str -> Number -> ClassGender -> Str = \root,n,cg ->
        case <cg,n> of
        {
          <C1_2,Sg> => case root of {
            (#vowel|#vowel_cap)+_ => "ku[LocPre]m[NPre][1]"+root+(noun_stem_tag cg) ;
            _+#cons+#vowel+#cons+_+#vowel+_ => "ku[LocPre]m[NPre][1]"+root+(noun_stem_tag cg) ;
            _ => "ku[LocPre]mu[NPre][1]"+root+(noun_stem_tag cg)
          } ; -- umu for single syllables, um for the rest
          <C1_2,Pl> => case root of {
            (#vowel|#vowel_cap)+_ => "ku[LocPre]b[NPre][2]"+root+(noun_stem_tag cg) ;
            _ => "ku[LocPre]ba[NPre][2]"+root -- abe for tribes or guilds
          } ;
          <C1a_2a,Sg> => "k[LocPre]u[NPre][1a]"+root+(noun_stem_tag cg) ;
          <C1a_2a,Pl> => "k[LocPre]o[NPre][2a]"+root+(noun_stem_tag cg) ;
          <C3_4,Sg> => case root of {
            ("m"|"M")+_ => "e[LocPre][NPre][3]"+(addLocSuffix root cg) ;
            ("n"|"N")+_ => "e[LocPre][NPre][3]"+(addLocSuffix root cg) ;
            _ => "e[LocPre]m[NPre][3]"+(addLocSuffix root cg)
          } ;
          <C3_4,Pl> => "e[LocPre]mi[NPre][4]"+(addLocSuffix root cg) ;
          <C5_6,Sg> => case root of {
            ("i"|"I")+_ => "e[LocPre][NPre][5]"+(addLocSuffix (drop 1 root) cg) ;
            (#vowel|#vowel_cap)+_ => "e[LocPre]l[NPre][5]"+(addLocSuffix root cg) ;
            _ => "e[LocPre][NPre][5]"+(addLocSuffix root cg) -- ili long form (not used?)
          } ;
          <C5_6,Pl> => case root of {
            (#vowel|#vowel_cap)+_ => "e[LocPre]m[NPre][6]"+(addLocSuffix root cg) ;
            _ => "e[LocPre]ma[NPre][6]"+(addLocSuffix root cg)
          } ;
          <C7_8,Sg> => case root of {
            (#vowel|#vowel_cap)+_ => "e[LocPre]s[NPre][7]"+(addLocSuffix root cg) ;
            _ => "e[LocPre]si[NPre][7]"+(addLocSuffix root cg)
          } ; -- is for roots starting with vowel
          <C7_8,Pl> => case root of {
            (#vowel|#vowel_cap)+_ => "e[LocPre]z[NPre][8]"+(addLocSuffix root cg) ;
            _ => "e[LocPre]zi[NPre][8]"+(addLocSuffix root cg)  -- iz for roots starting with vowel
          } ;
          <C9_10,Sg> => "e[LocPre]"+(addLocSuffix (prefix_nasal root cg Sg) cg) ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
          <C9_10,Pl> => "e[LocPre]zi"+(addLocSuffix (prefix_nasal root cg Pl) cg) ; -- izim for labial, izin for alveolar (TODO: does this correctly split options?)
          <C11_10,Sg> => case root of {
            (#vowel|#vowel_cap)+_ => "o[LocPre]lw[NPre][11]"+(addLocSuffix root cg) ;
            ("w"|"W")+_ => "o[LocPre]l[NPre][11]"+(addLocSuffix root cg) ;
            _ => "o[LocPre][NPre][11]"+(addLocSuffix root cg)
          } ;
          <C11_10,Pl> => "e[LocPre]zi"+(addLocSuffix (prefix_nasal root cg Pl) cg) ;
          <C9_6,Sg> => "e[LocPre]"+(addLocSuffix (prefix_nasal root cg Sg) cg) ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
          <C9_6,Pl> => case root of {
            (#vowel|#vowel_cap)+_ => "e[LocPre]m[NPre][6]"+(addLocSuffix root cg) ;
            _ => "e[LocPre]ma[NPre][6]"+(addLocSuffix root cg)
          } ;
          <C14,_> => "e[LocPre]bu[NPre][14]"+(addLocSuffix root cg) ;
          <C15,_> => case root of {
            ("a"|"e"|"A"|"E")+_ => "e[LocPre]kw[NPre][15]"+(addLocSuffix root cg) ;
            (#cons|"y"|#cons_cap|"Y")+_ => "e[LocPre]ku[NPre][15]"+root ;
            _ => "e[LocPre]k[NPre][15]"+(addLocSuffix root cg)
            } ; -- ukw for roots starting with a/e, uk for roots starting with o
          <C17,_> => "e[LocPre]ku[NPre][17]"+(addLocSuffix root cg)  -- sometimes ukw
        } ;


      locS : Agr => Str = table {
        Third C1_2 _ => [] ;
        Third C1a_2a _ => [] ;
        Third _ _  => "s[PreLoc-s]"++BIND ;
        (First _ | Second _ )  => []
      } ;

      -- loc_n_cop_pref : VForm -> Agr -> Str = \vform,agr -> case vform of {
      --   VFIndic _ Neg PresTense => kho_cop vform agr ;
      --   VFIndic _ _ _ => id_pre_cop_pref vform agr
      -- } ;

      loc_n_cop_base : {
        empty : Str ;
        s : NForm => Str ;
        agr : Agr ;
        i : RInit ;
        proDrop : Bool ;
        isPron : Bool ;
        } -> VForm -> Str = \np,vform -> case vform of {
        VFIndic _ Neg PresTense => np.s!NLoc ;
        VFIndic _ _ _ => locS!np.agr ++ np.s!NLoc ;
        VFConsec _ => np.s!NLoc ;
        VFSubjunct _ => np.s!NLoc
      } ;

      loc_NP : {
        empty : Str ;
        s : NForm => Str ;
        -- mod : Str ;
        -- dem : Str ;
        -- predet_pre : Str ;
        -- predet_post : Str ;
        agr : Agr ;
        proDrop : Bool ;
        isPron : Bool ;
        -- reqLocS : Bool ;
        -- qdef : QuantDef
      } -> Str = \np -> np.s!NLoc ;

      poss_NP : {
        empty : Str ;
        s : NForm => Str ;
        -- mod : Str ;
        -- dem : Str ;
        -- predet_pre : Str ;
        -- predet_post : Str ;
        agr : Agr ;
        proDrop : Bool ;
        isPron : Bool
        -- reqLocS : Bool ;
        -- qdef : QuantDef
      } -> Str = \np -> np.s!NPoss ;

      pref_lin_NP : {
        empty : Str ;
        s : NForm => Str ;
        mod : Str ;
        dem : Str ;
        predet_pre : Str ;
        predet_post : Str ;
        agr : Agr ;
        proDrop : Bool ;
        isPron : Bool ;
        -- reqLocS : Bool ;
        qdef : QuantDef
      } -> Str = \np -> np.s ! NReduced ++ np.dem ++ np.mod
      ++ np.predet_pre ++ np.predet_post ;

    ----------------
    -- CONGRUENCE --
    ----------------

    -- SUBJECT AGREEMENT MORPHEME --

    -- NOTE : the empty SCVow for class 6 might produce a dangling BIND token, causing bugs
    -- TODO: SC following vowel
    subjConcLookup : Agr => SCForm => Str =
      table {
        -- agr                     default        before vowel     after neg pref    sit/part         potential/subjunct/indirect relative
        First Sg =>         table {SC => "ngi[SC][1ps]" ;  SCVow => "ng[SC][1ps]"++BIND ;  SCNeg => "ngi[SCNeg][1ps]" ; SCNegVow => "ng[SCNeg][1ps]" ; SCPT => "nga[SCPT][1ps]" ; SCPS => "ngi" ; SCVowP => "ngi[SCPast][1ps]" ; SCBe => "bengi[SCBe][1ps]" ; SCRP => "ngangi[SCRP][1ps]" ; SCSe => "ngise[SCSe][1ps]" } ;
        Second Sg =>        table {SC => "u[SC][2ps]" ;    SCVow => "w[SC][2ps]"++BIND ;   SCNeg => "wu[SCNeg][2ps]" ;  SCNegVow => "w[SCNeg][2ps]" ;  SCPT => "wa[SCPT][2ps]" ;   SCPS => "u" ;   SCVowP => "wu[SCPast][2ps]" ;  SCBe => "ubu[SCBe][2ps]" ;   SCRP => "wawu[SCRP][2ps]" ; SCSe => "sewu[SCSe][2ps]" } ;
        First Pl =>         table {SC => "si[SC][1pp]" ;   SCVow => "s[SC][1pp]"++BIND ;   SCNeg => "si[SCNeg][1pp]" ;  SCNegVow => "s[SCNeg][1pp]" ; SCPT => "sa[SCPT][1pp]" ;  SCPS => "si" ;  SCVowP => "si[SCPast][1pp]" ;  SCBe => "besi[SCBe][1pp]" ;   SCRP => "sasi[SCRP][1pp]" ; SCSe => "sesi[SCSe][1pp]" } ;
        Second Pl =>        table {SC => "ni[SC][2pp]" ;   SCVow => "n[SC][2pp]"++BIND ;   SCNeg => "ni[SCNeg][2pp]" ;  SCNegVow => "n[SCNeg][2pp]" ; SCPT => "na[SCPT][2pp]" ;  SCPS => "ni" ;  SCVowP => "ni[SCPast][2pp]" ;  SCBe => "beni[SCBe][2pp]" ;   SCRP => "nani[SCRP][2pp]" ; SCSe => "seni[SCSe][2pp]" } ;
        Third C1_2 Sg =>    table {SC => "u[SC][1]" ;    SCVow => "w[SC][1]"++BIND ;   SCNeg => "ka[SCNeg][1]" ;  SCNegVow => "k[SCNeg][1]" ; SCPT => "wa[SCPT][1]" ;   SCPS => "a" ;   SCVowP => "wu[SCPast][1]" ;  SCBe => "ube[SCBe][1]" ;    SCRP => "waye[SCRP][1]" ; SCSe => "seye[SCSe][1]" } ;
        Third C1_2 Pl =>    table {SC => "ba[SC][2]" ;   SCVow => "b[SC][2]"++BIND ;   SCNeg => "ba[SCNeg][2]" ;  SCNegVow => "b[SCNeg][2]" ; SCPT => "ba[SCPT][2]" ;  SCPS => "ba" ;  SCVowP => "ba[SCPast][2]" ;  SCBe => "bebe[SCBe][2]" ;   SCRP => "babe[SCRP][2]" ; SCSe => "sebe[SCSe][2]" } ;
        Third C1a_2a Sg =>  table {SC => "u[SC][1a]" ;    SCVow => "w[SC][1a]"++BIND ;   SCNeg => "ka[SCNeg][1a]" ;  SCNegVow => "k[SCNeg][1a]" ; SCPT => "wa[SCPT][1a]" ;   SCPS => "a" ;   SCVowP => "wu[SCPast][1a]" ;  SCBe => "ube[SCBe][1a]" ;    SCRP => "waye[SCRP][1a]" ; SCSe => "seye[SCSe][1a]" } ;
        Third C1a_2a Pl =>  table {SC => "ba[SC][2a]" ;   SCVow => "b[SC][2a]"++BIND ;   SCNeg => "ba[SCNeg][2a]" ;  SCNegVow => "b[SCNeg][2a]" ; SCPT => "ba[SCPT][2a]" ;  SCPS => "ba" ;  SCVowP => "ba[SCPast][2a]" ;  SCBe => "bebe[SCBe][2a]" ;   SCRP => "babe[SCRP][2a]" ; SCSe => "sebe[SCSe][2a]" } ;
        Third C3_4 Sg =>    table {SC => "u[SC][3]" ;    SCVow => "w[SC][3]"++BIND ;   SCNeg => "wu[SCNeg][3]" ;  SCNegVow => "w[SCNeg][3]" ; SCPT => "uwa[SCPT][3]" ;   SCPS => "u" ;   SCVowP => "wu[SCPast][3]" ;  SCBe => "ubu[SCBe][3]" ;    SCRP => "wawu[SCRP][3]" ; SCSe => "sewu[SCSe][3]" } ;
        Third C3_4 Pl =>    table {SC => "i[SC][4]" ;    SCVow => "y[SC][4]"++BIND ;   SCNeg => "yi[SCNeg][4]" ;  SCNegVow => "y[SCNeg][4]" ; SCPT => "ya[SCPT][4]" ;   SCPS => "i" ;   SCVowP => "yi[SCPast][4]" ;  SCBe => "ibi[SCBe][4]" ;    SCRP => "yayi[SCRP][4]" ; SCSe => "seyi[SCSe][4]" } ;
        Third C5_6 Sg =>    table {SC => "li[SC][5]" ;   SCVow => "l[SC][5]"++BIND ;   SCNeg => "li[SCNeg][5]" ;  SCNegVow => "l[SCNeg][5]" ; SCPT => "la[SCPT][5]" ;  SCPS => "li" ;  SCVowP => "li[SCPast][5]" ;  SCBe => "beli[SCBe][5]" ;   SCRP => "lali[SCRP][5]" ; SCSe => "seli[SCSe][5]" } ;
        Third C5_6 Pl =>    table {SC => "a[SC][6]" ;    SCVow => [] ;          SCNeg => "wa[SCNeg][6]" ;  SCNegVow => "w[SCNeg][6]" ; SCPT => "a[SCPT][6]" ;   SCPS => "a" ;   SCVowP => "wa[SCPast][6]" ;  SCBe => "abe[SCBe][6]" ;    SCRP => "aye[SCRP][6]" ; SCSe => "seye[SCSe][6]" } ;
        Third C7_8 Sg =>    table {SC => "si[SC][7]" ;   SCVow => "s[SC][7]"++BIND ;   SCNeg => "si[SCNeg][7]" ;  SCNegVow => "s[SCNeg][7]" ; SCPT => "sa[SCPT][7]" ;  SCPS => "si" ;  SCVowP => "si[SCPast][7]" ;  SCBe => "besi[SCBe][7]" ;   SCRP => "sasi[SCRP][7]" ; SCSe => "sesi[SCSe][7]" } ;
        Third C7_8 Pl =>    table {SC => "zi[SC][8]" ;   SCVow => "z[SC][8]"++BIND ;   SCNeg => "zi[SCNeg][8]" ;  SCNegVow => "z[SCNeg][8]" ; SCPT => "za[SCPT][8]" ;  SCPS => "zi" ;  SCVowP => "zi[SCPast][8]" ;  SCBe => "bezi[SCBe][8]" ;   SCRP => "zazi[SCRP][8]" ; SCSe => "sezi[SCSe][8]" } ;
        Third C9_10 Sg =>   table {SC => "i[SC][9]" ;    SCVow => "y[SC][9]"++BIND ;   SCNeg => "yi[SCNeg][9]" ;  SCNegVow => "y[SCNeg][9]" ; SCPT => "ya[SCPT][9]" ;  SCPS => "i" ;   SCVowP => "yi[SCPast][9]" ;  SCBe => "ibi[SCBe][9]" ;    SCRP => "yayi[SCRP][9]" ; SCSe => "seyi[SCSe][9]" } ;
        -- Third C9_10 Sg =>   table {SC => "i" ;    SCVow => "i"++BIND ;   SCNeg => "yi" ;  SCPT => "yi" ;  SCPS => "i" ;   SCVowP => "yi" ;  SCBe => "ibi" } ;
        Third C9_10 Pl =>   table {SC => "zi[SC][10]" ;   SCVow => "z[SC][10]"++BIND ;   SCNeg => "zi[SCNeg][10]" ;  SCNegVow => "z[SCNeg][10]" ; SCPT => "za[SCPT][10]" ;  SCPS => "zi" ;  SCVowP => "zi[SCPast][10]" ;  SCBe => "bezi[SCBe][10]" ;   SCRP => "zazi[SCRP][10]" ; SCSe => "sezi[SCSe][10]" } ;
        Third C11_10 Sg =>  table {SC => "lu[SC][11]" ;   SCVow => "l[SC][11]"++BIND ;  SCNeg => "lu[SCNeg][11]" ;  SCNegVow => "l[SCNeg][11]" ; SCPT => "lwa[SCPT][11]" ;  SCPS => "lu" ;  SCVowP => "lu[SCPast][11]" ;  SCBe => "belu[SCBe][11]" ;   SCRP => "lwalu[SCRP][11]" ; SCSe => "selu[SCSe][11]" } ;
        Third C11_10 Pl =>  table {SC => "zi[SC][10]" ;   SCVow => "z[SC][10]"++BIND ;   SCNeg => "zi[SCNeg][10]" ;  SCNegVow => "z[SCNeg][10]" ; SCPT => "za[SCPT][10]" ;  SCPS => "zi" ;  SCVowP => "zi[SCPast][10]" ;  SCBe => "bezi[SCBe][10]" ;   SCRP => "zazi[SCRP][10]" ; SCSe => "sezi[SCSe][10]" } ;
        Third C9_6 Sg =>    table {SC => "i[SC][9]" ;    SCVow => "y[SC][9]"++BIND ;   SCNeg => "yi[SCNeg][9]" ;  SCNegVow => "y[SCNeg][9]" ; SCPT => "ya[SCPT][9]" ;  SCPS => "i" ;   SCVowP => "yi[SCPast][9]" ;  SCBe => "ibi[SCBe][9]" ;    SCRP => "yayi[SCRP][9]" ; SCSe => "seyi[SCSe][9]" } ;
        Third C9_6 Pl =>    table {SC => "a[SC][6]" ;    SCVow => [] ;          SCNeg => "wa[SCNeg][6]" ;  SCNegVow => "w[SCNeg][6]" ; SCPT => "a[SCPT][6]" ;   SCPS => "a" ;   SCVowP => "wa[SCPast][6]" ;  SCBe => "abe[SCBe][6]" ;    SCRP => "aye[SCRP][6]" ; SCSe => "seye[SCSe][6]" } ;
        Third C14 _ =>      table {SC => "bu[SC][14]" ;   SCVow => "b[SC][14]"++BIND ;   SCNeg => "bu[SCNeg][14]" ;  SCNegVow => "b[SCNeg][14]" ; SCPT => "ba[SCPT][14]" ;  SCPS => "bu" ;  SCVowP => "bu[SCPast][14]" ;  SCBe => "bebu[SCBe][14]" ;   SCRP => "babu[SCRP][14]" ; SCSe => "sebu[SCSe][14]" } ;
        Third C15 _ =>      table {SC => "ku[SC][15]" ;   SCVow => "k[SC][15]"++BIND ;  SCNeg => "ku[SCNeg][15]" ;  SCNegVow => "k[SCNeg][15]" ; SCPT => "ka[SCPT][15]" ;  SCPS => "ku" ;  SCVowP => "ku[SCPast][15]" ;  SCBe => "beku[SCBe][15]" ;   SCRP => "kwaku[SCRP][15]" ; SCSe => "seku[SCSe][15]" } ;
        Third C17 _ =>      table {SC => "ku[SC][17]" ;   SCVow => "k[SC][17]"++BIND ;  SCNeg => "ku[SCNeg][17]" ;  SCNegVow => "k[SCNeg][17]" ; SCPT => "ka[SCPT][17]" ;  SCPS => "ku" ;  SCVowP => "ku[SCPast][17]" ;  SCBe => "beku[SCBe][17]" ;   SCRP => "kwaku[SCRP][17]" ; SCSe => "seku[SCSe][17]" }
      } ;

    subjConc : VForm -> Agr -> Bool -> RInit -> Str = \vform,agr,vow,rinit ->
      case <vow,vform,agr,rinit> of {
          <False,VFIndic _ Neg _,_> => subjConcLookup ! agr ! SCNeg ++BIND ;
          <True,VFIndic _ Neg _,_> => subjConcLookup ! agr ! SCNegVow ++BIND ;
          <True,VFIndic _ _ _,Third C17 _,(RA|RE|RI)> => subjConcLookup ! agr ! SCVow ;
          <True,VFIndic _ _ _,_,_> => subjConcLookup ! agr ! SCVow ;
          <_,VFIndic _ _ RemPastTense,_,_> => subjConcLookup ! agr ! SCVow ;
          <_,VFIndic _ _ _,_,_>   => subjConcLookup ! agr ! SC ++BIND ;
          <False,VFConsec _ ,_,_> => subjConcLookup ! agr ! SCPT ++BIND ;
          <True,VFConsec Pos ,Third C17 _,(RA|RE|RI)> => subjConcLookup ! agr ! SCVow ;
          <True,VFConsec Pos ,_,_> => subjConcLookup ! agr ! SCVow ;
          <True,VFConsec Neg ,_,_> => subjConcLookup ! agr ! SCPT ++BIND ;
          <False,VFSubjunct _,_,_> => case agr of {
            Third C1_2 Sg => "a[SC][1]" ++BIND ;
            Third C1a_2a Sg => "a[SC][1a]" ++BIND ;
            (Third _ _ | First _ | Second _ ) => subjConcLookup ! agr ! SC ++BIND
          } ;
          <True,VFSubjunct Pos,Third C17 _,(RA|RE|RI)> => case agr of {
            Third C1_2 Sg => [] ;
            Third C1a_2a Sg => [] ;
            (Third _ _ | First _ | Second _ ) => subjConcLookup ! agr ! SCVow 
          } ;
          <True,VFSubjunct Pos,_,_> => case agr of {
            Third C1_2 Sg => [] ;
            Third C1a_2a Sg => [] ;
            (Third _ _ | First _ | Second _ ) => subjConcLookup ! agr ! SCVow
          } ;
          <True,VFSubjunct Neg,_,_> => case agr of {
            Third C1_2 Sg => "a[SC][1]" ++BIND ;
            Third C1a_2a Sg => "a[SC][1a]" ++BIND ;
            (Third _ _ | First _ | Second _ ) => subjConcLookup ! agr ! SC ++BIND
          }
      } ;

    impPref : Polarity -> Str = \pol -> case pol of {
      Pos => [] ;
      Neg => "u[SC][2ps]" ++BIND++ "nga[NegPre]" ++BIND
    } ;

    icomp_pref : VForm -> Agr -> Str = \vform,agr ->
    let
      neg1 = icompNeg1 vform ;
      neg2 = icompNeg2 vform ;
    in
    case vform of {
      VFIndic _ Pos PresTense => subjConcLookup ! agr ! SC ++BIND ;
      VFIndic _ Pos PastTense => [] ;
      VFIndic _ Pos RemPastTense => subjConcLookup ! agr ! SC ++BIND++ "be[AuxV]" ++ subjConcLookup ! agr ! SCBe ++BIND ;
      VFIndic _ Pos FutTense => subjConcLookup ! agr ! SC ++BIND ++ TEMP_PREF_FUT++BIND++"be[AuxV]" ++ subjConcLookup ! agr ! SC ++BIND ;
      VFIndic _ Pos RemFutTense => subjConcLookup ! agr ! SC ++BIND ++ TEMP_PREF_REMFUT++BIND++"be[AuxV]" ++ subjConcLookup ! agr ! SC ++BIND ;

      -- might have to add an SCNegBe to the table
      VFIndic _ Neg PresTense => neg1 ++ subjConcLookup ! agr ! SCNeg ++BIND ++ neg2 ;
      VFIndic _ Neg PastTense => NEG_NGA ; -- neg1 ++ "be"++BIND++ subjConcLookup ! agr ! SCBe ++BIND ++ neg2 ;
      VFIndic _ Neg RemPastTense => neg1 ++ subjConcLookup ! agr ! SC ++BIND++ "be[AuxV]" ++ subjConcLookup ! agr ! SCBe ++BIND ++ neg2 ;
      VFIndic _ Neg FutTense => neg1 ++ subjConcLookup ! agr ! SCNeg ++BIND ++ TEMP_PREF_FUT++BIND++"be[AuxV]" ++ subjConcLookup ! agr ! SCBe ++BIND ++ neg2 ;
      VFIndic _ Neg RemFutTense => neg1 ++ subjConcLookup ! agr ! SCNeg ++BIND ++ TEMP_PREF_REMFUT++BIND++"be[AuxV]" ++ subjConcLookup ! agr ! SCBe ++BIND ++ neg2 ;
      VFConsec _ => nonExist ; -- "*consec" ;
      VFSubjunct _ => nonExist -- "*subjunct"
    } ;

    -- OBJECT AGREEMENT MORPHEME --

    objConcLookup : Agr => OCForm => Str =
      table {
        First Sg =>         table {OC => "ngi[OC][1ps]" ;  OCAE => "ng[OC][1ps]" ;  OCIOU => "ng[OC][1ps]" ; OCMono => "ngi[OC][1ps]" ; OCThing => "ngi" } ;
        Second Sg =>        table {OC => "ku[OC][2ps]" ;   OCAE => "k[OC][2ps]" ;   OCIOU => "k[OC][2ps]" ; OCMono => "ku[OC][2ps]" ; OCThing => "ku" } ;
        First Pl =>         table {OC => "si[OC][1pp]" ;   OCAE => "s[OC][1pp]" ;   OCIOU => "s[OC][1pp]" ; OCMono => "si[OC][1pp]" ; OCThing => "si" } ;
        Second Pl =>        table {OC => "ni[OC][2pp]" ;   OCAE => "n[OC][2pp]" ;   OCIOU => "n[OC][2pp]" ; OCMono => "ni[OC][2pp]" ; OCThing => "ni" } ;
        Third C1_2 Sg =>    table {OC => "m[OC][1]" ;    OCAE => "m[OC][1]" ;   OCIOU => "m[OC][1]" ; OCMono => "mu[OC][1]" ; OCThing => "wu" } ;
        Third C1_2 Pl =>    table {OC => "ba[OC][2]" ;   OCAE => "b[OC][2]" ;   OCIOU => "b[OC][2]" ; OCMono => "ba[OC][2]" ; OCThing => "ba" } ;
        Third C1a_2a Sg =>  table {OC => "m[OC][1a]" ;    OCAE => "m[OC][1a]" ;   OCIOU => "m[OC][1a]" ; OCMono => "mu[OC][1a]" ; OCThing => "wu" } ;
        Third C1a_2a Pl =>  table {OC => "ba[OC][2a]" ;   OCAE => "b[OC][2a]" ;   OCIOU => "b[OC][2a]" ; OCMono => "ba[OC][2a]" ; OCThing => "ba" } ;
        Third C3_4 Sg =>    table {OC => "wu[OC][3]" ;   OCAE => "w[OC][3]" ;   OCIOU => "w[OC][3]" ; OCMono => "wu[OC][3]" ; OCThing => "wu" } ;
        Third C3_4 Pl =>    table {OC => "yi[OC][4]" ;   OCAE => "y[OC][4]" ;   OCIOU => "y[OC][4]" ; OCMono => "yi[OC][4]" ; OCThing => "yi" } ;
        Third C5_6 Sg =>    table {OC => "li[OC][5]" ;   OCAE => "l[OC][5]" ;   OCIOU => "l[OC][5]" ; OCMono => "li[OC][5]" ; OCThing => "li" } ;
        Third C5_6 Pl =>    table {OC => "wa[OC][6]" ;   OCAE => "w[OC][6]" ;   OCIOU => "w[OC][6]" ; OCMono => "wa[OC][6]" ; OCThing => "wa" } ;
        Third C7_8 Sg =>    table {OC => "si[OC][7]" ; OCAE => "s[OC][7]" ; OCIOU => "s[OC][7]" ; OCMono => "si[OC][7]" ; OCThing => "si" } ;
        Third C7_8 Pl =>    table {OC => "zi[OC][8]" ; OCAE => "z[OC][8]" ; OCIOU => "z[OC][8]" ; OCMono => "zi[OC][8]" ; OCThing => "zi" } ;
        Third C9_10 Sg =>   table {OC => "yi[OC][9]" ; OCAE => "y[OC][9]" ; OCIOU => "y[OC][9]" ; OCMono => "yi[OC][9]" ; OCThing => "yi" } ;
        Third C9_10 Pl =>   table {OC => "zi[OC][10]" ; OCAE => "z[OC][10]" ; OCIOU => "z[OC][10]" ; OCMono => "zi[OC][10]" ; OCThing => "zi" } ;
        Third C11_10 Sg =>  table {OC => "lu[OC][11]" ; OCAE => "lw[OC][11]" ; OCIOU => "l[OC][11]" ; OCMono => "lu[OC][11]" ; OCThing => "lu" } ;
        Third C11_10 Pl =>  table {OC => "zi[OC][10]" ; OCAE => "z[OC][10]" ; OCIOU => "z[OC][10]" ; OCMono => "zi[OC][10]" ; OCThing => "zi" } ;
        Third C9_6 Sg =>    table {OC => "yi[OC][9]" ; OCAE => "y[OC][9]" ; OCIOU => "y[OC][9]" ; OCMono => "yi[OC][9]" ; OCThing => "yi" } ;
        Third C9_6 Pl =>    table {OC => "wa[OC][6]" ; OCAE => "w[OC][6]" ; OCIOU => "w[OC][6]" ; OCMono => "wa[OC][6]" ; OCThing => "wa" } ;
        Third C14 _ =>      table {OC => "bu[OC][14]" ; OCAE => "bw[OC][14]" ; OCIOU => "b[OC][14]" ; OCMono => "bu[OC][14]" ; OCThing => "bu" } ;
        Third C15 _ =>      table {OC => "ku[OC][15]" ; OCAE => "kw[OC][15]" ; OCIOU => "k[OC][15]" ; OCMono => "ku[OC][15]" ; OCThing => "ku" } ;
        Third C17 _ =>      table {OC => "ku[OC][17]" ; OCAE => "kw[OC][17]" ; OCIOU => "k[OC][17]" ; OCMono => "ku[OC][17]" ; OCThing => "ku" }
      } ;

    -- ignoring the thing thing for now, must probably add something like gender to nouns...
    objConc : Agr -> RInit -> Syl -> Str = \agr,rinit,syl ->
      case rinit of {
        (RA|RE) => objConcLookup ! agr ! OCAE ++BIND ;
        (RI|RO|RU) => objConcLookup ! agr ! OCIOU ++BIND ;
        RC => case syl of {
          SylMono => objConcLookup ! agr ! OCMono ++BIND ;
          _ => objConcLookup ! agr ! OC ++BIND
        }
      } ;

    -- RELATIVE ANTECEDENT AGREEMENT MORPHEME --

    relConc : VForm -> Agr -> RInit -> Str = \p,a,r -> case p of {
    --  VFIndic CType Polarity BasicTense
      VFIndic RelCl Pos PresTense => relConcLookup!a!r ;
      VFIndic RelCl Pos RemPastTense => relConcLookup!a!RA ;
      VFIndic RelCl Pos PastTense => relConcLookup!a!r ;
      VFIndic RelCl Pos _ => relConcLookup!a!RC ;
      VFIndic RelCl Neg PresTense => case r of {
        RC => relConcLookup!a!RC ++ NEG_NGA ++BIND ;
        _ => relConcLookup!a!RC ++ NEG_NG ++BIND
      } ;
      VFIndic RelCl Neg PastTense => case r of {
        RC => relConcLookup!a!RC ++ NEG_NGA ++BIND ;
        _ => relConcLookup!a!RC ++ NEG_NG ++BIND
      } ;
      VFIndic RelCl Neg RemPastTense => case r of {
        RC => relConcLookup!a!RC ++ NEG_NGA ++BIND ;
        _ => relConcLookup!a!RC ++ NEG_NG ++BIND
      } ;
      VFIndic RelCl Neg FutTense => relConcLookup!a!RC ++ NEG_NGA ++BIND ;
      VFIndic RelCl Neg RemFutTense => relConcLookup!a!RC ++ NEG_NGA ++BIND ;
      VFIndic _ _ _ => [] ;
      VFConsec _ => [] ;
      VFSubjunct _ => []
    } ;

    relConcCop : VForm -> Agr -> RInit ->Str = \vform,a,r -> case vform of {
      VFIndic _ _ PresTense => relConcLookup!a!RC ;
      VFIndic _ _ FutTense => relConcLookup!a!RC ;
      VFIndic _ _ RemFutTense => relConcLookup!a!RC ;
      VFIndic _ _ PastTense => relCopConcBeLookup!a ;
      VFIndic _ _ RemPastTense => case a of {
        Third C5_6 Pl => [] ; -- relConcLookup!a!RA ; -- a + aye = aye
        (First _ | Second _ | Third _ _ ) => shortRelConc!a
      } ;
      VFConsec _ => [] ;
      VFSubjunct _ => []
    } ;

    quantConcCop : VForm -> Agr -> Str = \vform,a -> case vform of {
      VFIndic _ _ PresTense => relConcLookup!a!(quantinit!a) ;
      VFIndic _ _ FutTense => relConcLookup!a!(quantinit!a) ;
      VFIndic _ _ RemFutTense => relConcLookup!a!(quantinit!a) ;
      VFIndic _ _ PastTense => relCopConcBeLookup!a ;
      VFIndic _ _ RemPastTense => case a of {
        Third C5_6 Pl => [] ; -- relConcLookup!a!RA ; -- a + aye = aye
        (First _ | Second _ | Third _ _ ) => shortRelConc!a
      } ;
      VFConsec _ => [] ;
      VFSubjunct _ => []
    } ;

    adjConcCop : VForm -> Agr -> RInit ->Str = \vform,a,r -> case vform of {
      VFIndic _ Pos PresTense => shortRelConc!a ;
      VFIndic _ Neg PresTense => adjConcLookup!a!RC ;
      VFIndic _ _ FutTense => adjConcLookup!a!RC ;
      VFIndic _ _ RemFutTense => adjConcLookup!a!RC ;
      VFIndic _ _ PastTense => relCopConcBeLookup!a ;
      VFIndic _ _ RemPastTense => case a of {
        Third C5_6 Pl => [] ; -- relConcLookup!a!RA ; -- a + aye = aye
        (First _ | Second _ | Third _ _ ) => shortRelConc!a
      } ;
      VFConsec _ => [] ;
      VFSubjunct _ => []
    } ;

    relConcLookup : Agr => RInit => Str =
      table {
        Third C1_2 Sg => table { RO => "[RC][1]"++BIND ; (RA|RE) => "ow[RC][1]"++BIND ; _ => "o[RC][1]"++BIND } ;
        Third C1_2 Pl => table { RC => "aba[RC][2]"++BIND ; _ => "ab[RC][2]"++BIND } ;
        Third C1a_2a Sg => table { RO => "[RC][1a]"++BIND ; (RA|RE) => "ow[RC][1a]"++BIND ; _ => "o[RC][1a]"++BIND } ;
        Third C1a_2a Pl => table { RC => "aba[RC][2a]"++BIND ; _ => "ab[RC][2a]"++BIND } ;
        Third C3_4 Sg  => table { RO => "[RC][3]"++BIND ; (RA|RE) => "ow[RC][3]"++BIND ; _ => "o[RC][3]"++BIND } ;
        Third C3_4 Pl => table { RE => "[RC][4]"++BIND ; (RA|RO) => "ey[RC][4]" ++BIND ; _ => "e[RC][4]"++BIND } ;
        Third C5_6 Sg => table { RC => "eli[RC][5]"++BIND ; _ => "el[RC][5]"++BIND } ;
        Third C5_6 Pl => table { RC => "a[RC][6]"++BIND ; _ => "[RC][6]"++BIND } ;
        Third C7_8 Sg => table { RC => "esi[RC][7]"++BIND ; _ => "es[RC][7]"++BIND } ;
        Third C7_8 Pl => table { RC => "ezi[RC][8]"++BIND ; _ => "ez[RC][8]"++BIND } ;
        Third C9_10 Sg => table { RE => "[RC][9]"++BIND ; (RA|RO) => "ey[RC][9]" ++BIND ; _ => "e[RC][9]"++BIND } ;
        Third C9_10 Pl => table { RC => "ezi[RC][10]"++BIND ; _ => "ez[RC][10]"++BIND } ;
        Third C11_10 Sg => table { RC => "olu[RC][11]"++BIND ; (RA|RE) => "olw[RC][11]" ; _ => "ol[RC][11]"++BIND } ;
        Third C11_10 Pl => table { RC => "ezi[RC][10]"++BIND ; _ => "ez[RC][10]"++BIND } ;
        Third C9_6 Sg => table { RE => "[RC][9]"++BIND ; (RA|RO) => "ey[RC][9]" ++BIND ; _ => "e[RC][9]"++BIND } ;
        Third C9_6 Pl => table { RC => "a[RC][6]"++BIND ; _ => "[RC][6]"++BIND } ;
        Third C14 _ => table { RC => "obu[RC][14]"++BIND ; _ => "ob[RC][14]"++BIND } ;
        Third C15 _ => table { RC => "oku[RC][15]"++BIND ; (RA|RE) => "okw[RC][15]" ; _ => "ok[RC][15]"++BIND } ;
        Third C17 _ => table { RC => "oku[RC][17]"++BIND ; (RA|RE) => "okw[RC][17]" ; _ => "ok[RC][17]"++BIND } ;
        First Sg => table { RC => "engi[RC][1ps]"++BIND ; _ => "eng[RC][1ps]"++BIND } ;
        First Pl => table { RC => "esi[RC][1pp]"++BIND ; _ => "es[RC][1pp]"++BIND } ;
        Second Sg  => table { RE => "ow[RC][2ps]"++BIND ; _ => "o[RC][2ps]"++BIND } ;
        Second Pl => table { RC => "eni[RC][2pp]"++BIND ; _ => "en[RC][2pp]"++BIND }
    } ;

    adjConcLookup : Agr => RInit => Str =
      table {
        Third C1_2 Sg => table { RO => "[AC][1]" ; (RA|RE) => "ow[AC][1]"++BIND ; _ => "o[AC][1]"++BIND } ;
        Third C1_2 Pl => table { RC => "aba[AC][2]"++BIND ; _ => "ab[AC][2]"++BIND } ;
        Third C1a_2a Sg => table { RO => "[AC][1a]" ; (RA|RE) => "ow[AC][1a]"++BIND ; _ => "o[AC][1a]"++BIND } ;
        Third C1a_2a Pl => table { RC => "aba[AC][2a]"++BIND ; _ => "ab[AC][2a]"++BIND } ;
        Third C3_4 Sg  => table { RO => "[AC][3]" ; (RA|RE) => "ow[AC][3]"++BIND ; _ => "o[AC][3]"++BIND } ;
        Third C3_4 Pl => table { RC => "emi[AC][4]"++BIND ; _ => "em[AC][4]"++BIND } ;
        Third C5_6 Sg => table { RC => "eli[AC][5]"++BIND ; _ => "el[AC][5]"++BIND } ;
        Third C5_6 Pl => table { RC => "a[AC][6]"++BIND ; _ => "[AC][6]" } ;
        Third C7_8 Sg => table { RC => "esi[AC][7]"++BIND ; _ => "es[AC][7]"++BIND } ;
        Third C7_8 Pl => table { RC => "ezi[AC][8]"++BIND ; _ => "ez[AC][8]"++BIND } ;
        Third C9_10 Sg => table { RE => "[AC][9]" ; (RA|RO) => "ey[AC][9]"++BIND ; _ => "e[AC][9]"++BIND } ;
        Third C9_10 Pl => table { RC => "ezi[AC][10]"++BIND ; _ => "ez[AC][10]"++BIND } ;
        Third C11_10 Sg => table { RC => "olu[AC][11]"++BIND ; (RA|RE) => "olw[AC][11]"++BIND ; _ => "ol[AC][11]"++BIND } ;
        Third C11_10 Pl => table { RC => "ezi[AC][10]"++BIND ; _ => "ez[AC][10]"++BIND } ;
        Third C9_6 Sg => table { RE => "[AC][9]" ; (RA|RO) => "ey[AC][9]"++BIND ; _ => "e[AC][9]"++BIND } ;
        Third C9_6 Pl => table { RC => "a[AC][6]"++BIND ; _ => "[AC][6]" } ;
        Third C14 _ => table { RC => "obu[AC][14]"++BIND ; _ => "ob[AC][14]"++BIND } ;
        Third C15 _ => table { RC => "oku[AC][15]"++BIND ; (RA|RE) => "okw[AC][15]" ; _ => "ok[AC][15]"++BIND } ;
        Third C17 _ => table { RC => "oku[AC][17]"++BIND ; (RA|RE) => "okw[AC][17]" ; _ => "ok[AC][17]"++BIND } ;
        First Sg => table { RC => "engi[AC][1ps]"++BIND ; _ => "eng[AC][1ps]"++BIND } ;
        First Pl => table { RC => "esi[AC][1pp]"++BIND ; _ => "es[AC][1pp]"++BIND } ;
        Second Sg  => table { RE => "ow[AC][2ps]"++BIND ; _ => "o[AC][2ps]"++BIND } ;
        Second Pl => table { RC => "eni[AC][2pp]"++BIND ; _ => "en[AC][2pp]"++BIND }
    } ;

    relCopConcBeLookup : Agr => Str =
      table {
        Third C1_2 Sg => "obe[RCBe][1]"++BIND ;
        Third C1_2 Pl => "ababe[RCBe][2]"++BIND ;
        Third C1a_2a Sg => "obe[RCBe][1a]"++BIND ;
        Third C1a_2a Pl => "ababe[RCBe][2a]"++BIND ;
        Third C3_4 Sg  => "obu[RCBe][3]"++BIND ;
        Third C3_4 Pl => "ebi[RCBe][4]"++BIND ;
        Third C5_6 Sg => "ebeli[RCBe][5]"++BIND ;
        Third C5_6 Pl => "abe[RCBe][6]"++BIND ;
        Third C7_8 Sg => "ebesi[RCBe][7]"++BIND ;
        Third C7_8 Pl => "ebezi[RCBe][8]"++BIND ;
        Third C9_10 Sg => "ebi[RCBe][9]"++BIND ;
        Third C9_10 Pl => "ebezi[RCBe][10]"++BIND ;
        Third C11_10 Sg => "obelu[RCBe][11]"++BIND ;
        Third C11_10 Pl => "ebezi[RCBe][10]"++BIND ;
        Third C9_6 Sg => "ebi[RCBe][9]"++BIND ;
        Third C9_6 Pl => "abe[RCBe][6]"++BIND ;
        Third C14 _ => "obebu[RCBe][14]"++BIND ;
        Third C15 _ => "obeku[RCBe][15]"++BIND ;
        Third C17 _ => "obeku[RCBe][17]"++BIND ;
        First Sg => "ebengi[RCBe][1ps]"++BIND ;
        First Pl => "ebesi[RCBe][1pp]"++BIND ;
        Second Sg  => "obu[RCBe][2ps]"++BIND ;
        Second Pl => "ebeni[RCBe][2pp]"++BIND
    } ;

    relCopConcRemPastLookup : Agr => Str =
      table {
        Third C1_2 Sg => "owaye[RCRP][1]"++BIND ;
        Third C1_2 Pl => "ababe[RCRP][2]"++BIND ;
        Third C1a_2a Sg => "owaye[RCRP][1a]"++BIND ;
        Third C1a_2a Pl => "ababe[RCRP][2a]"++BIND ;
        Third C3_4 Sg  => "owawu[RCRP][3]"++BIND ;
        Third C3_4 Pl => "eyayi[RCRP][4]"++BIND ;
        Third C5_6 Sg => "elali[RCRP][5]"++BIND ;
        Third C5_6 Pl => "aye[RCRP][6]"++BIND ;
        Third C7_8 Sg => "esasi[RCRP][7]"++BIND ;
        Third C7_8 Pl => "ezazi[RCRP][8]"++BIND ;
        Third C9_10 Sg => "eyayi[RCRP][9]"++BIND ;
        Third C9_10 Pl => "ezazi[RCRP][10]"++BIND ;
        Third C11_10 Sg => "olwalu[RCRP][11]"++BIND ;
        Third C11_10 Pl => "ezazi[RCRP][10]"++BIND ;
        Third C9_6 Sg => "eyayi[RCRP][9]"++BIND ;
        Third C9_6 Pl => "aye[RCRP][6]"++BIND ;
        Third C14 _ => "obabu[RCRP][14]"++BIND ;
        Third C15 _ => "okwaku[RCRP][15]"++BIND ;
        Third C17 _ => "okwaku[RCRP][17]"++BIND ;
        First Sg => "engangi[RCRP][1ps]"++BIND ;
        First Pl => "esasi[RCRP][1pp]"++BIND ;
        Second Sg  => "owawu[RCRP][2ps]"++BIND ;
        Second Pl => "enani[RCRP][2pp]"++BIND
    } ;

    -- ENUMERATIVE ANTECEDENT AGREEMENT MORPHEME --

    enumConc : Polarity -> Agr -> Str = \pol,agr -> case pol of {
      Pos => enumConcLookup!agr ;
      Neg => "nge[NegPre]" ++BIND++ enumConcLookup!agr
    } ;

    enumConcLookup : Agr => Str =
      table {
        Third C1_2 Sg => "mu[EC][1]" ++BIND ; -- EC = enumerative concord
        Third C1_2 Pl => "ba[EC][2]" ++BIND ;
        Third C1a_2a Sg => "mu[EC][1a]" ++BIND ;
        Third C1a_2a Pl => "ba[EC][2a]" ++BIND ;
        Third C3_4 Sg  => "mu[EC][3]" ++BIND ;
        Third C3_4 Pl => "mi[EC][4]" ++BIND ;
        Third C5_6 Sg => "li[EC][5]" ++BIND ;
        Third C5_6 Pl => "ma[EC][6]" ++BIND ;
        Third C7_8 Sg => "si[EC][7]" ++BIND ;
        Third C7_8 Pl => "zi[EC][8]" ++BIND ;
        Third C9_10 Sg => "i[EC][9]" ++BIND ;
        Third C9_10 Pl => "zi[EC][10]" ++BIND ;
        Third C11_10 Sg => "lu[EC][11]" ++BIND ;
        Third C11_10 Pl => "zi[EC][10]" ++BIND ;
        Third C9_6 Sg => "i[EC][9]" ++BIND ;
        Third C9_6 Pl => "ma[EC][6]" ++BIND ;
        Third C14 _ => "bu[EC][14]" ++BIND ;
        Third C15 _ => "ku[EC][15]" ++BIND ;
        Third C17 _ => "ku[EC][17]" ++BIND ;
        First Sg => "mu[EC][1ps]"++BIND ;
        First Pl => "mu[EC][1pp]"++BIND ;
        Second Sg => "mu[EC][2ps]"++BIND ;
        Second Pl => "mu[EC][2pp]"++BIND
      } ;

    shortRelConc : Agr => Str =
      table {
        Third C1_2 Sg => "o[RC][1]" ++BIND ;
        Third C1_2 Pl => "a[RC][2]" ++BIND ;
        Third C1a_2a Sg => "o[RC][1a]" ++BIND ;
        Third C1a_2a Pl => "a[RC][2a]" ++BIND ;
        Third C3_4 Sg  => "o[RC][3]" ++BIND ;
        Third C3_4 Pl => "e[RC][4]" ++BIND ;
        Third C5_6 Sg => "e[RC][5]" ++BIND ;
        Third C5_6 Pl => "a[RC][6]" ++BIND ;
        Third C7_8 Sg => "e[RC][7]" ++BIND ;
        Third C7_8 Pl => "e[RC][8]" ++BIND ;
        Third C9_10 Sg => "e[RC][9]" ++BIND ;
        Third C9_10 Pl => "e[RC][10]" ++BIND ;
        Third C11_10 Sg => "o[RC][11]" ++BIND ;
        Third C11_10 Pl => "e[RC][10]" ++BIND ;
        Third C9_6 Sg => "e[RC][9]" ++BIND ;
        Third C9_6 Pl => "a[RC][6]" ++BIND ;
        Third C14 _ => "o[RC][14]" ++BIND ;
        Third C15 _ => "o[RC][15]" ++BIND ;
        Third C17 _ => "o[RC][17]" ++BIND ;
        First Sg => "e[RC][1ps]" ++BIND ;
        First Pl => "e[RC][1pp]" ++BIND ;
        Second Sg  => "o[RC][2ps]" ++BIND ;
        Second Pl => "e[RC][2pp]" ++BIND
      } ;

    -- POSSESSIVE ANTECEDENT AGREEMENT MORPHEME --

    poss_concord_agr : Agr => RInit => Str =
      table {
        First Sg => table {(RA|RC) => "wa[PC][1ps]" ; (RE|RI) => "we[PC][1ps]" ; (RO|RU) => "wo[PC][1ps]" } ;
        First Pl => table {(RA|RC) => "ba[PC][1pp]" ; (RE|RI) => "be[PC][1pp]" ; (RO|RU) => "bo[PC][1pp]" } ;
        Second Sg => table {(RA|RC) => "wa[PC][2ps]" ; (RE|RI) => "we[PC][2ps]" ; (RO|RU) => "wo[PC][2ps]" } ;
        Second Pl => table {(RA|RC) => "ba[PC][2pp]" ; (RE|RI) => "be[PC][2pp]" ; (RO|RU) => "bo[PC][2pp]" } ;
        Third C1_2 Sg => table {(RA|RC) => "wa[PC][1]" ; (RE|RI) => "we[PC][1]" ; (RO|RU) => "wo[PC][1]" } ;
        Third C1_2 Pl => table {(RA|RC) => "ba[PC][2]" ; (RE|RI) => "be[PC][2]" ; (RO|RU) => "bo[PC][2]" } ;
        Third C1a_2a Sg => table {(RA|RC) => "wa[PC][1a]" ; (RE|RI) => "we[PC][1a]" ; (RO|RU) => "wo[PC][1a]" } ;
        Third C1a_2a Pl => table {(RA|RC) => "ba[PC][2a]" ; (RE|RI) => "be[PC][2a]" ; (RO|RU) => "bo[PC][2a]" } ;
        Third C3_4 Sg => table {(RA|RC) => "wa[PC][3]" ; (RE|RI) => "we[PC][3]" ; (RO|RU) => "wo[PC][3]" } ;
        Third C3_4 Pl => table {(RA|RC) => "ya[PC][4]" ; (RE|RI) => "ye[PC][4]" ; (RO|RU) => "yo[PC][4]" } ;
        Third C5_6 Sg => table {(RA|RC) => "la[PC][5]" ; (RE|RI) => "le[PC][5]" ; (RO|RU) => "lo[PC][5]" } ;
        Third C5_6 Pl => table {(RA|RC) => "a[PC][6]" ; (RE|RI) => "e[PC][6]" ; (RO|RU) => "o[PC][6]" } ;
        Third C7_8 Sg => table {(RA|RC) => "sa[PC][7]" ; (RE|RI) => "se[PC][7]" ; (RO|RU) => "so[PC][7]" } ;
        Third C7_8 Pl => table {(RA|RC) => "za[PC][8]" ; (RE|RI) => "ze[PC][8]" ; (RO|RU) => "zo[PC][8]" } ;
        Third C9_10 Sg => table {(RA|RC) => "ya[PC][9]" ; (RE|RI) => "ye[PC][9]" ; (RO|RU) => "yo[PC][9]" } ;
        Third C9_10 Pl => table {(RA|RC) => "za[PC][10]" ; (RE|RI) => "ze[PC][10]" ; (RO|RU) => "zo[PC][10]" } ;
        Third C11_10 Sg => table {(RA|RC) => "lwa[PC][11]" ; (RE|RI) => "lwe[PC][11]" ; (RO|RU) => "lo[PC][11]" } ;
        Third C11_10 Pl => table {(RA|RC) => "za[PC][10]" ; (RE|RI) => "ze[PC][10]" ; (RO|RU) => "zo[PC][10]" } ;
        Third C9_6 Sg => table {(RA|RC) => "ya[PC][9]" ; (RE|RI) => "ye[PC][9]" ; (RO|RU) => "yo[PC][9]" } ;
        Third C9_6 Pl => table {(RA|RC) => "a[PC][6]" ; (RE|RI) => "e[PC][6]" ; (RO|RU) => "o[PC][6]" } ;
        Third C14 _ => table {(RA|RC) => "ba[PC][14]" ; (RE|RI) => "be[PC][14]" ; (RO|RU) => "bo[PC][14]" } ;
        Third C15 _ => table {(RA|RC) => "kwa[PC][15]" ; (RE|RI) => "kwe[PC][15]" ; (RO|RU) => "ko[PC][15]" } ;
        Third C17 _ => table {(RA|RC) => "kwa[PC][17]" ; (RE|RI) => "kwe[PC][17]" ; (RO|RU) => "ko[PC][17]" }
      } ;

    poss_concord : ClassGender => Number => RInit => Str =
      table {
        C1_2 => table {
          Sg => table {(RA|RC) => "wa[PC][1]" ; (RE|RI) => "we[PC][1]" ; (RO|RU) => "wo[PC][1]" } ;
          Pl => table {(RA|RC) => "ba[PC][2]" ; (RE|RI) => "be[PC][2]" ; (RO|RU) => "bo[PC][2]" }
        } ;
        C1a_2a => table {
          Sg => table {(RA|RC) => "wa[PC][1a]" ; (RE|RI) => "we[PC][1a]" ; (RO|RU) => "wo[PC][1a]" } ;
          Pl => table {(RA|RC) => "ba[PC][2a]" ; (RE|RI) => "be[PC][2a]" ; (RO|RU) => "bo[PC][2a]" }
        } ;
        C3_4 => table {
          Sg => table {(RA|RC) => "wa[PC][3]" ; (RE|RI) => "we[PC][3]" ; (RO|RU) => "wo[PC][3]" } ;
          Pl => table {(RA|RC) => "ya[PC][4]" ; (RE|RI) => "ye[PC][4]" ; (RO|RU) => "yo[PC][4]" }
        } ;
        C5_6 => table {
          Sg => table {(RA|RC) => "la[PC][5]" ; (RE|RI) => "le[PC][5]" ; (RO|RU) => "lo[PC][5]" } ;
          Pl => table {(RA|RC) => "a[PC][6]" ; (RE|RI) => "e[PC][6]" ; (RO|RU) => "o[PC][6]" }
        } ;
        C7_8 => table {
          Sg => table {(RA|RC) => "sa[PC][7]" ; (RE|RI) => "se[PC][7]" ; (RO|RU) => "so[PC][7]" } ;
          Pl => table {(RA|RC) => "za[PC][8]" ; (RE|RI) => "ze[PC][8]" ; (RO|RU) => "zo[PC][8]" }
        } ;
        C9_10 => table {
          Sg => table {(RA|RC) => "ya[PC][9]" ; (RE|RI) => "ye[PC][9]" ; (RO|RU) => "yo[PC][9]" } ;
          Pl => table {(RA|RC) => "za[PC][10]" ; (RE|RI) => "ze[PC][10]" ; (RO|RU) => "zo[PC][10]" }
        } ;
        C11_10 => table {
          Sg => table {(RA|RC) => "lwa[PC][11]" ; (RE|RI) => "lwe[PC][11]" ; (RO|RU) => "lo[PC][11]" } ;
          Pl => table {(RA|RC) => "za[PC][10]" ; (RE|RI) => "ze[PC][10]" ; (RO|RU) => "zo[PC][10]" }
        } ;
        C9_6 => table {
          Sg => table {(RA|RC) => "ya[PC][9]" ; (RE|RI) => "ye[PC][9]" ; (RO|RU) => "yo[PC][9]" } ;
          Pl => table {(RA|RC) => "a[PC][6]" ; (RE|RI) => "e[PC][6]" ; (RO|RU) => "o[PC][6]" }
        } ;
        C14 => table {
          _ => table {(RA|RC) => "ba[PC][14]" ; (RE|RI) => "be[PC][14]" ; (RO|RU) => "bo[PC][14]" }
        } ;
        C15 => table {
          _ => table {(RA|RC) => "kwa[PC][15]" ; (RE|RI) => "kwe[PC][15]" ; (RO|RU) => "ko[PC][15]" }
        } ;
        C17 => table {
          _ => table {(RA|RC) => "kwa[PC][17]" ; (RE|RI) => "kwe[PC][17]" ; (RO|RU) => "ko[PC][17]" }
        }
      } ;

    poss_concord_c1a : ClassGender => Number => Str =
      table {
        C1_2 => table {
          Sg => "ka[PC][1]" ;
          Pl => "baka[PC][2]"
        } ;
        C1a_2a => table {
          Sg => "ka[PC][1a]" ;
          Pl => "baka[PC][2a]"
        } ;
        C3_4 => table {
          Sg => "ka[PC][3]" ;
          Pl => "ka[PC][4]"
        } ;
        C5_6 => table {
          Sg => "lika[PC][5]" ;
          Pl => "ka[PC][6]"
        } ;
        C7_8 => table {
          Sg => "sika[PC][7]" ;
          Pl => "zika[PC][8]"
        } ;
        C9_10 => table {
          Sg => "ka[PC][9]" ;
          Pl => "zika[PC][10]"
        } ;
        C11_10 => table {
          Sg => "luka[PC][11]" ;
          Pl => "zika[PC][10]"
        } ;
        C9_6 => table {
          Sg => "ka[PC][9]" ;
          Pl => "ka[PC][6]"
        } ;
        C14 => table {
          _ => "buka[PC][14]"
        } ;
        C15 => table {
          _ => "kuka[PC][15]"
        } ;
        C17 => table {
          _ => "kuka[PC][17]"
        }
      } ;

    -- QUANTITATIVE AGREEMENT MORPHEME --
    -- (demonstatives)

    quantinit : Agr => RInit =
    table {
      Third C5_6 Pl => RO ;
      Third C9_6 Pl => RO ;
      Third _ _ => RC ;
      (First _ | Second _ )  => RC
    } ;

    -----------------
    -- COPULATIVES --
    -----------------

    pre_cop_pref : VForm -> Agr -> Str = \vform,agr ->
    let
      sc = subjConc vform agr False RC 
    in
      case vform of {
        VFIndic _ Pos PresTense => sc ;
        VFIndic _ Neg PresTense => "a[NegPre]" ++BIND++ subjConcLookup!agr!SCNeg ++BIND ;
        VFIndic _ _ FutTense => sc ++ (tensePref vform RC SylMult) ++ "ba[AuxV]" ;
        VFIndic _ _ RemFutTense => sc ++ (tensePref vform RC SylMult) ++ "ba[AuxV]" ;
        VFIndic _ _ _ => [] ;
        VFConsec _ => [] ;
        VFSubjunct _ => []
    } ;

    ap_cop_pref : VForm -> Agr -> AType -> Str = \vform,agr,atype ->
    let
      sc = subjConc vform agr False RC
    in
    -- TODO:
    -- for positive, present: SC only inserted with class 9
      case vform of {
        VFIndic MainCl Pos PresTense => case <agr,atype> of {
          <(Third _ _ | First _ | Second _),AdjType> => [] ;
          <(Third C9_10 Sg | Third C9_6 Sg),_> => sc  ; -- i++i = i
          <(Third _ _ | First _ | Second _),_> => sc
        } ;
        VFIndic MainCl Neg PresTense => case <agr,atype> of {
          <(Third C9_10 Sg | Third C9_6 Sg),AdjType> => "a[NegPre]" ++BIND++ "y[Phon]" ++BIND ;
          <(Third C9_10 Sg | Third C9_6 Sg),_> => "a[NegPre]" ++BIND++ subjConcLookup!agr!SCNeg ++BIND ;
          <(Third _ _ | First _ | Second _),_> => "a[NegPre]" ++BIND++ subjConcLookup!agr!SCNeg ++BIND
        } ;
        VFIndic RelCl _ PresTense => (negPrefNge vform False) ;

        VFIndic MainCl Pos (FutTense|RemFutTense) => case agr of {
          -- Third C9_10 Sg | Third C9_6 Sg => sc ++ (tensePref vform RC SylMult) ++ "b" ; -- ++BIND ;
          Third _ _ | First _ | Second _ => sc ++ (tensePref vform RC SylMult) ++ "ba[AuxV]" -- ++BIND
        } ;
        VFIndic RelCl Pos (FutTense|RemFutTense) => case agr of {
          -- Third C9_10 Sg | Third C9_6 Sg => (tensePref vform RC SylMult) ++ "b" ; -- ++BIND ;
          Third _ _ | First _ | Second _ => (tensePref vform RC SylMult) ++ "ba[AuxV]" -- ++BIND
        } ;
        VFIndic MainCl Neg (FutTense|RemFutTense) => case agr of {
          -- Third C9_10 Sg | Third C9_6 Sg => "a" ++BIND++ sc ++ (tensePref vform RC SylMult) ++ "b" ;
          Third _ _ | First _ | Second _ => "a[NegPre]" ++BIND++ sc ++ (tensePref vform RC SylMult) ++ "ba[AuxV]"
        } ;
        VFIndic RelCl Neg (FutTense|RemFutTense) => (negPrefNge vform False) ++ (tensePref vform RC SylMult) ++ "ba[AuxV]" ;

        VFIndic MainCl Pos PastTense => subjConcLookup!agr!SCBe ++BIND ;
        VFIndic MainCl Neg PastTense => subjConcLookup!agr!SCBe ++BIND++ (negPrefNge vform False) ;
        VFIndic RelCl _ PastTense  => (negPrefNge vform False) ;

        VFIndic _ Pos RemPastTense => subjConcLookup!agr!SCRP ++BIND ;
        VFIndic _ Neg RemPastTense => subjConcLookup!agr!SCRP ++BIND++ (negPrefNge vform False) ;
        VFConsec _ => subjConcLookup ! agr ! SCRP ++BIND++ (negPrefNge vform False) ;
        VFSubjunct Pos => case agr of {
          Third C1_2 Sg | Third C1a_2a Sg => "abe[AuxV]" ++BIND ;
          Third _ _ | First _ | Second _ => subjConcLookup!agr!SCBe ++ BIND 
        } ;
        VFSubjunct Neg => case agr of {
          Third C1_2 Sg | Third C1a_2a Sg => "a[NegPre]" ++BIND++ (negPrefNga vform False)++ "bi[AuxV]" ;
          Third _ _ | First _ | Second _ => subjConcLookup!agr!SC ++BIND++ (negPrefNga vform False) ++ "bi[AuxV]"
        }
    } ;

      id_pre_cop_pref : VForm -> Agr -> Str = \vform,agr -> let
        sc = subjConc vform agr False RC
      in case vform of {
        VFIndic MainCl Pos PresTense => sc ;
        VFIndic MainCl Neg PresTense => "a[NegPre]" ++BIND++ sc ; -- "aku" ++BIND ;
        VFIndic RelCl _ PresTense => (negPrefNge vform False) ;

        VFIndic MainCl Pos FutTense => sc ++ TEMP_PREF_FUT++BIND++"ba[AuxV]" ;
        VFIndic MainCl Neg FutTense => "a[NegPre]" ++BIND++ sc ++ TEMP_PREF_FUT_NEG++BIND++"kuba[AuxV]" ;
        VFIndic RelCl Pos FutTense => TEMP_PREF_FUT++BIND++"ba[AuxV]" ;
        VFIndic RelCl Neg FutTense => (negPrefNge vform False) ++ TEMP_PREF_FUT_NEG++BIND++"kuba[AuxV]" ;

        VFIndic MainCl Pos RemFutTense => sc ++ TEMP_PREF_REMFUT++BIND++"ba[AuxV]" ;
        VFIndic MainCl Neg RemFutTense => "a[NegPre]" ++BIND++ sc ++ TEMP_PREF_REMFUT_NEG++BIND++"kuba[AuxV]" ;
        VFIndic RelCl Pos RemFutTense => TEMP_PREF_REMFUT++BIND++"ba[AuxV]" ;
        VFIndic RelCl Neg RemFutTense => (negPrefNge vform False) ++ TEMP_PREF_REMFUT_NEG++BIND++"kuba[AuxV]" ;

        VFIndic MainCl _ PastTense => subjConcLookup!agr!SCBe ++ BIND ++ (negPrefNge vform False) ;
        VFIndic RelCl _ PastTense => (negPrefNge vform False) ;

        VFIndic _ _ RemPastTense => subjConcLookup!agr!SCRP ++BIND++ (negPrefNge vform False) ;
        VFConsec Pos => (subjConc vform agr False RC) ++ "ba[AuxV]" ;
        VFConsec Neg => (subjConc vform agr False RC) ++ (negPrefNga vform False) ++ "bi[AuxV]" ;
        VFSubjunct Pos => (subjConc vform agr False RC) ++ "be[AuxV]" ;
        VFSubjunct Neg => (subjConc vform agr False RC) ++ (negPrefNga vform False) ++ "bi[AuxV]"
      } ;

      assoc_pre_cop_pref : VForm -> Agr -> Str = \vform,agr -> let
        sc = subjConc vform agr False RC
      in case vform of {
        VFIndic MainCl Pos PresTense => sc ;
        VFIndic MainCl Neg PresTense => "a[NegPre]" ++BIND++ sc ;
        VFIndic RelCl _ PresTense => (negPrefNge vform False) ;

        VFIndic MainCl Pos FutTense => sc ++ TEMP_PREF_FUT++BIND++"ba[AuxV]" ;
        VFIndic MainCl Neg FutTense => "a[NegPre]" ++BIND++ sc ++ TEMP_PREF_FUT_NEG++BIND++"kuba[AuxV]" ;
        VFIndic RelCl Pos FutTense => TEMP_PREF_FUT++BIND++"ba[AuxV]" ;
        VFIndic RelCl Neg FutTense => (negPrefNge vform False) ++ TEMP_PREF_FUT_NEG++BIND++"kuba[AuxV]" ;

        VFIndic MainCl Pos RemFutTense => sc ++ TEMP_PREF_REMFUT++BIND++"ba[AuxV]" ;
        VFIndic MainCl Neg RemFutTense => "a[NegPre]" ++BIND++ sc ++ TEMP_PREF_REMFUT_NEG++BIND++"kuba[AuxV]" ;
        VFIndic RelCl Pos RemFutTense => TEMP_PREF_REMFUT++BIND++"ba[AuxV]" ;
        VFIndic RelCl Neg RemFutTense => (negPrefNge vform False) ++ TEMP_PREF_REMFUT_NEG++BIND++"kuba[AuxV]" ;

        VFIndic MainCl _ PastTense => subjConcLookup!agr!SCBe ++BIND++ (negPrefNge vform False) ;
        VFIndic RelCl _ PastTense => (negPrefNge vform False) ;

        VFIndic _ _ RemPastTense => subjConcLookup!agr!SCRP ++BIND++ (negPrefNge vform False) ;
        VFConsec Pos => (subjConc vform agr False RC) ++ "ba[AuxV]" ;
        VFConsec Neg => (subjConc vform agr False RC) ++ (negPrefNga vform False) ++ "bi[AuxV]" ;
        VFSubjunct Pos => (subjConc vform agr False RC) ++ "be[AuxV]" ;
        VFSubjunct Neg => (subjConc vform agr False RC) ++ (negPrefNga vform False) ++ "bi[AuxV]"
      } ;

      -- REF: Poulos & Msimang p355
      -- id_cop_pref has the following forms
      -- ngu:
      --     - absolute pronoun of 2nd person sg
      --     - class 1
      --     - all other a-, o-, u- commencing absolute pronouns and nouns except class 11
      --
      -- y:
      --     - i- commencing absolute pronouns and nouns
      --
      -- ngu:
      --     - everything else?
      id_cop_pref : Agr -> Str = \agr -> case agr of {
        Third C1_2 Sg => "ng[CopPre][1]"++BIND ;
        Third C1_2 Pl => "ng[CopPre][2]"++BIND ;
        Third C1a_2a Sg => "ng[CopPre][1a]"++BIND ;
        Third C1a_2a Pl => "ng[CopPre][2a]"++BIND ;
        Third C3_4 Sg  => "ng[CopPre][3]"++BIND ;
        Third C3_4 Pl => "y[CopPre][4]"++BIND ;
        Third C5_6 Sg => "y[CopPre][5]"++BIND ;
        Third C5_6 Pl => "ng[CopPre][6]"++BIND ;
        Third C7_8 Sg => "y[CopPre][7]"++BIND ;
        Third C7_8 Pl => "y[CopPre][8]"++BIND ;
        Third C9_10 Sg => "y[CopPre][9]"++BIND ;
        Third C9_10 Pl => "y[CopPre][10]"++BIND ;
        Third C11_10 Sg => "w[CopPre][11]"++BIND ;
        Third C11_10 Pl => "y[CopPre][10]"++BIND ;
        Third C9_6 Sg => "y[CopPre][9]"++BIND ;
        Third C9_6 Pl => "ng[CopPre][6]"++BIND ;
        Third C14 _ => "ng[CopPre][14]"++BIND ;
        Third C15 _ => "ng[CopPre][15]"++BIND ;
        Third C17 _ => "ng[CopPre][17]"++BIND ;
        First Sg => "yi[CopPre][1ps]"++BIND ;
        First Pl => "yi[CopPre][1pp]"++BIND ;
        Second Sg  => "ngu[CopPre][2ps]"++BIND ;
        Second Pl => "yi[CopPre][2pp]"++BIND -- ;
        -- LocAgr => "ngu[CopPre][]" ++BIND
      } ;

      assoc_cop_pref : Polarity -> Agr -> Str = \pol,agr -> case pol of {
        Neg => "na[AdvPre]"++BIND ;
        Pos => case agr of {
          Third C1_2 Sg => "no[AdvPre]";
          Third C1_2 Pl => "na[AdvPre]";
          Third C1a_2a Sg => "no[AdvPre]";
          Third C1a_2a Pl => "na[AdvPre]";
          Third C3_4 Sg  => "no[AdvPre]";
          Third C3_4 Pl => "ne[AdvPre]";
          Third C5_6 Sg => "ne[AdvPre]";
          Third C5_6 Pl => "na[AdvPre]";
          Third C7_8 Sg => "ne[AdvPre]";
          Third C7_8 Pl => "ne[AdvPre]";
          Third C9_10 Sg => "ne[AdvPre]";
          Third C9_10 Pl => "ne[AdvPre]";
          Third C11_10 Sg => "no[AdvPre]";
          Third C11_10 Pl => "ne[AdvPre]";
          Third C9_6 Sg => "ne[AdvPre]";
          Third C9_6 Pl => "na[AdvPre]";
          Third C14 _ => "no[AdvPre]";
          Third C15 _ => "no[AdvPre]";
          Third C17 _ => "no[AdvPre]";
          First Sg => "na[AdvPre]";
          First Pl => "na[AdvPre]";
          Second Sg  => "na[AdvPre]";
          Second Pl => "na[AdvPre]"-- ;
          -- LocAgr => "na"
        } ++BIND
      } ;

      eq_cop_pref : Polarity -> Agr -> Str = \pol,agr -> case pol of {
        Neg => "njenga[AdvPre]"++BIND ;
        Pos => case agr of {
          Third C1_2 Sg => "njengo[AdvPre]";
          Third C1_2 Pl => "njenga[AdvPre]";
          Third C1a_2a Sg => "njengo[AdvPre]";
          Third C1a_2a Pl => "njenga[AdvPre]";
          Third C3_4 Sg  => "njengo[AdvPre]";
          Third C3_4 Pl => "njenge[AdvPre]";
          Third C5_6 Sg => "njenge[AdvPre]";
          Third C5_6 Pl => "njenga[AdvPre]";
          Third C7_8 Sg => "njenge[AdvPre]";
          Third C7_8 Pl => "njenge[AdvPre]";
          Third C9_10 Sg => "njenge[AdvPre]";
          Third C9_10 Pl => "njenge[AdvPre]";
          Third C11_10 Sg => "njengo[AdvPre]";
          Third C11_10 Pl => "njenge[AdvPre]";
          Third C9_6 Sg => "njenge[AdvPre]";
          Third C9_6 Pl => "njenga[AdvPre]";
          Third C14 _ => "njengo[AdvPre]";
          Third C15 _ => "njengo[AdvPre]";
          Third C17 _ => "njengo[AdvPre]";
          First Sg => "njenga[AdvPre]";
          First Pl => "njenga[AdvPre]";
          Second Sg  => "njenga[AdvPre]";
          Second Pl => "njenga[AdvPre]";
          LocAgr => "njenga[AdvPre]"
        } ++BIND
      } ;

      eq_size_cop_pref : Polarity -> Agr -> Str = \pol,agr -> case pol of {
        Neg => "nganga[AdvPre]"++BIND ;
        Pos => case agr of {
          Third C1_2 Sg => "ngango[AdvPre]";
          Third C1_2 Pl => "nganga[AdvPre]";
          Third C1a_2a Sg => "ngango[AdvPre]";
          Third C1a_2a Pl => "nganga[AdvPre]";
          Third C3_4 Sg  => "ngango[AdvPre]";
          Third C3_4 Pl => "ngange[AdvPre]";
          Third C5_6 Sg => "ngange[AdvPre]";
          Third C5_6 Pl => "nganga[AdvPre]";
          Third C7_8 Sg => "ngange[AdvPre]";
          Third C7_8 Pl => "ngange[AdvPre]";
          Third C9_10 Sg => "ngange[AdvPre]";
          Third C9_10 Pl => "ngange[AdvPre]";
          Third C11_10 Sg => "ngango[AdvPre]";
          Third C11_10 Pl => "ngange[AdvPre]";
          Third C9_6 Sg => "ngange[AdvPre]";
          Third C9_6 Pl => "nganga[AdvPre]";
          Third C14 _ => "ngango[AdvPre]";
          Third C15 _ => "ngango[AdvPre]";
          Third C17 _ => "ngango[AdvPre]";
          First Sg => "nganga[AdvPre]";
          First Pl => "nganga[AdvPre]";
          Second Sg  => "nganga[AdvPre]";
          Second Pl => "nganga[AdvPre]";
          LocAgr => "nganga[AdvPre][]"
        } ++BIND
      } ;

      kho_cop : VForm -> Agr -> Str = \vform,agr -> case vform of {
        VFIndic MainCl Neg PresTense => neg_kho_cop_pref agr ++ "kho[Adv]";
        VFIndic RelCl Neg PresTense => (relConcCop vform agr RC) ++ (ap_cop_pref (VFIndic RelCl Neg PresTense) agr RelType) ++ "kho[Adv]" ;
        VFIndic RelCl p t => (relConcCop vform agr RC) ++ (ap_cop_pref (VFIndic RelCl p t) agr RelType) ++ "khona[Adv]" ;
        VFIndic MainCl p t => (ap_cop_pref (VFIndic MainCl p t) agr RelType) ++ "khona[Adv]" ;
        VFConsec p => (ap_cop_pref (VFIndic MainCl p PastTense) agr RelType) ++ "khona[Adv]" ;
        VFSubjunct Neg => neg_kho_cop_pref agr ++ "kho[Adv]" ;
        VFSubjunct Pos => (ap_cop_pref (VFIndic MainCl Pos PresTense) agr RelType) ++ "khona[Adv]"
      } ;

      neg_kho_cop_pref : Agr -> Str = \agr ->
        "a[NegPre]" ++BIND++
         case agr of {
          Third C1_2 Sg => "ke[SCNeg][1]" ;
          Third C1_2 Pl => "be[SCNeg][2]" ;
          Third C1a_2a Sg => "ke[SCNeg][1a]" ;
          Third C1a_2a Pl => "be[SCNeg][2a]" ;
          Third C5_6 Pl => "we[SCNeg][6]" ;
          (First _ | Second _ | Third _ _ ) => subjConcLookup!agr!SCNeg
        } ++BIND ;


    ----------------------------------------
    -- OTHER
    ----------------------------------------

    regConjN : Str -> { s : RInit => Str ; fix : Bool } = \s -> {
      s = \\_ => s+"[Conj]" ;
      fix = False
    } ;

    link_conj : { s: RInit => Str ; fix : Bool } -> RInit -> Str = \conj,rinit -> case conj.fix of {
      True => conj.s!rinit ++BIND ;
      False => conj.s!RC
    } ;

    compAgr : Agr -> Agr -> Agr = \a1,a2 -> case <a1,a2> of {
      <First _,(First _ | Second _ | Third _ _)> => First Pl ;
      <(First _ | Second _ | Third _ _),First _> => First Pl ;
      <Second _,(First _ | Second _ | Third _ _)> => Second Pl ;
      <(First _ | Second _ | Third _ _),Second _> => Second Pl ;
      <Third (C1_2|C1a_2a) _, Third _ _> => Third C1_2 Pl ;
      <Third _ _,Third c _> => Third c Pl
    } ;


    --------------------------------------------
    --  NONEXIST lincats
    --------------------------------------------

    nonExist_Adv : { s : Str ; reqLocS : Bool } = {
      s = nonExist ;
      reqLocS = False
    } ;

    nonExist_CN : {
      s : Number => NForm => Str ;
      c : ClassGender ;
      empty : Str ;
      predet : Bool
    } = {
      s = \\_,_ => nonExist ;
      c = C17 ;
      empty = nonExist ;
      predet = False
    } ;

    nonExist_LocAdv : { s : Str ; reqLocS : Bool } = {
      s = nonExist ;
      reqLocS = False
    } ;

    nonExist_Pron : {
      s : NForm => Str ;
      agr : Agr ;
      empty : Str ;
      proDrop : Bool
    } = {
        s = \\_ => nonExist ;
        agr = Third C17 Sg ;
        empty = nonExist ;
        proDrop = False
    } ;

    nonExist_LocN : { s : Str } = {
      s = nonExist
    } ;
}
