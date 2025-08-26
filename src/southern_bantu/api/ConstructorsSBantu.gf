incomplete resource ConstructorsSBantu = open GrammarSBantu in {

    oper

        mkUtt = overload {
            mkUtt : S -> Utt = UttS ;
            mkUtt : Imp -> Utt = \imp -> UttImpSg PPos imp ;
            mkUtt : VP -> Utt = \vp -> UttImpSg PPos (ImpVP vp) ;
            mkUtt : Pol -> Imp -> Utt = UttImpSg ;
        } ;

        subjUtt : S -> Utt = SubjunctS ;

        mkImp = overload {
            mkImp : VP -> Imp = ImpVP ;
        } ;

        mkS = overload {
            mkS : Cl -> S = \cl -> UseCl TPresTemp PPos cl ;
            mkS : Temp -> Cl -> S = \tmp,cl -> UseCl tmp PPos cl ;
            mkS : Pol -> Cl -> S = \pol,cl -> UseCl TPresTemp pol cl ;
            mkS : Temp -> Pol -> Cl -> S = UseCl ;
            mkS : Adv -> S -> S = AdvS ;
            mkS : NP -> S = ExistNP ;
            mkS : NP -> VP -> S = \np,vp -> UseCl TPresTemp PPos (PredVP np vp) ;
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
            mkVP : V2 -> NP -> VP = ComplV2 ;
            mkVP : NP -> VP = CopNP ;
            mkVP : Loc -> VP = CopLocative ;
            mkVP : AP -> VP = CopAP ;
            mkVP : VP -> Adv -> VP = AdvVP ;
            mkVP : QuantPron -> VP = CopQuant ;
            mkVP : VV  -> VP -> VP = ComplVV ;
            mkVP : V2V -> NP -> VP -> VP = ComplV2V ;
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
            mkNP : Det -> CN -> NP = DetCN ;
            mkNP : CN -> NP = \cn -> DetCN (DetNum NumSg) cn ;
            mkNP : CN -> RS -> NP = \cn,rs -> RelNP (DetCN (DetNum NumSg) cn) rs ;
            mkNP : NP -> RS -> NP = RelNP ;
            mkNP : Pron -> Postdet -> NP = PronPostdetNP ;
            mkNP : N -> NP -> NP = \n,np -> DetCN (DetNum NumSg) (PossNP (UseN n) np) ;
            mkNP : NP -> Conj -> NP -> NP = SBantuConjNP ;
            mkNP : Pol -> VP -> NP  = Deverb15 ;
            mkNP : VP -> NP = \vp -> Deverb15 PPos vp ;
            mkNP : NP -> Adv -> NP = AdvNP ;
            mkNP : Pron -> NP = UsePron ;
            mkNP : Pron -> CN -> NP = \pron,cn -> DetCN (DetNum NumSg) (PossNP cn (UsePron pron)) ;
        } ;

        mkCN = overload {
            mkCN : N -> CN = \n -> UseN n ;
            mkCN : Predet -> N -> CN = PredetN ;
            mkCN : N -> NP -> CN = \n,np -> PossNP (UseN n) np ;
            mkCN : CN -> NP -> CN = PossNP ;
            mkCN : AP -> CN  -> CN = AdjCN ;
            mkCN : A -> N -> CN = \a,n -> AdjCN (PositA a) (UseN n) ;
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
            locativisedNoun : LocAdv -> NP -> LocAdv = LocAdvNP ;
        } ;

        mkPredet = overload {
            mkPredet : QuantPron -> Predet = QuantPredet ;
            mkPredet : QuantPron -> Quant -> Predet = QuantDemPredet ;
        } ;

        mkPostdet = overload {
            mkPostdet : QuantPron -> Postdet = QuantPostdet ;
        } ;

        mkDet = overload {
            mkDet : Num -> Det = DetNum ;
        } ;

        mkAP = overload {
            mkAP : A -> AP = PositA ;
            mkA : AdA -> AP -> AP = AdAP ;
        } ;

        mkAdv = overload {
            mkAdv : A -> Adv = PositAdvAdj ;
            mkAdv : LocAdv -> Adv = LocAdvAdv ;
            mkAdv : NP -> Adv = \np -> LocAdvAdv (LocativisedNounAdv np) ;
        } ;

        instrumentalAdv = InstrAdv ;

        directAdv = overload {
            directAdv : NP -> Adv = NPAdv ;
        } ;

        insideLocAdv = overload {
            insideLocAdv : LocAdv -> LocAdv = InsideLocAdv ;
            insideLocAdv : NP -> LocAdv = \np -> InsideLocAdv (LocativisedNounAdv np) ;
        } ;

        loanPlaceNameN = overload {
            loanPlaceNameN : Symb -> N = SymbLoanPlaceName ;
        } ;

        symbNumA = overload {
            symbNumA : Symb -> A = SymbA ;
        } ;

        symbSmallNumN = overload {
            symbSmallNumN : Symb -> N = SymbN_sub10 ;
        } ;

        symbNumN10 = overload {
            symbNumN10 : Symb -> N = SymbN_10 ;
        } ;

        symbNumN100 = overload {
            symbNumN100 : Symb -> N = SymbN_100 ;
        } ;

        symbNumN1000 = overload {
            symbNumN1000 : Symb -> N = SymbN_1000 ;
        } ;

        -- together_with = together_with_ConjN ;
        -- and_with_N = with_ConjN ;
        -- and = and_Conj ;
        -- and_with = with_Conj ;

        -- all = all_QuantPron ;
        -- only = only_QuantPron ;
        -- this = this_Quant ;

        -- here = here_Adv ;

        aSg_Det = DetNum NumSg ;
        aPl_Det = DetNum NumPl ;

        sg_Num = NumSg ;
        pl_Num = NumPl ;

        presentTense = TPresTemp ;
        pastTense = TPastTemp ;
        futureTense = TFutTemp ;
        remotePastTense = TRemPastTemp ;
        remoteFutureTense = TRemFutTemp ;

        positivePol = PPos ;
        negativePol = PNeg ;

        i_Pronoun = i_Pron ;
        i_drop_Pronoun = ProDrop i_Pron ;

        he_Pronoun = he_Pron ;
        he_drop_Pronoun = ProDrop he_Pron ;

}