Scriptname MDS_BoundAtHomeRestrainKey_script extends ObjectReference  

bool                            first_try   = True
Armor               Property    restrainKey         auto
MDSBoundAtHomeMain  Property    BAHmain             auto

Event OnEquipped(Actor akActor)
    Game.getPlayer().UnequipItem(restrainKey, False,True)
    if (akActor == Game.getPlayer())
        if BAHmain.player_selfbondage_orgasms >= BAHmain.selfbondage_orgasms_toadvance
            if (Game.getPlayer().wornHasKeyword(BAHmain.libs.zad_DeviousHeavyBondage))
                if first_try
                    first_try = False
                    debug.messagebox("You tried using your whole body and feets to insert the key to socket. Just whene you thought you have managed to put it in, the key fall off. You tried looking for it on ground but didn't find it anywhere. Where could it go?")
                    BAHmain.SetStage(50)
                else
                    if Utility.randomInt() <= BAHmain.self_bondage_keylost_chance 
                        debug.messagebox("You tried again to unlock yourself using your whole body and feets to insert the key to socket. And again just whene you thought you have managed to put it in, the key fall off. After a while of desperately looking for it you have given up. Where could it go?")
                        BAHmain.spawnRestrainKey()
                    else
                        BAHmain.SetObjectiveCompleted(40)
                        debug.messagebox("You tried using your whole body and feets to insert the key to socket. And you manageged to put it in and with precise movement unlock the restrain. Sadly, the key broke when you tried to pul it out. You will have unlock rest of the restrains some other way.")
                        Game.getPlayer().removeItem((BAHmain.GetAlias(1) as ReferenceAlias).GetReference(),1, True)
                        BAHmain.unlockHandRestrain()
                    endif
                endif
            else
                Game.getPlayer().removeItem((BAHmain.GetAlias(1) as ReferenceAlias).GetReference(),1, True)
                debug.notification("You have used your key to successfully unlock rest of the restraints")
                BAHmain.unlockAllRestrains()
            endif
        else
            debug.notification("You want to enjoy yourself more before you unlock your restrains")
        endif
    endif
EndEvent

