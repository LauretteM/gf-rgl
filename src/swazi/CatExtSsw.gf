concrete CatExtSsw of CatExt = open ResSsw,Prelude,ParamX in {

  lincat
    Loc = {
      s : CType => Agr => Polarity => BasicTense => Str ;
      imp_s : Number => Polarity => Str ;
      inf_s : NForm => Polarity => Str ;
      consubj_s : DMType => Agr => Polarity => Str
    } ;
    LocN = { s : Str } ;
    LocAdv = { s : Str ; reqLocS : Bool } ;
    QuantPron = { s : Agr => Str } ;
    VAux = { s : Str ; at : AuxType } ;
    ConjN = { s : RInit => Str ; fix : Bool } ;
    IAdj = { s : AForm => Str } ;
    -- INAdv = { s : Str ; postIAdv : Bool } ;

    Postdet = { s : Agr => Str } ;
    SubCl = { s : Polarity => BasicTense => Str } ;

}
