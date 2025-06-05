incomplete resource ConstructorsSBantu = open GrammarSBantu, SymbolSBantu, ParadigmsZul, ResZul in {

    oper

        mkUtt = overload {
            mkUtt : S -> Utt = UttS ;
            mkUtt : Imp -> Utt = \imp -> UttImpSg PPos imp ;
            mkUtt : Pol -> Imp -> Utt = UttImpSg ;
        } ;

        mkImp = overload {
            mkImp : VP -> Imp = ImpVP ;
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
            mkRS : RS -> Conj -> RS -> RS = SBantuConjRS ;
        } ;

        mkRSShort = overload {
            mkRSShort : VP -> RS = \vp -> UseRCl TPresTemp PPos (RelVPShort IdRP vp) ;
            mkRSShort : Temp -> VP -> RS = \tmp,vp -> UseRCl tmp PPos (RelVPShort IdRP vp) ;
            mkRSShort : Pol -> VP -> RS = \pol,vp -> UseRCl TPresTemp pol (RelVPShort IdRP vp) ;
            mkRSShort : Temp -> Pol -> VP -> RS = \tmp,pol,vp -> UseRCl tmp pol (RelVPShort IdRP vp) ;
        } ;

        mkCl = overload {
            mkCl : NP -> VP -> Cl = PredVP ;
            mkCl : NP -> V -> Cl = \np,v -> PredVP np (UseV v) ;
            mkCl : NP -> V2 -> NP -> Cl = \np,v,obj -> PredVP np (ComplV2 v obj) ;
            -- mkCl : NP -> Cl = PredNP
        } ;

        mkVP = overload {
            mkVP : V -> VP = UseV ;
            mkVP : NP -> VP = CopNP ;
            mkVP : Loc -> VP = CopLocative ;
            mkVP : AP -> VP = CopAP ;
            mkVP : VP -> Adv -> VP = AdvVP ;
        } ;

        assocVP = overload {
            assocVP : NP -> VP = CopNPAssoc ;
        } ;

        mkLoc = overload {
            mkLoc : LocAdv -> Loc = LocAdvLoc ;
        } ;

        mkVPStative = overload {
            mkVPStative : V -> VP = UseVStative ;
        } ;

        mkNP = overload {
            mkNP : N -> NP = \n -> DetCN (DetNum NumSg) (UseN n) ;
            mkNP : Det -> N -> NP = \det,n -> DetCN det (UseN n) ;
            mkNP : CN -> NP = \cn -> DetCN (DetNum NumSg) cn ;
            mkNP : CN -> RS -> NP = \cn,rs -> RelNP (DetCN (DetNum NumSg) cn) rs ;
            mkNP : NP -> RS -> NP = RelNP ;
            mkNP : Pron -> Postdet -> NP = PronPostdetNP ;
            mkNP : N -> NP -> NP = \n,np -> DetCN (DetNum NumSg) (PossNP (UseN n) np) ;
            mkNP : NP -> Conj -> NP -> NP = SBantuConjNP ;
        } ;

        mkCN = overload {
            mkCN : N -> CN = \n -> UseN n ;
            mkCN : Predet -> N -> CN = PredetN ;
            mkCN : N -> NP -> CN = \n,np -> PossNP (UseN n) np ;
            mkCN : CN -> NP -> CN = PossNP ;
        } ;

        possCN = overload {
            locCN : N -> NP -> CN = \n,np -> PossNPLoc (UseN n) np ;
            locCN : CN -> NP -> CN = PossNPLoc ;
        } ;

        emphCN = overload {
            emphCN : CN -> CN = EmphCN
        } ;

        locativisedNoun = overload {
            locativisedNoun : N -> LocAdv = \n -> LocativisedNounAdv (DetCN (DetNum NumSg) (UseN n)) ;
            locativisedNoun : CN -> LocAdv = \cn -> LocativisedNounAdv (DetCN (DetNum NumSg) cn) ;
            locativisedNoun : NP -> LocAdv = LocativisedNounAdv ;
        } ;

        mkPredet = overload {
            mkPredet : QuantPron -> Predet = QuantPredet ;
        } ;

        mkPostdet = overload {
            mkPostdet : QuantPron -> Postdet = QuantPostdet ;
        } ;

        mkAP = overload {
            mkAP : A -> AP = PositA ;
        } ;

        mkAdv = overload {
            mkAdv : A -> Adv = PositAdvAdj ;
            mkAdv : NP -> Adv = \np -> LocAdvAdv (LocativisedNounAdv np) ;
        } ;

        mkNumA = overload {
            mkNumA : Symb -> A = SymbA ;
        } ;

        mkSmallNumN = overload {
            mkSmallNumN : Symb -> N = SymbN_sub10 ;
        } ;

        mkNumN10 = overload {
            mkNumN10 : Symb -> N = SymbN_10 ;
        } ;

        mkNumN100 = overload {
            mkNumN100 : Symb -> N = SymbN_100 ;
        } ;

        mkNumN1000 = overload {
            mkNumN1000 : Symb -> N = SymbN_1000 ;
        } ;

        together_with = together_with_Conj ;
        and_with = with_Conj ;
        and = and_Conj ;

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