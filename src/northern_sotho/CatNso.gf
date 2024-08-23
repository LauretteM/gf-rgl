concrete CatNso of Cat = CommonX - [Temp,Tense,Adv,IAdv,SC] **
  open ResNso, Prelude, ParamX in {

  flags optimize=all_subs ;

  lincat

    -- for now, no anteriority
    Temp = {s : Str ; t : BasicTense};

-- Tensed/Untensed
    S = { s : MoodS => Str } ;
    RS = { s : Agr => Str } ;

-- Sentence

    Cl = {
      s : ReducedTensedCl => Polarity => BasicTense => Str ;
      consubj_s :  UntensedCl => Polarity => Str
    } ;
--     ClSlash = {
--       s : ResNso.Tense => Anteriority => CPolarity => Order => Str ;
--       c2 : Str
--       } ;
    Imp = { s : Number => Polarity => Str } ;

-- Question


-- Relative

    RCl = {s : Agr => Polarity => BasicTense => Str } ;
    RP = { s : Agr => Str ; dist : Distance } ;

-- Verb

    VP = {
        s : TensedCl => Agr => Polarity => BasicTense => Bool => Str ;
        inf_s : Polarity => Str ;
        imp_s : Number => Polarity => Str ;
        consubj_s : UntensedCl => Agr => Polarity => Str ;
        hasComp : Bool -- indicates whether to use long form
    } ;

-- Adjective

    AP = { s : AForm => Str } ;

-- Noun

    CN = {s : Number => NPForm => Str ; c : ClassGender ; nt : NType} ;

    NP = {
      s : NPForm => Str ;
      a : Agr ;
      nt : NType ;
      isPron : Bool ;
      proDrop : Bool 
    } ; 

    -- Pronoun
    Pron = {s : NPForm => Str ; a : Agr ; empty : Str ; proDrop : Bool } ;

    Det = { s : Str ; n : Number } ;
    Predet = { s : Agr => Str } ;
    Num  = {s: Str ; n : Number} ;
    Quant = { s : Agr => Str ; dist : Distance } ;

-- Structural

    Conj = {s : Str ; mood : MoodS } ;

-- Open lexical classes, e.g. Lexicon
    V, V2, VV, V2V, VS = {s : VPreForm => VSufForm => Str ; initLab : Bool ; syl : Syl } ;

    A = { s : AForm => Str } ;

    N = {s : Number => NPForm => Str ; c : ClassGender ; nt : NType} ;

    Adv = { s : Str } ;

}
