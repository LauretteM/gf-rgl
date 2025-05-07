incomplete resource ConstructorsSBantu = open GrammarSBantu in {

    oper

        mkRS = overload {
            mkRS : VP -> RS = \vp -> UseRCl TPresTemp PPos (RelVP IdRP vp) ;
        } ;

        mkRSShort = overload {
            mkRSShort : VP -> RS = \vp -> UseRCl TPresTemp PPos (RelVPShort IdRP vp) ;
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

}