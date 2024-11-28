concrete QuestionXho of Question = CatXho ** open ResXho, Prelude, ParamX in {

  flags optimize=all_subs ;

  lin

    QuestCl cl = {
      s = \\p,t => cl.s!p!t ;
      qword_pre = [] ;
      qword_post = variants { QUESTION_NA ; [] } ;
    } ; -- guessing this will work...

    QuestIAdv iadv cl = qcl_iadv cl iadv ;

    QuestIComp icomp np = {
      s = \\p,t,s =>
      let
        vform = VFIndic MainCl p t ;
        pre_icomp = case icomp.postIComp of {
          False => (icomp_pref vform np.agr) ++ icomp.s ;
          True => []
        } ;
        post_icomp = case icomp.postIComp of {
          True => (icomp_pref vform np.agr) ++ icomp.s ;
          False => []
        }
      in
          pre_icomp ++ (np.s!NFull) ++ post_icomp ;
      qword_pre = [] ;
      qword_post = []
    } ;

  oper
    -- qcl_iadv : Cl -> CatXho.IAdv -> {s : Polarity => ZTense => DMood => Str ; potqcl : Polarity => DMood => Str ; qword_pre : Str ; qword_post : Str } = \cl,iadv -> {
    --   s = case iadv.postIAdv of {
    --     False => \\p,t,m => cl.s!p!t!m ++ iadv.s ++ cl.advs ;
    --     True => \\p,t,m => cl.s!p!t!m ++ cl.advs
    --   } ;
    --   potqcl = cl.potcl ;
    --   qword_pre = case iadv.postIAdv of {
    --     False => [] ;
    --     True => iadv.s
    --     } ;
    --   qword_post = []
    -- } ;

    qcl_iadv : Cl -> CatXho.IAdv -> {s : Polarity => BasicTense => Aspect => Str ; qword_pre : Str ; qword_post : Str } = \cl,iadv -> {
      s = \\p,t,s => cl.s!p!t!s ;
      qword_pre = case iadv.postIAdv of {
        True => [] ;
        False => iadv.s
        } ;
      qword_post = case iadv.postIAdv of {
        False => [] ;
        True => iadv.s
        } ;
    } ;

}
