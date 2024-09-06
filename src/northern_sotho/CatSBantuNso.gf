concrete CatSBantuNso of CatSBantu = open ResNso,Prelude,ParamX in {

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
    -- VAux 
    ConjN = {s : Str } ;
    -- ConjAdv
    -- IAdv

    Postdet = { s : Agr => Str } ;
    -- SubCl
    
}
