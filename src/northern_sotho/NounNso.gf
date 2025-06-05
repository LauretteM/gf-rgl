concrete NounNso of Noun = CatNso ** open ResNso, Prelude, ParamX in {

  flags optimize=all_subs ;

  lin
    DetCN det cn = {
      s = \\npform => det.s ++ cn.s!det.n!npform ; 
      a = Third cn.c det.n ;
      nt = cn.nt ;
      proDrop = False
    } ; 

    UsePron pron = { 
      s = pron.s ; 
      a = pron.a ; 
      nt = HumanN ;
      proDrop = pron.proDrop
    } ;

    AdvNP np adv = {
      s = \\nform => np.s!nform ++ adv.s ;
      a = np.a ;
      nt = np.nt ;
      proDrop = False ; -- probably right?
    } ;

    RelNP np rs = {
      s = \\npform => np.s!npform ++ rs.s!np.a ;
      a = np.a ;
      nt = np.nt ;
      proDrop = np.proDrop 
    } ;

    NumSg = { s = [] ; n = Sg } ;
    NumPl = { s = [] ; n = Pl } ;

    UseN n = n ;

    PossNP cn np = {
      s = \\num, npform => cn.s!num!npform ++ (possConc cn.c num) ++ np.s!Possessive ;   
      c = cn.c ; empty =[] ; 
      nt = cn.nt 
    } ;

    AdjCN ap cn = {
      s = case ap.at of {
        EnumA => \\num,npform => cn.s!num!npform ++ subjConcLookup!(Third cn.c num)!SC1 ++ ap.s!AF1 ;
        AdjA => \\num,npform => cn.s!num!npform ++ compl_ap ap (Third cn.c num)
      } ; 
      c = cn.c ;
      nt = cn.nt 
    } ;

}
