incomplete resource ConstructorsSBantu = open GrammarSBantu in {

    oper

        mkUtt = overload {
            mkUtt : S -> Utt = UttS ;
            mkUtt : Imp -> Utt = \imp -> UttImpSg PPos imp ;
            mkUtt : Pol -> Imp -> Utt = UttImpSg ;
        } ;

        mkS = overload {
            mkS : Cl -> S = \cl -> UseCl TPresTemp PPos cl ;
            mkS : Temp -> Cl -> S = \tmp,cl -> UseCl tmp PPos cl ;
            mkS : Pol -> Cl -> S = \pol,cl -> UseCl TPresTemp pol cl ;
            mkS : Temp -> Pol -> Cl -> S = UseCl ;
            mkS : Adv -> S -> S = AdvS ;
        } ;

        mkRS = overload {
            mkRS : VP -> RS = \vp -> UseRCl TPresTemp PPos (RelVP IdRP vp) ;
            mkRS : Temp -> VP -> RS = \tmp,vp -> UseRCl tmp PPos (RelVP IdRP vp) ;
            mkRS : Pol -> VP -> RS = \pol,vp -> UseRCl TPresTemp pol (RelVP IdRP vp) ;
            mkRS : Temp -> Pol -> VP -> RS = \tmp,pol,vp -> UseRCl tmp pol (RelVP IdRP vp) ;
        } ;

        mkRSShort = overload {
            mkRSShort : VP -> RS = \vp -> UseRCl TPresTemp PPos (RelVPShort IdRP vp) ;
            mkRSShort : Temp -> VP -> RS = \tmp,vp -> UseRCl tmp PPos (RelVPShort IdRP vp) ;
            mkRSShort : Pol -> VP -> RS = \pol,vp -> UseRCl TPresTemp pol (RelVPShort IdRP vp) ;
            mkRSShort : Temp -> Pol -> VP -> RS = \tmp,pol,vp -> UseRCl tmp pol (RelVPShort IdRP vp) ;
        } ;

        mkCl = overload {
            mkCl : NP -> VP -> Cl = PredVP ;
        } ;

        mkVP = overload {
            mkVP : V -> VP = UseV ;
            mkVP : NP -> VP = CopNP ;
            mkVP : Loc -> VP = CopLocative ;
        } ;

        mkLoc = overload {
            mkLoc : LocAdv -> Loc = LocAdvLoc ;
        } ;

        mkVPStative = overload {
            mkVPStative : V -> VP = UseVStative ;
        } ;

        mkNP = overload {
            mkNP : N -> NP = \n -> DetCN (DetNum NumSg) (UseN n) ;
            mkNP : NP -> RS -> NP = RelNP ;
        } ;

        mkCN = overload {
            mkCN : N -> CN = \n -> UseN n ;
        } ;

        locativisedNoun = overload {
            locativisedNoun : N -> LocAdv = \n -> LocativisedNounAdv (DetCN (DetNum NumSg) (UseN n)) ;
            locativisedNoun : NP -> LocAdv = LocativisedNounAdv ;
        } ;

        aSg_Det = DetNum NumSg ;
        aPl_Det = DetNum NumPl ;

        presentTense = TPresTemp ;
        pastTense = TPastTemp ;
        futureTense = TFutTemp ;
        remotePastTense = TRemPastTemp ;
        remoteFutureTense = TRemFutTemp ;

        positivePol = PPos ;
        negativePol = PNeg ;

}