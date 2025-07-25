--# -path=.:../abstract:../common:../../prelude

resource ResSsw = open Prelude,Predef,ParamX in {

  param
    ClassGender = C1_2 | C1a_2a | C3_4 | C5_6 | C7_8 | C9_10 | C11_10 | C9_6 | C14 | C15 | C17 ;
    SemanticType = Human | Animate | Misc ;
    NForm = NFull | NReduced | NPoss | NLoc ;
    -- ClForm = ClFull | ClReduced ;
    Agr = First Number | Second Number | Third ClassGender Number ;

    -- SMood = SIndic | SPot | SSubj ; -- | SConsec ;
    -- DMood = Princ | Part ; -- mood dimension that depends on grammatical context: principal and participial
    CType = MainCl | RelCl ;
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
    AuxType = PartAux ; -- TODO: add SubjAux, InfAux, ConsecAux etc (p327)
    AType = AdjType | RelType | EnumType ;
    LocAdvType = KwaAdv | NaAdv ;
    SType = SInd | SSub | SConsec ;

    AForm = AF1 | AF2 | AF3 ; -- two forms for implementing sound changes Poulos+Msimang p143, one for monosyllabic
    SCForm = SC | SCVow | SCNeg | SCNegVow | SCPS | SCPart | SCVowP | SCBe | SCRP | SCSe ;
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

    ADV_KA : Str = "ka" ;
    ADV_NGA : Str = "nga" ;
    ADV_KHONA : Str = "khona" ;
    ADV_LAPHA : Str = "lapha" ;
    ADV_NI : Str = "ni" ;
    ADV_PHI : Str = "phi" ;

    BA : Str = "ba" ;
    BI : Str = "bi" ;
    COP_YI : Str = "yi" ;
    COP_Y : Str = "y" ;

    IMP_NEG_PREF_SG : Str = "unga" ;
    IMP_NEG_PREF_PL : Str = "ninga" ;

    IMP_NEG_PREF_SG_REDUCED : Str = "ung" ;
    IMP_NEG_PREF_PL_REDUCED : Str = "ning" ;

    IMP_SUF : Str = "ni" ;

    INF_PREF_FULL : Str = "ku" ;
    INF_PREF_REDUCED : Str = "ku" ;

    LOC_IMP_SG_POS : Str = "yiba" ;
    LOC_IMP_SG_NEG : Str = "ungabi" ;
    LOC_IMP_PL_POS : Str = "yibani" ;
    LOC_IMP_PL_NEG : Str = "ningabi" ;

    LOC_E : Str = "e" ;

    LOC_KI : Str = "ki" ;
    LOC_KO : Str = "ko" ;
    LOC_KW : Str = "kw" ;
    LOC_KU : Str = "ku" ;

    LOC_S : Str = "s" ;

    LONG_YA : Str = "ya" ;

    NEG_NGA : Str = "nga" ;
    NEG_NG : Str = "ng" ;

    PL_NI : Str = "ni" ;
    PRON_NA : Str = "na" ;

    QUESTION_NA : Str = "na" ;

    REFL_PRON : Str = "ti" ;

    SC_17 : Str = "ku" ;

    TEMP_PREF_FUT : Str = "to" ;
    TEMP_PREF_REMFUT : Str = "yo" ;
    TEMP_PREF_FUT_NEG : Str = "tu" ;
    TEMP_PREF_REMFUT_NEG : Str = "yu" ;

    TEMP_PREF_PAST : Str = "a" ;

    ASPECT_KA = "ka" ;
    ASPECT_K = "k" ;
    ASPECT_SE = "se" ;
    ASPECT_SA = "sa" ;
    ASPECT_S = "s" ;

    prefix_nasal : Str -> Str = \r -> case r of {
      "ph"+x => "mp" + x ;
      "Ph"+x => "mP" + x ;
      "bh"+x => "mb" + x ;
      "Bh"+x => "mB" + x ;
      -- (#nasal_de_asp|#nasal_de_asp_cap)+"h"+x => "n"+(take 1 r) + x ;
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
    --------------
    -- PRONOUNS --
    --------------
    -- mkFullPron : Str -> Agr -> { s : NForm => Str ; agr : Agr ; empty : Str ; proDrop : Bool } = \s,agr -> {
    --   s = s ;
    --   agr = agr ;
    --   empty = [] ;
    --   proDrop = False
    -- } ;

    mkPron : Agr -> { s : NForm => Str ; agr : Agr ; empty : Str ; proDrop : Bool } = \agr -> {
      s = table {
        NFull => pron_stem!agr +"na" ;
        NReduced => pron_stem!agr ;
        NPoss => poss_pron_stem!agr ;
        NLoc => case agr of {
          First _ | Second Pl => "ki" ++BIND++ pron_stem!agr ;
          _ => "ku" ++BIND++ pron_stem!agr
        }
      } ;
      agr = agr ;
      empty = [] ;
      proDrop = False
    } ;

    full_pron : Str -> Str = \s -> s ++BIND++ "na" ;

    pron_stem : Agr => Str = table {
      First Sg => "mi" ;
      First Pl => "tsi" ;
      Second Sg => "we" ;
      Second Pl => "ni" ;
      Third C1_2 Sg => "ye" ;
      Third C1_2 Pl => "bo" ;
      Third C1a_2a Sg => "ye" ;
      Third C1a_2a Pl => "bo" ;
      Third C3_4 Sg  => "wo" ;
      Third C3_4 Pl => "yo" ;
      Third C5_6 Sg => "lo" ;
      Third C5_6 Pl => "wo" ;
      Third C7_8 Sg => "so" ;
      Third C7_8 Pl => "to" ;
      Third C9_10 Sg => "yo" ;
      Third C9_10 Pl => "to" ;
      Third C11_10 Sg => "lo" ;
      Third C11_10 Pl => "to" ;
      Third C9_6 Sg => "yo" ;
      Third C9_6 Pl => "wo" ;
      Third C14 _ => "bo" ;
      Third C15 _ => "ko" ;
      Third C17 _ => "ko"
    } ;

    poss_pron_stem : Agr => Str = table {
      First Sg => "mi" ;
      First Pl => "tfu" ;
      Second Sg => "kho" ;
      Second Pl => "nu" ;
      Third C1_2 Sg => "khe" ;
      Third C1_2 Pl => "bo" ;
      Third C1a_2a Sg => "khe" ;
      Third C1a_2a Pl => "bo" ;
      Third C3_4 Sg  => "wo" ;
      Third C3_4 Pl => "yo" ;
      Third C5_6 Sg => "lo" ;
      Third C5_6 Pl => "wo" ;
      Third C7_8 Sg => "so" ;
      Third C7_8 Pl => "to" ;
      Third C9_10 Sg => "yo" ;
      Third C9_10 Pl => "to" ;
      Third C11_10 Sg => "lo" ;
      Third C11_10 Pl => "to" ;
      Third C9_6 Sg => "yo" ;
      Third C9_6 Pl => "wo" ;
      Third C14 _ => "bo" ;
      Third C15 _ => "kho" ;
      Third C17 _ => "kho"
    } ;

    dem1_full : Agr => Str = table {
      First Sg => "lo" ;
      First Pl => "laba" ;
      Second Sg => "lo" ;
      Second Pl => "laba" ;
      Third C1_2 Sg => "lo" ;
      Third C1_2 Pl => "laba" ;
      Third C1a_2a Sg => "lo" ;
      Third C1a_2a Pl => "laba" ;
      Third C3_4 Sg => "lo" ;
      Third C3_4 Pl => "le" ;
      Third C5_6 Sg => "leli" ;
      Third C5_6 Pl => "la" ;
      Third C7_8 Sg => "lesi" ;
      Third C7_8 Pl => "leti" ;
      Third C9_10 Sg => "le" ;
      Third C9_10 Pl => "leti" ;
      Third C11_10 Sg => "lolu" ;
      Third C11_10 Pl => "leti" ;
      Third C9_6 Sg => "le" ;
      Third C9_6 Pl => "la" ;
      Third C14 _ => "lobu" ;
      Third C15 _ => "loku" ;
      Third C17 _ => "lapha"
    } ;

    dem_pron : Distance => Agr => Str = table {
      Dem1 => table {
        First Sg => "lo" ++BIND ;
        First Pl => "la" ++BIND ;
        Second Sg => "lo" ++BIND ;
        Second Pl => "la" ++BIND ;
        Third C1_2 Sg => "lo" ++BIND ;
        Third C1_2 Pl => "la" ++BIND ;
        Third C1a_2a Sg => "lo" ++BIND ;
        Third C1a_2a Pl => "la" ++BIND ;
        Third C3_4 Sg => "lo" ++BIND ;
        Third C3_4 Pl => "le" ++BIND ;
        Third C5_6 Sg => "le" ++BIND ;
        Third C5_6 Pl => "la" ++BIND ;
        Third C7_8 Sg => "le" ++BIND ;
        Third C7_8 Pl => "le" ++BIND ;
        Third C9_10 Sg => "le" ++BIND ;
        Third C9_10 Pl => "le" ++BIND ;
        Third C11_10 Sg => "lo" ++BIND ;
        Third C11_10 Pl => "le" ++BIND ;
        Third C9_6 Sg => "le" ++BIND ;
        Third C9_6 Pl => "la" ++BIND ;
        Third C14 _ => "lo" ++BIND ;
        Third C15 _ => "lo" ++BIND ;
        Third C17 _ => "lo" ++BIND
      } ;
      Dem2 => table {
        First Sg => "lowo" ;
        First Pl => "labo" ;
        Second Sg => "lowo" ;
        Second Pl => "labo" ;
        Third C1_2 Sg => "lowo" ;
        Third C1_2 Pl => "labo" ;
        Third C1a_2a Sg => "lowo" ;
        Third C1a_2a Pl => "labo" ;
        Third C3_4 Sg => "lowo" ;
        Third C3_4 Pl => "leyo" ;
        Third C5_6 Sg => "lelo" ;
        Third C5_6 Pl => "lawo" ;
        Third C7_8 Sg => "leso" ;
        Third C7_8 Pl => "leto" ;
        Third C9_10 Sg => "leyo" ;
        Third C9_10 Pl => "leto" ;
        Third C11_10 Sg => "lolo" ;
        Third C11_10 Pl => "leto" ;
        Third C9_6 Sg => "leyo" ;
        Third C9_6 Pl => "lawo" ;
        Third C14 _ => "lobo" ;
        Third C15 _ => "lokho" ;
        Third C17 _ => "lapho"
      } ;
      Dem3 => table {
        First Sg => "loya" ;
        First Pl => "laba" ;
        Second Sg => "loya" ;
        Second Pl => "laba" ;
        Third C1_2 Sg => "loya" ;
        Third C1_2 Pl => "laba" ;
        Third C1a_2a Sg => "loya" ;
        Third C1a_2a Pl => "laba" ;
        Third C3_4 Sg => "lowa" ;
        Third C3_4 Pl => "leya" ;
        Third C5_6 Sg => "lela" ;
        Third C5_6 Pl => "lawa" ;
        Third C7_8 Sg => "lesa" ;
        Third C7_8 Pl => "leta" ;
        Third C9_10 Sg => "leya" ;
        Third C9_10 Pl => "leta" ;
        Third C11_10 Sg => "lolwa" ;
        Third C11_10 Pl => "leta" ;
        Third C9_6 Sg => "leya" ;
        Third C9_6 Pl => "lawa" ;
        Third C14 _ => "loba" ;
        Third C15 _ => "lokwa" ;
        Third C17 _ => "lapha"
      }
    } ;

    dem_pron_na : Agr => Str = table {
        First Sg => BIND++"na" ;
        First Pl => [] ;
        Second Sg => BIND++"na" ;
        Second Pl => [] ;
        Third C1_2 Sg => BIND++"na" ;
        Third C1_2 Pl => [] ;
        Third C1a_2a Sg => BIND++"na" ;
        Third C1a_2a Pl => [] ;
        Third C3_4 Sg => BIND++"na" ;
        Third C3_4 Pl => BIND++"na" ;
        Third C5_6 Sg => [] ;
        Third C5_6 Pl => BIND++"na" ;
        Third C7_8 Sg => [] ;
        Third C7_8 Pl => [] ;
        Third C9_10 Sg => BIND++"na" ;
        Third C9_10 Pl => [] ;
        Third C11_10 Sg => [] ;
        Third C11_10 Pl => [] ;
        Third C9_6 Sg => BIND++"na" ;
        Third C9_6 Pl => BIND++"na" ;
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
        R_a => root ++BIND++ "a" ;
        R_ile => case root of {
          _+"el" => root ++BIND++ "e" ;
          (#cons+"al") | (#cons+#cons+"al") | (#cons+#cons+#cons+"al") => root ++BIND ++ "e" ;
          _+"al" => (tk 2 root) + "el" ++BIND++ "e" ;
          _+"an" => (tk 2 root) + "en" ++BIND++ "e" ;
          _+"ats" => (tk 3 root) + "ets" ++BIND++ "e" ;
          _+"w" => root ++BIND ++ "e" ;
          _ => root ++BIND++ "ile"
        } ;
        R_e => case root of {
          _+"an" => (tk 2 root) + "en" ++BIND++ "e" ;
          _+"al" => (tk 2 root) + "el" ++BIND++ "e" ;
          _+"ats" => (tk 3 root) + "ets" ++BIND++ "e" ;
          _ => root ++BIND++ "e"
        } ;
        R_i => case root of {
          _+"w" => root ++BIND++ "a" ;
          _ => root ++BIND++ "i"
        } ;
        R_anga => case root of {
          _+"al" => (tk 2 root) + "el" ++BIND++ "anga" ;
          _+"an" => (tk 2 root) + "en" ++BIND++ "anga" ;
          _+"ats" => (tk 3 root) + "ets" ++BIND++ "anga" ;
          _ => root ++BIND++ "anga"
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
        R_a => thi ;
        R_ile => th ++BIND++ "ile" ;
        R_e => th ++BIND++ "e" ;
        R_i => th ++BIND++ "i" ;
        R_anga => th ++BIND++ "anga"
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
        R_a => r_a ;
        R_ile => r_ile ;
        R_e => root ++BIND++ "e" ;
        R_i => root ++BIND++ "i" ;
        R_anga => root ++BIND++ "anga"
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
        R_a => r_a ;
        R_ile => r_ile ;
        R_e => r_e ;
        R_i => root ++BIND++ "i" ;
        R_anga => root ++BIND++ "anga"
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
        R_a => root ++BIND++ "a" ;
        R_ile => root ++BIND++ "ile" ;
        R_e => root ++BIND++ "e" ;
        R_i => root ++BIND++ "i" ;
        R_anga => root ++BIND++ "anga"
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
      <VFIndic MainCl Pos PresTense,True,RC,(Null|Excl)> => "ya"++BIND ;
      <VFIndic MainCl Pos PresTense,True,_,(Null|Excl)>  => "y"++BIND ;
      <VFIndic _ _ _,_,_,_> => [] ;
      <VFConsec _,_,_,_> => [] ;
      <VFSubjunct _,_,_,_> => [] 
    } ;

    verb_prefix_stative : VForm -> Agr -> RInit -> Syl -> Str = \vform,agr,rinit,syl -> case vform of {
      VFIndic MainCl Pos PresTense => case <rinit,agr> of {
        <(RA | RE | RI | RO | RU),Third C5_6 Pl> => [] ;
        <(RA | RE | RI | RO | RU), (Third _ _ | Second _ | First _)> => subjConcLookup!agr!SCVow ++BIND ;
        <RC,(Third _ _ | Second _ | First _)> => subjConcLookup!agr!SC ++BIND
      } ;
      VFIndic MainCl Pos PastTense => subjConcLookup!agr!SCBe ++BIND ;
      VFIndic MainCl Pos RemPastTense => subjConcLookup!agr!SCRP ++BIND ;
      VFIndic MainCl Pos FutTense => subjConcLookup!agr!SC ++BIND++ TEMP_PREF_FUT ++BIND ;
      VFIndic MainCl Pos RemFutTense => subjConcLookup!agr!SC ++BIND++ TEMP_PREF_REMFUT ++BIND ;

      VFIndic MainCl Neg PresTense => "a" ++BIND++ subjConcLookup!agr!SCVowP ++BIND ;
      VFIndic MainCl Neg PastTense => subjConcLookup!agr!SCBe ++BIND++ NEG_NGA ++BIND ;
      VFIndic MainCl Neg RemPastTense => subjConcLookup!agr!SCRP ++BIND++ NEG_NGA ++BIND ;
      VFIndic MainCl Neg FutTense => "a" ++BIND++ subjConcLookup!agr!SCVowP ++BIND++ (tensePref vform rinit syl) ;
      VFIndic MainCl Neg RemFutTense => "a" ++BIND++ subjConcLookup!agr!SCVowP ++BIND++ (tensePref vform rinit syl) ;

      VFIndic RelCl Pos PresTense => relConcLookup!agr!rinit ;
      VFIndic RelCl Pos PastTense => relCopConcBeLookup!agr ;
      VFIndic RelCl Pos RemPastTense => relCopConcRemPastLookup!agr ;
      VFIndic RelCl Pos FutTense => relConcLookup!agr!rinit ++ (tensePref vform rinit syl) ;
      VFIndic RelCl Pos RemFutTense => relConcLookup!agr!rinit ++ (tensePref vform rinit syl) ;

      VFIndic RelCl Neg PresTense => relConcLookup!agr!RC ++ NEG_NGA ++BIND ;
      VFIndic RelCl Neg PastTense => relCopConcBeLookup!agr ++ NEG_NGA ++BIND ;
      VFIndic RelCl Neg RemPastTense => relCopConcRemPastLookup!agr ++ NEG_NGA ++BIND ;
      VFIndic RelCl Neg FutTense => relConcLookup!agr!RC ++ NEG_NGA ++BIND++ (tensePref vform rinit syl) ;
      VFIndic RelCl Neg RemFutTense => relConcLookup!agr!RC ++ NEG_NGA ++BIND++ (tensePref vform rinit syl) ;
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
        <VFIndic MainCl Pos PresTense,_,RC,Prog> => subjConcLookup!agr!SC ++BIND++ ASPECT_SA ++BIND ; -- usahamba
        <VFIndic MainCl Pos PresTense,_,_,Prog> => subjConcLookup!agr!SC ++BIND++ ASPECT_S ++BIND ; -- useqa
        
        <VFIndic MainCl Neg PresTense,_,RC,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_SA ++BIND ; -- akasahambi
        <VFIndic MainCl Neg PresTense,_,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_S ++BIND ; -- akaseqi

        <VFIndic MainCl Pos PastTense,_,RC,Prog> => subjConcLookup!agr!SC ++BIND++ ASPECT_SA ++BIND ; -- usahambile
        <VFIndic MainCl Pos PastTense,_,_,Prog> => subjConcLookup!agr!SC ++BIND++ ASPECT_S ++BIND ; -- useqile

        <VFIndic MainCl Neg PastTense,_,RC,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_SA ++BIND ; -- akasahambile
        <VFIndic MainCl Neg PastTense,_,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_S ++BIND ; -- akaseqile

        <VFIndic MainCl Pos RemPastTense,_,RC,Prog> => (subjConc vform agr True rinit) ++ (tensePref vform RC syl) ++ ASPECT_SA ++BIND ; -- wasahamba
        <VFIndic MainCl Pos RemPastTense,_,_,Prog> => (subjConc vform agr True rinit) ++ (tensePref vform RC syl) ++ ASPECT_S ++BIND ; -- waseqa

        <VFIndic MainCl Neg RemPastTense,_,RC,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_SA ++BIND ; -- akasahambanga
        <VFIndic MainCl Neg RemPastTense,_,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_S ++BIND ; -- akaseqanga

        <VFIndic MainCl Pos _,_,_,Prog> => subjConcLookup!agr!SC ++BIND++ ASPECT_SA ++BIND++ (tensePref vform rinit syl) ; -- usazohamba
        <VFIndic MainCl Neg _,_,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_SA ++BIND++ (tensePref vform rinit syl) ; -- akasazuhamba

        -- progressive, relative clause
        <VFIndic RelCl Pos RemPastTense,_,RC,Prog> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ++ ASPECT_SA ++BIND ;
        <VFIndic RelCl Pos RemPastTense,_,_,Prog> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ++ ASPECT_S ++BIND ;

        <VFIndic RelCl Pos (FutTense|RemFutTense),_,_,Prog> => (relConc vform agr rinit) ++ ASPECT_SA ++BIND++ (tensePref vform rinit syl) ;

        <VFIndic RelCl Neg (FutTense|RemFutTense),_,_,Prog> => (relConc vform agr rinit) ++ ASPECT_SE ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic RelCl _ _,_,RC,Prog> => (relConc vform agr rinit) ++ ASPECT_SA ++BIND ;
        <VFIndic RelCl _ _,_,_,Prog> => (relConc vform agr rinit) ++ ASPECT_S ++BIND ;

        -- exclusive, main clause
        <VFIndic MainCl Pos PresTense,_,RC,Excl> => subjConcLookup!agr!SCSe ++BIND ; -- sewuhamba
        <VFIndic MainCl Pos PresTense,_,_,Excl> => ASPECT_SE ++BIND++ (subjConc vform agr True rinit) ; -- seweqa

        <VFIndic MainCl Neg PresTense,_,RC,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ; -- akakahambi
        <VFIndic MainCl Neg PresTense,_,_,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNegVow ++BIND++ ASPECT_K ++ BIND ; -- akakeqi

        <VFIndic MainCl Pos PastTense,_,RC,Excl> => subjConcLookup!agr!SCSe ++BIND ; -- sewuhambile
        <VFIndic MainCl Pos PastTense,_,_,Excl> => ASPECT_SE ++BIND++ (subjConc vform agr True rinit) ; -- seweqile

        <VFIndic MainCl Neg PastTense,_,RC,Excl> => nonExist ; -- "*" ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ;
        <VFIndic MainCl Neg PastTense,_,_,Excl> => nonExist ; -- "*" ++ subjConcLookup!agr!SCNegVow ++BIND++ ASPECT_K ++ BIND ;

        <VFIndic MainCl Pos RemPastTense,_,RC,Excl> => ASPECT_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- sewahamba
        <VFIndic MainCl Pos RemPastTense,_,_,Excl> => ASPECT_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- seweqa

        <VFIndic MainCl Neg RemPastTense,_,RC,Excl> => nonExist ; -- "*" ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ;
        <VFIndic MainCl Neg RemPastTense,_,_,Excl> => nonExist ; -- "*" ++ subjConcLookup!agr!SCNegVow ++BIND++ ASPECT_K ++ BIND ;

        <VFIndic MainCl Pos _,_,_,Excl> => subjConcLookup!agr!SCSe ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic MainCl Neg _,_,_,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++BIND++ (tensePref vform rinit syl) ;

        -- exclusive, relative clause
        <VFIndic RelCl Pos PresTense,_,RC,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND ; -- engiseyahamba
        <VFIndic RelCl Pos PresTense,_,_,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND ; -- engiseyeqa

        <VFIndic RelCl Neg PresTense,_,RC,Excl> => (relConc vform agr rinit) ++ ASPECT_KA ++ BIND ; -- engingakahambi
        <VFIndic RelCl Neg PresTense,_,_,Excl> => (relConc vform agr RC) ++ ASPECT_K ++ BIND ; -- engingakeqi

        <VFIndic RelCl Pos PastTense,_,RC,Excl> => shortRelConc!agr ++ ASPECT_SE ++BIND++ subjConcLookup!agr!SC ++BIND ; -- esengihambile
        <VFIndic RelCl Pos PastTense,_,_,Excl> => shortRelConc!agr ++ ASPECT_SE ++BIND++ (subjConc vform agr True rinit) ; -- esengeqile

        <VFIndic RelCl Neg PastTense,_,RC,Excl> => nonExist ; -- "*" ++ (relConc vform agr rinit) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ;
        <VFIndic RelCl Neg PastTense,_,_,Excl> => nonExist ; -- "*" ++ (relConc vform agr rinit) ++ subjConcLookup!agr!SCNegVow ++BIND++ ASPECT_K ++ BIND ;

        <VFIndic RelCl Pos RemPastTense,_,RC,Excl> => shortRelConc!agr ++ ASPECT_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- osewahamba
        <VFIndic RelCl Pos RemPastTense,_,_,Excl> => shortRelConc!agr ++ ASPECT_SE ++BIND++ (subjConc vform agr True rinit) ; -- oseweqa

        <VFIndic RelCl Neg RemPastTense,_,RC,Excl> => nonExist ; -- "*" ++ (relConc vform agr rinit) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ;
        <VFIndic RelCl Neg RemPastTense,_,_,Excl> => nonExist ; -- "*" ++ (relConc vform agr rinit) ++ subjConcLookup!agr!SCNegVow ++BIND++ ASPECT_K ++ BIND ;

        <VFIndic RelCl Pos _,_,_,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic RelCl Neg _,_,_,Excl> => (relConc vform agr rinit) ++ ASPECT_KA ++BIND++ (tensePref vform rinit syl) ;
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
        <VFIndic MainCl Pos PresTense,_,Prog> => subjConcLookup!agr!SC ++BIND++ ASPECT_SA ++BIND ; -- usahamba
        
        <VFIndic MainCl Neg PresTense,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_SA ++BIND ; -- akasahambi

        <VFIndic MainCl Pos PastTense,_,Prog> => subjConcLookup!agr!SC ++BIND++ ASPECT_SA ++BIND ; -- usahambile

        <VFIndic MainCl Neg PastTense,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_SA ++BIND ; -- akasahambile

        <VFIndic MainCl Pos RemPastTense,_,Prog> => (subjConc vform agr True rinit) ++ (tensePref vform RC syl) ++ ASPECT_SA ++BIND ; -- wasahamba

        <VFIndic MainCl Neg RemPastTense,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_SA ++BIND ; -- akasahambanga

        <VFIndic MainCl Pos _,_,Prog> => subjConcLookup!agr!SC ++BIND++ ASPECT_SA ++BIND++ (tensePref vform rinit syl) ; -- usazohamba
        <VFIndic MainCl Neg _,_,Prog> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_SA ++BIND++ (tensePref vform rinit syl) ; -- akasazuhamba

        -- progressive, relative clause
        <VFIndic RelCl Pos RemPastTense,_,Prog> => (relConc vform agr rinit) ++ (tensePref vform rinit syl) ++ ASPECT_SA ++BIND ;

        <VFIndic RelCl Pos (FutTense|RemFutTense),_,Prog> => (relConc vform agr rinit) ++ ASPECT_SA ++BIND++ (tensePref vform rinit syl) ;

        <VFIndic RelCl Neg (FutTense|RemFutTense),_,Prog> => (relConc vform agr rinit) ++ ASPECT_SE ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic RelCl _ _,_,Prog> => (relConc vform agr rinit) ++ ASPECT_SA ++BIND ;

        -- exclusive, main clause
        <VFIndic MainCl Pos PresTense,_,Excl> => subjConcLookup!agr!SCSe ++BIND ; -- sewuhamba

        <VFIndic MainCl Neg PresTense,_,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ; -- akakahambi

        <VFIndic MainCl Pos PastTense,_,Excl> => subjConcLookup!agr!SCSe ++BIND ; -- sewuhambile

        <VFIndic MainCl Neg PastTense,_,Excl> => nonExist ; -- "*" ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ;

        <VFIndic MainCl Pos RemPastTense,_,Excl> => ASPECT_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- sewahamba

        <VFIndic MainCl Neg RemPastTense,_,Excl> => nonExist ; -- "*" ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ;

        <VFIndic MainCl Pos _,_,Excl> => subjConcLookup!agr!SCSe ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic MainCl Neg _,_,Excl> => (negPref vform) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++BIND++ (tensePref vform rinit syl) ;

        -- exclusive, relative clause
        <VFIndic RelCl Pos PresTense,_,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND ; -- engiseyahamba

        <VFIndic RelCl Neg PresTense,_,Excl> => (relConc vform agr rinit) ++ ASPECT_KA ++ BIND ; -- engingakahambi

        <VFIndic RelCl Pos PastTense,_,Excl> => shortRelConc!agr ++ ASPECT_SE ++BIND++ subjConcLookup!agr!SC ++BIND ; -- esengihambile

        <VFIndic RelCl Neg PastTense,_,Excl> => nonExist ; -- "*" ++ (relConc vform agr rinit) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ;

        <VFIndic RelCl Pos RemPastTense,_,Excl> => shortRelConc!agr ++ ASPECT_SE ++BIND++ (subjConc vform agr True rinit) ++ (tensePref vform rinit syl) ; -- osewahamba

        <VFIndic RelCl Neg RemPastTense,_,Excl> => nonExist ; -- "*" ++ (relConc vform agr rinit) ++ subjConcLookup!agr!SCNeg ++BIND++ ASPECT_KA ++ BIND ;

        <VFIndic RelCl Pos _,_,Excl> => shortRelConc!agr ++ subjConcLookup!agr!SCSe ++BIND++ (tensePref vform rinit syl) ;
        <VFIndic RelCl Neg _,_,Excl> => (relConc vform agr rinit) ++ ASPECT_KA ++BIND++ (tensePref vform rinit syl) ;
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
        <RC,VFIndic _ Pos FutTense,SylMono> => TEMP_PREF_FUT++BIND++"ku" ++BIND ;
        <RC,VFIndic _ Pos FutTense,_> => TEMP_PREF_FUT ++BIND ;
        <_,VFIndic _ Pos FutTense,_> => TEMP_PREF_FUT++BIND++"kw" ++BIND ;
        <RC,VFIndic _ Neg FutTense,_> => TEMP_PREF_FUT_NEG++BIND++"ku" ++BIND ;
        <_,VFIndic _ Neg FutTense,_> => TEMP_PREF_FUT_NEG++BIND++"kw" ++BIND ;

        <RC,VFIndic _ Pos RemFutTense,SylMono> => TEMP_PREF_REMFUT++BIND++"ku" ++BIND ;
        <RC,VFIndic _ Pos RemFutTense,_> => TEMP_PREF_REMFUT ++BIND ;
        <_,VFIndic _ Pos RemFutTense,_> => TEMP_PREF_REMFUT++BIND++"kw" ++BIND ;
        <RC,VFIndic _ Neg RemFutTense,_> => TEMP_PREF_REMFUT_NEG++BIND++"ku" ++BIND ;
        <_,VFIndic _ Neg RemFutTense,_> => TEMP_PREF_REMFUT_NEG++BIND++"kw" ++BIND ;

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
        VFIndic _ Neg _ => "a"++BIND ;
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
      <VFIndic _ Neg _,False> => "nga" ++BIND ;
      <VFIndic _ Neg _,_> => "ng" ++BIND ;
      <VFConsec Neg,False> => "nga" ++BIND ;
      <VFConsec Neg,_> => "ng" ++BIND ;
      <VFIndic _ Pos _,_> => [] ;
      <VFConsec Pos,_> => [] ;
      <VFSubjunct Neg,False> => "nga" ++BIND ;
      <VFSubjunct Neg,_> => "ng" ++BIND ;
      <VFSubjunct Pos,_> => []
    } ;

    negPrefNge : VForm -> Bool -> Str = \vform,vow -> case <vform,vow> of {
      <VFIndic _ Neg _,False> => "nge" ++BIND ;
      <VFIndic _ Neg _,_> => "ng" ++BIND ;
      <VFConsec Neg,False> => "nge" ++BIND ;
      <VFConsec Neg,_> => "ng" ++BIND ;
      <VFIndic _ Pos _,_> => [] ;
      <VFConsec Pos,_> => [] ;
      <VFSubjunct Neg,False> => "nge" ++BIND ;
      <VFSubjunct Neg,_> => "ng" ++BIND ;
      <VFSubjunct Pos,_> => []
    } ;

    icompNeg1 : VForm -> Str = \vform -> case vform of {
      VFIndic _ Neg PresTense => "a"++BIND ;
      VFIndic _ _ _ => [] ;
      VFConsec Neg => "a" ;
      VFConsec Pos => [] ;
      VFSubjunct Neg => "a" ;
      VFSubjunct Pos => []
    } ;

    icompNeg2 : VForm -> Str = \vform -> case vform of {
      VFIndic _ Neg _ => "nga"++BIND ;
      VFIndic _ _ _ => [] ;
      VFConsec Neg => "nga" ;
      VFConsec Pos => [] ;
      VFSubjunct Neg => "nga" ;
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
    --     VFIndic _ Neg (PresTense | FutTense) Excl => "ka" ++BIND ;
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
      s = adv ;
      asp = Null ;
      reqLocS = False
    } ;

    aspAdv : Str -> Aspect -> { s : Str ; asp : Aspect ; reqLocS : Bool } = \adv,asp ->
    {
      s = adv ;
      asp = asp ;
      reqLocS = False
    } ;

    -- together with
    withPref : Agr => Str = table {
      Third C1a_2a _ => "na" ;
      Third _ _ => "ne" ;
      First _ => "ne" ;
      Second _  => "ne"
    } ;

    -- just like
    eqPref : Agr => Str = table {
      Third C1a_2a _ => "njenga" ;
      Third _ _ => "njenge" ;
      First _ => "njenge" ;
      Second _  => "njenge"
    } ;

    -- as big as
    eqSizePref : Agr => Str = table {
      Third C1a_2a _ => "nganga" ;
      Third _ _ => "ngange" ;
      First _ => "ngange" ;
      Second _  => "ngange"
    } ;

    -- with
    instrPref : Agr => Str = table {
      Third C1a_2a _ => "nga" ;
      Third _ _ => "nge" ;
      First _ => "nge" ;
      Second _  => "nge"
    } ;

    --------------------
    -- QUALIFICATIVES --
    --------------------
    regAdj : Str -> { s : AForm => Str ; empty : Str ; t : AType } = \a ->
    {
      s = table {
        AF1 => a ;
        AF2 => prefix_nasal a ;
        AF3 => case a of {
          #cons+#cons*+#vowel => "u"+a ;
          _ => a
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
      s = \\_ => a ;
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
      s = \\_ => a ;
      empty = [] ;
      t = EnumType
    } ;

    rel_yo_2 : Str = BIND++"ko" ;

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
        Third C1_2 Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m"++BIND } ;
        Third C1_2 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ba"++BIND } ;
        Third C1a_2a Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m"++BIND } ;
        Third C1a_2a Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ba"++BIND } ;
        Third C3_4 Sg  => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m"++BIND } ;
        Third C3_4 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "mi"++BIND } ;
        Third C5_6 Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "li"++BIND } ;
        Third C5_6 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ma"++BIND } ;
        Third C7_8 Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "si"++BIND } ;
        Third C7_8 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ti"++BIND } ; -- nasal for 8,9,10 assumed to be fixed to root
        Third C9_10 Sg => table {
          VFIndic MainCl Pos PresTense => "yi" ++BIND ;
          VFIndic _ Pos PresTense => [] ;
          VFIndic RelCl Neg PresTense => [] ;
          VFIndic _ _ FutTense => "yi"++BIND ;
          VFIndic _ _ RemFutTense => "yi"++BIND ;
          VFIndic _ _ PastTense => "yi" ++BIND ;
          VFIndic _ _ RemPastTense => "yi" ++BIND ;
          VFIndic _ _ _ => "i"++BIND ;
          VFConsec _ => "yi" ;
          VFSubjunct _ => "yi"
        } ;
        Third C9_10 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ti"++BIND } ;
        Third C11_10 Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "lu"++BIND } ;
        Third C11_10 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ti"++BIND } ;
        Third C9_6 Sg => table {
          VFIndic MainCl Pos PresTense => "yi" ++BIND ;
          VFIndic _ Pos PresTense => [] ;
          VFIndic RelCl Neg PresTense => [] ;
          VFIndic _ _ FutTense => "yi"++BIND ;
          VFIndic _ _ RemFutTense => "yi"++BIND ;
          VFIndic _ _ PastTense => "yi" ++BIND ;
          VFIndic _ _ RemPastTense => "yi" ++BIND ;
          VFIndic _ _ _ => "i"++BIND ;
          VFConsec _ => "yi" ;
          VFSubjunct _ => "yi"
        } ;
        Third C9_6 Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ma"++BIND } ;
        Third C14 _ => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "bu"++BIND } ;
        Third C15 _ => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ku"++BIND } ;
        Third C17 _ => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ku"++BIND } ;
        First Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m"++BIND } ;
        First Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "ba"++BIND } ;
        Second Sg => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "m"++BIND } ;
        Second Pl => table { VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => "om"++BIND }
      } ;

      adjPref : Agr -> VForm -> Str = \agr,vform -> case vform of {
        VFIndic _ _ _ | VFConsec _ | VFSubjunct _ => adjPrefLookup!agr!vform
      } ;

    atwhichPhiPref : Agr => Str =
      table {
        Third C1_2 Sg => "mu" ;
        Third C1_2 Pl => "ba" ;
        Third C1a_2a Sg => "mu" ;
        Third C1a_2a Pl => "ba" ;
        Third C3_4 Sg  => "mu" ;
        Third C3_4 Pl => "mi" ;
        Third C5_6 Sg => "li" ;
        Third C5_6 Pl => "ma" ;
        Third C7_8 Sg => "si" ;
        Third C7_8 Pl => "ti" ;
        Third C9_10 Sg => "yi" ;
        Third C9_10 Pl => "ti" ;
        Third C11_10 Sg => "lu" ;
        Third C11_10 Pl => "ti" ;
        Third C9_6 Sg => "yi" ;
        Third C9_6 Pl => "ma" ;
        Third C14 _ => "bu" ;
        Third C15 _ => "ku" ;
        Third C17 _ => "ku" ;
        First Sg => "mu" ;
        First Pl => "ba" ;
        Second Sg => "mu" ;
        Second Pl => "om"
      } ;

    -----------
    -- NOUNS --
    -----------
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

    kwaProperName : Str -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str ; lemma : Str } =
    \root,cg ->
    let
      noms : Str = nomNoun root Sg cg ;
      nomp : Str = nomNoun root Sg cg ;
      locs : Str = "Kwa"+root ;
      locp : Str = "Kwa"+root ;
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
        _+#cons+#vowel+#cons+_+#vowel+_ => "kum"+root ;
        _ => "kumu"+root
      } ; -- umu for single syllables, um for the rest
      <C1_2,Pl> => "kuba"+root ; -- abe for tribes or guilds
      <C1a_2a,Sg> => "ku"+root ;
      <C1a_2a,Pl> => "ko"+root ;
      <C3_4,Sg> => case root of {
        ("m"|"M")+_ => "e"+root ;
        _ => "em"+root
      } ;
      <C3_4,Pl> => "emi"+root ;
      <C5_6,Sg> => case root of {
        ("i"|"I")+_ => "e" + (last root)  ;
        (#vowel|#vowel_cap)+_ => "el" + root ;
        _ => "e"+root -- ili long form (not used?)
      } ;
      <C5_6,Pl> => case root of {
        ("i"|"I")+_ => "eme"+ (last root) ;
        (#vowel|#vowel_cap)+_ => "em"+root ;
        _ => "ema"+root
      } ; -- ame for roots starting with i
      <C7_8,Sg> => case root of {
        (#vowel|#vowel_cap)+_ => "es"+root ;
        _ => "esi"+root
      } ; -- is for roots starting with vowel
      <C7_8,Pl> => case root of {
        (#vowel|#vowel_cap)+_ => "et"+root ;
        _ => "eti"+root  -- iz for roots starting with vowel
      } ;
      <C9_10,Sg> => "e"+root ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
      <C9_10,Pl> => "eti"+root ; -- izim for labial, izin for alveolar (TODO: does this correctly split options?)
      <C11_10,Sg> => case root of {
        (#vowel|#vowel_cap)+_ => "olw" + root ;
        ("w"|"W")+_ => "ol"+root ;
        _ => "o"+root
      } ;
      <C11_10,Pl> => case root of {
        (#vowel|#vowel_cap)+_ => "etilw" + root ;
        ("w"|"W")+_ => "etil" + root ;
        _ => "eti"+root
      } ; -- izim for labial, izin for alveolar, izi(n|m)k for roots starting with kh
      <C9_6,Sg> => "e"+root ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
      <C9_6,Pl> => case root of {
        ("i"|"I")+_ => "eme"+root ;
        _ => "ema"+root
      } ; -- ame for roots starting with i
      <C14,_> => "ebu"+root ;
      <C15,_> => case root of {
        ("a"|"e"|"A"|"E")+_ => "ekw"+root ;
        (#cons|"y"|#cons_cap|"Y")+_ => "eku"+root ;
        _ => "ek"+root
        } ; -- ukw for roots starting with a/e, uk for roots starting with o
      <C17,_> => "eku"+root  -- sometimes ukw
    } ;

    -- Src: Doke, Linda Hall
    addLocSuffix : Str -> Str = \root ->
      case root of
      {
        _+"mbo" => (tk 3 root) + "njeni" ;
        _+"mbu" => (tk 3 root) + "njini" ;
        _+"pho" => (tk 3 root) + "sheni" ;
        _+"bho" => (tk 3 root) + "jeni" ;
        _+"phu" => (tk 3 root) + "shini" ;
        _+"bhu" => (tk 3 root) + "jini" ;
        _+"bo" => (tk 2 root) + "tsheni" ;
        _+"bu" => (tk 2 root) + "tshini" ;
        _+"mo" => (tk 2 root) + "nyeni" ;
        _+"mu" => (tk 2 root) + "nyini" ;
        _+("a"|"e") => (init root)+"eni" ;
        _+"i" => (init root)+"ini" ;
        _+"wu" => (init root)+"ini" ;
        _+"wo" => (init root)+"eni" ;
        _+"o" => (init root)+"weni" ;
        _+"u" => (init root)+"wini" ;
        _ => root+"ini"
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
          (#vowel|#vowel_cap)+_ => "um"+root ;
          _+#cons+#vowel+#cons+_+#vowel+_ => "um"+root ;
          _ => "umu"+root
        } ; -- umu for single syllables, um for the rest
        <C1_2,Pl> => case root of {
          (#vowel|#vowel_cap)+_ => "b"+root ;
          _ => "ba"+root  -- abe for tribes or guilds
        } ;
        <C1a_2a,Sg> => root ;
        <C1a_2a,Pl> => "bo"+root ;
        <C3_4,Sg> => case root of {
          ("m"|"M")+_+#vowel+#cons+_+#vowel+_ => "u"+root ;
          _+(#cons|"y")+#vowel+#cons+_+#vowel+_ => "um"+root ;
          ("o"|"O")+_ => "um"+root ;
          _ => "umu"+root
        } ; -- umu for single syllables, um for the rest
        <C3_4,Pl> => "imi"+root ;
        <C5_6,Sg> => case root of {
          -- ("i"|"I")+_ => root ;
          -- (#vowel|#vowel_cap)+_ => "il"+root ;
          _ => "li"+root  -- ili long form (not used?)
        } ;
        <C5_6,Pl> => case root of {
          ("i"|"I")+_ => "eme"+(drop 1 root) ;
          (#vowel|#vowel_cap)+_ => "em"+root ;
          _ => "ema"+root
        } ; -- ame for roots starting with i
        <C7_8,Sg> => case root of {
          (#vowel|#vowel_cap)+_ => "s"+root ;
          _ => "si"+root
        } ; -- is for roots starting with vowel
        <C7_8,Pl> => case root of {
          (#vowel|#vowel_cap)+_ => "t"+root ;
          _ => "ti" + root
        } ;
        <C9_10,Sg> => "i" + prefix_nasal root ;
        <C9_10,Pl> => "ti" + prefix_nasal root ;
        <C11_10,Sg> => case root of {
          (#vowel|#vowel_cap)+_ => "lw"+root ;
          ("w"|"W")+_ => "l"+root ;
          _ => "lu"+root
        } ;
        <C11_10,Pl> => case root of {
          (#vowel|#vowel_cap)+_ => "tilw"+root ;
          ("w"|"W")+_ => "til"+root ;
          _ => "ti" + prefix_nasal root
        } ;
        <C9_6,Sg> => "i" + prefix_nasal root ;
        <C9_6,Pl> => case root of {
          ("i"|"I")+_ => "eme"+root ;
          _ => "ema"+root
        } ; -- ame for roots starting with i
        <C14,_> => "bu"+root ;
        <C15,_> => case root of {
          ("a"|"e"|"A"|"E")+_ => "kw"+root ;
          (#cons|#cons_cap|"y"|"Y")+_ => "ku"+root ;
          _ => "k"+root
        } ; -- ukw for roots starting with a/e, uk for roots starting with o
        <C17,_> => "ku"+root  -- sometimes ukw
      } ;

    locNoun : Str -> Number -> ClassGender -> Str = \root,n,cg ->
        case <cg,n> of
        {
          <C1_2,Sg> => case root of {
            (#vowel|#vowel_cap)+_ => "kum"+root ;
            _+#cons+#vowel+#cons+_+#vowel+_ => "kum"+root ;
            _ => "kumu"+root
          } ; -- umu for single syllables, um for the rest
          <C1_2,Pl> => case root of {
            (#vowel|#vowel_cap)+_ => "kub"+root ;
            _ => "kuba"+root -- abe for tribes or guilds
          } ;
          <C1a_2a,Sg> => "ku"+root ;
          <C1a_2a,Pl> => "ko"+root ;
          <C3_4,Sg> => case root of {
            ("m"|"M")+_ => "e"+(addLocSuffix root) ;
            ("n"|"N")+_ => "e"+(addLocSuffix root) ;
            _ => "em"+(addLocSuffix root)
          } ;
          <C3_4,Pl> => "emi"+(addLocSuffix root) ;
          <C5_6,Sg> => case root of {
            ("i"|"I")+_ => "e"+(addLocSuffix (drop 1 root)) ;
            (#vowel|#vowel_cap)+_ => "el"+(addLocSuffix root) ;
            _ => "e"+(addLocSuffix root) -- ili long form (not used?)
          } ;
          <C5_6,Pl> => case root of {
            ("i"|"I")+_ => "eme"+(addLocSuffix (drop 1 root)) ;
            (#vowel|#vowel_cap)+_ => "em"+(addLocSuffix root) ;
            _ => "ema"+(addLocSuffix root)
          } ; -- ame for roots starting with i
          <C7_8,Sg> => case root of {
            (#vowel|#vowel_cap)+_ => "es"+(addLocSuffix root) ;
            _ => "esi"+(addLocSuffix root)
          } ; -- is for roots starting with vowel
          <C7_8,Pl> => case root of {
            (#vowel|#vowel_cap)+_ => "et"+(addLocSuffix root) ;
            _ => "eti"+(addLocSuffix root)  -- iz for roots starting with vowel
          } ;
          <C9_10,Sg> => "e"+(addLocSuffix (prefix_nasal root)) ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
          <C9_10,Pl> => "eti"+(addLocSuffix (prefix_nasal root)) ; -- izim for labial, izin for alveolar (TODO: does this correctly split options?)
          <C11_10,Sg> => case root of {
            (#vowel|#vowel_cap)+_ => "olw"+(addLocSuffix root) ;
            ("w"|"W")+_ => "ol"+(addLocSuffix root) ;
            _ => "o"+(addLocSuffix root)
          } ;
          <C11_10,Pl> => case root of {
            (#vowel|#vowel_cap)+_ => "etilw"+(addLocSuffix root) ;
            ("w"|"W")+_ => "etil"+(addLocSuffix root) ;
            _ => "eti"+(addLocSuffix (prefix_nasal root)) -- izim for labial, izin for alveolar, izi(n|m)k for roots starting with kh
          } ;
          <C9_6,Sg> => "e"+(addLocSuffix (prefix_nasal root)) ; -- em for labial, en for alveolar (TODO: does this correctly split options?)
          <C9_6,Pl> => case root of {
            ("i"|"I")+_ => "eme"+(addLocSuffix root) ;
            _ => "ema"+(addLocSuffix root)
          } ; -- ame for roots starting with i
          <C14,_> => "ebu"+(addLocSuffix root) ;
          <C15,_> => case root of {
            ("a"|"e"|"A"|"E")+_ => "ekw"+(addLocSuffix root) ;
            (#cons|"y"|#cons_cap|"Y")+_ => "eku"+root ;
            _ => "ek"+(addLocSuffix root)
            } ; -- ukw for roots starting with a/e, uk for roots starting with o
          <C17,_> => "eku"+(addLocSuffix root)  -- sometimes ukw
        } ;


      locS : Agr => Str = table {
        Third C1_2 _ => [] ;
        Third C1a_2a _ => [] ;
        Third _ _  => "s"++BIND ;
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
        First Sg =>         table {SC => "ngi" ;  SCVow => "ng"++BIND ;  SCNeg => "ngi" ; SCNegVow => "ng" ; SCPart => "ngi" ; SCPS => "ngi" ; SCVowP => "ngi" ; SCBe => "bengi" ; SCRP => "ngangi" ; SCSe => "ngi"++BIND++"se" } ;
        Second Sg =>        table {SC => "u" ;    SCVow => "w"++BIND ;   SCNeg => "wu" ;  SCNegVow => "w" ;  SCPart => "u" ;   SCPS => "u" ;   SCVowP => "wu" ;  SCBe => "ubu" ;   SCRP => "wawu" ; SCSe => "se"++BIND++"wu" } ;
        First Pl =>         table {SC => "si" ;   SCVow => "s"++BIND ;   SCNeg => "si" ;  SCNegVow => "s" ; SCPart => "si" ;  SCPS => "si" ;  SCVowP => "si" ;  SCBe => "besi" ;   SCRP => "sasi" ; SCSe => "se"++BIND++"si" } ;
        Second Pl =>        table {SC => "ni" ;   SCVow => "n"++BIND ;   SCNeg => "ni" ;  SCNegVow => "n" ; SCPart => "ni" ;  SCPS => "ni" ;  SCVowP => "ni" ;  SCBe => "beni" ;   SCRP => "nani" ; SCSe => "se"++BIND++"ni" } ;
        Third C1_2 Sg =>    table {SC => "u" ;    SCVow => "w"++BIND ;   SCNeg => "ka" ;  SCNegVow => "k" ; SCPart => "e" ;   SCPS => "a" ;   SCVowP => "wu" ;  SCBe => "ube" ;    SCRP => "waye" ; SCSe => "se"++BIND++"ye" } ;
        Third C1_2 Pl =>    table {SC => "ba" ;   SCVow => "b"++BIND ;   SCNeg => "ba" ;  SCNegVow => "b" ; SCPart => "be" ;  SCPS => "ba" ;  SCVowP => "ba" ;  SCBe => "bebe" ;   SCRP => "babe" ; SCSe => "se"++BIND++"be" } ;
        Third C1a_2a Sg =>  table {SC => "u" ;    SCVow => "w"++BIND ;   SCNeg => "ka" ;  SCNegVow => "k" ; SCPart => "e" ;   SCPS => "a" ;   SCVowP => "wu" ;  SCBe => "ube" ;    SCRP => "waye" ; SCSe => "se"++BIND++"ye" } ;
        Third C1a_2a Pl =>  table {SC => "ba" ;   SCVow => "b"++BIND ;   SCNeg => "ba" ;  SCNegVow => "b" ; SCPart => "be" ;  SCPS => "ba" ;  SCVowP => "ba" ;  SCBe => "bebe" ;   SCRP => "babe" ; SCSe => "se"++BIND++"be" } ;
        Third C3_4 Sg =>    table {SC => "u" ;    SCVow => "w"++BIND ;   SCNeg => "wu" ;  SCNegVow => "w" ; SCPart => "u" ;   SCPS => "u" ;   SCVowP => "wu" ;  SCBe => "ubu" ;    SCRP => "wawu" ; SCSe => "se"++BIND++"wu" } ;
        Third C3_4 Pl =>    table {SC => "i" ;    SCVow => "y"++BIND ;   SCNeg => "yi" ;  SCNegVow => "y" ; SCPart => "i" ;   SCPS => "i" ;   SCVowP => "yi" ;  SCBe => "ibi" ;    SCRP => "yayi" ; SCSe => "se"++BIND++"yi" } ;
        Third C5_6 Sg =>    table {SC => "li" ;   SCVow => "l"++BIND ;   SCNeg => "li" ;  SCNegVow => "l" ; SCPart => "li" ;  SCPS => "li" ;  SCVowP => "li" ;  SCBe => "beli" ;   SCRP => "lali" ; SCSe => "se"++BIND++"li" } ;
        Third C5_6 Pl =>    table {SC => "a" ;    SCVow => [] ;          SCNeg => "wa" ;  SCNegVow => "w" ; SCPart => "e" ;   SCPS => "a" ;   SCVowP => "wa" ;  SCBe => "abe" ;    SCRP => "aye" ; SCSe => "se"++BIND++"ye" } ;
        Third C7_8 Sg =>    table {SC => "si" ;   SCVow => "s"++BIND ;   SCNeg => "si" ;  SCNegVow => "s" ; SCPart => "si" ;  SCPS => "si" ;  SCVowP => "si" ;  SCBe => "besi" ;   SCRP => "sasi" ; SCSe => "se"++BIND++"si" } ;
        Third C7_8 Pl =>    table {SC => "ti" ;   SCVow => "t"++BIND ;   SCNeg => "ti" ;  SCNegVow => "t" ; SCPart => "ti" ;  SCPS => "ti" ;  SCVowP => "ti" ;  SCBe => "beti" ;   SCRP => "tati" ; SCSe => "se"++BIND++"ti" } ;
        Third C9_10 Sg =>   table {SC => "i" ;    SCVow => "y"++BIND ;   SCNeg => "yi" ;  SCNegVow => "y" ; SCPart => "yi" ;  SCPS => "i" ;   SCVowP => "yi" ;  SCBe => "ibi" ;    SCRP => "yayi" ; SCSe => "se"++BIND++"yi" } ;
        -- Third C9_10 Sg =>   table {SC => "i" ;    SCVow => "i"++BIND ;   SCNeg => "yi" ;  SCPart => "yi" ;  SCPS => "i" ;   SCVowP => "yi" ;  SCBe => "ibi" } ;
        Third C9_10 Pl =>   table {SC => "ti" ;   SCVow => "t"++BIND ;   SCNeg => "ti" ;  SCNegVow => "t" ; SCPart => "ti" ;  SCPS => "ti" ;  SCVowP => "ti" ;  SCBe => "beti" ;   SCRP => "tati" ; SCSe => "se"++BIND++"ti" } ;
        Third C11_10 Sg =>  table {SC => "lu" ;   SCVow => "lw"++BIND ;  SCNeg => "lu" ;  SCNegVow => "l" ; SCPart => "lu" ;  SCPS => "lu" ;  SCVowP => "lu" ;  SCBe => "belu" ;   SCRP => "lwalu" ; SCSe => "se"++BIND++"lu" } ;
        Third C11_10 Pl =>  table {SC => "ti" ;   SCVow => "t"++BIND ;   SCNeg => "ti" ;  SCNegVow => "t" ; SCPart => "ti" ;  SCPS => "ti" ;  SCVowP => "ti" ;  SCBe => "beti" ;   SCRP => "tati" ; SCSe => "se"++BIND++"ti" } ;
        Third C9_6 Sg =>    table {SC => "i" ;    SCVow => "y"++BIND ;   SCNeg => "yi" ;  SCNegVow => "y" ; SCPart => "yi" ;  SCPS => "i" ;   SCVowP => "yi" ;  SCBe => "ibi" ;    SCRP => "yayi" ; SCSe => "se"++BIND++"yi" } ;
        Third C9_6 Pl =>    table {SC => "a" ;    SCVow => [] ;          SCNeg => "wa" ;  SCNegVow => "w" ; SCPart => "e" ;   SCPS => "a" ;   SCVowP => "wa" ;  SCBe => "abe" ;    SCRP => "aye" ; SCSe => "se"++BIND++"ye" } ;
        Third C14 _ =>      table {SC => "bu" ;   SCVow => "b"++BIND ;   SCNeg => "bu" ;  SCNegVow => "b" ; SCPart => "bu" ;  SCPS => "bu" ;  SCVowP => "bu" ;  SCBe => "bebu" ;   SCRP => "babu" ; SCSe => "se"++BIND++"bu" } ;
        Third C15 _ =>      table {SC => "ku" ;   SCVow => "k"++BIND ;  SCNeg => "ku" ;  SCNegVow => "k" ; SCPart => "ku" ;  SCPS => "ku" ;  SCVowP => "ku" ;  SCBe => "beku" ;   SCRP => "kwaku" ; SCSe => "se"++BIND++"ku" } ;
        Third C17 _ =>      table {SC => "ku" ;   SCVow => "k"++BIND ;  SCNeg => "ku" ;  SCNegVow => "k" ; SCPart => "ku" ;  SCPS => "ku" ;  SCVowP => "ku" ;  SCBe => "beku" ;   SCRP => "kwaku" ; SCSe => "se"++BIND++"ku" }
      } ;

    subjConc : VForm -> Agr -> Bool -> RInit -> Str = \vform,agr,vow,rinit ->
      case <vow,vform,agr,rinit> of {
          <False,VFIndic _ Neg _,_> => subjConcLookup ! agr ! SCNeg ++BIND ;
          <True,VFIndic _ Neg _,_> => subjConcLookup ! agr ! SCNegVow ++BIND ;
          <True,VFIndic _ _ _,Third C17 _,(RA|RE|RI)> => subjConcLookup ! agr ! SCVow ++BIND ;
          <True,VFIndic _ _ _,_,_> => subjConcLookup ! agr ! SCVow ;
          <_,VFIndic _ _ RemPastTense,_,_> => subjConcLookup ! agr ! SCVow ;
          <_,VFIndic _ _ _,_,_>   => subjConcLookup ! agr ! SC ++BIND ;
          <False,VFConsec _ ,_,_> => subjConcLookup ! agr ! SCVow ++BIND++ "a" ++BIND ;
          <True,VFConsec Pos ,Third C17 _,(RA|RE|RI)> => subjConcLookup ! agr ! SCVow ++BIND ;
          <True,VFConsec Pos ,_,_> => subjConcLookup ! agr ! SCVow ;
          <True,VFConsec Neg ,_,_> => subjConcLookup ! agr ! SCVow ++BIND++ "a" ++BIND ;
          <False,VFSubjunct _,_,_> => case agr of {
            Third C1_2 Sg => "a" ++BIND ;
            Third C1a_2a Sg => "a" ++BIND ;
            (Third _ _ | First _ | Second _ ) => subjConcLookup ! agr ! SC ++BIND
          } ;
          <True,VFSubjunct Pos,Third C17 _,(RA|RE|RI)> => case agr of {
            Third C1_2 Sg => [] ;
            Third C1a_2a Sg => [] ;
            (Third _ _ | First _ | Second _ ) => subjConcLookup ! agr ! SCVow ++BIND
          } ;
          <True,VFSubjunct Pos,_,_> => case agr of {
            Third C1_2 Sg => [] ;
            Third C1a_2a Sg => [] ;
            (Third _ _ | First _ | Second _ ) => subjConcLookup ! agr ! SCVow
          } ;
          <True,VFSubjunct Neg,_,_> => case agr of {
            Third C1_2 Sg => "a" ++BIND ;
            Third C1a_2a Sg => "a" ++BIND ;
            (Third _ _ | First _ | Second _ ) => subjConcLookup ! agr ! SC ++BIND
          }
      } ;

    impPref : Polarity -> Str = \pol -> case pol of {
      Pos => [] ;
      Neg => "u" ++BIND++ "nga" ++BIND
    } ;

    icomp_pref : VForm -> Agr -> Str = \vform,agr ->
    let
      neg1 = icompNeg1 vform ;
      neg2 = icompNeg2 vform ;
    in
    case vform of {
      VFIndic _ Pos PresTense => subjConcLookup ! agr ! SC ++BIND ;
      VFIndic _ Pos PastTense => [] ;
      VFIndic _ Pos RemPastTense => subjConcLookup ! agr ! SC ++BIND++ "be" ++ subjConcLookup ! agr ! SCBe ++BIND ;
      VFIndic _ Pos FutTense => subjConcLookup ! agr ! SC ++BIND ++ TEMP_PREF_FUT++BIND++"be" ++ subjConcLookup ! agr ! SC ++BIND ;
      VFIndic _ Pos RemFutTense => subjConcLookup ! agr ! SC ++BIND ++ TEMP_PREF_REMFUT++BIND++"be" ++ subjConcLookup ! agr ! SC ++BIND ;

      -- might have to add an SCNegBe to the table
      VFIndic _ Neg PresTense => neg1 ++ subjConcLookup ! agr ! SCNeg ++BIND ++ neg2 ;
      VFIndic _ Neg PastTense => NEG_NGA ; -- neg1 ++ "be"++BIND++ subjConcLookup ! agr ! SCBe ++BIND ++ neg2 ;
      VFIndic _ Neg RemPastTense => neg1 ++ subjConcLookup ! agr ! SC ++BIND++ "be" ++ subjConcLookup ! agr ! SCBe ++BIND ++ neg2 ;
      VFIndic _ Neg FutTense => neg1 ++ subjConcLookup ! agr ! SCNeg ++BIND ++ TEMP_PREF_FUT++BIND++"be" ++ subjConcLookup ! agr ! SCBe ++BIND ++ neg2 ;
      VFIndic _ Neg RemFutTense => neg1 ++ subjConcLookup ! agr ! SCNeg ++BIND ++ TEMP_PREF_REMFUT++BIND++"be" ++ subjConcLookup ! agr ! SCBe ++BIND ++ neg2 ;
      VFConsec _ => nonExist ; -- "*consec" ;
      VFSubjunct _ => nonExist -- "*subjunct"
    } ;

    -- OBJECT AGREEMENT MORPHEME --

    objConcLookup : Agr => OCForm => Str =
      table {
        First Sg =>         table {OC => "ngi" ;  OCAE => "ng" ;  OCIOU => "ng" ; OCMono => "ngi" ; OCThing => "ngi" } ;
        Second Sg =>        table {OC => "ku" ;   OCAE => "k" ;   OCIOU => "k" ;  OCMono => "ku" ;  OCThing => "ku" } ;
        First Pl =>         table {OC => "si" ;   OCAE => "s" ;   OCIOU => "s" ;  OCMono => "si" ;  OCThing => "si" } ;
        Second Pl =>        table {OC => "ni" ;   OCAE => "n" ;   OCIOU => "n" ;  OCMono => "ni" ;  OCThing => "ni" } ;
        Third C1_2 Sg =>    table {OC => "m" ;    OCAE => "m" ;   OCIOU => "m" ;  OCMono => "mu" ;  OCThing => "wu" } ;
        Third C1_2 Pl =>    table {OC => "ba" ;   OCAE => "b" ;   OCIOU => "b" ;  OCMono => "ba" ;  OCThing => "ba" } ;
        Third C1a_2a Sg =>  table {OC => "m" ;    OCAE => "m" ;   OCIOU => "m" ;  OCMono => "mu" ;  OCThing => "wu" } ;
        Third C1a_2a Pl =>  table {OC => "ba" ;   OCAE => "b" ;   OCIOU => "b" ;  OCMono => "ba" ;  OCThing => "ba" } ;
        Third C3_4 Sg =>    table {OC => "wu" ;   OCAE => "w" ;   OCIOU => "w" ;  OCMono => "wu" ;  OCThing => "wu" } ;
        Third C3_4 Pl =>    table {OC => "yi" ;   OCAE => "y" ;   OCIOU => "y" ;  OCMono => "yi" ;  OCThing => "yi" } ;
        Third C5_6 Sg =>    table {OC => "li" ;   OCAE => "l" ;   OCIOU => "l" ;  OCMono => "li" ;  OCThing => "li" } ;
        Third C5_6 Pl =>    table {OC => "wa" ;   OCAE => "w" ;   OCIOU => "w" ;  OCMono => "wa" ;  OCThing => "wa" } ;
        Third C7_8 Sg =>    table {OC => "si" ;   OCAE => "s" ;   OCIOU => "s" ;  OCMono => "si" ;  OCThing => "si" } ;
        Third C7_8 Pl =>    table {OC => "ti" ;   OCAE => "t" ;   OCIOU => "t" ;  OCMono => "ti" ;  OCThing => "ti" } ;
        Third C9_10 Sg =>   table {OC => "yi" ;   OCAE => "y" ;   OCIOU => "y" ;  OCMono => "yi" ;  OCThing => "yi" } ;
        Third C9_10 Pl =>   table {OC => "ti" ;   OCAE => "t" ;   OCIOU => "t" ;  OCMono => "ti" ;  OCThing => "ti" } ;
        Third C11_10 Sg =>  table {OC => "lu" ;   OCAE => "lw" ;  OCIOU => "l" ;  OCMono => "lu" ;  OCThing => "lu" } ;
        Third C11_10 Pl =>  table {OC => "ti" ;   OCAE => "t" ;   OCIOU => "t" ;  OCMono => "ti" ;  OCThing => "ti" } ;
        Third C9_6 Sg =>    table {OC => "yi" ;   OCAE => "y" ;   OCIOU => "y" ;  OCMono => "yi" ;  OCThing => "yi" } ;
        Third C9_6 Pl =>    table {OC => "wa" ;   OCAE => "w" ;   OCIOU => "w" ;  OCMono => "wa" ;  OCThing => "wa" } ;
        Third C14 _ =>      table {OC => "bu" ;   OCAE => "bw" ;  OCIOU => "b" ;  OCMono => "bu" ;  OCThing => "bu" } ;
        Third C15 _ =>      table {OC => "ku" ;   OCAE => "kw" ;  OCIOU => "k" ;  OCMono => "ku" ;  OCThing => "ku" } ;
        Third C17 _ =>      table {OC => "ku" ;   OCAE => "kw" ;  OCIOU => "k" ;  OCMono => "ku" ;  OCThing => "ku" }
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

    -- ADJECTIVE ANTECEDENT AGREEMENT MORPHEME --

    relAdjPrefLookup : Agr => Str =
      table {
        Third C1_2 Sg => "m" ;
        Third C1_2 Pl => "" ;
        Third C1a_2a Sg => "m" ;
        Third C1a_2a Pl => "" ;
        Third C3_4 Sg  => "m" ;
        Third C3_4 Pl => "mi" ;
        Third C5_6 Sg => "" ;
        Third C5_6 Pl => "ma" ;
        Third C7_8 Sg => "" ;
        Third C7_8 Pl => "" ;
        Third C9_10 Sg => "" ;
        Third C9_10 Pl => "" ;
        Third C11_10 Sg => "" ;
        Third C11_10 Pl => "" ;
        Third C9_6 Sg => "" ;
        Third C9_6 Pl => "ma" ;
        Third C14 _ => "bu" ;
        Third C15 _ => "ku" ;
        Third C17 _ => "ku" ;
        (First _ | Second _ )  => "m"
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
        Third C1_2 Sg => table { RO => "l" ; (RA|RE) => "low"++BIND ; _ => "lo"++BIND } ;
        Third C1_2 Pl => table { RC => "laba"++BIND ; _ => "lab"++BIND } ;
        Third C1a_2a Sg => table { RO => "l" ; (RA|RE) => "low"++BIND ; _ => "lo"++BIND } ;
        Third C1a_2a Pl => table { RC => "laba"++BIND ; _ => "lab"++BIND } ;
        Third C3_4 Sg  => table { RO => "l" ; (RA|RE) => "low"++BIND ; _ => "lo"++BIND } ;
        Third C3_4 Pl => table { RE => "l" ; (RA|RO) => "ley"++BIND ; _ => "le"++BIND } ;
        Third C5_6 Sg => table { RC => "leli"++BIND ; _ => "lel"++BIND } ;
        Third C5_6 Pl => table { RC => "la"++BIND ; _ => "l" } ;
        Third C7_8 Sg => table { RC => "lesi"++BIND ; _ => "les"++BIND } ;
        Third C7_8 Pl => table { RC => "leti"++BIND ; _ => "let"++BIND } ;
        Third C9_10 Sg => table { RE => "l" ; (RA|RO) => "ley" ++BIND ; _ => "le"++BIND } ;
        Third C9_10 Pl => table { RC => "leti"++BIND ; _ => "let"++BIND } ;
        Third C11_10 Sg => table { RC => "lolu"++BIND ; (RA|RE) => "lolw" ; _ => "lol"++BIND } ;
        Third C11_10 Pl => table { RC => "leti"++BIND ; _ => "let"++BIND } ;
        Third C9_6 Sg => table { RE => "l" ; (RA|RO) => "ley"++BIND ; _ => "le"++BIND } ;
        Third C9_6 Pl => table { RC => "la"++BIND ; _ => "l" } ;
        Third C14 _ => table { RC => "lobu"++BIND ; _ => "lob"++BIND } ;
        Third C15 _ => table { RC => "loku"++BIND ; (RA|RE) => "lokw" ; _ => "lok"++BIND } ;
        Third C17 _ => table { RC => "loku"++BIND ; (RA|RE) => "lokw" ; _ => "lok"++BIND } ;
        First Sg => table { RC => "lengi"++BIND ; _ => "leng"++BIND } ;
        First Pl => table { RC => "lesi"++BIND ; _ => "les"++BIND } ;
        Second Sg  => table { RE => "low"++BIND ; _ => "lo"++BIND } ;
        Second Pl => table { RC => "leni"++BIND ; _ => "len"++BIND }
    } ;

    adjConcLookup : Agr => RInit => Str =
      table {
        Third C1_2 Sg => table { RO => "l" ; (RA|RE) => "low"++BIND ; _ => "lo"++BIND } ;
        Third C1_2 Pl => table { RC => "laba"++BIND ; _ => "lab"++BIND } ;
        Third C1a_2a Sg => table { RO => "l" ; (RA|RE) => "low"++BIND ; _ => "lo"++BIND } ;
        Third C1a_2a Pl => table { RC => "laba"++BIND ; _ => "lab"++BIND } ;
        Third C3_4 Sg  => table { RO => "l" ; (RA|RE) => "low"++BIND ; _ => "lo"++BIND } ;
        Third C3_4 Pl => table { RC => "lemi"++BIND ; _ => "lem"++BIND } ;
        Third C5_6 Sg => table { RC => "leli"++BIND ; _ => "lel"++BIND } ;
        Third C5_6 Pl => table { RC => "la"++BIND ; _ => "l" } ;
        Third C7_8 Sg => table { RC => "lesi"++BIND ; _ => "les"++BIND } ;
        Third C7_8 Pl => table { RC => "leti"++BIND ; _ => "let"++BIND } ;
        Third C9_10 Sg => table { RE => "l" ; (RA|RO) => "ley" ++BIND ; _ => "le"++BIND } ;
        Third C9_10 Pl => table { RC => "leti"++BIND ; _ => "let"++BIND } ;
        Third C11_10 Sg => table { RC => "lolu"++BIND ; (RA|RE) => "lolw" ; _ => "lol"++BIND } ;
        Third C11_10 Pl => table { RC => "leti"++BIND ; _ => "let"++BIND } ;
        Third C9_6 Sg => table { RE => "l" ; (RA|RO) => "ley"++BIND ; _ => "le"++BIND } ;
        Third C9_6 Pl => table { RC => "la"++BIND ; _ => "l" } ;
        Third C14 _ => table { RC => "lobu"++BIND ; _ => "lob"++BIND } ;
        Third C15 _ => table { RC => "loku"++BIND ; (RA|RE) => "lokw" ; _ => "lok"++BIND } ;
        Third C17 _ => table { RC => "loku"++BIND ; (RA|RE) => "lokw" ; _ => "lok"++BIND } ;
        First Sg => table { RC => "lengi"++BIND ; _ => "leng"++BIND } ;
        First Pl => table { RC => "lesi"++BIND ; _ => "les"++BIND } ;
        Second Sg  => table { RE => "low"++BIND ; _ => "lo"++BIND } ;
        Second Pl => table { RC => "leni"++BIND ; _ => "len"++BIND }
    } ;

    relCopConcBeLookup : Agr => Str =
      table {
        Third C1_2 Sg => "lobe"++BIND ;
        Third C1_2 Pl => "lababe"++BIND ;
        Third C1a_2a Sg => "lobe"++BIND ;
        Third C1a_2a Pl => "lababe"++BIND ;
        Third C3_4 Sg  => "lobu"++BIND ;
        Third C3_4 Pl => "lebi"++BIND ;
        Third C5_6 Sg => "lebeli"++BIND ;
        Third C5_6 Pl => "labe"++BIND ;
        Third C7_8 Sg => "lebesi"++BIND ;
        Third C7_8 Pl => "lebeti"++BIND ;
        Third C9_10 Sg => "lebi"++BIND ;
        Third C9_10 Pl => "lebeti"++BIND ;
        Third C11_10 Sg => "lobelu"++BIND ;
        Third C11_10 Pl => "lebeti"++BIND ;
        Third C9_6 Sg => "lebi"++BIND ;
        Third C9_6 Pl => "labe"++BIND ;
        Third C14 _ => "lobebu"++BIND ;
        Third C15 _ => "lobeku"++BIND ;
        Third C17 _ => "lobeku"++BIND ;
        First Sg => "lebengi"++BIND ;
        First Pl => "lebesi"++BIND ;
        Second Sg  => "lobu"++BIND ;
        Second Pl => "lebeni"++BIND
    } ;

    relCopConcRemPastLookup : Agr => Str =
      table {
        Third C1_2 Sg => "lowaye"++BIND ;
        Third C1_2 Pl => "lababe"++BIND ;
        Third C1a_2a Sg => "lowaye"++BIND ;
        Third C1a_2a Pl => "lababe"++BIND ;
        Third C3_4 Sg  => "lowawu"++BIND ;
        Third C3_4 Pl => "leyayi"++BIND ;
        Third C5_6 Sg => "lelali"++BIND ;
        Third C5_6 Pl => "laye"++BIND ;
        Third C7_8 Sg => "lesasi"++BIND ;
        Third C7_8 Pl => "letati"++BIND ;
        Third C9_10 Sg => "leyayi"++BIND ;
        Third C9_10 Pl => "letati"++BIND ;
        Third C11_10 Sg => "lolwalu"++BIND ;
        Third C11_10 Pl => "letati"++BIND ;
        Third C9_6 Sg => "leyayi"++BIND ;
        Third C9_6 Pl => "laye"++BIND ;
        Third C14 _ => "lobabu"++BIND ;
        Third C15 _ => "lokwaku"++BIND ;
        Third C17 _ => "lokwaku"++BIND ;
        First Sg => "lengangi"++BIND ;
        First Pl => "lesasi"++BIND ;
        Second Sg  => "lowawu"++BIND ;
        Second Pl => "lenani"++BIND
    } ;

    -- ENUMERATIVE ANTECEDENT AGREEMENT MORPHEME --

    enumConc : Polarity -> Agr -> Str = \pol,agr -> case pol of {
      Pos => enumConcLookup!agr ;
      Neg => "nge" ++BIND++ enumConcLookup!agr
    } ;

    enumConcLookup : Agr => Str =
      table {
        Third C1_2 Sg => "mu" ++BIND ;
        Third C1_2 Pl => "ba" ++BIND ;
        Third C1a_2a Sg => "mu" ++BIND ;
        Third C1a_2a Pl => "ba" ++BIND ;
        Third C3_4 Sg  => "mu" ++BIND ;
        Third C3_4 Pl => "mi" ++BIND ;
        Third C5_6 Sg => "li" ++BIND ;
        Third C5_6 Pl => "ma" ++BIND ;
        Third C7_8 Sg => "si" ++BIND ;
        Third C7_8 Pl => "ti" ++BIND ;
        Third C9_10 Sg => "i" ++BIND ;
        Third C9_10 Pl => "ti" ++BIND ;
        Third C11_10 Sg => "lu" ++BIND ;
        Third C11_10 Pl => "ti" ++BIND ;
        Third C9_6 Sg => "i" ++BIND ;
        Third C9_6 Pl => "ma" ++BIND ;
        Third C14 _ => "bu" ++BIND ;
        Third C15 _ => "ku" ++BIND ;
        Third C17 _ => "ku" ++BIND ;
        (First _ | Second _ )  => "mu"++BIND 
      } ;

    shortRelConc : Agr => Str =
      table {
        Third C1_2 Sg => "lo" ++BIND ;
        Third C1_2 Pl => "la" ++BIND ;
        Third C1a_2a Sg => "lo" ++BIND ;
        Third C1a_2a Pl => "la" ++BIND ;
        Third C3_4 Sg  => "lo" ++BIND ;
        Third C3_4 Pl => "le" ++BIND ;
        Third C5_6 Sg => "le" ++BIND ;
        Third C5_6 Pl => "la" ++BIND ;
        Third C7_8 Sg => "le" ++BIND ;
        Third C7_8 Pl => "le" ++BIND ;
        Third C9_10 Sg => "le" ++BIND ;
        Third C9_10 Pl => "le" ++BIND ;
        Third C11_10 Sg => "lo" ++BIND ;
        Third C11_10 Pl => "le" ++BIND ;
        Third C9_6 Sg => "le" ++BIND ;
        Third C9_6 Pl => "la" ++BIND ;
        Third C14 _ => "lo" ++BIND ;
        Third C15 _ => "lo" ++BIND ;
        Third C17 _ => "lo" ++BIND ;
        First Sg => "le" ++BIND ;
        First Pl => "le" ++BIND ;
        Second Sg  => "lo" ++BIND ;
        Second Pl => "le" ++BIND
      } ;

    -- POSSESSIVE ANTECEDENT AGREEMENT MORPHEME --

    poss_concord_agr : Agr => Agr => Str =
      table {
        First Sg => table {(Third C1a_2a _) => "wa" ; (Third _ _) => "we" ; (First _|Second _) => "wa" } ;
        First Pl => table {(Third C1a_2a _) => "ba" ; (Third _ _) => "be" ; (First _|Second _) => "ba"} ;
        Second Sg => table {(Third C1a_2a _) => "wa" ; (Third _ _) => "we" ; (First _|Second _) => "wa"} ;
        Second Pl => table {(Third C1a_2a _) => "ba" ; (Third _ _) => "be" ; (First _|Second _) => "ba" } ;
        Third C1_2 Sg => table {(Third C1a_2a _) => "wa" ; (Third _ _) => "we" ; (First _|Second _) => "wa"  } ;
        Third C1_2 Pl => table {(Third C1a_2a _) => "ba" ; (Third _ _) => "be" ; (First _|Second _) => "ba" } ;
        Third C1a_2a Sg => table {(Third C1a_2a _) => "wa" ; (Third _ _) => "we" ; (First _|Second _) => "wa" } ;
        Third C1a_2a Pl => table {(Third C1a_2a _) => "ba" ; (Third _ _) => "be" ; (First _|Second _) => "ba" } ;
        Third C3_4 Sg => table {(Third C1a_2a _) => "wa" ; (Third _ _) => "we" ; (First _|Second _) => "wa"  } ;
        Third C3_4 Pl => table {(Third C1a_2a _) => "ya" ; (Third _ _) => "ye" ; (First _|Second _) => "ya" } ;
        Third C5_6 Sg => table {(Third C1a_2a _) => "la" ; (Third _ _) => "le" ; (First _|Second _) => "la" } ;
        Third C5_6 Pl => table {(Third C1a_2a _) => "a" ; (Third _ _) => "e" ; (First _|Second _) => "a" } ;
        Third C7_8 Sg => table {(Third C1a_2a _) => "sa" ; (Third _ _) => "se" ; (First _|Second _) => "sa" } ;
        Third C7_8 Pl => table {(Third C1a_2a _) => "ta" ; (Third _ _) => "te" ; (First _|Second _) => "ta" } ;
        Third C9_10 Sg => table {(Third C1a_2a _) => "ya" ; (Third _ _) => "ye" ; (First _|Second _) => "ya" } ;
        Third C9_10 Pl => table {(Third C1a_2a _) => "ta" ; (Third _ _) => "te" ; (First _|Second _) => "ta" } ;
        Third C11_10 Sg => table {(Third C1a_2a _) => "lwa" ; (Third _ _) => "lwe" ; (First _|Second _) => "lwa" } ;
        Third C11_10 Pl => table {(Third C1a_2a _) => "ta" ; (Third _ _) => "te" ; (First _|Second _) => "ta" } ;
        Third C9_6 Sg => table {(Third C1a_2a _) => "ya" ; (Third _ _) => "ye" ; (First _|Second _) => "ya" } ;
        Third C9_6 Pl => table {(Third C1a_2a _) => "a" ; (Third _ _) => "e" ; (First _|Second _) => "a" } ;
        Third C14 _ => table {(Third C1a_2a _) => "ba" ; (Third _ _) => "be" ; (First _|Second _) => "ba" } ;
        Third C15 _ => table {(Third C1a_2a _) => "kwa" ; (Third _ _) => "kwe" ; (First _|Second _) => "kwa" } ;
        Third C17 _ => table {(Third C1a_2a _) => "kwa" ; (Third _ _) => "kwe" ; (First _|Second _) => "kwa" }
      } ;

    poss_concord : ClassGender => Number => Agr => Str =
      table {
        C1_2 => table {
          Sg => table {(Third C1a_2a _) => "wa" ; (Third _ _) => "we" ; (First Sg|Second Sg) => "wa" ; (First Pl|Second Pl) => "we" } ;
          Pl => table {(Third C1a_2a _) => "ba" ; (Third _ _) => "be" ; (First Sg|Second Sg) => "ba" ; (First Pl|Second Pl) => "be" }
        } ;
        C1a_2a => table {
          Sg => table {(Third C1a_2a _) => "wa" ; (Third _ _) => "we" ; (First Sg|Second Sg) => "wa" ; (First Pl|Second Pl) => "we" } ;
          Pl => table {(Third C1a_2a _) => "ba" ; (Third _ _) => "be" ; (First Sg|Second Sg) => "ba" ; (First Pl|Second Pl) => "be" }
        } ;
        C3_4 => table {
          Sg => table {(Third C1a_2a _) => "wa" ; (Third _ _) => "we" ; (First Sg|Second Sg) => "wa" ; (First Pl|Second Pl) => "we" } ;
          Pl => table {(Third C1a_2a _) => "ya" ; (Third _ _) => "ye" ; (First Sg|Second Sg) => "ya" ; (First Pl|Second Pl) => "ye" }
        } ;
        C5_6 => table {
          Sg => table {(Third C1a_2a _) => "la" ; (Third _ _) => "le" ; (First Sg|Second Sg) => "la" ; (First Pl|Second Pl) => "le" } ;
          Pl => table {(Third C1a_2a _) => "a" ; (Third _ _) => "e" ; (First Sg|Second Sg) => "a" ; (First Pl|Second Pl) => "e" }
        } ;
        C7_8 => table {
          Sg => table {(Third C1a_2a _) => "sa" ; (Third _ _) => "se" ; (First Sg|Second Sg) => "sa" ; (First Pl|Second Pl) => "se" } ;
          Pl => table {(Third C1a_2a _) => "ta" ; (Third _ _) => "te" ; (First Sg|Second Sg) => "ta" ; (First Pl|Second Pl) => "te" }
        } ;
        C9_10 => table {
          Sg => table {(Third C1a_2a _) => "ya" ; (Third _ _) => "ye" ; (First Sg|Second Sg) => "ya" ; (First Pl|Second Pl) => "ye" } ;
          Pl => table {(Third C1a_2a _) => "ta" ; (Third _ _) => "te" ; (First Sg|Second Sg) => "ta" ; (First Pl|Second Pl) => "te" }
        } ;
        C11_10 => table {
          Sg => table {(Third C1a_2a _) => "lwa" ; (Third _ _) => "lwe" ; (First Sg|Second Sg) => "lwa" ; (First Pl|Second Pl) => "lwe" } ;
          Pl => table {(Third C1a_2a _) => "ta" ; (Third _ _) => "te" ; (First Sg|Second Sg) => "ta" ; (First Pl|Second Pl) => "te" }
        } ;
        C9_6 => table {
          Sg => table {(Third C1a_2a _) => "ya" ; (Third _ _) => "ye" ; (First Sg|Second Sg) => "ya" ; (First Pl|Second Pl) => "ye" } ;
          Pl => table {(Third C1a_2a _) => "a" ; (Third _ _) => "e" ; (First Sg|Second Sg) => "a" ; (First Pl|Second Pl) => "e" }
        } ;
        C14 => table {
          _ => table {(Third C1a_2a _) => "ba" ; (Third _ _) => "be" ; (First Sg|Second Sg) => "ba" ; (First Pl|Second Pl) => "be" }
        } ;
        C15 => table {
          _ => table {(Third C1a_2a _) => "kwa" ; (Third _ _) => "kwe" ; (First Sg|Second Sg) => "kwa" ; (First Pl|Second Pl) => "kwe" }
        } ;
        C17 => table {
          _ => table {(Third C1a_2a _) => "kwa" ; (Third _ _) => "kwe" ; (First Sg|Second Sg) => "kwa" ; (First Pl|Second Pl) => "kwe" }
        }
      } ;

    poss_concord_c1a : ClassGender => Number => Str =
      table {
        C1_2 => table {
          Sg => "ka" ;
          Pl => "baka"
        } ;
        C1a_2a => table {
          Sg => "ka" ;
          Pl => "baka"
        } ;
        C3_4 => table {
          Sg => "ka" ;
          Pl => "ka"
        } ;
        C5_6 => table {
          Sg => "lika" ;
          Pl => "ka"
        } ;
        C7_8 => table {
          Sg => "sika" ;
          Pl => "tika"
        } ;
        C9_10 => table {
          Sg => "ka" ;
          Pl => "tika"
        } ;
        C11_10 => table {
          Sg => "luka" ;
          Pl => "tika"
        } ;
        C9_6 => table {
          Sg => "ka" ;
          Pl => "ka"
        } ;
        C14 => table {
          _ => "buka"
        } ;
        C15 => table {
          _ => "kuka"
        } ;
        C17 => table {
          _ => "kuka"
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

    exclQuantConc : Agr => Str = table {
      Third C1_2 Sg => "ye" ;
      Third C1_2 Pl => "bo" ;
      Third C1a_2a Sg => "ye" ;
      Third C1a_2a Pl => "bo" ;
      Third C3_4 Sg  => "wo" ;
      Third C3_4 Pl => "yo" ;
      Third C5_6 Sg => "lo" ;
      Third C5_6 Pl => "o" ;
      Third C7_8 Sg => "so" ;
      Third C7_8 Pl => "to" ;
      Third C9_10 Sg => "yo" ;
      Third C9_10 Pl => "to" ;
      Third C11_10 Sg => "lo" ;
      Third C11_10 Pl => "to" ;
      Third C9_6 Sg => "yo" ;
      Third C9_6 Pl => "o" ;
      Third C14 _ => "bo" ;
      Third C15 _ => "ko" ;
      Third C17 _ => "ko" ;
      First Sg => "nge" ;
      First Pl => "so" ;
      Second Sg  => "we" ;
      Second Pl => "no"
    } ;



    -----------------
    -- COPULATIVES --
    -----------------

    pre_cop_pref : VForm -> Agr -> Str = \vform,agr ->
    let
      sc = subjConc vform agr False RC ;
    in
      case vform of {
        VFIndic _ Pos PresTense => sc ;
        VFIndic _ Neg PresTense => "a" ++BIND++ subjConcLookup!agr!SCNeg ++BIND ;
        VFIndic _ _ FutTense => sc ++ (tensePref vform RC SylMult) ++ "ba" ;
        VFIndic _ _ RemFutTense => sc ++ (tensePref vform RC SylMult) ++ "ba" ;
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
          <(Third C9_10 Sg | Third C9_6 Sg),AdjType> => "a" ++BIND++ "y" ++BIND ;
          <(Third C9_10 Sg | Third C9_6 Sg),_> => "a" ++BIND++ subjConcLookup!agr!SCNeg ++BIND ;
          <(Third _ _ | First _ | Second _),_> => "a" ++BIND++ subjConcLookup!agr!SCNeg ++BIND
        } ;
        VFIndic RelCl _ PresTense => (negPrefNge vform False) ;

        VFIndic MainCl Pos (FutTense|RemFutTense) => case agr of {
          -- Third C9_10 Sg | Third C9_6 Sg => sc ++ (tensePref vform RC SylMult) ++ "b" ; -- ++BIND ;
          Third _ _ | First _ | Second _ => sc ++ (tensePref vform RC SylMult) ++ "ba" -- ++BIND
        } ;
        VFIndic RelCl Pos (FutTense|RemFutTense) => case agr of {
          -- Third C9_10 Sg | Third C9_6 Sg => (tensePref vform RC SylMult) ++ "b" ; -- ++BIND ;
          Third _ _ | First _ | Second _ => (tensePref vform RC SylMult) ++ "ba" -- ++BIND
        } ;
        VFIndic MainCl Neg (FutTense|RemFutTense) => case agr of {
          -- Third C9_10 Sg | Third C9_6 Sg => "a" ++BIND++ sc ++ (tensePref vform RC SylMult) ++ "b" ;
          Third _ _ | First _ | Second _ => "a" ++BIND++ sc ++ (tensePref vform RC SylMult) ++ "ba"
        } ;
        VFIndic RelCl Neg (FutTense|RemFutTense) => (negPrefNge vform False) ++ (tensePref vform RC SylMult) ++ "ba" ;

        VFIndic MainCl Pos PastTense => subjConcLookup!agr!SCBe ++BIND ;
        VFIndic MainCl Neg PastTense => subjConcLookup!agr!SCBe ++BIND++ (negPrefNge vform False) ;
        VFIndic RelCl _ PastTense  => (negPrefNge vform False) ;

        VFIndic _ Pos RemPastTense => subjConcLookup!agr!SCRP ++BIND ;
        VFIndic _ Neg RemPastTense => subjConcLookup!agr!SCRP ++BIND++ (negPrefNge vform False) ;
        VFConsec _ => subjConcLookup ! agr ! SCRP ++BIND++ (negPrefNge vform False) ;
        VFSubjunct Pos => case agr of {
          Third C1_2 Sg | Third C1a_2a Sg => "abe" ++BIND ;
          Third _ _ | First _ | Second _ => subjConcLookup!agr!SCBe ++ BIND 
        } ;
        VFSubjunct Neg => case agr of {
          Third C1_2 Sg | Third C1a_2a Sg => "a" ++BIND++ (negPrefNga vform False)++ "bi" ;
          Third _ _ | First _ | Second _ => subjConcLookup!agr!SC ++BIND++ (negPrefNga vform False) ++ "bi"
        }
    } ;

      id_pre_cop_pref : VForm -> Agr -> Str = \vform,agr -> let
        sc = subjConc vform agr False RC
      in case vform of {
        VFIndic MainCl Pos PresTense => sc ;
        VFIndic MainCl Neg PresTense => "a" ++BIND++ sc ; -- "aku" ++BIND ;
        VFIndic RelCl _ PresTense => (negPrefNge vform False) ;

        VFIndic MainCl Pos FutTense => sc ++ TEMP_PREF_FUT++BIND++"ba" ;
        VFIndic MainCl Neg FutTense => "a" ++BIND++ sc ++ TEMP_PREF_FUT_NEG++BIND++"kuba" ;
        VFIndic RelCl Pos FutTense => TEMP_PREF_FUT++BIND++"ba" ;
        VFIndic RelCl Neg FutTense => (negPrefNge vform False) ++ TEMP_PREF_FUT_NEG++BIND++"kuba" ;

        VFIndic MainCl Pos RemFutTense => sc ++ TEMP_PREF_REMFUT++BIND++"ba" ;
        VFIndic MainCl Neg RemFutTense => "a" ++BIND++ sc ++ TEMP_PREF_REMFUT_NEG++BIND++"kuba" ;
        VFIndic RelCl Pos RemFutTense => TEMP_PREF_REMFUT++BIND++"ba" ;
        VFIndic RelCl Neg RemFutTense => (negPrefNge vform False) ++ TEMP_PREF_REMFUT_NEG++BIND++"kuba" ;

        VFIndic MainCl _ PastTense => subjConcLookup!agr!SCBe ++ BIND ++ (negPrefNge vform False) ;
        VFIndic RelCl _ PastTense => (negPrefNge vform False) ;

        VFIndic _ _ RemPastTense => subjConcLookup!agr!SCRP ++BIND++ (negPrefNge vform False) ;
        VFConsec Pos => (subjConc vform agr False RC) ++ "ba" ;
        VFConsec Neg => (subjConc vform agr False RC) ++ (negPrefNga vform False) ++ "bi" ;
        VFSubjunct Pos => (subjConc vform agr False RC) ++ "be" ;
        VFSubjunct Neg => (subjConc vform agr False RC) ++ (negPrefNga vform False) ++ "bi"
      } ;

      assoc_pre_cop_pref : VForm -> Agr -> Str = \vform,agr -> let
        sc = subjConc vform agr False RC
      in case vform of {
        VFIndic MainCl Pos PresTense => sc ;
        VFIndic MainCl Neg PresTense => "a" ++BIND++ sc ;
        VFIndic RelCl _ PresTense => (negPrefNge vform False) ;

        VFIndic MainCl Pos FutTense => sc ++ TEMP_PREF_FUT++BIND++"ba" ;
        VFIndic MainCl Neg FutTense => "a" ++BIND++ sc ++ TEMP_PREF_FUT_NEG++BIND++"kuba" ;
        VFIndic RelCl Pos FutTense => TEMP_PREF_FUT++BIND++"ba" ;
        VFIndic RelCl Neg FutTense => (negPrefNge vform False) ++ TEMP_PREF_FUT_NEG++BIND++"kuba" ;

        VFIndic MainCl Pos RemFutTense => sc ++ TEMP_PREF_REMFUT++BIND++"ba" ;
        VFIndic MainCl Neg RemFutTense => "a" ++BIND++ sc ++ TEMP_PREF_REMFUT_NEG++BIND++"kuba" ;
        VFIndic RelCl Pos RemFutTense => TEMP_PREF_REMFUT++BIND++"ba" ;
        VFIndic RelCl Neg RemFutTense => (negPrefNge vform False) ++ TEMP_PREF_REMFUT_NEG++BIND++"kuba" ;

        VFIndic MainCl _ PastTense => subjConcLookup!agr!SCBe ++BIND++ (negPrefNge vform False) ;
        VFIndic RelCl _ PastTense => (negPrefNge vform False) ;

        VFIndic _ _ RemPastTense => subjConcLookup!agr!SCRP ++BIND++ (negPrefNge vform False) ;
        VFConsec Pos => (subjConc vform agr False RC) ++ "ba" ;
        VFConsec Neg => (subjConc vform agr False RC) ++ (negPrefNga vform False) ++ "bi" ;
        VFSubjunct Pos => (subjConc vform agr False RC) ++ "be" ;
        VFSubjunct Neg => (subjConc vform agr False RC) ++ (negPrefNga vform False) ++ "bi"
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
        Third C1_2 _ => [] ;
        Third C1a_2a _ => [] ;
        Third C3_4 _  => [] ;
        Third C5_6 _ => [] ;
        Third C7_8 _ => [] ;
        Third C9_10 _ => [] ;
        Third C11_10 _ => [] ;
        Third C9_6 _ => [] ;
        Third C14 _ => [] ;
        Third C15 _ => [] ;
        Third C17 _ => [] ;
        First Sg => "yi"++BIND ;
        First Pl => "yi"++BIND ;
        Second Sg  => "ngu"++BIND ;
        Second Pl => "yi"++BIND
      } ;

      assoc_cop_pref : Polarity -> Agr -> Str = \pol,agr -> case pol of {
        Neg => "na"++BIND ;
        Pos => case agr of {
          Third C1_2 Sg => "no" ;
          Third C1_2 Pl => "na" ;
          Third C1a_2a Sg => "no" ;
          Third C1a_2a Pl => "na" ;
          Third C3_4 Sg  => "no" ;
          Third C3_4 Pl => "ne" ;
          Third C5_6 Sg => "ne" ;
          Third C5_6 Pl => "na" ;
          Third C7_8 Sg => "ne" ;
          Third C7_8 Pl => "ne" ;
          Third C9_10 Sg => "ne" ;
          Third C9_10 Pl => "ne" ;
          Third C11_10 Sg => "no" ;
          Third C11_10 Pl => "ne" ;
          Third C9_6 Sg => "ne" ;
          Third C9_6 Pl => "na" ;
          Third C14 _ => "no" ;
          Third C15 _ => "no" ;
          Third C17 _ => "no" ;
          First Sg => "na" ;
          First Pl => "na" ;
          Second Sg  => "na" ;
          Second Pl => "na"
        } ++BIND
      } ;

      eq_cop_pref : Polarity -> Agr -> Str = \pol,agr -> case pol of {
        Neg => eqPref!(Third C1a_2a Sg) ++BIND ;
        Pos => eqPref!agr ++BIND
      } ;

      eq_size_cop_pref : Polarity -> Agr -> Str = \pol,agr -> case pol of {
        Neg => eqSizePref!(Third C1a_2a Sg) ++BIND ;
        Pos => eqSizePref!agr ++BIND
      } ;

      kho_cop : VForm -> Agr -> Str = \vform,agr -> case vform of {
        VFIndic MainCl Neg PresTense => neg_kho_cop_pref agr ++ "kho";
        VFIndic RelCl Neg PresTense => (relConcCop vform agr RC) ++ (ap_cop_pref (VFIndic RelCl Neg PresTense) agr RelType) ++ "kho" ;
        VFIndic RelCl p t => (relConcCop vform agr RC) ++ (ap_cop_pref (VFIndic RelCl p t) agr RelType) ++ "khona" ;
        VFIndic MainCl p t => (ap_cop_pref (VFIndic MainCl p t) agr RelType) ++ "khona" ;
        VFConsec p => (ap_cop_pref (VFIndic MainCl p PastTense) agr RelType) ++ "khona" ;
        VFSubjunct Neg => neg_kho_cop_pref agr ++ "kho" ;
        VFSubjunct Pos => (ap_cop_pref (VFIndic MainCl Pos PresTense) agr RelType) ++ "khona"
      } ;

      neg_kho_cop_pref : Agr -> Str = \agr ->
        "a" ++BIND++
         case agr of {
          Third C1_2 Sg => "ke" ;
          Third C1_2 Pl => "be" ;
          Third C1a_2a Sg => "ke" ;
          Third C1a_2a Pl => "be" ;
          -- Third C3_4 Sg  => "no" ;
          -- Third C3_4 Pl => "ne" ;
          -- Third C5_6 Sg => "ne" ;
          Third C5_6 Pl => "we" ;
          -- Third C7_8 Sg => "ne" ;
          -- Third C7_8 Pl => "ne" ;
          -- Third C9_10 Sg => "ne" ;
          -- Third C9_10 Pl => "ne" ;
          -- Third C11_10 Sg => "no" ;
          -- Third C11_10 Pl => "ne" ;
          -- Third C9_6 Sg => "ne" ;
          -- Third C9_6 Pl => "na" ;
          -- Third C14 _ => "no" ;
          -- Third C15 _ => "no" ;
          -- Third C17 _ => "no" ;
          -- First Sg => "na" ;
          -- First Pl => "na" ;
          -- Second Sg  => "na" ;
          -- Second Pl => "na"
          (First _ | Second _ | Third _ _ ) => subjConcLookup!agr!SCNeg
        } ++BIND ;


    ----------------------------------------
    -- OTHER
    ----------------------------------------

    link_conj : { s: Agr => Str ; fix : Bool } -> Agr -> Str = \conj,agr -> case conj.fix of {
      True => conj.s!agr ++BIND ;
      False => conj.s!agr
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
