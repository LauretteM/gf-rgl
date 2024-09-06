concrete RelativeNso of Relative = CatNso ** open ResNso,Prelude,ParamX in {

  flags optimize=all_subs ;

  lin

    RelVP rp vp = {
      s = \\a,p,t => rp.s!a ++ vp.s!RelCl!a!p!t!False
    } ;

    IdRP = {
      s = abs_pron ;
    } ;
}
