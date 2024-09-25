concrete BackwardNso of Backward = CatNso ** open ResNso,Prelude,ParamX in {

  flags optimize=all_subs ;

  lin

-- ComplV2  : V2  -> NP -> VP ;        -- use it
    ComplV2 v np = {
            s = table {
                    IndicCl => \\a,p,t,l => let
                        vform = VFTensed IndicCl p t ;
                        p1 = pre1 IndicCl p t ;
                        sc = subjConc vform a ;
                        longform = case <l,np.proDrop> of {
                            <False,False> => False ;
                            <False,True> => False ;
                            <_,False> => False ;
                            <_,True> => True
                        } ;
                        p2 = pre2 IndicCl p t longform ;
                        oc = case np.proDrop of {
                            True => objConc v.initLab np.a ;
                            False => []
                        } ;
                        r = v2RootForm v p t np.a;
                    in p1 ++ sc ++ p2 ++ oc ++ r ++ np.s!Absolute ;

                    RelCl => \\a,p,t,l => let
                        vform = VFTensed RelCl p t ;
                        sc = subjConc vform a ;
                        p2 = pre2 RelCl p t False ;
                        oc = case np.proDrop of {
                            True => objConc v.initLab np.a ;
                            False => []
                        } ;
                        r = v2RootForm v p t np.a ;
                        suf = "go" ;
                    in sc ++ p2 ++ oc ++ r ++ BIND ++ suf ++ np.s!Absolute ;

                    SitCl => \\a,p,t,l => let
                        vform = VFTensed SitCl p t ;
                        sc = subjConc vform a ;
                        p2 = pre2 SitCl p t False ;
                        stab_e = case <v.syl, np.proDrop> of {
                            <SylMono, False> => "e" ++BIND ;
                            <_, _> => []
                        } ;
                        oc = case np.proDrop of {
                             True => objConc v.initLab np.a ;
                             False => []
                        } ;
                        r = v2RootForm v p t np.a ;
                    in sc ++ p2 ++ stab_e ++ oc ++ r ++ np.s!Absolute
            } ;
            inf_s = let
                oc = case np.proDrop of {
                            True => objConc v.initLab np.a ;
                            False => []
                } ;
                in
                table {
                    Pos => "go" ++ oc ++ (v2RootForm v Pos PresTense np.a) ++ np.s!Absolute ;
                    Neg => "go" ++ "se" ++ oc ++ (v2RootForm v Neg PresTense np.a) ++ np.s!Absolute
            } ;

            imp_s = let
                stab_e = case <v.syl, np.proDrop> of {
                    <SylMono, False> => "e" ++BIND;
                    <_, _> => []
                } ;
                oc = case np.proDrop of {
                    True => objConc v.initLab np.a ;
                    False => []
                } ;
                vform = case np.proDrop of {
                    True => v2RootFormImp v Neg np.a ;
                    False => v2RootFormImp v Pos np.a
                } ;
            in  table {
                    Sg => table {
                        Pos => stab_e ++ oc ++ vform ++ np.s!Absolute ;
                        Neg => "se" ++ oc ++ (v2RootFormImp v Neg np.a) ++ np.s!Absolute
                    } ;
                    Pl => table {
                        Pos => stab_e ++ oc ++ vform ++BIND++ "ng" ++ np.s!Absolute ;
                        Neg => "se" ++ oc ++ (v2RootFormImp v Neg np.a) ++BIND++ "ng" ++ np.s!Absolute
                    }
            } ;
            consubj_s = table {
                SubjunctCl => \\a,p => let
                    vform = VFUntensed SubjunctCl p ;
                    sc = subjConc vform a ;
                    pre1 = case p of {
                        Pos => [] ;
                        Neg => "se"
                    } ;
                    oc = case np.proDrop of {
                        True => objConc v.initLab np.a ;
                        False => []
                    } ;
                    r = v2RootForm v Neg PresTense np.a;
                in sc ++ pre1 ++ oc ++ r ++ np.s!Absolute ;

                ConsecCl => \\a,p => let
                    vform = VFUntensed ConsecCl p ;
                    sc = subjConc vform a ;
                    pre1 = case p of {
                        Pos => [] ;
                        Neg => "se"
                    } ;
                    oc = case np.proDrop of {
                        True => objConc v.initLab np.a ;
                        False => []
                    } ;
                    r = case p of {
                        Pos => v2RootForm v Pos PresTense np.a ;
                        Neg => v2RootForm v Neg PresTense np.a
                    } ;
                in sc ++ pre1 ++ oc ++ r ++ np.s!Absolute
            } ;
            hasComp = case np.proDrop of {
                True => False ;
                False => True
            } ;
        } ;

-- ComplV3  : V3  -> NP -> NP -> VP ;  -- send a message to her
ComplV3 v npd npi = let
    longform = False ;
    oc = case <npi.proDrop,npd.proDrop> of {
        <False, False> => [] ;
        <True, False> => objConc v.initLab npi.a ;
        <False, True> => objConc v.initLab npd.a ;
        <True, True> => objConc v.initLab npi.a
    } ;
    abspron = case <npi.proDrop,npd.proDrop> of {
        <True, True> => abs_pron!npd.a ;
        <_, _> => []
    } ;
    stab_e = case <v.syl, npi.proDrop, npd.proDrop> of {
                <SylMono, False, False> => "e" ++BIND ;
                <_, _, R_a> => []
    } ;
in {
    s = table {
        IndicCl => \\a,p,t,l => let
            vform = VFTensed IndicCl p t ;
            p1 = pre1 IndicCl p t ;
            sc = subjConc vform a ;
            p2 = pre2 IndicCl p t longform ;
            r = case <npi.proDrop,npd.proDrop> of {
                    <False, False> => v2RootForm v p t npi.a ;
                    <True, False> => v2RootForm v p t npi.a ;
                    <False, True> => v2RootForm v p t npd.a ;
                    <True, True> => v2RootForm v p t npi.a
                } ;
        in p1 ++ sc ++ p2 ++ oc ++ r ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron ;

        RelCl => \\a,p,t,l => let
            vform = VFTensed RelCl p t ;
            sc = subjConc vform a ;
            p2 = pre2 RelCl p t False ;
            r = case <npi.proDrop,npd.proDrop> of {
                    <False, False> => v2RootForm v p t npi.a ;
                    <True, False> => v2RootForm v p t npi.a ;
                    <False, True> => v2RootForm v p t npd.a ;
                    <True, True> => v2RootForm v p t npi.a
                } ;
            suf = "go" ;
        in sc ++ p2 ++ oc ++ r ++ BIND ++ suf ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron ;

        SitCl => \\a,p,t,l => let
            vform = VFTensed SitCl p t ;
            sc = subjConc vform a ;
            p2 = pre2 SitCl p t False ;
            r = case <npi.proDrop,npd.proDrop> of {
                    <False, False> => v2RootForm v p t npi.a ;
                    <True, False> => v2RootForm v p t npi.a ;
                    <False, True> => v2RootForm v p t npd.a ;
                    <True, True> => v2RootForm v p t npi.a
                } ;
        in sc ++ p2 ++ stab_e ++ oc ++ r ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron
    } ;

    inf_s = let
        posv = case <npi.proDrop,npd.proDrop> of {
                    <False, False> => v2RootForm v Pos PresTense (Third C15 Sg) ;
                    <True, False> => v2RootForm v Pos PresTense npi.a ;
                    <False, True> => v2RootForm v Pos PresTense npd.a ;
                    <True, True> => v2RootForm v Pos PresTense npi.a
            } ;
        negv = case <npi.proDrop,npd.proDrop> of {
                    <False, False> => v2RootForm v Neg PresTense (Third C15 Sg) ;
                    <True, False> => v2RootForm v Neg PresTense npi.a ;
                    <False, True> => v2RootForm v Neg PresTense npd.a ;
                    <True, True> => v2RootForm v Neg PresTense npi.a
            } ;
    in
    table {
        Pos => "go" ++ oc ++ posv ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron ;
        Neg => "go" ++ "se" ++ oc ++ negv ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron
    } ;
    imp_s = let
        posv = case <npi.proDrop,npd.proDrop> of {
                    <False, False> => v2RootFormImp v Pos (Third C15 Sg) ;
                    <True, False> => v2RootFormImp v Neg npi.a ;
                    <False, True> => v2RootFormImp v Neg npd.a ;
                    <True, True> => v2RootFormImp v Neg npi.a
            } ;
        negv = case <npi.proDrop,npd.proDrop> of {
                    <False, False> => v2RootFormImp v Neg (Third C15 Sg) ;
                    <True, False> => v2RootFormImp v Neg npi.a ;
                    <False, True> => v2RootFormImp v Neg npd.a ;
                    <True, True> => v2RootFormImp v Neg npi.a
            } ;
    in
    table {
        Sg => table {
            Pos => stab_e ++ oc ++ posv ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron ;
            Neg => "se" ++ oc ++ negv ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron
        } ;
        Pl => table {
            Pos => stab_e ++ oc ++ posv ++BIND++ "ng" ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron ;
            Neg => "se" ++ oc ++ negv ++BIND++ "ng" ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron
        }
    } ;
    consubj_s = table {
        SubjunctCl => \\a,p => let
            vform = VFUntensed SubjunctCl p ;
            sc = subjConc vform a ;
            pre1 = case p of {
                Pos => [] ;
                Neg => "se"
            } ;
            r = case <npi.proDrop,npd.proDrop> of {
                    <False, False> => v2RootForm v Neg PresTense (Third C15 Sg) ;
                    <True, False> => v2RootForm v Neg PresTense npi.a ;
                    <False, True> => v2RootForm v Neg PresTense npd.a ;
                    <True, True> => v2RootForm v Neg PresTense npi.a
            } ;
        in sc ++ pre1 ++ oc ++ r ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron ;

        ConsecCl => \\a,p => let
            vform = VFUntensed ConsecCl p ;
            sc = subjConc vform a ;
            pre1 = case p of {
                Pos => [] ;
                Neg => "se"
            } ;
            r = case <p,npi.proDrop,npd.proDrop> of {
                <Pos, False, False> => v2RootForm v Pos PresTense (Third C15 Sg) ;
                <Pos, True, False> => v2RootForm v Pos PresTense npi.a ;
                <Pos, False, True> => v2RootForm v Pos PresTense npd.a;
                <Pos, True, True> => v2RootForm v Pos PresTense npi.a ;
                <Neg, False, False> => v2RootForm v Neg PresTense (Third C15 Sg) ;
                <Neg, True, False> => v2RootForm v Neg PresTense npi.a ;
                <Neg, False, True> => v2RootForm v Neg PresTense npd.a ;
                <Neg, True, True> => v2RootForm v Neg PresTense npi.a
            } ;
        in sc ++ pre1 ++ oc ++ r ++ npi.s!Absolute ++ npd.s!Absolute ++ abspron
    } ;
    hasComp = True ;
} ;


-- ComplV2V : V2V -> NP -> VP -> VP ;  -- cause it to burn
    ComplV2V v np vp = {
            s = table {
                    IndicCl => \\a,p,t,l => let
                        vform = VFTensed IndicCl p t ;
                        p1 = pre1 IndicCl p t ;
                        sc = subjConc vform a ;
                        longform = case <l,np.proDrop> of {
                            <False,False> => False ;
                            <False,True> => False ;
                            <_,False> => False ;
                            <_,True> => True
                        } ;
                        p2 = pre2 IndicCl p t longform ;
                        oc = case np.proDrop of {
                            True => objConc v.initLab np.a ;
                            False => []
                        } ;
                        r = v2RootForm v p t np.a;
                    in p1 ++ sc ++ p2 ++ oc ++ r ++ np.s!Absolute ++ vp.inf_s!Pos;

                    RelCl => \\a,p,t,l => let
                        vform = VFTensed RelCl p t ;
                        sc = subjConc vform a ;
                        p2 = pre2 RelCl p t False ;
                        oc = case np.proDrop of {
                            True => objConc v.initLab np.a ;
                            False => []
                        } ;
                        r = v2RootForm v p t np.a ;
                        suf = "go" ;
                    in sc ++ p2 ++ oc ++ r ++ BIND ++ suf ++ np.s!Absolute ++ vp.inf_s!Pos ;

                    SitCl => \\a,p,t,l => let
                        vform = VFTensed SitCl p t ;
                        sc = subjConc vform a ;
                        p2 = pre2 SitCl p t False ;
                        stab_e = case <v.syl, np.proDrop> of {
                            <SylMono, False> => "e" ++BIND ;
                            <_, _> => []
                         } ;
                        oc = case np.proDrop of {
                            True => objConc v.initLab np.a ;
                            False => []
                        } ;
                        r = v2RootForm v p t np.a ;
                    in sc ++ p2 ++ stab_e ++ oc ++ r ++ np.s!Absolute ++ vp.inf_s!Pos
            } ;
            inf_s = table {
                Pos => "go" ++ (v2RootForm v Pos PresTense np.a) ++ np.s!Absolute ++ vp.inf_s!Pos ;
                Neg => "go" ++ "se" ++ (v2RootForm v Neg PresTense np.a) ++ np.s!Absolute ++ vp.inf_s!Pos
            } ;
            imp_s = let
                stab_e = case <v.syl, np.proDrop> of {
                    <SylMono, False> => "e" ++BIND;
                    <_, _> => []
                } ;
                oc = case np.proDrop of {
                    True => objConc v.initLab np.a ;
                    False => []
                } ;
            in
                table {
                    Sg => table {
                        Pos => stab_e ++ oc ++ (v2RootForm v Pos PresTense np.a) ++ np.s!Absolute ++ vp.inf_s!Pos;
                        Neg => "se" ++ oc ++ (v2RootForm v Neg PresTense np.a) ++ np.s!Absolute ++ vp.inf_s!Pos
                    } ;
                    Pl => table {
                        Pos => stab_e ++ oc ++ (v2RootForm v Pos PresTense np.a) ++BIND++ "ng" ++ np.s!Absolute ++ vp.inf_s!Pos;
                        Neg => "se" ++ oc ++ (v2RootForm v Neg PresTense np.a) ++BIND++ "ng" ++ np.s!Absolute ++ vp.inf_s!Pos
                    }
            } ;
            consubj_s = table {
                SubjunctCl => \\a,p => let
                    vform = VFUntensed SubjunctCl p ;
                    sc = subjConc vform a ;
                    pre1 = case p of {
                        Pos => [] ;
                        Neg => "se"
                    } ;
                    oc = case np.proDrop of {
                        True => objConc v.initLab np.a ;
                        False => []
                    } ;
                    r = v2RootForm v Neg PresTense np.a;
                in sc ++ pre1 ++ oc ++ r ++ np.s!Absolute ++ vp.inf_s!Pos ;

                ConsecCl => \\a,p => let
                    vform = VFUntensed ConsecCl p ;
                    sc = subjConc vform a ;
                    pre1 = case p of {
                        Pos => [] ;
                        Neg => "se"
                    } ;
                    oc = case np.proDrop of {
                        True => objConc v.initLab np.a ;
                        False => []
                    } ;
                    r = case p of {
                        Pos => v2RootForm v Pos PresTense np.a;
                        Neg => v2RootForm v Neg PresTense np.a
                    } ;
                in sc ++ pre1 ++ oc ++ r ++ np.s!Absolute ++ vp.inf_s!Pos
            } ;
            hasComp = True
        } ;

}
