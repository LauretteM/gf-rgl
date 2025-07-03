concrete CatSBantuSsw of CatSBantu = open ResSsw,Prelude,ParamX in {

  lincat
    Loc = {
      s : CType => Agr => Polarity => BasicTense => Str ;
      imp_s : Number => Polarity => Str ;
      inf_s : NForm => Polarity => Str ;
      consubj_s : DMType => Agr => Polarity => Str
    } ;
    LocN = { s : Str } ;
    LocAdv = { s : Str ; reqLocS : Bool } ;
    QuantPron = { s : Agr => Str ; lemma : Str } ;
    VAux = { s : Str ; at : AuxType } ;
    ConjN = { s : RInit => Str ; fix : Bool } ;
    ConjAdv = { s : Str } ;
    IAdj = { s : AForm => Str } ;
    -- INAdv = { s : Str ; postIAdv : Bool } ;

    Postdet = { s : Agr => Str } ;
    SubCl = { s : Polarity => BasicTense => Str } ;

    linref
      Loc = \loc -> loc.s!MainCl!(Third C15 Sg)!Pos!PresTense ;
      QuantPron = \q -> q.lemma ;
      ConjN = \c -> c.s!RC ;
      Postdet = \p -> p.s!(Third C15 Sg) ;

}
