;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_MoreDSBoundAtHomeQuest_0B14A321 Extends Quest Hidden
ObjectReference             Property StartMark          Auto  
zadlibs                     Property libs               Auto
Key                         Property HomeKey            Auto
ObjectReference             Property HomeDoor           Auto
MDSBoundAtHomeMain          Property BAHmain            Auto
ARTH_LAL_RumorsOfWarScript  Property RumorOfWarQuest    Auto
SexLabFramework             Property SexLab             Auto
arth_lal_startquest         Property ChargenQuest       Auto


;BEGIN ALIAS PROPERTY RestrainKeyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RestrainKeyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
    RumorOfWarQuest.setStage(2)
    BAHmain.spawnPlayer()
    SetObjectiveDisplayed(10)
    SetObjectiveDisplayed(30,False);no idea why it shows so i have to turn if off
    
    Sexlab.StripActor(Game.getPlayer(),none,false)

    libs.lockDevice(Game.getPlayer(),libs.gagBall)
    libs.lockDevice(Game.getPlayer(),libs.blindfold)
    libs.lockDevice(Game.getPlayer(),libs.plugSoulgemVag)
    libs.lockDevice(Game.getPlayer(), libs.plugInflatableAn )
    libs.lockDevice(Game.getPlayer(),libs.armbinder)
    libs.lockDevice(Game.getPlayer(),libs.harnessBody)

    BAHmain.spawnHomeKey()

    BAHmain.blockDoors()

    BAHmain.registerForSingleUpdate(2.0)

    Utility.wait(5.0)
    BAHmain.vibrate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
    BAHmain.SetObjectiveCompleted(20)
    BAHmain.SetObjectiveDisplayed(40)
    BAHmain.spawnRestrainKey()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


