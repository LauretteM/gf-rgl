concrete SentenceSBantuNso of SentenceSBantu = CatNso,CatSBantuNso ** open ResNso, Prelude, ParamX in {

  lin

    ExistNP np = {s = \\_ => "ke" ++ np.s!Absolute} ;

    GreetSg = {
      s = "dumela"
    } ;
    GreetPl = {
      s = "dumelang"
    } ;

-- SConjS : S -> Conj -> S -> S ; -- he helps the aunt before she cries
    SConjS s1 conj s2 = {
      s = table {
        IndicMS => s1.s!IndicMS ++ conj.s ++ s2.s!conj.mood ;
        SitMS => s1.s!SitMS ++ conj.s ++ s2.s!conj.mood ;
        SubjunctMS => s1.s!SubjunctMS ++ conj.s ++ s2.s!conj.mood ;
        ConsecMS => s1.s!ConsecMS ++ conj.s ++ s2.s!conj.mood 
      }
    } ;

-- ImpConjS : Imp -> Conj -> S -> S ; -- help the aunt before she cries 
-- ImpConjS : Imp -> Conj -> S -> Imp ; -- help the aunt before she cries 

    ImpConjS imp conj s1 = {
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