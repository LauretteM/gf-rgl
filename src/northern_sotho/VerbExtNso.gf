concrete VerbExtNso of VerbExt = CatNso,CatExtNso ** open ResNso, Prelude, ParamX in {

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
      }
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
      } 
    } ;

    CopLocative loc = {
      s = \\c,a,p,t,l => loc.s!c!a!p!t ;
      inf_s = loc.inf_s ;
      imp_s = loc.imp_s ;
      consubj_s = \\c,a,p => loc.consubj_s!c!a!p         
    } ;

}
