concrete CatAfr of Cat = CommonX - [Adv] ** open ResAfr, Prelude in {

  flags optimize=all_subs ;

  lincat

-- Tensed/Untensed

    S  = {s : Order => Str} ;
    QS = { s : Order => Str ; o : Order ; qw : Str ; hasQw : Bool } ;
    -- RS = {s : Gender => Number => Str} ;
    -- SSlash = {s : Order => Str} ** {c2 : Preposition} ;

-- Sentence

    Cl = { s : TTense => TPol => Order => Str } ;
    -- ClSlash = Clause ** {c2 : Preposition} ;
    -- Imp = {s : TPol => ImpForm => Str} ;

-- Question

    QCl = { s : TTense => TPol => Order => Str ; o : Order ; qw : Str ; hasQw : Bool } ;
    IP = { s : Str } ; -- {s : NPCase => Str ; n : Number} ;
    IComp  = {s : Agr => Str} ;
    IDet   = {s : Gender => Str ; n : Number} ;
    IQuant = {s : Number => Gender => Str} ;

-- Relative

    -- RCl = {s : ResAfr.Tense => Anteriority => TPol => Gender => Number => Str} ;
    -- RP = {s : Gender => Number => Str ; a : RAgr} ;

-- Verb

    VP = {
        v  : Verb ;
        n2a, n2b, subCl : Str ; -- two slots for object noun phrase
        adv : Str ; -- vinnig
        vIsBe : Bool ;
        filled : Bool ; -- insert first "nie" if sentence polarity is negative, because certain slots are filled (hy loop nie/hy loop *nie* goed nie)
        nword : Bool ; -- the vp contains the equivalent of an nword, which forces the second "nie"
        compV : VForm => Str
    } ;
    -- VPSlash = ResAfr.VP ** {c2 : Preposition} ;
    -- Comp = {s : Agr => Str} ;

-- Adjective

    -- AP = {s : AForm => Str ; isPre : Bool} ;
    AP = { s : AForm => Str } ;

-- Noun

    -- CN = {s : Adjf => NForm => Str ; g : Gender} ;
    CN = { s : Number => Str ; g : Gender } ;
    -- NP = {s : NPCase => Str ; a : Agr ; isPron : Bool} ;
    NP = { s : Case => Str ; a : Agr ; isPron : Bool ; p : TPol } ;
    -- Pron = Pronoun ;

    -- Det = {s,sp : Gender => Str ; n : Number ; a : Adjf} ;
    Det = {s : Str ; n : Number ; p : TPol } ;
    -- Quant = {
    --   s  : Bool => Number => Gender => Str ;
    --   sp : Number => Gender => Str ;
    --   a  : Adjf
    --   } ;
    -- Predet = {s : Number => Gender => Str} ;
    -- Num = {s : Str ; n : Number ; isNum : Bool} ;
    -- Card = {s : Gender => Case => Str ; n : Number} ;
    -- Ord = {s : AForm => Str} ;

-- Numeral

    -- Numeral = {s : CardOrd => Str ; n : Number } ;
    -- Digits = {s : CardOrd => Str ; n : Number } ;

-- Structural

    -- Conj = {s1,s2 : Str ; n : Number} ;
    Conj = { s : Str } ;
    -- Subj = {s : Str} ;
    Prep = {s : Str} ;

-- Open lexical classes, e.g. Lexicon

    V = ResAfr.Verb ;
    V2 = { v : ResAfr.Verb ; c : Str ; hasC : Bool } ;
    VV = ResAfr.Verb ;
    -- V2A, V2S, V2Q = VVerb ** {c2 : Preposition} ;
    -- V2V = VVerb ** {c2 : Preposition ; isAux : Bool} ;
    -- V3 = VVerb ** {c2, c3 : Preposition} ;
    VS = { v : ResAfr.Verb ; c : Str } ;
    VQ = { v : ResAfr.Verb ; c : Str } ;

    A = { s : AForm => Str } ;
    -- A2 = Adjective ** {c2 : Preposition} ;

    N = { s : Number => Str ; g : Gender } ;
    -- N2 = {s : NForm => Str ; g : Gender} ** {c2 : Preposition} ;
    -- N3 = {s : NForm => Str ; g : Gender} ** {c2,c3 : Preposition} ;
    PN = { s : Str ; a : Agr } ;

    -- Not CommonX
    Adv = { s : Str ; p : TPol } ; -- polarity: altyd/nooit

}
