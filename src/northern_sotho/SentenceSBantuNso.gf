concrete SentenceSBantuNso of SentenceSBantu = CatNso,CatSBantuNso ** open ResNso, Prelude, ParamX in {

  lin

    ExistNP np = {s = \\_ => "ke" ++ np.s!Absolute} ;

    ExistAppos np1 np2 = {s = \\_ => np1.s!Absolute ++ "ke" ++ np2.s!Absolute} ;

    GreetSg = {
      s = "dumela"
    } ;
    GreetPl = {
      s = "dumelang"
    } ;

    -- UseClProg : Temp -> Pol -> Cl -> S ;
    -- UseClExcl : Temp -> Pol -> Cl -> S ;

    -- UseRClProg : Temp -> Pol -> RCl -> RS ;
    -- UseRClExcl : Temp -> Pol -> RCl -> RS ;

    SConjS s1 conj s2 = {         -- he helps the aunt before she cries
      s = table {
        IndicMS => s1.s!IndicMS ++ conj.s ++ s2.s!conj.mood ;
        SitMS => s1.s!SitMS ++ conj.s ++ s2.s!conj.mood ;
        SubjunctMS => s1.s!SubjunctMS ++ conj.s ++ s2.s!conj.mood ;
        ConsecMS => s1.s!ConsecMS ++ conj.s ++ s2.s!conj.mood 
      }
    } ;

    ImpConjS imp conj s1 = {      -- help the aunt before she cries 

      s = table {
        Sg => table {
              Pos => imp.s!Sg!Pos ++ conj.s ++ s1.s!conj.mood ;
              Neg => imp.s!Sg!Neg ++ conj.s ++ s1.s!conj.mood 
        } ;
        Pl => table {
              Pos => imp.s!Pl!Pos ++ conj.s ++ s1.s!conj.mood ;
              Neg => imp.s!Pl!Neg ++ conj.s ++ s1.s!conj.mood 
        } 
      } 
    } ;
} 