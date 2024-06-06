concrete CatExtNso of CatExt = open ResNso,Prelude,ParamX in {

  lincat
    Loc = {
      s : TensedCl => Agr => Polarity => BasicTense => Str ; 
      inf_s : Polarity => Str  ;
      imp_s : Number => Polarity => Str ;
      consubj_s : UntensedCl => Agr => Polarity => Str
    } ;
    LocN = {s : Str ; c : ClassGender } ;
    LocAdv = { s : Str } ;
    QuantPron = { s : Agr => Str } ;

    Postdet = { s : Agr => Str } ;

}
