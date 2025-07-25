resource ResNso = open Prelude,ParamX in {
    
    param
        ClassGender = C1_2 | C1a_2a | C3_4 | C5_6 | C7_8 | C9_10 | C14_6 | C14 | C15 | C16 | C17 | C18 ; -- | CLocGa | CLocN ;    -- nso noun classes, 23-05-2023
        -- Number = Sg | Pl ;
        Agr = First Number | Second Number | Third ClassGender Number ;
        NPForm = Absolute | Possessive | Locative ; 
        NType = ConcreteN | AbstractN | HumanN | PlaceN ;
        AType = AdjA | EnumA ;

        MoodS = IndicMS | SitMS | SubjunctMS | ConsecMS ;
        TensedCl = IndicCl | RelCl | SitCl ;
        ReducedTensedCl = RedIndicCl | RedSitCl ;
        UntensedCl = SubjunctCl | ConsecCl ;
        -- Polarity = Pos | Neg ;
        BasicTense = PastTense | PresTense | FutTense ;
                
        VForm = VFTensed TensedCl Polarity BasicTense | -- Indicative, situative and relative moods
                VFUntensed UntensedCl Polarity ; -- Subjunctive and consecutive moods
               
        SCForm = SC1 | SC1Alt | SC2 | SC1AltPreKa;
        AForm = AF1 | AF2 ; 

        VPreForm = VPreReg | VPreAlt1 | VPreAlt2 ; -- 1 is for OC 1ps and 2 is for OC C1/1a
        VSufForm = VS_a | VS_e | VS_ile ;
        Syl = SylMono | SylMult ;
        Let = LabB | LabFMP | NotLab ;

        Distance = Dem1 | Dem2 | Dem3 ;

    oper

        ADV_GA : Str = "ga" ; 
        INS_KA : Str = "ka" ;
        ASS_LE : Str = "le" ;



        vowel : pattern Str = #("a"|"e"|"i"|"o"|"u") ;
        cons : pattern Str = #("b"|"c"|"d"|"f"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"š"|"t"|"v"|"w"|"x"|"y"|"z") ;
        labial_fmp : pattern Str = #("p"|"f"|"m" ) ;
        labial_b : pattern Str = #("b") ;

        mkNounWC : Str -> Str -> Str -> Str -> ClassGender -> NType -> {s : Number => NPForm => Str ; c : ClassGender ; nt : NType }
        = \abssg,locsg,abspl,locpl,cg,nt -> {
            s = table {
                Sg => table {
                    Absolute => abssg ;
                    Possessive => abssg ;
                    Locative => locsg
                } ;
                Pl => table {
                    Absolute => abspl ;
                    Possessive => abspl ;
                    Locative => locpl
                }
            } ;
            c = cg ;
            nt = nt
        } ;

        mkNounExplicit : Str -> Str -> Str -> Str -> ClassGender -> {s : Number => NPForm => Str ; c : ClassGender ; nt : NType }
        = \abssg,locsg,abspl,locpl,cg -> let
            ntype = case cg of {
                (C1_2| C1a_2a) => HumanN ;
                (C14_6 | C14) => AbstractN ;
                _ => ConcreteN
            }
        in {
            s = table {
                Sg => table {
                    Absolute => abssg ;
                    Possessive => abssg ;
                    Locative => locsg
                } ;
                Pl => table {
                    Absolute => abspl ;
                    Possessive => abspl ;
                    Locative => locpl
                }
            } ;
            c = cg ;
            nt = ntype
        } ;

        mkNounFull : Str -> Str -> ClassGender -> NType -> {s : Number => NPForm => Str ; c : ClassGender ; nt : NType }
        = \stemsg, stempl, cg, nt -> {
            s = table {
                Sg => table {
                    Absolute => stemsg ;
                    Possessive => stemsg ;
                    Locative => mkLoc nt (stemsg)
                } ;
                Pl => table {
                    Absolute => stempl ;
                    Possessive => stempl ;
                    Locative => mkLoc nt (stempl)
                }
            } ;
            c = cg ;
            nt = nt
        } ; 

        mkNounIrreg : Str -> Str -> ClassGender -> {s : Number => NPForm => Str ; c : ClassGender ; nt : NType }
        = \stemsg, stempl, cg -> let
            ntype = case cg of {
                (C1_2| C1a_2a) => HumanN ;
                (C14_6 | C14) => AbstractN ;
                _ => ConcreteN
            }
            in mkNounFull stemsg stempl cg ntype ;

        mkNounTyped : Str -> ClassGender -> NType -> {s : Number => NPForm => Str ; c : ClassGender ; nt : NType }
        = \root, cg, nt -> {
            s = table {
                Sg => table {
                    Absolute => (mkNPre cg Sg) + root ;
                    Possessive => (mkNPre cg Sg) + root ;
                    Locative => mkLoc nt ((mkNPre cg Sg) + root)
                } ;
                Pl => table {
                    Absolute => (mkNPre cg Pl) + root ;
                    Possessive => (mkNPre cg Pl) + root ;
                    Locative => mkLoc nt ((mkNPre cg Pl) + root)
                }
            } ;
            c = cg ;
            nt = nt
        } ; 

        mkNoun : Str -> ClassGender -> {s : Number => NPForm => Str ; c : ClassGender ; nt : NType }
        = \root, cg -> let
            ntype = case cg of {
                (C1_2| C1a_2a) => HumanN ;
                (C14_6 | C14) => AbstractN ;
                _ => ConcreteN
            }
        in mkNounTyped root cg ntype ;

        mkLocClassNoun : Str -> ClassGender -> { s : Str ; c : ClassGender }
        = \n, lcg -> {
            s = n ;
            c = lcg 
        } ;
            
        mkNPre : ClassGender -> Number -> Str 
        = \cg, num -> case cg of {
                        C1_2 => case num of {Sg => "mo" ;
                                             Pl => "ba" } ;
                        C1a_2a => case num of {Sg => "" ;
                                             Pl => "bo" } ;
                        C3_4 => case num of {Sg => "mo" ;
                                             Pl => "me" } ;                   
                        C5_6 => case num of {Sg => "le" ;
                                             Pl => "ma" } ;
                        C7_8 => case num of {Sg => "se" ;
                                             Pl => "di" } ;
                        C9_10 => case num of {Sg => "" ;
                                             Pl => "di" } ;
                        C14_6 => case num of {Sg => "bo" ;
                                             Pl => "ma" } ;
                        C14 => case num of { _ => "bo" } ;                                                  --Sg and Pl prefixes unified for classes 14-18, 23-05-2023
                        C15 => case num of { _ => "go" } ;
                        C16 => case num of { _ => "fa" } ;
                        C17 => case num of { _ => "go" } ;
                        C18 => case num of { _ => "mo" } 
        } ;  

        mkLoc : NType -> Str -> Str 
        = \nt, root -> case nt of {
                              HumanN | PlaceN => root ;
                              _ => suffixLoc root 
        } ;

        suffixLoc : Str -> Str
        = \root -> case root of {
                x + "a" => x + "eng" ;
                _ => root + "ng"
        } ;

        possConc : ClassGender -> Number -> Str
        = \cg, num -> case cg of {
                        C1_2 => case num of {Sg => "wa" ;
                                             Pl => "ba" } ;
                        C1a_2a => case num of {Sg => "wa" ;
                                             Pl => "ba" } ;
                        C3_4 => case num of {Sg => "wa" ;
                                             Pl => "ya" } ;                   
                        C5_6 => case num of {Sg => "la" ;
                                             Pl => "a" } ;
                        C7_8 => case num of {Sg => "sa" ;
                                             Pl => "tša" } ;
                        C9_10 => case num of {Sg => "ya" ;
                                             Pl => "tša" } ;
                        C14_6 => case num of {Sg => "bja" ;
                                             Pl => "a" } ;
                        C14 => case num of { _ => "bja" } ;                                                  --Sg and Pl possessive concords unified for classes 14-18, 24-05-2023
                        C15 => case num of { _ => "ga" } ;
                        C16 => case num of { _ => "ga" } ;
                        C17 => case num of { _ => "ga" } ;
                        C18 => case num of { _ => "ga" } 
        } ;  

        mkPron : Str -> Str -> Agr -> {s : NPForm => Str ; a : Agr ; empty : Str ; proDrop : Bool }
        = \abs, poss, a -> {s = table { 
                                    Absolute => abs ; 
                                    Possessive => poss ;
                                    Locative => abs
                                } ;
                                a = a ;
                                empty = [] ;
                                proDrop = False
        } ;

        mkVerbExplicit : Str -> Str -> {s : VPreForm => VSufForm => Str ; initLet : Let ; syl : Syl }
        = \root,pastform -> {
                    s = table {
                        VPreReg => table {
                            VS_a => root + "a" ;                            -- sepela
                            VS_e => root + "e" ;                            -- sepele    
                            VS_ile => pastform
                        } ;
                          
                        VPreAlt1 => let 
                            alt_root = vPreAlt1Root root ;
                            alt_pastform = vPreAlt1Root pastform
                        in table {
                            VS_a => alt_root+ "a" ;                --"tshepela" ;
                            VS_e => alt_root + "e" ;               --"tshepele" ;
                            VS_ile => alt_pastform              
                        } ;

                         VPreAlt2 => let 
                            alt_root = vPreAlt2Root root ;
                            alt_pastform = vPreAlt2Root pastform
                        in table {
                            VS_a => alt_root+ "a" ;                --"tshepela" ;
                            VS_e => alt_root + "e" ;               --"tshepele" ;
                            VS_ile => alt_pastform              
                        } 
                    } ;   

                    initLet = case root of {
                        #labial_b + p => LabB ;
                        #labial_fmp + p => LabFMP ;
                        _ => NotLab
                    }   ;

                    syl = case root of {
                        _+#cons+#vowel+#cons+_ => SylMult ; -- bal
                        _+#cons+#vowel+#vowel+_ => SylMult ; -- neel
                        _+#vowel+#cons+#vowel+_ => SylMult ; -- ape
                        _+#cons+#vowel+_ => SylMult ; -- bo
                        _+#vowel+#cons+_ => SylMult ; -- ag
                        _ => SylMono
                    } ;
        } ;

        mkVerbIrregular : Str -> Str -> {s : VPreForm => VSufForm => Str ; initLet : Let ; syl : Syl }
        = \presform,pastform -> {
                    s = table {
                        VPreReg => table {
                            VS_a => presform ;                            -- re
                            VS_e => presform ;                            -- re    
                            VS_ile => pastform
                        } ;
                          
                        VPreAlt1 => let 
                            alt_presform = vPreAlt1Root presform ;
                            alt_pastform = vPreAlt1Root pastform
                        in table {
                            VS_a => alt_presform ;                -- the
                            VS_e => alt_presform ;                -- the 
                            VS_ile => alt_pastform              
                        } ;

                        VPreAlt2 => let 
                            alt_presform = vPreAlt2Root presform ;
                            alt_pastform = vPreAlt2Root pastform
                        in table {
                            VS_a => alt_presform ;                -- the
                            VS_e => alt_presform ;                -- the 
                            VS_ile => alt_pastform              
                        } 
                    } ;   

                    initLet = case presform of {
                        #labial_b + p => LabB ;
                        #labial_fmp + p => LabFMP ;
                        _ => NotLab
                    }   ;

                    syl = case presform of {
                        _+#cons+#vowel+#cons+_ => SylMult ; -- bal
                        _+#cons+#vowel+#vowel+_ => SylMult ; -- neel
                        _+#vowel+#cons+#vowel+_ => SylMult ; -- ape
                        _+#cons+#vowel+_ => SylMult ; -- bo
                        _+#vowel+#cons+_ => SylMult ; -- ag
                        _ => SylMono
                    } ;
        } ;
        
        mkVerb : Str -> {s : VPreForm => VSufForm => Str ; initLet : Let ; syl : Syl }
        = \root -> {s = table {
                        VPreReg => table {
                            VS_a => root + "a" ;                            -- sepela
                            VS_e => root + "e" ;                            -- sepele    
                            VS_ile => case root of {  
                                "ngwal" => "ngwadile" ;  
                                "lwal" => "lwadile" ; 
                                "gom" => "gomile" ;  
                                "bolay" => "bolaile" ;
                                "y" => "ile" ;                              -- sepetše
                                p + "n" => p + "ne" ;
                                p + "m" => p + "me" ;
                                p + "ar" => p + "ere" ;
                                p + "al" => p + "etše" ;
                                p + "el" => p + "etše" ;
                                p + "ul" => p + "utše" ;
                                p + "ol" => p + "otše" ;
                                p + "tš" => p + "ditše" ;
                                p + "š" => p + "šitše" ;
                                p + "ny" => p + "tše" ;
                                p + "al" => p + "adile" ;
                                p => p + "ile" } 
                        } ;
                          
                        VPreAlt1 => let 
                            alt_root = vPreAlt1Root root
                        in table {
                            VS_a => alt_root+ "a" ;                --"tshepela" ;
                            VS_e => alt_root + "e" ;               --"tshepele" ;
                            VS_ile => case alt_root of {            --"tshepetše"
                                p + "n" => p + "ne" ;
                                p + "m" => p + "me" ;
                                p + "ar" => p + "ere" ;
                                p + "al" => p + "etše" ;
                                p + "el" => p + "etše" ;
                                p + "ul" => p + "utše" ;
                                p + "ol" => p + "otše" ;
                                p + "tš" => p + "ditše" ;
                                p + "š" => p + "šitše" ;
                                p + "ny" => p + "tše" ;
                                p + "al" => p + "adile" ;
                                -- monosyllabic verb root : a -> ele
                                p => p + "ile" }               
                        } ;

                        VPreAlt2 => let 
                            alt_root = vPreAlt2Root root
                        in table {
                            VS_a => alt_root+ "a" ;                --"tshepela" ;
                            VS_e => alt_root + "e" ;               --"tshepele" ;
                            VS_ile => case alt_root of {            --"tshepetše"
                                p + "n" => p + "ne" ;
                                p + "m" => p + "me" ;
                                p + "ar" => p + "ere" ;
                                p + "al" => p + "etše" ;
                                p + "el" => p + "etše" ;
                                p + "ul" => p + "utše" ;
                                p + "ol" => p + "otše" ;
                                p + "tš" => p + "ditše" ;
                                p + "š" => p + "šitše" ;
                                p + "ny" => p + "tše" ;
                                p + "al" => p + "adile" ;
                                -- monosyllabic verb root : a -> ele
                                p => p + "ile" }               
                        } 
                    } ;   

                    initLet = case root of {
                        #labial_b + p => LabB ;
                        #labial_fmp + p => LabFMP ;
                        _ => NotLab
                    }   ;

                    syl = case root of {
                        _+#cons+#vowel+#cons+_ => SylMult ; -- bal
                        _+#cons+#vowel+#vowel+_ => SylMult ; -- neel
                        _+#vowel+#cons+#vowel+_ => SylMult ; -- ape
                        _+#cons+#vowel+_ => SylMult ; -- bo
                        _+#vowel+#cons+_ => SylMult ; -- ag
                        _ => SylMono
                    } ;
        } ;

        vPreAlt1Root : Str -> Str 
        = \root -> case root of {
            "a" + p => "ka" + p ;
            "e" + p => "ke" + p ;
            "i" + p => "ki" + p ;
            "o" + p => "ko" + p ;
            "u" + p => "ku" + p ;
            "bj" + p => "pš" + p ;
            "b" + p => "p" + p ; -- bitš -> pitš
            "d" + p => "t" + p ;
            "f" + p => "ph" + p ;
            "fs" + p => "psh" + p ;
            "g" + p => "kg" + p ;
            "hl" + p => "tlh" + p ;
            "h" + p => "kh" + p ;
            "j" + p => "tš" + p ;
            "l" + p => "t" + p ;
            "r" + p => "th" + p ;
            "s" + p => "tsh" + p ;
            "š" + p => "tšh" + p ;
            "w" + p => "kw" + p ;
            "y" + p => "k" + p ;
            _ => root
        } ;


        vPreAlt2Root : Str -> Str 
        = \root -> case root of {
            "b" + p => "m" + p ;-- bitš -> mitš
            _ => root
        } ;

        subjConcLookup : Agr => SCForm => Str 
        = table{
            First Sg =>  table {SC1 => "ke" ;  SC1Alt => "ke" ; SC2 => "ka" ; SC1AltPreKa => "n"++BIND} ;
            Second Sg =>  table {SC1 => "o" ;  SC1Alt => "o" ; SC2 => "wa" ; SC1AltPreKa => "o"} ;
            First Pl =>  table {SC1 => "re" ;  SC1Alt => "re" ; SC2 => "ra" ; SC1AltPreKa => "re"} ;
            Second Pl =>  table {SC1 => "le" ;  SC1Alt => "le" ; SC2 => "la" ; SC1AltPreKa => "le"} ;
            Third C1_2 Sg => table{SC1 => "o" ;  SC1Alt => "a" ; SC2 => "a" ; SC1AltPreKa => "a"} ;
            Third C1_2 Pl => table{SC1 => "ba" ;  SC1Alt => "ba" ; SC2 => "ba" ; SC1AltPreKa => "ba"} ;
            Third C1a_2a Sg => table{SC1 => "o" ;  SC1Alt => "a" ; SC2 => "a" ; SC1AltPreKa => "a"} ;
            Third C1a_2a Pl => table{SC1 => "ba" ;  SC1Alt => "ba" ; SC2 => "ba" ; SC1AltPreKa => "ba"} ;
            Third C3_4 Sg => table{SC1 => "o" ;  SC1Alt => "o" ; SC2 => "wa" ; SC1AltPreKa => "o"} ;
            Third C3_4 Pl => table{SC1 => "e" ;  SC1Alt => "e" ; SC2 => "ya" ; SC1AltPreKa => "e"} ;
            Third C5_6 Sg => table{SC1 => "le" ;  SC1Alt => "le" ; SC2 => "la" ; SC1AltPreKa => "le"} ;
            Third C5_6 Pl => table{SC1 => "a" ;  SC1Alt => "a" ; SC2 => "a" ; SC1AltPreKa => "a"} ;
            Third C7_8 Sg => table{SC1 => "se" ;  SC1Alt => "se" ; SC2 => "sa" ; SC1AltPreKa => "se"} ;
            Third C7_8 Pl => table{SC1 => "di" ;  SC1Alt => "di" ; SC2 => "tša" ; SC1AltPreKa => "di"} ; 
            Third C9_10 Sg => table{SC1 => "e" ;  SC1Alt => "e" ; SC2 => "ya" ; SC1AltPreKa => "e"} ;
            Third C9_10 Pl => table{SC1 => "di" ;  SC1Alt => "di" ; SC2 => "tša" ; SC1AltPreKa => "di"} ;
            Third C14_6 Sg => table{SC1 => "bo" ;  SC1Alt => "bo" ; SC2 => "bja" ; SC1AltPreKa => "bo"} ;
            Third C14_6 Pl => table{SC1 => "a" ;  SC1Alt => "a" ; SC2 => "a" ; SC1AltPreKa => "a"} ;
            Third C14 _ => table{SC1 => "bo" ;  SC1Alt => "bo" ; SC2 => "bja" ; SC1AltPreKa => "bo"} ;
            Third C15 _ => table{SC1 => "go" ;  SC1Alt => "go" ; SC2 => "gwa" ; SC1AltPreKa => "go"} ;
            Third C16 _ => table{SC1 => "go" ;  SC1Alt => "go" ; SC2 => "gwa" ; SC1AltPreKa => "go"} ;
            Third C17 _ => table{SC1 => "go" ;  SC1Alt => "go" ; SC2 => "gwa" ; SC1AltPreKa => "go"} ; 
            Third C18 _ => table{SC1 => "go" ;  SC1Alt => "go" ; SC2 => "gwa" ; SC1AltPreKa => "go"} 
        } ;

        subjConc : VForm -> Agr ->  Str = \vform,agr ->
            case vform of {
                VFTensed IndicCl Pos _ => subjConcLookup ! agr ! SC1 ; 
                VFTensed IndicCl Neg PresTense => subjConcLookup ! agr ! SC1Alt ;
                VFTensed IndicCl Neg PastTense => subjConcLookup ! agr ! SC2 ;
                VFTensed IndicCl Neg FutTense => subjConcLookup ! agr ! SC1AltPreKa ;
                VFTensed RelCl Neg FutTense => subjConcLookup ! agr ! SC1AltPreKa ;
                VFTensed RelCl _ _ => subjConcLookup ! agr ! SC1Alt ; 
                VFTensed SitCl Neg FutTense => subjConcLookup ! agr ! SC1AltPreKa ; 
                VFTensed SitCl _ _  => subjConcLookup ! agr ! SC1Alt ;
                VFUntensed SubjunctCl _ => subjConcLookup ! agr ! SC1Alt ;
                VFUntensed ConsecCl _ => subjConcLookup ! agr ! SC2 
        } ;

         objConcLookup : Agr => Str 
        = table {
            First Sg =>  "n"++BIND ;
            Second Sg =>  "go" ;
            First Pl =>  "re" ;
            Second Pl =>  "le" ;
            Third C1_2 Sg => "mo" ;
            Third C1_2 Pl => "ba";
            Third C1a_2a Sg => "mo" ;
            Third C1a_2a Pl => "ba";
            Third C3_4 Sg => "o" ;
            Third C3_4 Pl => "e" ;
            Third C5_6 Sg => "le" ;
            Third C5_6 Pl => "a";
            Third C7_8 Sg => "se" ;
            Third C7_8 Pl => "di" ;
            Third C9_10 Sg => "e" ;
            Third C9_10 Pl => "di" ;
            Third C14_6 Sg => "bo" ;
            Third C14_6 Pl => "a";
            Third C14 _ => "bo";
            Third C15 _ => "go" ;
            Third C16 _ => "go" ;
            Third C17 _ => "go" ;
            Third C18 _ =>  "go" 
        } ;

        objConc : Let -> Agr -> Str = \Let,a -> case a of {
            First Sg => case Let of {
                LabB => "m"++BIND ;
                LabFMP => "m"++BIND ;
                NotLab => "n"++BIND
            } ;
            Third C1_2 Sg => case Let of {
                LabB => "m"++BIND ;
                _ => objConcLookup!a
            } ;
            _ => objConcLookup!a
        } ;

        vStemForm : { s : VPreForm => VSufForm => Str ; initLet : Let ; syl : Syl} -> Polarity -> BasicTense -> Str = \v,p,t ->
        case <p,t> of {
                <Pos, PresTense> => v.s!VPreReg!VS_a ;
                <Pos, PastTense> => v.s!VPreReg!VS_ile ;
                <Pos, FutTense> => v.s!VPreReg!VS_a ;
                <Neg, PresTense> => v.s!VPreReg!VS_e ;
                <Neg, PastTense> => v.s!VPreReg!VS_a ;
                <Neg, FutTense> => v.s!VPreReg!VS_e 
        } ;

        vsStemForm : { s : VPreForm => VSufForm => Str ; initLet : Let ; syl : Syl ; mood :MoodS }  -> Polarity -> BasicTense -> Str = \v,p,t ->
        case <p,t> of {
                <Pos, PresTense> => v.s!VPreReg!VS_a ;
                <Pos, PastTense> => v.s!VPreReg!VS_ile ;
                <Pos, FutTense> => v.s!VPreReg!VS_a ;
                <Neg, PresTense> => v.s!VPreReg!VS_e ;
                <Neg, PastTense> => v.s!VPreReg!VS_a ;
                <Neg, FutTense> => v.s!VPreReg!VS_e 
        } ;

        v2StemForm : { s : VPreForm => VSufForm => Str ; initLet : Let ; syl : Syl} -> Polarity -> BasicTense -> Agr -> Bool -> Str = \v,p,t,a,pd ->
        case <a,p,t,pd> of {
                <First Sg, Pos, PresTense, True> => v.s!VPreAlt1!VS_a ;
                <First Sg, Pos, PastTense, True> => v.s!VPreAlt1!VS_ile ;
                <First Sg, Pos, FutTense, True> => v.s!VPreAlt1!VS_a ;
                <First Sg, Neg, PresTense, True> => v.s!VPreAlt1!VS_e ;
                <First Sg, Neg, PastTense, True> => v.s!VPreAlt1!VS_a ;
                <First Sg, Neg, FutTense, True> => v.s!VPreAlt1!VS_e ;

                <Third C1_2 Sg, Pos, PresTense, True> => v.s!VPreAlt2!VS_a ;
                <Third C1_2 Sg, Pos, PastTense, True> => v.s!VPreAlt2!VS_ile ;
                <Third C1_2 Sg, Pos, FutTense, True> => v.s!VPreAlt2!VS_a ;
                <Third C1_2 Sg, Neg, PresTense, True> => v.s!VPreAlt2!VS_e ;
                <Third C1_2 Sg, Neg, PastTense, True> => v.s!VPreAlt2!VS_a ;
                <Third C1_2 Sg, Neg, FutTense, True> => v.s!VPreAlt2!VS_e ;

                <_, Pos, PresTense, _> => v.s!VPreReg!VS_a ;
                <_, Pos, PastTense, _> => v.s!VPreReg!VS_ile ;
                <_, Pos, FutTense, _> => v.s!VPreReg!VS_a ;
                <_, Neg, PresTense, _> => v.s!VPreReg!VS_e ;
                <_, Neg, PastTense, _> => v.s!VPreReg!VS_a ;
                <_, Neg, FutTense, _> => v.s!VPreReg!VS_e 
        } ;

        v2StemFormImp : { s : VPreForm => VSufForm => Str ; initLet : Let ; syl : Syl} -> Polarity -> Agr -> Bool -> Str = \v,p,a,pd ->
        case <a,p,pd> of {
                <First Sg, Pos, True> => v.s!VPreAlt1!VS_a ;
                <First Sg, Neg, True> => v.s!VPreAlt1!VS_e ;

                <Third C1_2 Sg, Pos, True> => v.s!VPreAlt2!VS_a ;
                <Third C1_2 Sg, Neg, True> => v.s!VPreAlt2!VS_e ;
                
                <_, Pos, _> => v.s!VPreReg!VS_a ;
                <_, Neg, _> => v.s!VPreReg!VS_e 
        } ;

        dem_pron : Distance => Agr => Str = table {
        Dem1 => table {
            First Sg => "yo" ;  
            First Pl => "ba" ;
            Second Sg => "yo" ;
            Second Pl => "ba" ;
            Third C1_2 Sg => "yo" ;
            Third C1_2 Pl => "ba" ;
            Third C1a_2a Sg => "yo" ;
            Third C1a_2a Pl => "ba" ;
            Third C3_4 Sg => "wo" ;
            Third C3_4 Pl => "ye" ;
            Third C5_6 Sg => "le" ;
            Third C5_6 Pl => "a" ;
            Third C7_8 Sg => "se" ;
            Third C7_8 Pl => "tše" ;
            Third C9_10 Sg => "ye" ;
            Third C9_10 Pl => "tše" ;
            Third C14_6 Sg => "bjo" ;
            Third C14_6 Pl => "a" ;
            Third C14 _ => "bjo" ;
            Third C15 _ => "mo" ;
            Third C16 _ => "fa" ;
            Third C17 _ => "mo" ;
            Third C18 _ => "mo" 
        } ;

        Dem2 => table {
            First Sg => "yoo" ;
            First Pl => "bao" ;
            Second Sg => "yoo" ;
            Second Pl => "bao" ;
            Third C1_2 Sg => "yoo" ;
            Third C1_2 Pl => "bao" ;
            Third C1a_2a Sg => "yoo" ;
            Third C1a_2a Pl => "bao" ;
            Third C3_4 Sg => "woo" ;
            Third C3_4 Pl => "yeo" ;
            Third C5_6 Sg => "leo" ;
            Third C5_6 Pl => "ao" ;
            Third C7_8 Sg => "seo" ;
            Third C7_8 Pl => "tšeo" ;
            Third C9_10 Sg => "yeo" ;
            Third C9_10 Pl => "tšeo" ;
            Third C14_6 Sg => "bjoo" ;
            Third C14_6 Pl => "ao" ;
            Third C14 _ => "bjoo" ;
            Third C15 _ => "moo" ;
            Third C16 _ => "fao" ;
            Third C17 _ => "moo" ;
            Third C18 _ => "moo" 
        } ;

        Dem3 => table {
            First Sg => "yola" ;
            First Pl => "bale" ;
            Second Sg => "yola" ;
            Second Pl => "bale" ;
            Third C1_2 Sg => "yola" ;
            Third C1_2 Pl => "bale" ;
            Third C1a_2a Sg => "yola" ;
            Third C1a_2a Pl => "bale" ;
            Third C3_4 Sg => "wola" ;
            Third C3_4 Pl => "yela" ;
            Third C5_6 Sg => "lela" ;
            Third C5_6 Pl => "ale" ;
            Third C7_8 Sg => "sela" ;
            Third C7_8 Pl => "tšela" ;
            Third C9_10 Sg => "yela" ;
            Third C9_10 Pl => "tšela" ;
            Third C14_6 Sg => "bjola" ;
            Third C14_6 Pl => "ale" ;
            Third C14 _ => "bjola" ;
            Third C15 _ => "mola" ;
            Third C16 _ => "fale" ;
            Third C17 _ => "mola" ;
            Third C18 _ => "mola" 
        }
        } ;

        all_quantpron : Agr => Str = table {
            First Sg => "yohle" ;
            First Pl => "bohle" ;
            Second Sg => "yohle" ;
            Second Pl => "bohle" ;
            Third C1_2 Sg => "yohle" ;
            Third C1_2 Pl => "bohle" ;
            Third C1a_2a Sg => "yohle" ;
            Third C1a_2a Pl => "bohle" ;
            Third C3_4 Sg => "wohle" ;
            Third C3_4 Pl => "yohle" ;
            Third C5_6 Sg => "lohle" ;
            Third C5_6 Pl => "ohle" ;
            Third C7_8 Sg => "sohle" ;
            Third C7_8 Pl => "tšohle" ;
            Third C9_10 Sg => "yohle" ;
            Third C9_10 Pl => "tšohle" ;
            Third C14_6 Sg => "bjohle" ;
            Third C14_6 Pl => "ohle" ;
            Third C14 _ => "bjohle" ;
            Third C15 _ => "gohle" ;
            Third C16 _ => "gohle" ;
            Third C17 _ => "gohle" ;
            Third C18 _ => "gohle" 
        } ;

        abs_pron : Agr => Str = table {
            First Sg => "nna" ;
            First Pl => "rena" ;
            Second Sg => "wena" ;
            Second Pl => "lena" ;
            Third C1_2 Sg => "yena" ;
            Third C1_2 Pl => "bona" ;
            Third C1a_2a Sg => "yena" ;
            Third C1a_2a Pl => "bona" ;
            Third C3_4 Sg => "wona" ;
            Third C3_4 Pl => "yona" ;
            Third C5_6 Sg => "lona" ;
            Third C5_6 Pl => "ona" ;
            Third C7_8 Sg => "sona" ;
            Third C7_8 Pl => "tšona" ;
            Third C9_10 Sg => "yona" ;
            Third C9_10 Pl => "tšona" ;
            Third C14_6 Sg => "bjona" ;
            Third C14_6 Pl => "ona" ;
            Third C14 _ => "bjona" ;
            Third C15 _ => "gona" ;
            Third C16 _ => "gona" ;
            Third C17 _ => "gona" ;
            Third C18 _ => "gona" 
        } ;

        poss_pron : Agr => Str = table {
            First Sg => "ka" ;
            First Pl => "gešo" ;
            Second Sg => "gago" ;
            Second Pl => "geno" ;
            Third C1_2 Sg => "gagwe" ;
            Third C1_2 Pl => "gabo" ;
            Third C1a_2a Sg => "gagwe" ;
            Third C1a_2a Pl => "gabo" ;
            Third C3_4 Sg => "wona" ;
            Third C3_4 Pl => "yona" ;
            Third C5_6 Sg => "lona" ;
            Third C5_6 Pl => "ona" ;
            Third C7_8 Sg => "sona" ;
            Third C7_8 Pl => "tšona" ;
            Third C9_10 Sg => "yona" ;
            Third C9_10 Pl => "tšona" ;
            Third C14_6 Sg => "bjona" ;
            Third C14_6 Pl => "ona" ;
            Third C14 _ => "bjona" ;
            Third C15 _ => "gona" ;
            Third C16 _ => "gona" ;
            Third C17 _ => "gona" ;
            Third C18 _ => "gona" 
        } ;

        pre1 : TensedCl -> Polarity -> BasicTense -> Str =\c,p,t ->
        case <c,p,t> of {
            <_, Pos, _> => [] ;
            <IndicCl, Neg, PresTense> => "ga" ;
            <IndicCl, Neg, PastTense> => "ga" ++ "se" ;
            <_, _, _> => []
        } ;
        
        pre2 : TensedCl -> Polarity -> BasicTense -> Bool -> Str =\c,p,t,l->
        case <c,p,t,l> of {
            <IndicCl, Pos, PresTense, True> => "a" ;
            <IndicCl, Pos, PresTense, False> => [] ;
            <IndicCl, Neg, PresTense, _> => [] ;
            <IndicCl, Pos, PastTense, _> => [] ;
            <IndicCl, Neg, PastTense, _> => [] ;
            <IndicCl, Pos, FutTense, _> => "tlo" ;
            <IndicCl, Neg, FutTense, _> => "ka" ++ "se" ;

            <SitCl, Pos, PresTense, _> => [] ;
            <SitCl, Neg, PresTense, _> => "sa" ;
            <SitCl, Pos, PastTense, _> => [] ;
            <SitCl, Neg, PastTense, _> => "sa" ;
            <SitCl, Pos, FutTense, _> => "tlo" ;
            <SitCl, Neg, FutTense, _> => "ka" ++ "se" ;

            <RelCl, Pos, PresTense, _> => [] ;
            <RelCl, Neg, PresTense, _> => "sa" ;
            <RelCl, Pos, PastTense, _> => [] ;
            <RelCl, Neg, PastTense, _> => "sa" ;
            <RelCl, Pos, FutTense, _> => "tlo" ;
            <RelCl, Neg, FutTense, _> => "ka" ++ "se" 
        } ;

        regAdj : Str -> { s : AForm => Str ; at : AType } = \a -> {
            s = table {
                AF1 => a ;
                AF2 => strengthen_root a 
                } ;
            at = AdjA
        } ;

        enum : Str -> { s : AForm => Str ; at : AType } = \a -> {
            s = table {
                AF1 => a ;
                AF2 => strengthen_root a 
                } ;
            at = EnumA
        } ;

        strengthen_root : Str -> Str = \r -> 
        case r of {
            "bjalo" => "bjalo";
            "bjang" => "bjang" ; 
            "botse" => "botse" ;
            "bose" => "bose" ;
            "ntši" => "ntši" ;
            "so" => "ntsho" ;
            "be" => "mpe" ;
            "fsa" => "mpsha" ;
            "n"+x => "nn"+x ;
            "b"+x => "p"+x ;
            "fs"+x => "psh"+x ;
            "r"+x => "th"+x ;
            "s"+x => "tsh"+x ;
            "š"+x => "tšh"+x ;
            "hl"+x => "tlh"+x ;
            "h"+x => "kh"+x ;
            "g"+x => "kg"+x ;
            _ => r
        } ;

        ident_cop : VForm -> Agr -> Str = \vform,a ->
            case vform of {
            VFTensed IndicCl Pos PresTense => case a of{
                Third _ _ => "ke" ;
                _ => subjConcLookup!a!SC1                 
            } ;
            VFTensed IndicCl Neg PresTense => case a of {
                Third _ _ => "ga" ++ "se" ;
                _ => "ga" ++ subjConcLookup!a!SC1Alt 
            } ;
            VFTensed IndicCl Pos PastTense => case a of {
                Third _ _ => "e" ++ "be" ++ "e" ++"le" ;
                _ => subjConcLookup!a!SC1 ++ "be" ++ subjConcLookup!a!SC1 ++"le"
            } ;
            VFTensed IndicCl Neg PastTense => case a of{
                Third _ _ => "e" ++ "be" ++ "e" ++"se" ;
                _ => subjConcLookup!a!SC1 ++ "be" ++ subjConcLookup!a!SC1Alt ++"se" 
            } ;
            VFTensed IndicCl Pos FutTense => case a of {
                Third _ _ => "e" ++ "tlo" ++ "ba" ;
                _ => subjConcLookup!a!SC1 ++ "tlo" ++ "ba" 
            } ;
             VFTensed IndicCl Neg FutTense => case a of {
                Third _ _ => "e" ++ "ka" ++ "se" ++ "be" ;
                _ => subjConcLookup!a!SC1AltPreKa ++ "ka" ++ "se" ++ "be" 
            } ;
            VFTensed RelCl Pos PresTense => case a of {
                Third _ _ =>  "e" ++"lego" ;
                _ => subjConcLookup!a!SC1  ++ "lego"
            } ;
            VFTensed RelCl Neg PresTense => case a of {
                Third _ _ => "e" ++ "sego" ;
                _ => subjConcLookup!a!SC1Alt ++ "sego"
            } ;
            VFTensed RelCl Pos PastTense =>case a of {
                Third _ _ => "e" ++ "bego" ++ "e" ++ "le" ;
                _ => subjConcLookup!a!SC1 ++ "bego" ++ subjConcLookup!a!SC1 ++ "le"
            } ;
            VFTensed RelCl Neg PastTense => case a of {
                Third _ _ => "e" ++ "bego" ++ "e" ++ "se" ;
                _ => subjConcLookup!a!SC1 ++ "bego" ++ subjConcLookup!a!SC1Alt ++ "se" 
            } ; 
            VFTensed RelCl Pos FutTense => case a of {
                Third _ _ => "e" ++ "tlo" ++ "bago" ;
                _ => subjConcLookup!a!SC1 ++"tlo" ++ "bago"
            } ;
            VFTensed RelCl Neg FutTense => case a of {
                Third _ _ => "e" ++ "ka" ++ "se" ++ "bego" ;
                _ => subjConcLookup!a!SC1AltPreKa ++ "ka" ++ "se" ++ "bego" 
            } ;
            VFTensed SitCl Pos PresTense => case a of {
                Third _ _ =>  "e" ++ "le" ;
                _ => subjConcLookup!a!SC1  ++ "le"
            } ;
            VFTensed SitCl Neg PresTense => case a of {
                Third _ _ => "e" ++ "se" ;
                _ => subjConcLookup!a!SC1Alt ++ "se"
            } ;
            VFTensed SitCl Pos PastTense =>case a of {
                Third _ _ => "e" ++ "be" ++ "e" ++ "le" ;
                _ => subjConcLookup!a!SC1 ++ "be" ++ subjConcLookup!a!SC1 ++ "le"
            } ;
            VFTensed SitCl Neg PastTense => case a of {
                Third _ _ => "e" ++ "be" ++ "e" ++ "se" ;
                _ => subjConcLookup!a!SC1 ++ "be" ++ subjConcLookup!a!SC1Alt ++ "se" 
            } ; 
            VFTensed SitCl Pos FutTense => case a of {
                Third _ _ => "e" ++ "tlo" ++ "ba" ;
                _ => subjConcLookup!a!SC1 ++"tlo" ++ "ba"
            } ;
            VFTensed SitCl Neg FutTense => case a of {
                Third _ _ => "e" ++ "ka" ++ "se" ++ "be" ;
                _ => subjConcLookup!a!SC1AltPreKa ++ "ka" ++ "se" ++ "be" 
            } ;
            VFUntensed SubjunctCl Pos => case a of {
                Third _ _  =>  "e" ++ "be" ;
                _ => subjConcLookup!a!SC1  ++ "be"
            } ;
            VFUntensed SubjunctCl Neg => case a of {
                Third _ _ =>  "e" ++ "se" ++ "be" ;
                _ => subjConcLookup!a!SC1  ++ "se" ++ "be"
            } ;
            VFUntensed ConsecCl Pos => case a of {
                Third _ _  =>  "ya" ++ "ba" ;
                _ => subjConcLookup!a!SC2  ++ "ba"
            } ;
            VFUntensed ConsecCl Neg => case a of { -- pattern 1 in P&L p. 303
                Third _ _ =>  "ya" ++ "se" ++ "be" ;
                _ => subjConcLookup!a!SC2  ++ "se" ++ "be"
            }
        } ;

        compl_ap : {s : AForm => Str; at : AType } -> Agr -> Str = \ap,a ->
        case <ap.at,a> of {
            <AdjA, First Sg> => "yo" ++ "mo" ++BIND ++ ap.s!AF1 ; 
            <AdjA,First Pl> => "ba" ++ "ba" ++BIND ++ ap.s!AF1 ;
            <AdjA,Second Sg> => "yo" ++ "mo" ++BIND ++ ap.s!AF1 ;
            <AdjA,Second Pl> => "ba" ++ "ba" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C1_2 Sg> => "yo" ++ "mo" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C1_2 Pl> => "ba" ++ "ba" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C1a_2a Sg> => "yo" ++ "mo" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C1a_2a Pl> =>"ba" ++ "ba" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C3_4 Sg> => "wo" ++ "mo" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C3_4 Pl> => "ye" ++ "me" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C5_6 Sg> => "le" ++ "le" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C5_6 Pl> => "a" ++ "ma" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C7_8 Sg> => "se" ++ "se" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C7_8 Pl> => "tše" ++ ap.s!AF2 ;
            <AdjA,Third C9_10 Sg> => "ye" ++ ap.s!AF2 ;
            <AdjA,Third C9_10 Pl> => "tše" ++ ap.s!AF2 ;
            <AdjA,Third C14_6 Sg> => "bjo" ++ "bo" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C14_6 Pl> => "a" ++ "ma" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C14 _> => "bjo" ++ "bo" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C15 _> => "mo" ++ "go" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C16 _> => "mo" ++ "go" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C17 _> => "mo" ++ "go" ++BIND ++ ap.s!AF1 ;
            <AdjA,Third C18 _> => "mo" ++ "go" ++BIND ++ ap.s!AF1 ;

            <EnumA,First Sg> => "yo" ++ ap.s!AF1 ;
            <EnumA,First Pl> => "ba" ++ ap.s!AF1 ;
            <EnumA,Second Sg> => "yo" ++ ap.s!AF1 ;
            <EnumA,Second Pl> => "ba" ++ ap.s!AF1 ;
            <EnumA,Third C1_2 Sg> => "yo" ++ ap.s!AF1 ;
            <EnumA,Third C1_2 Pl> => "ba" ++ ap.s!AF1 ;
            <EnumA,Third C1a_2a Sg> => "yo" ++ ap.s!AF1 ;
            <EnumA,Third C1a_2a Pl> =>"ba" ++ ap.s!AF1 ;
            <EnumA,Third C3_4 Sg> => "wo" ++ ap.s!AF1 ;
            <EnumA,Third C3_4 Pl> => "ye" ++ ap.s!AF1 ;
            <EnumA,Third C5_6 Sg> => "le" ++ ap.s!AF1 ;
            <EnumA,Third C5_6 Pl> => "a" ++ ap.s!AF1 ;
            <EnumA,Third C7_8 Sg> => "se" ++ ap.s!AF1 ;
            <EnumA,Third C7_8 Pl> => "tše" ++ ap.s!AF1 ;
            <EnumA,Third C9_10 Sg> => "ye" ++ ap.s!AF1 ;
            <EnumA,Third C9_10 Pl> => "tše" ++ ap.s!AF1 ;
            <EnumA,Third C14_6 Sg> => "bjo" ++ ap.s!AF1 ;
            <EnumA,Third C14_6 Pl> => "a" ++ ap.s!AF1 ;
            <EnumA,Third C14 _> => "bjo" ++ ap.s!AF1 ;
            <EnumA,Third C15 _> => "mo" ++ ap.s!AF1 ;
            <EnumA,Third C16 _> => "mo" ++ ap.s!AF1 ;
            <EnumA,Third C17 _> => "mo" ++ ap.s!AF1 ;
            <EnumA,Third C18 _> => "mo" ++ ap.s!AF1

        } ;

        descr_cop : VForm -> Agr -> Str = \vform,a -> let
            sc = subjConcLookup!a!SC1 ;
            sca = subjConcLookup!a!SC1Alt ;
            sck = subjConcLookup!a!SC1AltPreKa ;
            sc2 = subjConcLookup!a!SC2 ;
            in
                case vform of {
                    VFTensed IndicCl Pos PresTense => sc ;
                    VFTensed IndicCl Neg PresTense => "ga" ++ sca ;
                    VFTensed IndicCl Pos PastTense => sc ++ "be" ++ sca ++ "le" ;
                    VFTensed IndicCl Neg PastTense => sc ++ "be" ++ sca ++ "se" ;
                    VFTensed IndicCl Pos FutTense => sc ++ "tlo" ++ "ba" ;
                    VFTensed IndicCl Neg FutTense => sck ++ "ka" ++ "se" ++ "be" ;
                    
                    VFTensed RelCl Pos PresTense => sca ++ "lego" ;
                    VFTensed RelCl Neg PresTense => sca ++ "sego" ;
                    VFTensed RelCl Pos PastTense => sca ++ "bego" ++ sca ++ "le" ;
                    VFTensed RelCl Neg PastTense => sca ++ "bego" ++ sca ++ "se" ; 
                    VFTensed RelCl Pos FutTense => sca ++ "tlogo" ++ "ba" ;
                    VFTensed RelCl Neg FutTense => sck ++ "ka" ++ "se" ++ "bego" ;
                    
                    VFTensed SitCl Pos PresTense => sca ++ "le" ;
                    VFTensed SitCl Neg PresTense => sca ++ "se" ;
                    VFTensed SitCl Pos PastTense => sca ++ "be" ++ sca ++ "le" ;
                    VFTensed SitCl Neg PastTense => sca ++ "be" ++ sca ++ "se" ; 
                    VFTensed SitCl Pos FutTense => sca ++ "tlo" ++ "ba" ;
                    VFTensed SitCl Neg FutTense => sck ++ "ka" ++ "se" ++ "be" ;

                    VFUntensed SubjunctCl Pos => sca ++ "be" ;
                    VFUntensed SubjunctCl Neg => sca ++ "se" ++ "be" ;

                    VFUntensed ConsecCl Pos => sc2 ++ "ba" ;
                    VFUntensed ConsecCl Neg => sc2 ++ "se" ++ "be" 
        } ;

        assoc_cop : VForm -> Agr -> Str = \vform,a -> let
            sc = subjConcLookup!a!SC1 ;
            sca = subjConcLookup!a!SC1Alt ;
            sc2 = subjConcLookup!a!SC2 ;
            in
                case vform of {
                    VFTensed IndicCl Pos PresTense => sc ++ "na" ++"le" ;
                    VFTensed IndicCl Neg PresTense => "ga" ++ sca ++ "na" ;
                    VFTensed IndicCl Pos PastTense => sc ++ "be" ++ sca ++ "na" ++ "le" ; -- pattern 1 of 2
                    VFTensed IndicCl Neg PastTense => sc ++ "be" ++ sca ++ "se" ++ "na" ;
                    VFTensed IndicCl Pos FutTense => sc ++ "tlo" ++ "ba" ++ sca ++ "na" ++ "le" ; -- pattern 2 of 2
                    VFTensed IndicCl Neg FutTense => sc ++ "tlo" ++ "ba" ++ sca ++ "se" ++ "na" ;
                    
                    VFTensed RelCl Pos PresTense => sca ++ "nago" ++ "le" ;
                    VFTensed RelCl Neg PresTense => sca ++ "se" ++ "nago" ;
                    VFTensed RelCl Pos PastTense => sca ++ "be" ++ sca ++ "nago" ++ "le" ; -- pattern 1 of 2
                    VFTensed RelCl Neg PastTense => sca ++ "be" ++ sca ++ "se" ++ "nago" ; 
                    VFTensed RelCl Pos FutTense => sca ++ "tlo" ++ "ba" ++ sca ++ "nago" ++ "le" ; -- pattern 2 of 2
                    VFTensed RelCl Neg FutTense => sca ++ "tlo" ++ "ba" ++ sca ++ "se" ++ "nago" ;
                    
                    VFTensed SitCl Pos PresTense => sca ++ "na" ++ "le" ;
                    VFTensed SitCl Neg PresTense => sca ++ "se" ++ "na" ;
                    VFTensed SitCl Pos PastTense => sca ++ "be" ++ sca ++ "na" ++ "le" ; -- pattern 1 of 2
                    VFTensed SitCl Neg PastTense => sca ++ "be" ++ sca ++ "se" ++ "na" ; 
                    VFTensed SitCl Pos FutTense => sca ++ "tlo" ++ "ba" ++ sca ++ "na" ++ "le" ; -- pattern 2 of 2
                    VFTensed SitCl Neg FutTense => sca ++ "tlo" ++ "ba" ++ sca ++ "se" ++ "na" ;

                    VFUntensed SubjunctCl Pos => sca ++ "be" ++ "le" ;
                    VFUntensed SubjunctCl Neg => sca ++ "se" ++ "be" ++ "le" ;

                    VFUntensed ConsecCl Pos => sc2 ++ "ba" ++ "le";
                    VFUntensed ConsecCl Neg => sc2 ++ "se" ++ "be" ++ "le"
        } ;

        compAgr : Agr -> Agr -> Agr = \a1,a2 -> case <a1,a2> of {
            <First _,(First _ | Second _ | Third _ _)> => First Pl ;
            <(First _ | Second _ | Third _ _),First _> => First Pl ;
            <Second _,(First _ | Second _ | Third _ _)> => Second Pl ;
            <(First _ | Second _ | Third _ _),Second _> => Second Pl ;
            <Third (C1_2|C1a_2a) _, Third _ _> => Third C1_2 Pl ;
            <Third _ _,Third c _> => Third c Pl
        } ;
    
    ---------------------------------------------------------------
    -- Nonexist lincats
    ---------------------------------------------------------------

    nonExist_RS : { s : Agr => Str } = {
        s = \\_ => nonExist
    } ;

    nonExist_VP : {
        s : TensedCl => Agr => Polarity => BasicTense => Bool => Str ;
        inf_s : Polarity => Str ;
        imp_s : Number => Polarity => Str ;
        consubj_s : UntensedCl => Agr => Polarity => Str ;
        hasComp : Bool -- indicates whether to use long form
    } = {
        s = \\_,_,_,_,_ => nonExist ;
        inf_s = \\_ => nonExist ;
        imp_s = \\_,_ => nonExist ;
        consubj_s = \\_,_,_ => nonExist ;
        hasComp = False
    } ;

    nonExist_RCl : {s : Agr => Polarity => BasicTense => Str } = {
        s = \\_,_,_ => nonExist
    } ;

    nonExist_N : {
        s : Number => NPForm => Str ;
        c : ClassGender ;
        nt : NType
      } = {
        s = \\_,_ => nonExist ;
        c = C17 ;
        nt = ConcreteN
    } ;

    nonExist_A : { s : AForm => Str ; at : AType } = {
        s = \\_ => nonExist ;
        at = AdjA
    } ;

}
       
