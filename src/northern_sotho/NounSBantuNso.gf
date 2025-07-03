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
      --proDrop = pn.proDrop 
      proDrop = False -- Even if the pron is dropped the postdet remains 13 May 2025
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

    PostdetCN pdet cn = { 
      s = \\num,npform => cn.s!num!npform ++ pdet.s!(Third cn.c num) ;
      c = cn.c ;
      nt = cn.nt  
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
    -- DemQuantPredet d q = { -- ntlo ye yohle
    --   s = \\a => d.s!a ++ q.s!a ;
    -- } ;

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
      proDrop = False
    } ;

    -- LocNNgaNP : LocN -> NP ;
    -- PossLocN : LocN -> NP -> LocN ; -- phezu kwamahora...
    PossLocN locn np = {
      s = locn.s ++ "ga" ++ np.s!Absolute ;
      c = locn.c
    } ;

    

    -- PossNPLoc : CN -> NP -> CN ; -- zasepulazini

    PossNPLoc cn np = {
      s = \\num, npform => cn.s!num!npform ++ (possConc cn.c num) ++ np.s!Locative ;
      c = cn.c ; empty = cn.empty ;
      nt = cn.nt
    } ;

    -- SBantuConjNP : NP -> ConjN -> NP -> NP ;

    SBantuConjNP np1 cj np2 = {
      s = table {
        Absolute => np1.s!Absolute ++ cj.s ++ np2.s!Absolute ;
        Possessive => np1.s!Possessive ++ cj.s ++ np2.s!Absolute ;
        Locative => np1.s!Locative ++ cj.s ++ np2.s!Absolute 
      } ;
      a = compAgr np1.a np2.a ;
      nt = np1.nt ;
      proDrop = andB np1.proDrop np2.proDrop 
    } ;
   
    -- AdjPron : AP -> Pron -> Pron ;
    
    AdjPron ap pn = {
      s = table {
        Absolute => case ap.at of {
          EnumA => pn.s!Absolute ++ subjConcLookup!pn.a!SC1 ++ ap.s!AF1 ;
          AdjA => pn.s!Absolute ++ compl_ap ap pn.a
         } ;
        Possessive => case ap.at of {
          EnumA => pn.s!Possessive ++ subjConcLookup!pn.a!SC1 ++ ap.s!AF1 ;
          AdjA => pn.s!Possessive ++ compl_ap ap pn.a
         } ;
        Locative => case ap.at of {
          EnumA => pn.s!Locative ++ subjConcLookup!pn.a!SC1 ++ ap.s!AF1 ;
          AdjA => pn.s!Locative ++ compl_ap ap pn.a
         } 
      } ;
      a = pn.a ;
      empty = pn.empty ;
      proDrop = pn.proDrop
    } ;

    -- CN = {s : Number => NPForm => Str ; c : ClassGender ; nt : NType} ;

    NomRel cn1 cn2 = {
        s = \\num, npform => let
                part1 = cn1.s!num!npform ;
                rel = dem_pron!Dem1!(Third cn1.c num) ;
                part2 = cn2.s!num!Absolute ;
                in
                part1 ++ rel ++ part2 ;
        c = cn1.c ;
        nt = cn1.nt
    } ;

  }
