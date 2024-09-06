concrete VerbSBantuNso of VerbSBantu = CatNso,CatSBantuNso ** open ResNso, Prelude, ParamX in {

  lin

    CopAP ap = {
      s = table {
          IndicCl => \\a,p,t,l => let
              vform = VFTensed IndicCl p t ;
              cop = ident_cop vform a ; 
              compl = compl_ap ap a ;
          in cop ++ compl ;
          
          RelCl => \\a,p,t,l => let
              vform = VFTensed RelCl p t ;
              cop = ident_cop vform a ; 
              compl = compl_ap ap a ;
          in cop ++ compl ;

          SitCl => \\a,p,t,l => let
              vform = VFTensed SitCl p t ;
              cop = ident_cop vform a ; 
              compl = compl_ap ap a ;
          in cop ++ compl 
      } ;
      inf_s = table {
          Pos => "go" ++ "ba" ++ compl_ap ap (Third C15 Sg) ;
          Neg => "go" ++ "se" ++ "be" ++ compl_ap ap (Third C15 Sg)
      } ;
      imp_s = table {
          Sg => table {
              Pos => "eba" ++ compl_ap ap (Third C15 Sg) ;           
          Neg => "se" ++ "be" ++ (compl_ap ap (Third C15 Sg)) 
          } ;
          Pl => table {
              Pos => "ebang" ++ compl_ap ap (Third C15 Sg) ;           
          Neg => "se" ++ "beng" ++ compl_ap ap (Third C15 Sg)   
          } 
      } ;
      consubj_s= table {
          SubjunctCl => \\a,p => let
              vform = VFUntensed SubjunctCl p ;
              cop = ident_cop vform a ; 
              compl = compl_ap ap a ;
          in cop ++ compl ;
          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              cop = ident_cop vform a ; 
              compl = compl_ap ap a ;
          in cop ++ compl 
      } ;
      hasComp = True
    } ;

    CopNP np = {
      s = table {
          IndicCl => \\a,p,t,l => let
              vform = VFTensed IndicCl p t ;
              npt = np.nt ;
              idcop = ident_cop vform a ; 
              decop = descr_cop vform a ;
              compl = np.s!Absolute ;
              in case npt of {
                  AbstractN => decop ++ compl ;
                  _ => idcop ++ compl

              } ;
          
          RelCl => \\a,p,t,l => let
              vform = VFTensed RelCl p t ;
              npt = np.nt ;
              idcop = ident_cop vform a ; 
              decop = descr_cop vform a ;
              compl = np.s!Absolute ;
              in case npt of {
                  AbstractN => decop ++ compl ;
                  _ => idcop ++ compl
              } ;

            SitCl => \\a,p,t,l => let
              vform = VFTensed SitCl p t ;
              npt = np.nt ;
              idcop = ident_cop vform a ; 
              decop = descr_cop vform a ;
              compl = np.s!Absolute ;
              in case npt of {
                  AbstractN => decop ++ compl ;
                  _ => idcop ++ compl
              }    
      } ;
      inf_s = table {
          Pos => "go" ++ "ba" ++ np.s!Absolute ;
          Neg => "go" ++ "se" ++ "be" ++  np.s!Absolute
      } ;
      imp_s = table {
          Sg => table {
              Pos => "eba" ++ np.s!Absolute ;           
          Neg => "se" ++ "be" ++ np.s!Absolute 
          } ;
          Pl => table {
              Pos => "ebang" ++ np.s!Absolute ;           
          Neg => "se" ++ "beng" ++ np.s!Absolute   
          } 
      } ;
      consubj_s= table {
          SubjunctCl => \\a,p => let
              vform = VFUntensed SubjunctCl p ;
              npt = np.nt ;
              idcop = ident_cop vform a ; 
              decop = descr_cop vform a ;
              compl = np.s!Absolute ;
              in case npt of {
                  AbstractN => decop ++ compl ;
                  _ => idcop ++ compl

              } ;
          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              npt = np.nt ;
              idcop = ident_cop vform a ; 
              decop = descr_cop vform a ;
              compl = np.s!Absolute ;
              in case npt of {
                  AbstractN => decop ++ compl ;
                  _ => idcop ++ compl
              } 
      } ;
      hasComp = True
    } ;

    CopNPAssoc np = {
      s = table {
          IndicCl => \\a,p,t,l => let
              vform = VFTensed IndicCl p t ;
              ascop = assoc_cop vform a ;
              compl = np.s!Absolute ;
              in ascop ++ compl ;
          
          RelCl => \\a,p,t,l => let
              vform = VFTensed RelCl p t ;
              ascop = assoc_cop vform a ;
              compl = np.s!Absolute ;
              in ascop ++ compl ;

          SitCl => \\a,p,t,l => let
              vform = VFTensed SitCl p t ;
              ascop = assoc_cop vform a ;
              compl = np.s!Absolute ;
              in ascop ++ compl    
      } ;
      inf_s = table {
          Pos => "go" ++ "ba" ++ "le" ++ np.s!Absolute ;
          Neg => "go" ++ "se" ++ "be" ++ "le" ++ np.s!Absolute 
      } ;
      imp_s = table {
          Sg => table {
              Pos => "eba" ++ "le" ++ np.s!Absolute ;           
          Neg => "se" ++ "be" ++ "le" ++ np.s!Absolute 
          } ;
          Pl => table {
              Pos => "ebang" ++ "le" ++ np.s!Absolute ;           
          Neg => "se" ++ "beng" ++ "le" ++ np.s!Absolute   
          } 
      } ;
      consubj_s = table {
          SubjunctCl => \\a,p => let
              vform = VFUntensed SubjunctCl p ;
              ascop = assoc_cop vform a ;
              compl = np.s!Absolute ;
              in ascop ++ compl ;
          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              ascop = assoc_cop vform a ;
              compl = np.s!Absolute ;
              in ascop ++ compl 
      } ;
      hasComp = True
    } ;

    -- CopNPEq : NP -> VP ;
    -- CopNPEqSize : NP -> VP ;

    CopLocative loc = {
      s = \\c,a,p,t,l => loc.s!c!a!p!t ;
      inf_s = loc.inf_s ;
      imp_s = loc.imp_s ;
      consubj_s = \\c,a,p => loc.consubj_s!c!a!p ;
      hasComp = True        
    } ;

    -- UseVRefl : V -> VP ;

    

        ComplV2Light v np = {
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
                        oc = objConc v.initLab np.a ;
                        r = v2RootForm v p t np.a;
                    in p1 ++ sc ++ p2 ++ oc ++ r ++ np.s!Absolute ;

                    RelCl => \\a,p,t,l => let
                        vform = VFTensed RelCl p t ;
                        sc = subjConc vform a ;
                        p2 = pre2 RelCl p t False ;
                        oc = objConc v.initLab np.a ;
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
                        oc = objConc v.initLab np.a ;
                        r = v2RootForm v p t np.a ;
                    in sc ++ p2 ++ stab_e ++ oc ++ r ++ np.s!Absolute    
            } ;
            inf_s = let
                oc = objConc v.initLab np.a ;
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
                oc = objConc v.initLab np.a ;
            in  table {
                    Sg => table {
                        Pos => stab_e ++ oc ++ (v2RootFormImp v Pos np.a) ++ np.s!Absolute ;
                        Neg => "se" ++ oc ++ (v2RootFormImp v Neg np.a) ++ np.s!Absolute 
                    } ;    
                    Pl => table {
                        Pos => stab_e ++ oc ++ (v2RootFormImp v Pos np.a) ++BIND++ "ng" ++ np.s!Absolute ;
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
                    oc = objConc v.initLab np.a ;
                    r = v2RootForm v Neg PresTense np.a;
                in sc ++ pre1 ++ oc ++ r ++ np.s!Absolute ;

                ConsecCl => \\a,p => let
                    vform = VFUntensed ConsecCl p ;
                    sc = subjConc vform a ;
                    pre1 = case p of {
                        Pos => [] ;
                        Neg => "se" 
                    } ;
                    oc = objConc v.initLab np.a ;
                    r = case p of {
                        Pos => v2RootForm v Pos PresTense np.a ;
                        Neg => v2RootForm v Neg PresTense np.a
                    } ;
                in sc ++ pre1 ++ oc ++ r ++ np.s!Absolute
            } ;
            hasComp = False
        } ;

        -- ComplV2Refl : V2 -> NP -> VP ; -- Ngizishaya umunwe.

        AdvVPLight vp adv = {
        s = \\c,a,p,t,b => vp.s!c!a!p!t!b ++ adv.s ;
        inf_s = \\p => vp.inf_s!p ++ adv.s ;
        imp_s = \\n,p => vp.imp_s!n!p ++ adv.s ;
        consubj_s = \\c,a,p => vp.consubj_s!c!a!p ++ adv.s ;
        hasComp = False
    } ;

    -- CopPoss : NP -> VP ;
    -- CopQuant : QuantPron -> VP ;
    -- UseVStative : V -> VP ;

    ComplV2Nonspec v np = {
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
            in  table {
                    Sg => table {
                        Pos => stab_e ++ oc ++ (v2RootFormImp v Pos np.a) ++ np.s!Absolute ;
                        Neg => "se" ++ oc ++ (v2RootFormImp v Neg np.a) ++ np.s!Absolute 
                    } ;    
                    Pl => table {
                        Pos => stab_e ++ oc ++ (v2RootFormImp v Pos np.a) ++BIND++ "ng" ++ np.s!Absolute ;
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

    -- ApplV : V -> V ; -- el
    -- CausV : V -> V ; -- is
    -- IntensV : V -> V ; -- isis
    -- ComplV : V -> V ; -- elel
    -- NeutV : V -> V ; -- ek
    -- PassV : V -> V ; -- w
    -- RecipV : V -> V ; -- an

}
