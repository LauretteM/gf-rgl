incomplete resource ConstructorsSBantu = open GrammarSBantu in {

    oper

        mkRS = overload {
            mkRS : VP -> RS = \vp -> UseRCl TPresTemp PPos (RelVP IdRP vp) ;
            mkRS : Temp -> VP -> RS = \tmp,vp -> UseRCl tmp PPos (RelVP IdRP vp) ;
            mkRS : Pol -> VP -> RS = \pol,vp -> UseRCl TPresTemp pol (RelVP IdRP vp) ;
            mkRS : Temp -> Pol -> VP -> RS = \tmp,pol,vp -> UseRCl tmp pol (RelVP IdRP vp) ;
        } ;

        mkRSShort = overload {
            mkRSShort : VP -> RS = \vp -> UseRCl TPresTemp PPos (RelVPShort IdRP vp) ;
        } ;

        mkVP = overload {
            mkVP : V -> VP = UseV ;
            mkVP : NP -> VP = CopNP ;
        } ;

        mkStativeVP = overload {
            mkStativeVP : V -> VP = UseVStative ;
        } ;

        mkNP = overload {
            mkNP : N -> NP = \n -> DetCN (DetNum NumSg) (UseN n) ;
            mkNP : NP -> RS -> NP = RelNP ;
        } ;

        mkCN = overload {
            mkCN : N -> CN = \n -> UseN n ;
        } ;

        aSg_Det = DetNum NumSg ;

        presentTense = TPresTemp ;
        pastTense = TPastTemp ;

        positivePol = PPos ;
        negativePol = PNeg ;

}