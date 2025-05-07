concrete SentenceNso of Sentence = CatNso ** open Prelude,ResNso,ParamX in {

  flags optimize=all_subs ;

  lin

    PredVP np vp = {
      s = table {
          RedIndicCl => \\p,t => let 
              long_form = case vp.hasComp of {
                  True => False ;
                  False => True
               }
              in np.s!Absolute ++ vp.s!IndicCl!np.a!p!t!long_form ;
          RedSitCl => \\p,t => let 
              long_form = False ;
              in np.s!Absolute ++ vp.s!SitCl!np.a!p!t!long_form 
      } ;
      consubj_s = \\c,p => np.s!Absolute ++ vp.consubj_s!c!np.a!p        
    } ; 

    ImpVP vp = {
      s = table {
          Sg => table {
              Pos => vp.imp_s!Sg!Pos ;
              Neg => vp.imp_s!Sg!Neg
          } ;
          Pl => table {
              Pos => vp.imp_s!Pl!Pos ;
              Neg => vp.imp_s!Pl!Neg
          }    
      } 
    } ;

    UseCl t p cl = {
      s = table {
          IndicMS => t.s ++ p.s ++ cl.s!RedIndicCl!p.p!t.t ;
          SitMS => t.s ++ p.s ++ cl.s!RedSitCl!p.p!t.t ;
          SubjunctMS => case t.t of {
              PresTense => t.s ++ p.s ++ cl.consubj_s!SubjunctCl!p.p ;
              _ => nonExist
          } ;
          ConsecMS => case t.t of {
              PastTense => t.s ++ p.s ++ cl.consubj_s!ConsecCl!p.p ;
              _ => nonExist
          } 
      } ;
    } ;
    
    UseRCl t p rcl = {
      s = \\a => t.s ++ p.s ++ rcl.s!a!p.p!t.t
    } ;

    AdvS adv s = {
      s = \\ms => s.s!ms ++ adv.s
    } ;

}
