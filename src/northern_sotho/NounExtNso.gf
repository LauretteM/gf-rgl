concrete NounExtNso of NounExt = CatNso,CatExtNso ** open ResNso, Prelude, ParamX in {

  lin

    ProDrop pron = {
      s = table {
              Absolute => case pron.proDrop of {
                  True => "*" ++ pron.s!Absolute ;
                  False => pron.empty
              } ;
              Possessive => "*" ++ pron.s!Possessive ;
              Locative => "*" ++ pron.s!Locative
      } ; 
      a = pron.a ; 
      empty = pron.empty ;
      proDrop = True
    } ;

    -- Quant is used for demonstratives, and QuantStem for all/only

    PronPostdetNP pn pd = {
      s = table {
          Absolute => pn.s!Absolute ++ pd.s!pn.a ;
          Possessive => pn.s!Possessive ++ pd.s!pn.a ;
          Locative => pn.s!Locative ++ pd.s!pn.a 
      } ;
      a = pn.a; 
      nt = ConcreteN ;
      isPron = False ;
      proDrop = pn.proDrop
    } ;

    QuantPostdet q = { -- (ntlo) yohle  
      s = \\a => q.s!a ;
    } ;

    DemPostdet d = { -- (ntlo) ye
        s = \\a => d.s!a ;
    } ;

    QuantDemPostdet q d = { -- NSO Vraag
      s = \\a => q.s!a ++ d.s!a ;
    } ;

    DemQuantPostdet d q = { -- ntlo ye yohle
      s = \\a => d.s!a ++ q.s!a ;
    } ;

    DetNum n = n ;

    PredetN pdet n = { 
      s = \\num,npform => pdet.s!(Third n.c num) ++ n.s!num!npform ;
      c = n.c ;
      nt = n.nt  
    } ; 

    QuantPredet q = { -- NSO Vraag
      s = \\a => q.s!a ;
    } ;

    DemPredet d = { -- lo (mfana) -- NSO Vraag
      s = \\a => d.s!a ;
    } ;

    QuantDemPredet q d = { -- sonke lesi (sikhathi)
      s = \\a => q.s!a ++ d.s!a ;
    } ;

    Deverb15 pol vp = {
      s = table {
          _ => vp.inf_s!pol.p ++ pol.s
      } ;
      a = Third C15 Sg ;
      nt = ConcreteN ;
      isPron = False ;
      proDrop = False 
    } ;

    --  morago as noun e.g. subject/object of sentence at the back there are many people
    LocNNP locn = {
      s = table {
          Absolute => locn.s ;
          Possessive => locn.s ;
          Locative => locn.s
      } ;
      a = Third locn.c Sg ;
      nt = ConcreteN ;
      isPron = False ;
      proDrop = False
    } ;

    LocAdvLoc locadv = {
      s = table {
          IndicCl => \\a,p,t => let
              vform = VFTensed IndicCl p t ;
              idcop = descr_cop vform a ; 
              compl = locadv.s ;
              in
              idcop ++ compl ;
          
          RelCl => \\a,p,t => let
              vform = VFTensed RelCl p t ;
              idcop = descr_cop vform a ; 
              compl = locadv.s ;       
              in
              idcop ++ compl ;

          SitCl => \\a,p,t => let
              vform = VFTensed SitCl p t ;
              idcop = descr_cop vform a ; 
              compl = locadv.s ;       
              in
              idcop ++ compl    
      } ;
      inf_s = table {
          Pos => "go" ++ "ba" ++ locadv.s ;
          Neg => "go" ++ "se" ++ "be" ++ locadv.s
      } ;
      imp_s = table {
          Sg => table {
              Pos => "eba" ++ locadv.s ;           
          Neg => "se" ++ "be" ++ locadv.s 
          } ;
          Pl => table {
              Pos => "ebang" ++ locadv.s ;           
          Neg => "se" ++ "beng" ++ locadv.s    
          } 
      } ;
      consubj_s = table {
          SubjunctCl => \\a,p => let
              vform = VFUntensed SubjunctCl p ;
              idcop = descr_cop vform a ; 
              compl = locadv.s ;
              in
              idcop ++ compl ;
          
          ConsecCl => \\a,p => let
              vform = VFUntensed ConsecCl p ;
              idcop = descr_cop vform a ; 
              compl = locadv.s ;       
              in
              idcop ++ compl
      } 
    } ;

}
