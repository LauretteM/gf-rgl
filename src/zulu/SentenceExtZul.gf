concrete SentenceExtZul of SentenceExt = CatZul,CatExtZul ** open ResZul, Prelude, ParamX in {

  lin

    ExistNP np = {
      s = let
          cp = (id_cop_pref np.agr) ; -- ng-
          cop_base = np.s!NFull -- umfundi
        in
          case np.proDrop of {
            False => cp ++ cop_base ;
            True => "*" ++ cp ++ cop_base
          }
    } ;
    GreetSg = {
      s = "sawubona"
    } ;
    GreetPl = {
      s = "sanibonani"
    } ;

    ExtConjS s1 conj s2 = {
      s = case conj.fix of {
        False => s1.s ++ conj.s!RC ++ s2.s ;
        True => s1.s ++ conj.s!RC ++BIND++ s2.s -- this selection of RC is a short cut
      }
    } ;

    -- IAdvQS np iadv = {
    --   s = case np.proDrop of {
    --     True => np.empty ;
    --     False => np.s ! Full ++ np.desc
    --     } ;
    --   qword_pre = case iadv.postIAdv of {
    --     False => let
    --               vform = VFIndic Princ Pos PresTense Null
    --             in
    --               (subjConc vform np.agr False) ++ iadv.s ;
    --     True => []
    --   } ;
    --   qword_post = case iadv.postIAdv of {
    --     True => let
    --               vform = VFIndic Princ Pos PresTense Null
    --             in
    --               (subjConc vform np.agr False) ++ iadv.s ;
    --     False => []
    --   } ;
    -- } ;

    -- AdvQCl adv qcl = {
    --   s = \\p,t,m => qcl.s!p!t!m ++ adv.s ;
    --   potqcl = \\p,m => qcl.potqcl!p!m ++ adv.s ;
    --   qword_pre = qcl.qword_pre ;
    --   qword_post = qcl.qword_post
    -- } ;

    -- AdvQS adv qs = { s = adv.s ++ qs.s ; qword_pre = [] ; qword_post = [] } ;
}
