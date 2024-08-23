concrete VerbNso of Verb = CatNso ** open ResNso, Prelude, ParamX in {

  flags optimize=all_subs ;

  lin
    UseV v = {
      s = table {
          IndicCl => \\a,p,t,l => let
              vform = VFTensed IndicCl p t ;
              p1 = pre1 IndicCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 IndicCl p t l ;
              r = vRootForm v p t;
          in p1 ++ sc ++ p2 ++ r ;
          
          RelCl => \\a,p,t,l => let
              vform = VFTensed RelCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 RelCl p t l ;
              r = vRootForm v p t ;
              suf = "go" ;
          in sc ++ p2 ++ r ++ BIND ++ suf ;

          SitCl => \\a,p,t,l => let
              vform = VFTensed SitCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 SitCl p t l ;
              r = case <p,t,v.syl> of {
                  <Pos, PresTense, SylMono> => "e" ++BIND++ vRootForm v p t ;
                  <_, _, _> => vRootForm v p t 
                  } ;
          in sc ++ p2 ++ r  
      } ;
      inf_s = table {
          Pos => "go" ++ (vRootForm v Pos PresTense) ;
          Neg => "go" ++ "se" ++ (vRootForm v Neg PresTense)
      } ;
      imp_s = table {
          Sg => table {
              Pos => case v.syl of {
                  SylMono => "e" ++BIND++ (vRootForm v Pos PresTense) ;            
                  SylMult =>  vRootForm v Pos PresTense                     
              } ;           
          Neg => "se" ++ (vRootForm v Neg PresTense)                   
          } ;
          Pl => table {
              Pos => case v.syl of {
                  SylMono => "e" ++BIND++ (vRootForm v Pos PresTense) ++BIND++ "ng" ;        
                  SylMult =>  (vRootForm v Pos PresTense) ++BIND++ "ng"                
              } ;           
          Neg => "se" ++ (vRootForm v Neg PresTense) ++BIND++ "ng"                 
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
              r = vRootForm v Neg PresTense ;
          in sc ++ pre1 ++ r ;
                          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              sc = subjConc vform a ;
              pre1 = case p of {
                  Pos => [] ;
                  Neg => "se" 
              } ;
              r = case p of {
                  Pos => vRootForm v Pos PresTense ;
                  Neg => vRootForm v Neg PresTense
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
              r = vRootForm vv p t;
          in p1 ++ sc ++ p2 ++ r ++ vp.inf_s!Pos;
          
          RelCl => \\a,p,t,l => let
              vform = VFTensed RelCl p t ;
              sc = subjConc vform a ;
              p2 = pre2 RelCl p t l ;
              r = vRootForm vv p t ;
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
                  r = vRootForm vv p t ;
              in sc ++ p2 ++ stab_e ++ r ++ vp.inf_s!Pos 
      } ;
      inf_s = table {
          Pos => "go" ++ (vRootForm vv Pos PresTense) ++ vp.inf_s!Pos;
          Neg => "go" ++ "se" ++ (vRootForm vv Neg PresTense) ++ vp.inf_s!Pos
      } ;
      imp_s = table {
          Sg => table {
              Pos => case vv.syl of {
                  SylMono => "e" ++BIND++ (vRootForm vv Pos PresTense) ++ vp.inf_s!Pos ; 
                  SylMult =>  (vRootForm vv Pos PresTense) ++ vp.inf_s!Pos          
              } ;           
          Neg => "se" ++ (vRootForm vv Neg PresTense) ++ vp.inf_s!Pos 
          } ;
          Pl => table {
              Pos => case vv.syl of {
                  SylMono => "e" ++BIND++ (vRootForm vv Pos PresTense) ++BIND++ "ng" ++ vp.inf_s!Pos;    
                  SylMult =>  (vRootForm vv Pos PresTense) ++BIND++ "ng" ++ vp.inf_s!Pos           
              } ;           
          Neg => "se" ++ (vRootForm vv Neg PresTense) ++BIND++ "ng" ++ vp.inf_s!Pos      
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
              r = vRootForm vv Neg PresTense ;
          in sc ++ pre1 ++ r ++ vp.inf_s!Pos ;
                          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              sc = subjConc vform a ;
              pre1 = case p of {
                  Pos => [] ;
                  Neg => "se" 
              } ;
              r = case p of {
                  Pos => vRootForm vv Pos PresTense ;
                  Neg => vRootForm vv Neg PresTense
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
}
