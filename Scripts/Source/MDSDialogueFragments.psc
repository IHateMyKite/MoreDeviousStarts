Scriptname MDSDialogueFragments extends TopicInfo Hidden

MoreDSmain _DSmain
MoreDSmain Property DSmain
    MoreDSmain Function Get()
        if !_DSmain
            _DSmain = Game.GetFormFromFile(0x005901,"MoreDeviousStarts.esp") as MoreDSmain
        endif
        return _DSmain
    EndFunction
    Function Set(MoreDSmain akObject)
        _DSmain = akObject
    EndFunction
EndProperty

Function AllRandom(ObjectReference akSpeakerRef)
    DSmain.selectedSet = -1
    DSmain.headGear = 50
    DSmain.selectedLoc = -1
    DSmain.color = 0
    DSmain.hardcore = (Utility.randomInt(0,1) == 1)
    DSmain.setDS()
EndFunction

;SETS
Function SelectLatexSuit(ObjectReference akSpeakerRef)
    SetSuit(10)
EndFunction
Function SelectStraitjacketSuit(ObjectReference akSpeakerRef)
    SetSuit(20)
EndFunction
Function SelectOldSchoolSuit(ObjectReference akSpeakerRef)
    SetSuit(30)
EndFunction
Function SelectTransparentSuit(ObjectReference akSpeakerRef)
    SetSuit(30)
EndFunction
Function SelectRopeSuit(ObjectReference akSpeakerRef)
    SetSuit(40)
EndFunction
Function SelectRestrictiveSuit(ObjectReference akSpeakerRef)
    SetSuit(60)
EndFunction
Function SelectEasySuit(ObjectReference akSpeakerRef)
    SetSuit(70)
EndFunction
Function SelectNormalSuit(ObjectReference akSpeakerRef)
    SetSuit(80)
EndFunction
Function SelectHardSuit(ObjectReference akSpeakerRef)
    SetSuit(90)
EndFunction
Function SelectChainSuit(ObjectReference akSpeakerRef)
    SetSuit(100)
EndFunction
Function SelectPonySuit(ObjectReference akSpeakerRef)
    SetSuit(110)
EndFunction
Function SelectChastitySuit(ObjectReference akSpeakerRef)
    SetSuit(120)
EndFunction
Function SelectBrandNewSuit(ObjectReference akSpeakerRef)
    ConsoleUtil.PrintMessage("SelectBrandNewSuit")
    SetSuit(130)
EndFunction

;HEADGEAR
Function SelectHeadgear_None(ObjectReference akSpeakerRef)
    SetHeadgear(0)
EndFunction
Function SelectHeadgear_Gag(ObjectReference akSpeakerRef)
    SetHeadgear(1)
EndFunction
Function SelectHeadgear_Blindfold(ObjectReference akSpeakerRef)
    SetHeadgear(2)
EndFunction
Function SelectHeadgear_GagAndBlindfold(ObjectReference akSpeakerRef)
    SetHeadgear(3)
EndFunction
Function SelectHeadgear_Hood(ObjectReference akSpeakerRef)
    SetHeadgear(4)
EndFunction
Function SelectHeadgear_Gasmask(ObjectReference akSpeakerRef)
    SetHeadgear(5)
EndFunction
Function SelectHeadgear_GasmaskFilter(ObjectReference akSpeakerRef)
    SetHeadgear(6)
EndFunction
Function SelectHeadgear_GasmaskRebreather(ObjectReference akSpeakerRef)
    SetHeadgear(7)
EndFunction
Function SelectHeadgear_GasmaskTube(ObjectReference akSpeakerRef)
    SetHeadgear(8)
EndFunction
Function SelectHeadgear_Random(ObjectReference akSpeakerRef)
    SetHeadgear(50)
EndFunction


;COLOR
Function Color_Black(ObjectReference akSpeakerRef)
    SetColor(1)
EndFunction
Function Color_White(ObjectReference akSpeakerRef)
    SetColor(2)
EndFunction
Function Color_Red(ObjectReference akSpeakerRef)
    SetColor(3)
EndFunction
Function Color_Transparent(ObjectReference akSpeakerRef)
    SetColor(4)
EndFunction
Function Color_Random(ObjectReference akSpeakerRef)
    SetColor(0)
EndFunction

;LOCATIONS
Function Location_Cell(ObjectReference akSpeakerRef)
    SetLocation(0)
EndFunction
Function Location_Wilderness(ObjectReference akSpeakerRef)
    SetLocation(1)
EndFunction
Function Location_City(ObjectReference akSpeakerRef)
    SetLocation(2)
EndFunction
Function Location_Dungeon(ObjectReference akSpeakerRef)
    SetLocation(3)
EndFunction
Function Location_Solstheim(ObjectReference akSpeakerRef)
    SetLocation(4)
EndFunction
Function Location_Random(ObjectReference akSpeakerRef)
    SetLocation(-1)
EndFunction


;HARDCORE
Function Hardcore_ON(ObjectReference akSpeakerRef)
    DSmain.hardcore = True
EndFunction
Function Hardcore_OFF(ObjectReference akSpeakerRef)
    DSmain.hardcore = False
EndFunction


;OPTIONAL MODS
Function AbadonStart(ObjectReference akSpeakerRef)
    SetSuit(400)
EndFunction
Function Dollsuit(ObjectReference akSpeakerRef)
    SetSuit(410)
EndFunction
Function THWStart(ObjectReference akSpeakerRef)
    SetSuit(500)
EndFunction
Function THWEnd(ObjectReference akSpeakerRef)
    DSmain.THWskipintro = False
    DSmain.setDS()
EndFunction
Function THWEndSkipIntro(ObjectReference akSpeakerRef)
    DSmain.THWskipintro = True
    DSmain.setDS()
EndFunction
Function THWMode_SlaveHunt(ObjectReference akSpeakerRef)
    DSmain.THWmod = 0
EndFunction
Function THWMode_TreasureHunt(ObjectReference akSpeakerRef)
    DSmain.THWmod = 1
EndFunction
Function THWMode_Random(ObjectReference akSpeakerRef)
    DSmain.THWmod = 2
EndFunction
Function THWSetSuit(Int aiSuit)
    DSmain.THWoutfit = aiSuit
EndFunction
Function THWSuit_Pony(ObjectReference akSpeakerRef)
    THWSetSuit(1)
EndFunction
Function THWSuit_Latex(ObjectReference akSpeakerRef)
    THWSetSuit(2)
EndFunction
Function THWSuit_Chain(ObjectReference akSpeakerRef)
    THWSetSuit(3)
EndFunction
Function THWSuit_Steampunk(ObjectReference akSpeakerRef)
    THWSetSuit(4)
EndFunction
Function THWSuit_Rope(ObjectReference akSpeakerRef)
    THWSetSuit(5)
EndFunction
Function THWSuit_Random(ObjectReference akSpeakerRef)
    THWSetSuit(6)
EndFunction
Function THWSuit_None(ObjectReference akSpeakerRef)
    THWSetSuit(0)
EndFunction

;QUEST
Function BoundAtHome(ObjectReference akSpeakerRef)
    DSmain.selectedSet = 250
    DSmain.setDS()
EndFunction
Function BetrayedAtHome(ObjectReference akSpeakerRef)
    DSmain.selectedSet = 260
    DSmain.setDS()
EndFunction
Function Plaything(ObjectReference akSpeakerRef)
    DSmain.selectedSet = 260
    DSmain.setDS()
EndFunction

Function SetLocation(Int aiLoation)
    DSmain.selectedLoc = aiLoation
    DSmain.setDS()
EndFunction
Function SetSuit(Int aiSuit)
    DSmain.selectedSet = aiSuit
EndFunction
Function SetHeadgear(Int aiHeadgear)
    DSmain.headGear = aiHeadgear
EndFunction
Function SetColor(Int aiColor)
    DSmain.color = aiColor
EndFunction