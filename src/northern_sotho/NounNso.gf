concrete NounNso of Noun = CatNso ** open ResNso, Prelude, ParamX in {

  flags optimize=all_subs ;

  lin
    DetCN det cn = {
      s = \\npform => det.s ++ cn.s!det.n!npform ; 
      a = Third cn.c det.n ;
      nt = cn.nt ;
      isPron = False ;
      proDrop = False
    } ; 

    UsePron pron = { 
      s = pron.s ; 
      a = pron.a ; 
      nt = HumanN ;
      isPron = True ;
      proDrop = pron.proDrop
    } ;

    AdvNP np adv = {
      s = \\nform => np.s!nform ++ adv.s ;
      a = np.a ;
      nt = np.nt ;
      proDrop = False ; -- probably right?
      isPron = np.isPron ;
    } ;

    RelNP np rs = {
      s = \\npform => np.s!npform ++ rs.s!np.a ;
      a = np.a ;
      nt = np.nt ;
      isPron = np.isPron ;
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
      s = \\num,npform => cn.s!num!npform ++ compl_ap ap (Third cn.c num) ; 
      c = cn.c ;
      nt = cn.nt 
    } ;

}
