concrete SymbolSBantuNso of SymbolSBantu = CatNso, SymbolNso ** open ResNso, ParamX, Prelude in {

    lin

        SymbN s = nonExist_N ;
        SymbA s = nonExist_A ;

        SymbN_sub10 s = nonExist_N ;
        SymbN_10 s = nonExist_N ;
        SymbN_100 s = nonExist_N ;
        SymbN_1000 s = nonExist_N ;

        -- SymbN_sub10 symb = mkSymbNumber symb.s C7_8 ;
        -- SymbN_10 symb = mkSymbNumber symb.s C5_6 ;
        -- SymbN_100 symb = mkSymbNumber symb.s C5_6 ;
        -- SymbN_1000 symb = mkSymbNumber symb.s C9_10 ;


    -- oper
    --     mkSymbNumber : Str -> ClassGender -> { s : Number => NForm => Str ; c : ClassGender ; empty : Str ; lemma : Str } = \symb,c -> {
    --         s = case c of {
    --             C7_8 => table {
    --                     _ => table {
    --                         NFull => "isi-" ++BIND++ symb ;
    --                         _ => "si-" ++BIND++ symb 
    --                     } 
    --                 } ;
    --             C9_10 => table {
    --                     Sg => table {
    --                         NFull => "in-" ++BIND++ symb ;
    --                         _ => "-n" ++BIND++ symb 
    --                     } ;
    --                     Pl => table {
    --                         NFull => "izin-" ++BIND++ symb ;
    --                         _ => "zin-" ++BIND++ symb
    --                     }
    --                 } ;
    --             C5_6 => table {
    --                     Sg => table {
    --                         NFull => "i-" ++BIND++ symb ;
    --                         _ => "-" ++BIND++ symb 
    --                     } ;
    --                     Pl => table {
    --                         NFull => "ama-" ++BIND++ symb ;
    --                         _ => "ma-" ++BIND++ symb 
    --                     }
    --                 } ;
    --             _ => table { -- acts like C17
    --                     _ => table {
    --                         NFull => "uku-" ++BIND++ symb ;
    --                         _ => "ku-" ++BIND++ symb 
    --                     }
    --                 }
    --             } ;
    --         c = c ;
    --         empty = [] ;
    --         lemma = symb
    --     } ;
}