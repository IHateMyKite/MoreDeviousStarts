
;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 55
Scriptname QF_ARTHLALMoreDS_0B005901 Extends Quest Hidden
MoreDSmain      Property DSmain     Auto
MDS_SetEquipper Property Equipper   Auto

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
if DSmain.selectedSet == 10
    Equipper.RuberDollSet()
elseif DSmain.selectedSet == 20
    Equipper.StraitjacketSet()
elseif DSmain.selectedSet == 30
    Equipper.OldSchoolSet()
elseif DSmain.selectedSet == 40
    Equipper.TransparentSet()
elseif DSmain.selectedSet == 50
    Equipper.RopeSet()
elseif DSmain.selectedSet == 60
    Equipper.RestrictiveSet()
elseif DSmain.selectedSet == 70
    Equipper.SimpleSet()
elseif DSmain.selectedSet == 80
    Equipper.NormalSet()
elseif DSmain.selectedSet == 90
    Equipper.HardSet()
elseif DSmain.selectedSet == 100
    Equipper.ChainSet()
elseif DSmain.selectedSet == 110
    Equipper.PonySet()
elseif DSmain.selectedSet == 120
    Equipper.ChastitySet()
elseif DSmain.selectedSet == 130
    Equipper.BrandNewSet()
elseif DSmain.selectedSet == 400
    Equipper.AbadonPlug()
elseif DSmain.selectedSet == 410
    Equipper.TheFacilityDollSuit()
elseif DSmain.selectedSet == 500
    Equipper.TreasureHuntingWhore()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


