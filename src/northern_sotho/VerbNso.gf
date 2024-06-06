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
                  <Pos, Pres, SylMono> => "e" ++BIND++ vRootForm v p t ;
                  <_, _, _> => vRootForm v p t 
                  } ;
          in sc ++ p2 ++ r  
      } ;
      inf_s = table {
          Pos => "go" ++ (vRootForm v Pos Pres) ;
          Neg => "go" ++ "se" ++ (vRootForm v Neg Pres)
      } ;
      imp_s = table {
          Sg => table {
              Pos => case v.syl of {
                  SylMono => "e" ++BIND++ (vRootForm v Pos Pres) ;            
                  SylMult =>  vRootForm v Pos Pres                     
              } ;           
          Neg => "se" ++ (vRootForm v Neg Pres)                   
          } ;
          Pl => table {
              Pos => case v.syl of {
                  SylMono => "e" ++BIND++ (vRootForm v Pos Pres) ++BIND++ "ng" ;        
                  SylMult =>  (vRootForm v Pos Pres) ++BIND++ "ng"                
              } ;           
          Neg => "se" ++ (vRootForm v Neg Pres) ++BIND++ "ng"                 
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
              r = vRootForm v Neg Pres ;
          in sc ++ pre1 ++ r ;
                          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              sc = subjConc vform a ;
              pre1 = case p of {
                  Pos => [] ;
                  Neg => "se" 
              } ;
              r = case p of {
                  Pos => vRootForm v Pos Pres ;
                  Neg => vRootForm v Neg Pres
              } ;
          in sc ++ pre1 ++ r 
      }
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
          Pos => "go" ++ (vRootForm vv Pos Pres) ++ vp.inf_s!Pos;
          Neg => "go" ++ "se" ++ (vRootForm vv Neg Pres) ++ vp.inf_s!Pos
      } ;
      imp_s = table {
          Sg => table {
              Pos => case vv.syl of {
                  SylMono => "e" ++BIND++ (vRootForm vv Pos Pres) ++ vp.inf_s!Pos ; 
                  SylMult =>  (vRootForm vv Pos Pres) ++ vp.inf_s!Pos          
              } ;           
          Neg => "se" ++ (vRootForm vv Neg Pres) ++ vp.inf_s!Pos 
          } ;
          Pl => table {
              Pos => case vv.syl of {
                  SylMono => "e" ++BIND++ (vRootForm vv Pos Pres) ++BIND++ "ng" ++ vp.inf_s!Pos;    
                  SylMult =>  (vRootForm vv Pos Pres) ++BIND++ "ng" ++ vp.inf_s!Pos           
              } ;           
          Neg => "se" ++ (vRootForm vv Neg Pres) ++BIND++ "ng" ++ vp.inf_s!Pos      
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
              r = vRootForm vv Neg Pres ;
          in sc ++ pre1 ++ r ++ vp.inf_s!Pos ;
                          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              sc = subjConc vform a ;
              pre1 = case p of {
                  Pos => [] ;
                  Neg => "se" 
              } ;
              r = case p of {
                  Pos => vRootForm vv Pos Pres ;
                  Neg => vRootForm vv Neg Pres
              } ;
          in sc ++ pre1 ++ r ++ vp.inf_s!Pos 
      }
    } ;


    AdvVP vp adv = vp ** {
      advs = vp.advs ++ adv.s ;
      hasComp = True
    } ;
}
