                                        concrete NounSBantuNso of NounSBantu = CatNso,CatSBantuNso ** open ResNso, Prelude, ParamX in {

  lin

    ProDrop pron = { -- 20 September 2024
            s = table {
                    Absolute => case pron.proDrop of {
                        True => nonExist ;
                        False => pron.empty
                    } ;
                    Possessive => case pron.proDrop of {
                        True => nonExist ;
                        False => pron.empty
                    } ;
                    Locative => case pron.proDrop of {
                        True => nonExist ;
                        False => pron.empty
                    } 
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

    -- PostdetCN : CN -> Postdet -> Det -> NP ;

    -- RelN : RS -> N -> CN ;

    -- ApposCN : CN -> N -> CN ; -- (takes agr of CN)

    -- ApposN : CN -> N -> CN ; -- (takes agr of N)

    PredetN pdet n = { 
      s = \\num => table {
        Absolute => pdet.s!(Third n.c num) ++ n.s!num!Absolute ;
        Possessive => pdet.s!(Third n.c num) ++ n.s!num!Absolute ;
        Locative => "go" ++ pdet.s!(Third n.c num) ++ n.s!num!Absolute 
      } ;
      c = n.c ;
      nt = n.nt  
    } ; 

    PostdetN pdet n = { 
      s = \\num,npform => n.s!num!npform ++ pdet.s!(Third n.c num) ;
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

    -- DemQuantPredet?

    EmphCN cn = {
      s = \\num => table {
          Absolute => abs_pron!(Third cn.c num) ++ cn.s!num!Absolute ;
          Possessive => abs_pron!(Third cn.c num) ++ cn.s!num!Absolute ;
          Locative => abs_pron!(Third cn.c num) ++ cn.s!num!Absolute 
      } ;
      c = cn.c ;
      nt = cn.nt 
    } ;

    ContrastCN cn = {
      s = \\num,npform => cn.s!num!npform ++ abs_pron!(Third cn.c num) ;
      c = cn.c ;
      nt = cn.nt 
    } ;

    -- UsePNPl : PN -> NP ;

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

    -- LocNNgaNP : LocN -> NP ;
    -- PossLocN : LocN -> NP -> LocN ; -- phezu kwamahora...
    PossLocN locn np = {
      s = locn.s ++ "ga" ++ np.s!Absolute ;
      c = locn.c
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

    -- PossNPLoc : CN -> NP -> CN ; -- zasepulazini

    -- SBantuConjNP : NP -> Conj -> NP -> NP ;

  }