concrete RelativeXho of Relative = CatXho ** open ResXho,Prelude,ParamX in {

  flags optimize=all_subs ;

  lin

    RelVP rp vp = {
      s = \\a,p,t,s =>
        let
          reqLF = case vp.hasComp of { -- doesn't matter for copulative VPs
              True => False ;
              False => True
          } ;
        in
        rp.s ++ vp.s!RelCl!a!p!t!s!reqLF ++ vp.iadv ++ vp.advs 
    } ;

    IdRP = { s = [] } ;

}
