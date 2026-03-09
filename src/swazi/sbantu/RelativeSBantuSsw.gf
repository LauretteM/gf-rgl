concrete RelativeSBantuSsw of RelativeSBantu = CatSsw ** open ResSsw,Prelude,ParamX in {

  flags optimize=all_subs ;

  lin

    RelVPShort rp vp = case vp.vptype of {
      CopIdent => rcl_with_id_cop_predicate_short rp vp ;
      CopAssoc => rcl_with_ass_cop_predicate_short rp vp ;
      CopEq => rcl_with_eq_cop_predicate_short rp vp ;
      CopDescr => rcl_with_descr_predicate_short rp vp ;
      _ => rcl_with_verb_predicate_short rp vp
    } ;

    SBantuConjRS rs1 conj rs2 = {
      s = \\agr => rs1.s!agr ++ conj.s!agr ++ rs2.s!agr
    } ;

    oper

      rcl_with_verb_predicate_short : RP -> VP -> { s : Agr => Polarity => BasicTense => Aspect => Str } = \rp,vp -> {
        s = \\a,p,t,s =>
          let
            vform = VFIndic RelCl p t ;
            rcform = RelC ;
          in
            -- naively only took out the subject
            rp.s
            ++ vp.s!RelCl!a!p!t!s!False
            ++ vp.iadv
            ++ vp.comp
            ++ vp.advs
      } ;

      rcl_with_ass_cop_predicate_short : RP -> VP -> { s : Agr => Polarity => BasicTense => Aspect => Str } = \rp,vp -> {
        s = \\a,p,t,s => nonExist
      } ;

      rcl_with_id_cop_predicate_short : RP -> VP -> { s : Agr => Polarity => BasicTense => Aspect => Str } = \rp,vp -> {
        s = \\a,p,t,s => nonExist
      } ;

      rcl_with_ass_cop_predicate_short : RP -> VP -> { s : Agr => Polarity => BasicTense => Aspect => Str } = \rp,vp -> {
        s = \\a,p,t,s => nonExist
      } ;

      rcl_with_eq_cop_predicate_short : RP -> VP -> { s : Agr => Polarity => BasicTense => Aspect => Str } = \rp,vp -> {
        s = \\a,p,t,s => nonExist
      } ;

      rcl_with_descr_predicate_short : RP -> VP -> { s : Agr => Polarity => BasicTense => Aspect => Str } = \rp,vp -> {
      s = \\a,p,t,s => nonExist
        } ;

}
