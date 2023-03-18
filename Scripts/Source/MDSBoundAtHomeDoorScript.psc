Scriptname MDSBoundAtHomeDoorScript extends ObjectReference

zadlibs             Property libs       Auto
MDSBoundAtHomeMain  property BAHmain    auto

Event OnActivate(ObjectReference akActionRef)
if (akActionRef as Actor == Game.getPlayer() && (BAHmain as Quest).isRunning())
    if (!BAHmain.haveKey())
        debug.messagebox("You doesn't have key from your own house. Try to find it first.")
    elseif (Game.getPlayer().WornHasKeyword(libs.zad_DeviousHeavyBondage))
        debug.messagebox("You can't unlock this door with your hands tied!")
    else
        debug.messagebox("You succesfully unlocked the door.")
        BAHmain.unblockDoors()
        (BAHmain as Quest).completeQuest()
        (BAHmain as Quest).stop()
        self.activate(Game.getPlayer())
    endif
endif
EndEvent
