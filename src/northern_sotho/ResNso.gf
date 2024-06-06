resource ResNso = open Prelude,ParamX in {
    
    param
        ClassGender = C1_2 | C1a_2a | C3_4 | C5_6 | C7_8 | C9_10 | C14_6 | C14 | C15 | C16 | C17 | C18 ;    -- nso noun classes, 23-05-2023
        -- Number = Sg | Pl ;
        Agr = First Number | Second Number | Third ClassGender Number ;
        NPForm = Absolute | Possessive | Locative ; 
        NType = ConcreteN | AbstractN | HumanN | PlaceN ;

        MoodS = IndicMS | SitMS | SubjunctMS | ConsecMS ;
        TensedCl = IndicCl | RelCl | SitCl ;
        ReducedTensedCl = RedIndicCl | RedSitCl ;
        UntensedCl = SubjunctCl | ConsecCl ;
        -- Polarity = Pos | Neg ;
        BasicTense = Past | Pres | Fut ;
                
        VForm = VFTensed TensedCl Polarity BasicTense | -- Indicative, situative and relative moods
                VFUntensed UntensedCl Polarity ; -- Subjunctive and consecutive moods
               
        SCForm = SC1 | SC1Alt | SC2 | SC1AltPreKa;
        AForm = AF1 | AF2 ; 

        VPreForm = VPreReg | VPreAlt ;
        VSufForm = VS_a | VS_e | VS_ile ;
        Syl = SylMono | SylMult ;

        Distance = Dem1 | Dem2 | Dem3 ;

    oper
        vowel : pattern Str = #("a"|"e"|"i"|"o"|"u") ;
        cons : pattern Str = #("b"|"c"|"d"|"f"|"g"|"h"|"j"|"k"|"l"|"m"|"n"|"p"|"q"|"r"|"s"|"t"|"v"|"w"|"x"|"y"|"z") ;
        labial_cons : pattern Str = #("p"|"b"|"f"|"m" ) ;

        mkNounWC : Str -> ClassGender -> NType -> {s : Number => NPForm => Str ; c : ClassGender ; nt : NType }
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
        in mkNounWC root cg ntype ;

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
                                    Locative => "go" ++ abs
                                } ;
                                a = a ;
                                empty = [] ;
                                proDrop = False
        } ;

        mkVerb : Str -> {s : VPreForm => VSufForm => Str ; initLab : Bool ; syl : Syl }
        = \root -> {s = table {
                        VPreReg => table {
                            VS_a => root + "a" ;                            -- sepela
                            VS_e => root + "e" ;                            -- sepele    
                            VS_ile => case root of {                        -- sepetše
                                p + "n" => p + "ne" ;
                                p + "m" => p + "me" ;
                                p + "ar" => p + "ere" ;
                                p + "al" => p + "etše" ;
                                p + "el" => p + "etše" ;
                                p + "ul" => p + "utše" ;
                                p + "tš" => p + "ditše" ;
                                p + "š" => p + "šitše" ;
                                p + "ny" => p + "tše" ;
                                p + "al" => p + "adile" ;
                                p => p + "ile" } 
                        } ;
                          
                        VPreAlt => let 
                            alt_root = vPreAltRoot root
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
                                p + "tš" => p + "ditše" ;
                                p + "š" => p + "šitše" ;
                                p + "ny" => p + "tše" ;
                                p + "al" => p + "adile" ;
                                -- monosyllabic verb root : a -> ele
                                p => p + "ile" }               
                        }
                    } ;   

                    initLab = case root of {
                        #labial_cons + p => True ;
                        _ => False
                    }   ;

                    syl = case root of {
                        _+#cons+#vowel+#cons+_ => SylMult ; -- bal
                        _+#cons+#vowel+#vowel+_ => SylMult ; -- neel
                        _+#vowel+#cons+#vowel+_ => SylMult ; -- ape
                        _+#cons+#vowel+_ => SylMult ; -- bo
                        _ => SylMono
                    } ;
        } ;

        vPreAltRoot : Str -> Str 
        = \root -> case root of {
            "a" + p => "ka" + p ;
            "e" + p => "ke" + p ;
            "i" + p => "ki" + p ;
            "o" + p => "ko" + p ;
            "u" + p => "ku" + p ;
            "b" + p => "p" + p ;
            "d" + p => "t" + p ;
            "f" + p => "ph" + p ;
            "fs" + p => "psh" + p ;
            "g" + p => "kg" + p ;
            "h" + p => "kh" + p ;
            "hl" + p => "tlh" + p ;
            "j" + p => "tš" + p ;
            "l" + p => "t" + p ;
            "r" + p => "th" + p ;
            "s" + p => "tsh" + p ;
            "š" + p => "tšh" + p ;
            "w" + p => "kw" + p ;
            "y" + p => "k" + p ;
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
                VFTensed IndicCl Neg Pres => subjConcLookup ! agr ! SC1Alt ;
                VFTensed IndicCl Neg Past => subjConcLookup ! agr ! SC2 ;
                VFTensed IndicCl Neg Fut => subjConcLookup ! agr ! SC1AltPreKa ;
                VFTensed RelCl Neg Fut => subjConcLookup ! agr ! SC1AltPreKa ;
                VFTensed RelCl _ _ => subjConcLookup ! agr ! SC1Alt ; 
                VFTensed SitCl Neg Fut => subjConcLookup ! agr ! SC1AltPreKa ; 
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

        objConc : Bool -> Agr -> Str = \init,a -> case a of {
            First Sg => case init of {
                True => "m"++BIND ;
                False => "n"++BIND
            } ;
            _ => objConcLookup!a
        } ;

        vRootForm : { s : VPreForm => VSufForm => Str ; initLab : Bool ; syl : Syl} -> Polarity -> BasicTense -> Str = \v,p,t ->
        case <p,t> of {
                <Pos, Pres> => v.s!VPreReg!VS_a ;
                <Pos, Past> => v.s!VPreReg!VS_ile ;
                <Pos, Fut> => v.s!VPreReg!VS_a ;
                <Neg, Pres> => v.s!VPreReg!VS_e ;
                <Neg, Past> => v.s!VPreReg!VS_a ;
                <Neg, Fut> => v.s!VPreReg!VS_e 
        } ;

        v2RootForm : { s : VPreForm => VSufForm => Str ; initLab : Bool ; syl : Syl} -> Polarity -> BasicTense -> Agr -> Str = \v,p,t,a ->
        case <a,p,t> of {
                <First Sg, Pos, Pres> => v.s!VPreAlt!VS_a ;
                <First Sg, Pos, Past> => v.s!VPreAlt!VS_ile ;
                <First Sg, Pos, Fut> => v.s!VPreAlt!VS_a ;
                <First Sg, Neg, Pres> => v.s!VPreAlt!VS_e ;
                <First Sg, Neg, Past> => v.s!VPreAlt!VS_a ;
                <First Sg, Neg, Fut> => v.s!VPreAlt!VS_e ;

                <_, Pos, Pres> => v.s!VPreReg!VS_a ;
                <_, Pos, Past> => v.s!VPreReg!VS_ile ;
                <_, Pos, Fut> => v.s!VPreReg!VS_a ;
                <_, Neg, Pres> => v.s!VPreReg!VS_e ;
                <_, Neg, Past> => v.s!VPreReg!VS_a ;
                <_, Neg, Fut> => v.s!VPreReg!VS_e 
        } ;

        v2RootFormImp : { s : VPreForm => VSufForm => Str ; initLab : Bool ; syl : Syl} -> Polarity -> Agr -> Str = \v,p,a ->
        case <a,p> of {
                <First Sg, Pos> => v.s!VPreAlt!VS_e ;
                <First Sg, Neg> => v.s!VPreAlt!VS_e ;
                
                <_, Pos> => v.s!VPreReg!VS_e ;
                <_, Neg> => v.s!VPreReg!VS_e 
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

        pre1 : TensedCl -> Polarity -> BasicTense -> Str =\c,p,t ->
        case <c,p,t> of {
            <_, Pos, _> => [] ;
            <IndicCl, Neg, Pres> => "ga" ;
            <IndicCl, Neg, Past> => "ga" ++ "se" ;
            <_, _, _> => []
        } ;
        
        pre2 : TensedCl -> Polarity -> BasicTense -> Bool -> Str =\c,p,t,l->
        case <c,p,t,l> of {
            <SitCl, Pos, Pres, _> => [] ;
            <SitCl, Neg, Pres, _> => "sa" ;
            <SitCl, Pos, Past, _> => [] ;
            <SitCl, Neg, Past, _> => "sa" ;
            <SitCl, Pos, Fut, _> => "tlo" ;
            <SitCl, Neg, Fut, _> => "ka" ++ "se" ;

            <_, Pos, Fut,_> => "tlo" ;
            <_, Neg, Fut, _> => "ka" ++ "se" ;
            
            <IndicCl, Pos, Pres, True> => "a" ;
            <IndicCl, Pos, Pres, False> => [] ;
            
            <RelCl, Neg, _, _> => "sa" ;
            <_, _, _, _> => [] 
        } ;

        regAdj : Str -> { s : AForm => Str } = \a -> {s = 
        table {
            AF1 => a ;
            AF2 => strengthen_root a 
            }
        } ;

        strengthen_root : Str -> Str = \r -> 
        case r of {
            "bjalo" => "bjalo";
            "bjang" => "bjang" ; 
            "botse" => "botse" ;
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
            VFTensed IndicCl Pos Pres => case a of{
                Third _ _ => "ke" ;
                _ => subjConcLookup!a!SC1                 
            } ;
            VFTensed IndicCl Neg Pres => case a of {
                Third _ _ => "ga" ++ "se" ;
                _ => "ga" ++ subjConcLookup!a!SC1Alt 
            } ;
            VFTensed IndicCl Pos Past => case a of {
                Third _ _ => "e" ++ "be" ++ "e" ++"le" ;
                _ => subjConcLookup!a!SC1 ++ "be" ++ subjConcLookup!a!SC1 ++"le"
            } ;
            VFTensed IndicCl Neg Past => case a of{
                Third _ _ => "e" ++ "be" ++ "e" ++"se" ;
                _ => subjConcLookup!a!SC1 ++ "be" ++ subjConcLookup!a!SC1Alt ++"se" 
            } ;
            VFTensed IndicCl Pos Fut => case a of {
                Third _ _ => "e" ++ "tlo" ++ "ba" ;
                _ => subjConcLookup!a!SC1 ++ "tlo" ++ "ba" 
            } ;
             VFTensed IndicCl Neg Fut => case a of {
                Third _ _ => "e" ++ "ka" ++ "se" ++ "be" ;
                _ => subjConcLookup!a!SC1AltPreKa ++ "ka" ++ "se" ++ "be" 
            } ;
            VFTensed RelCl Pos Pres => case a of {
                Third _ _ =>  "e" ++"lego" ;
                _ => subjConcLookup!a!SC1  ++ "lego"
            } ;
            VFTensed RelCl Neg Pres => case a of {
                Third _ _ => "e" ++ "sego" ;
                _ => subjConcLookup!a!SC1Alt ++ "sego"
            } ;
            VFTensed RelCl Pos Past =>case a of {
                Third _ _ => "e" ++ "bego" ++ "e" ++ "le" ;
                _ => subjConcLookup!a!SC1 ++ "bego" ++ subjConcLookup!a!SC1 ++ "le"
            } ;
            VFTensed RelCl Neg Past => case a of {
                Third _ _ => "e" ++ "bego" ++ "e" ++ "se" ;
                _ => subjConcLookup!a!SC1 ++ "bego" ++ subjConcLookup!a!SC1Alt ++ "se" 
            } ; 
            VFTensed RelCl Pos Fut => case a of {
                Third _ _ => "e" ++ "tlo" ++ "bago" ;
                _ => subjConcLookup!a!SC1 ++"tlo" ++ "bago"
            } ;
            VFTensed RelCl Neg Fut => case a of {
                Third _ _ => "e" ++ "ka" ++ "se" ++ "bego" ;
                _ => subjConcLookup!a!SC1AltPreKa ++ "ka" ++ "se" ++ "bego" 
            } ;
            VFTensed SitCl Pos Pres => case a of {
                Third _ _ =>  "e" ++ "le" ;
                _ => subjConcLookup!a!SC1  ++ "le"
            } ;
            VFTensed SitCl Neg Pres => case a of {
                Third _ _ => "e" ++ "se" ;
                _ => subjConcLookup!a!SC1Alt ++ "se"
            } ;
            VFTensed SitCl Pos Past =>case a of {
                Third _ _ => "e" ++ "be" ++ "e" ++ "le" ;
                _ => subjConcLookup!a!SC1 ++ "be" ++ subjConcLookup!a!SC1 ++ "le"
            } ;
            VFTensed SitCl Neg Past => case a of {
                Third _ _ => "e" ++ "be" ++ "e" ++ "se" ;
                _ => subjConcLookup!a!SC1 ++ "be" ++ subjConcLookup!a!SC1Alt ++ "se" 
            } ; 
            VFTensed SitCl Pos Fut => case a of {
                Third _ _ => "e" ++ "tlo" ++ "ba" ;
                _ => subjConcLookup!a!SC1 ++"tlo" ++ "ba"
            } ;
            VFTensed SitCl Neg Fut => case a of {
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

        compl_ap : {s : AForm => Str } -> Agr -> Str = \ap,a ->
        case a of {
            First Sg => "yo" ++ "mo" ++BIND ++ ap.s!AF1 ;
            First Pl => "ba" ++ "ba" ++BIND ++ ap.s!AF1 ;
            Second Sg => "yo" ++ "mo" ++BIND ++ ap.s!AF1 ;
            Second Pl => "ba" ++ "ba" ++BIND ++ ap.s!AF1 ;
            Third C1_2 Sg => "yo" ++ "mo" ++BIND ++ ap.s!AF1 ;
            Third C1_2 Pl => "ba" ++ "ba" ++BIND ++ ap.s!AF1 ;
            Third C1a_2a Sg => "yo" ++ "mo" ++BIND ++ ap.s!AF1 ;
            Third C1a_2a Pl =>"ba" ++ "ba" ++BIND ++ ap.s!AF1 ;
            Third C3_4 Sg => "wo" ++ "mo" ++BIND ++ ap.s!AF1 ;
            Third C3_4 Pl => "ye" ++ "me" ++BIND ++ ap.s!AF1 ;
            Third C5_6 Sg => "le" ++ "le" ++BIND ++ ap.s!AF1 ;
            Third C5_6 Pl => "a" ++ "ma" ++BIND ++ ap.s!AF1 ;
            Third C7_8 Sg => "se" ++ "se" ++BIND ++ ap.s!AF1 ;
            Third C7_8 Pl => "tše" ++ ap.s!AF2 ;
            Third C9_10 Sg => "ye" ++ ap.s!AF2 ;
            Third C9_10 Pl => "tše" ++ ap.s!AF2 ;
            Third C14_6 Sg => "bjo" ++ "bo" ++BIND ++ ap.s!AF1 ;
            Third C14_6 Pl => "a" ++ "ma" ++BIND ++ ap.s!AF1 ;
            Third C14 _ => "bjo" ++ "bo" ++BIND ++ ap.s!AF1 ;
            Third C15 _ => "mo" ++ "go" ++BIND ++ ap.s!AF1 ;
            Third C16 _ => "mo" ++ "go" ++BIND ++ ap.s!AF1 ;
            Third C17 _ => "mo" ++ "go" ++BIND ++ ap.s!AF1 ;
            Third C18 _ => "mo" ++ "go" ++BIND ++ ap.s!AF1
        } ;
    
        descr_cop : VForm -> Agr -> Str = \vform,a -> let
            sc = subjConcLookup!a!SC1 ;
            sca = subjConcLookup!a!SC1Alt ;
            sck = subjConcLookup!a!SC1AltPreKa ;
            sc2 = subjConcLookup!a!SC2 ;
            in
                case vform of {
                    VFTensed IndicCl Pos Pres => sc ;
                    VFTensed IndicCl Neg Pres => "ga" ++ sca ;
                    VFTensed IndicCl Pos Past => sc ++ "be" ++ sca ++ "le" ;
                    VFTensed IndicCl Neg Past => sc ++ "be" ++ sca ++ "se" ;
                    VFTensed IndicCl Pos Fut => sc ++ "tlo" ++ "ba" ;
                    VFTensed IndicCl Neg Fut => sck ++ "ka" ++ "se" ++ "be" ;
                    
                    VFTensed RelCl Pos Pres => sca ++ "lego" ;
                    VFTensed RelCl Neg Pres => sca ++ "sego" ;
                    VFTensed RelCl Pos Past => sca ++ "bego" ++ sca ++ "le" ;
                    VFTensed RelCl Neg Past => sca ++ "bego" ++ sca ++ "se" ; 
                    VFTensed RelCl Pos Fut => sca ++ "tlogo" ++ "ba" ;
                    VFTensed RelCl Neg Fut => sck ++ "ka" ++ "se" ++ "bego" ;
                    
                    VFTensed SitCl Pos Pres => sca ++ "le" ;
                    VFTensed SitCl Neg Pres => sca ++ "se" ;
                    VFTensed SitCl Pos Past => sca ++ "be" ++ sca ++ "le" ;
                    VFTensed SitCl Neg Past => sca ++ "be" ++ sca ++ "se" ; 
                    VFTensed SitCl Pos Fut => sca ++ "tlo" ++ "ba" ;
                    VFTensed SitCl Neg Fut => sck ++ "ka" ++ "se" ++ "be" ;

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
                    VFTensed IndicCl Pos Pres => sc ++ "na" ++"le" ;
                    VFTensed IndicCl Neg Pres => "ga" ++ sca ++ "na" ;
                    VFTensed IndicCl Pos Past => sc ++ "be" ++ sca ++ "na" ++ "le" ; -- pattern 1 of 2
                    VFTensed IndicCl Neg Past => sc ++ "be" ++ sca ++ "se" ++ "na" ;
                    VFTensed IndicCl Pos Fut => sc ++ "tlo" ++ "ba" ++ sca ++ "na" ++ "le" ; -- pattern 2 of 2
                    VFTensed IndicCl Neg Fut => sc ++ "tlo" ++ "ba" ++ sca ++ "se" ++ "na" ;
                    
                    VFTensed RelCl Pos Pres => sca ++ "nago" ++ "le" ;
                    VFTensed RelCl Neg Pres => sca ++ "se" ++ "nago" ;
                    VFTensed RelCl Pos Past => sca ++ "be" ++ sca ++ "nago" ++ "le" ; -- pattern 1 of 2
                    VFTensed RelCl Neg Past => sca ++ "be" ++ sca ++ "se" ++ "nago" ; 
                    VFTensed RelCl Pos Fut => sca ++ "tlo" ++ "ba" ++ sca ++ "nago" ++ "le" ; -- pattern 2 of 2
                    VFTensed RelCl Neg Fut => sca ++ "tlo" ++ "ba" ++ sca ++ "se" ++ "nago" ;
                    
                    VFTensed SitCl Pos Pres => sca ++ "na" ++ "le" ;
                    VFTensed SitCl Neg Pres => sca ++ "se" ++ "na" ;
                    VFTensed SitCl Pos Past => sca ++ "be" ++ sca ++ "na" ++ "le" ; -- pattern 1 of 2
                    VFTensed SitCl Neg Past => sca ++ "be" ++ sca ++ "se" ++ "na" ; 
                    VFTensed SitCl Pos Fut => sca ++ "tlo" ++ "ba" ++ sca ++ "na" ++ "le" ; -- pattern 2 of 2
                    VFTensed SitCl Neg Fut => sca ++ "tlo" ++ "ba" ++ sca ++ "se" ++ "na" ;

                    VFUntensed SubjunctCl Pos => sca ++ "be" ++ "le" ;
                    VFUntensed SubjunctCl Neg => sca ++ "se" ++ "be" ++ "le" ;

                    VFUntensed ConsecCl Pos => sc2 ++ "ba" ++ "le";
                    VFUntensed ConsecCl Neg => sc2 ++ "se" ++ "be" ++ "le"
        } ;

}
       
