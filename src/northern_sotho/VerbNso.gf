concrete VerbNso of Verb = CatNso ** open ResNso, Prelude, ParamX in {

  flags optimize=all_subs ;

  lin

    -- PassV2   : V2 -> VP ;               -- be loved

    UseV v = {
      s = table {
          IndicCl => \\a,p,t,l => let
              vform = VFTensed IndicCl p t ;
              p1 = pre1 IndicCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 IndicCl p t l ;
              r = vStemForm v p t;
          in p1 ++ sc ++ p2 ++ r ;
          
          RelCl => \\a,p,t,l => let
              vform = VFTensed RelCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 RelCl p t l ;
              r = vStemForm v p t ;
              suf = "go" ;
          in sc ++ p2 ++ r ++ BIND ++ suf ;

          SitCl => \\a,p,t,l => let
              vform = VFTensed SitCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 SitCl p t l ;
              r = case <p,t,v.syl> of {
                  <Pos, PresTense, SylMono> => "e" ++BIND++ vStemForm v p t ;
                  <_, _, _> => vStemForm v p t 
                  } ;
          in sc ++ p2 ++ r 
      } ;
      inf_s = table {
          Pos => "go" ++ (vStemForm v Pos PresTense) ;
          Neg => "go" ++ "se" ++ (vStemForm v Neg PresTense)
      } ;
      imp_s = table {
          Sg => table {
              Pos => case v.syl of {
                  SylMono => "e" ++BIND++ (vStemForm v Pos PresTense) ; 
                  SylMult =>  vStemForm v Pos PresTense 
              } ; 
          Neg => "se" ++ (vStemForm v Neg PresTense)
          } ;
          Pl => table {
              Pos => case v.syl of {
                  SylMono => "e" ++BIND++ (vStemForm v Pos PresTense) ++BIND++ "ng" ;
                  SylMult =>  (vStemForm v Pos PresTense) ++BIND++ "ng"
              } ;           
          Neg => "se" ++ (vStemForm v Neg PresTense) ++BIND++ "ng"
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
              r = vStemForm v Neg PresTense ;
          in sc ++ pre1 ++ r ;
                          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              sc = subjConc vform a ;
              pre1 = case p of {
                  Pos => [] ;
                  Neg => "se" 
              } ;
              r = case p of {
                  Pos => vStemForm v Pos PresTense ;
                  Neg => vStemForm v Neg PresTense
              } ;
          in sc ++ pre1 ++ r 
      } ;
      hasComp = False
    } ;

    ComplVV vv vp = {
      s = table {
          IndicCl => \\a,p,t,l => let
              vform = VFTensed IndicCl p t ;
              p1 = pre1 IndicCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 IndicCl p t l ;
              r = vStemForm vv p t;
          in p1 ++ sc ++ p2 ++ r ++ vp.inf_s!Pos;
          
          RelCl => \\a,p,t,l => let
              vform = VFTensed RelCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 RelCl p t l ;
              r = vStemForm vv p t ;
              suf = "go" ;
          in sc ++ p2 ++ r ++ BIND ++ suf ++ vp.inf_s!Pos ;

          SitCl => \\a,p,t,l => let
                  vform = VFTensed SitCl p t ;
                  sc = subjConc vform a ;
                  p2 = pre2 SitCl p t l ;
                  stab_e = case vv.syl of {
                      SylMono => "e" ++BIND ;
                      SylMult => []
                    } ;
                  r = vStemForm vv p t ;
              in sc ++ p2 ++ stab_e ++ r ++ vp.inf_s!Pos 
      } ;
      inf_s = table {
          Pos => "go" ++ (vStemForm vv Pos PresTense) ++ vp.inf_s!Pos;
          Neg => "go" ++ "se" ++ (vStemForm vv Neg PresTense) ++ vp.inf_s!Pos
      } ;
      imp_s = table {
          Sg => table {
              Pos => case vv.syl of {
                  SylMono => "e" ++BIND++ (vStemForm vv Pos PresTense) ++ vp.inf_s!Pos ; 
                  SylMult =>  (vStemForm vv Pos PresTense) ++ vp.inf_s!Pos
              } ;
          Neg => "se" ++ (vStemForm vv Neg PresTense) ++ vp.inf_s!Pos 
          } ;
          Pl => table {
              Pos => case vv.syl of {
                  SylMono => "e" ++BIND++ (vStemForm vv Pos PresTense) ++BIND++ "ng" ++ vp.inf_s!Pos;
                  SylMult =>  (vStemForm vv Pos PresTense) ++BIND++ "ng" ++ vp.inf_s!Pos
              } ;           
          Neg => "se" ++ (vStemForm vv Neg PresTense) ++BIND++ "ng" ++ vp.inf_s!Pos
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
              r = vStemForm vv Neg PresTense ;
          in sc ++ pre1 ++ r ++ vp.inf_s!Pos ;
                          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              sc = subjConc vform a ;
              pre1 = case p of {
                  Pos => [] ;
                  Neg => "se" 
              } ;
              r = case p of {
                  Pos => vStemForm vv Pos PresTense ;
                  Neg => vStemForm vv Neg PresTense
              } ;
          in sc ++ pre1 ++ r ++ vp.inf_s!Pos 
      } ;
      hasComp = True
    } ;

    AdvVP vp adv = {
        s = \\c,a,p,t,b => vp.s!c!a!p!t!b ++ adv.s ;
        inf_s = \\p => vp.inf_s!p ++ adv.s ;
        imp_s = \\n,p => vp.imp_s!n!p ++ adv.s ;
        consubj_s = \\c,a,p => vp.consubj_s!c!a!p ++ adv.s ;
        hasComp = True
    } ;

-- VV = {s : VPreForm => VSufForm => Str ; initLet : Let ; syl : Syl } ;
-- VS = {s : VPreForm => VSufForm => Str ; initLet : Let ; syl : Syl ; mood : MoodS } ;

    ComplVS vs s = {
      s = table {
          IndicCl => \\a,p,t,l => let
              vform = VFTensed IndicCl p t ;
              p1 = pre1 IndicCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 IndicCl p t l ;
              r = vsStemForm vs p t;
          in p1 ++ sc ++ p2 ++ r ++ "gore" ++ s.s!vs.mood ;
          
          RelCl => \\a,p,t,l => let
              vform = VFTensed RelCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 RelCl p t l ;
              r = vsStemForm vs p t ;
              suf = "go" ;
          in sc ++ p2 ++ r ++ BIND ++ suf ++ "gore" ++ s.s!vs.mood ;

          SitCl => \\a,p,t,l => let
                  vform = VFTensed SitCl p t ;
                  sc = subjConc vform a ;
                  p2 = pre2 SitCl p t l ;
                  stab_e = case vs.syl of {
                      SylMono => "e" ++BIND ;
                      SylMult => []
                    } ;
                  r = vsStemForm vs p t ;
              in sc ++ p2 ++ stab_e ++ r ++ "gore" ++ s.s!vs.mood 
      } ;
      inf_s = table {
          Pos => "go" ++ (vsStemForm vs Pos PresTense) ++ "gore" ++ s.s!vs.mood ;
          Neg => "go" ++ "se" ++ (vsStemForm vs Neg PresTense) ++ "gore" ++ s.s!vs.mood
      } ;
      imp_s = table {
          Sg => table {
              Pos => case vs.syl of {
                  SylMono => "e" ++BIND++ (vsStemForm vs Pos PresTense) ++ "gore" ++ s.s!vs.mood ; 
                  SylMult =>  (vsStemForm vs Pos PresTense) ++ "gore" ++ s.s!vs.mood
              } ;
              Neg => "se" ++ (vsStemForm vs Neg PresTense) ++ "gore" ++ s.s!vs.mood 
          } ;
          Pl => table {
              Pos => case vs.syl of {
                  SylMono => "e" ++BIND++ (vsStemForm vs Pos PresTense) ++BIND++ "ng" ++ "gore" ++ s.s!vs.mood ;
                  SylMult =>  (vsStemForm vs Pos PresTense) ++BIND++ "ng" ++ "gore" ++ s.s!vs.mood 
              } ;           
              Neg => "se" ++ (vsStemForm vs Neg PresTense) ++BIND++ "ng" ++ "gore" ++ s.s!vs.mood
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
              r = vsStemForm vs Neg PresTense ;
          in sc ++ pre1 ++ r ++ "gore" ++ s.s!vs.mood ;
                          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              sc = subjConc vform a ;
              pre1 = case p of {
                  Pos => [] ;
                  Neg => "se" 
              } ;
              r = case p of {
                  Pos => vsStemForm vs Pos PresTense ;
                  Neg => vsStemForm vs Neg PresTense
              } ;
          in sc ++ pre1 ++ r ++ "gore" ++ s.s!vs.mood 
      } ;
      hasComp = True
    } ;
}
