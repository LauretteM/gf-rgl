concrete NumeralExtZul of NumeralExt = CatZul, CatExtZul, ResZul, Prelude,
    ParamX ** {

    lin

        NumeralAP s = {
            s = \\_ => "-" ++BIND++ s.s ;
            empty = [] ;
            t = RelType
        } ;
        
        NumeralNP s = {
            empty = [] ;
            s = table {
                NFull => "i-" ++BIND++ s.s ;
                _ => "-" ++BIND++ s.s 
            } ;
            agr = Third C5_6 Sg ;
            i = RC ;
            proDrop = False ; -- used when NP is object
            isPron = False ; -- used to choose correct between Full/Reduced
            heavy = True -- has object/adv/qword
        } ;
}