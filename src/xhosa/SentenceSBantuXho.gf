concrete SentenceSBantuXho of SentenceSBantu = CatXho,CatSBantuXho ** open ResXho, Prelude, ParamX in {

  lin

    ExistNP np = {
      s = table {
        SInd => let
          cp = (id_cop_pref np.agr) ; -- ng-
          cop_base = case np.isPron of {
            True => np.s!NReduced ;
            False => np.s!NFull -- umfundi
          }
        in
          case np.proDrop of {
            False => cp ++ cop_base ;
            True => nonExist -- "*" ++ cp ++ cop_base
          } ;
        _ => nonExist -- "* exist consec/subjunct"
      }
    } ;

    ExistAppos np1 np2 = {
      s = table {
        SInd => let
          cp = (id_cop_pref np1.agr) ; -- ng-
          cop_base = np2.s!NFull -- umfundi
        in
          case np2.proDrop of {
            False => np1.s!NFull ++ cp ++ cop_base ;
            True => nonExist -- "*" ++ np1.s!NFull ++ cp ++ cop_base
          } ;
        _ => nonExist -- "* exist consec/subjunct"
      }
    } ;

    GreetSg = {
      s = "sawubona"
    } ;
    GreetPl = {
      s = "sanibonani"
    } ;

    UseClProg t p cl = {
      s = table {
        SInd => t.s ++ p.s ++ cl.s ! p.p ! t.t ! Prog ;
        SSub => case t.t of {
          PresTense => t.s ++ p.s ++ cl.consubj_s ! SubjCl ! p.p ;
          _ => nonExist -- "*" ++ t.s ++ p.s ++ cl.consubj_s ! SubjCl ! p.p
        } ;
        SConsec => case t.t of {
          PresTense => t.s ++ p.s ++ cl.consubj_s ! ConsecCl ! p.p ;
          _ => nonExist -- "*" ++ t.s ++ p.s ++ cl.consubj_s ! ConsecCl ! p.p
        } 
      }
    } ;

    UseClExcl t p cl = {
      s = table {
        SInd => t.s ++ p.s ++ cl.s ! p.p ! t.t ! Excl ;
        SSub => case t.t of {
          PresTense => t.s ++ p.s ++ cl.consubj_s ! SubjCl ! p.p ;
          _ => nonExist -- "*" ++ t.s ++ p.s ++ cl.consubj_s ! SubjCl ! p.p
        } ;
        SConsec => case t.t of {
          PresTense => t.s ++ p.s ++ cl.consubj_s ! ConsecCl ! p.p ;
          _ => nonExist -- "*" ++ t.s ++ p.s ++ cl.consubj_s ! ConsecCl ! p.p
        } 
      }
    } ;

    UseRClProg temp pol rcl = {
      s = \\a => temp.s ++ pol.s ++ rcl.s!a!pol.p!temp.t!Prog ;
    } ;

    UseRClExcl temp pol rcl = {
      s = \\a => temp.s ++ pol.s ++ rcl.s!a!pol.p!temp.t!Excl 
    } ;

    SConjS s1 conj s2 = {
      s = \\st => s1.s!st ++ conj.s!RC ++ s2.s!st 
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
