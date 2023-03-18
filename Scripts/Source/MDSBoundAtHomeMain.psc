Scriptname MDSBoundAtHomeMain extends Quest conditional 


Bool                property debug_mod                      = False     auto
Int                 Property Difficulty                     = 0         auto                    Hidden
MoreDSmain          Property MDSmain                                    auto
int                 Property selfbondage_orgasms_toadvance  = 1         auto
int                 Property self_bondage_keylost_chance    = 75        auto
Armor               Property restrainKey                                auto                    Hidden
int                 property player_selfbondage_orgasms     = 0         auto    conditional     Hidden
bool                property haveKey                        = False     auto    conditional     Hidden
zadlibs             Property libs                                       Auto

;MoreDSmain Property DSmain  Auto  
ARTH_LAL_StartQuest property ChargenQuest           auto
Key[]               Property homeKeys               auto

ObjectReference     Property EasyStartLocation      auto
ObjectReference[]   Property EasyStartDoors         auto
ObjectReference[]   Property EasyStartStorages      Auto
ObjectReference[]   Property EasyStartKeyLocations  Auto

Event OnInit()
    RegisterForModEvent("DeviceActorOrgasm", "OnOrgasm")
EndEvent

Event OnOrgasm(string eventName, string strArg, float numArg, Form sender)
    if (MDSmain.Player.GetLeveledActorBase().GetName() == strArg)
        player_selfbondage_orgasms += 1
        if (player_selfbondage_orgasms == selfbondage_orgasms_toadvance)
            SetObjectiveCompleted(10)
            SetObjectiveDisplayed(20)
        endif
    endif
EndEvent

Event OnUpdate()
    if (!MDSmain.Player.WornHasKeyword(libs.zad_DeviousHeavyBondage))
        SetObjectiveCompleted(40)
        debug.messagebox("Finally having your hands free, you immediately discharge your plug as much as possible. Now you just need to unlock your doors.")
        plug_charged = False
        libs.StopVibrating(MDSmain.Player)
    else
        registerForSingleUpdate(2.0)
    endif
EndEvent

Function unlockAllRestrains()
    Int iFormIndex = MDSmain.Player.GetNumItems()
    While iFormIndex > 0
        iFormIndex -= 1
        Form kForm = MDSmain.Player.GetNthForm(iFormIndex)
        If kForm.GetType() == 26 ; Ingredient
            if kForm.hasKeyword(libs.zad_InventoryDevice)
                ;actor akActor, armor deviceInventory, armor deviceRendered = none, keyword zad_DeviousDevice = none, bool destroyDevice = false, bool genericonly = false
                ObjectReference temp = MDSmain.Player.placeatme(kForm,1,False,True)
                zadEquipScript devicescript = temp as zadEquipScript
                libs.UnlockDevice(MDSmain.Player,devicescript.deviceInventory,devicescript.deviceRendered, devicescript.zad_DeviousDevice,False,True)
                temp.delete()
            endif
        EndIf
    EndWhile
EndFunction

Function unlockHandRestrain()
    libs.UnlockDeviceByKeyword(MDSmain.Player, libs.zad_DeviousHeavyBondage,False)
EndFunction

bool Function haveKey()
    if MDSmain.Player.GetItemCount(homeKeys[0]) > 0
        return True
    else
        return False
    endif 
EndFunction

Function blockDoors()
    ObjectReference[] doors = getDoorArray()
    int i = doors.length
    while i > 0
        i = i - 1
        doors[i].BlockActivation(True)
    endwhile
EndFunction

Function unblockDoors()
    ObjectReference[] doors = getDoorArray()
    int i = doors.length
    while i > 0
        i = i - 1
        doors[i].BlockActivation(False)
    endwhile
EndFunction

ObjectReference[] Function getDoorArray()
    return EasyStartDoors
EndFunction

ObjectReference[] Function getStorageArray()
    return EasyStartStorages
EndFunction

ObjectReference[] Function getRestrainKeyLocationArray()
    return EasyStartKeyLocations
EndFunction

Function spawnPlayer()
    MDSmain.Player.Moveto(EasyStartLocation)
    EasyStartLocation.GetParentCell().SetActorOwner(MDSmain.Player.getActorBase())
EndFunction

Key Function getHomeKey()
    return homeKeys[0]
EndFunction

Function removeKey()
    MDSmain.Player.removeItem(homeKeys[0],1,True)
EndFunction

Function spawnHomeKey()
    ObjectReference[] storages = getStorageArray()
    int randomLocation = Utility.randomInt(0,storages.length - 1)
    storages[randomLocation].addItem(homeKeys[0])
EndFunction

Function spawnRestrainKey()
    ObjectReference[] locations = getRestrainKeyLocationArray()
    int randomLocation = Utility.randomInt(0,locations.length - 1)
    debug.trace("[MDS]: RKey spawned in: "+randomLocation)
    if (debug_mod)
        debug.notification("RKey spawned in: "+randomLocation)
    endif
    (GetAlias(1) as ReferenceAlias).GetReference().moveTo(locations[randomLocation])
EndFunction

bool plug_charged = True
Function vibrate()
    while !isCompleted() && MDSmain.Player.wornhasKeyword(libs.zad_DeviousPlugVaginal) && plug_charged
        Utility.wait(5.0)
        libs.VibrateEffect(MDSmain.Player,3,Utility.randomInt(20,40))
    endwhile
EndFunction

Function addRestrainKey()
    MDSmain.Player.addItem((GetAlias(1) as ReferenceAlias).GetReference().getBaseObject(),1,True)
EndFunction
int selfbondage_unlock_tries = 0
int Function getSelfbondageUnlockTries()
    return selfbondage_unlock_tries
EndFunction


;/
ObjectReference     Property MediumStartLocation        auto
ObjectReference[]   Property MediumStartDoors           auto
ObjectReference[]   Property MediumStartStorages        auto
ObjectReference[]   Property MediumStartKeyLocations    Auto
 
ObjectReference     Property HardStartLocation      auto
ObjectReference[]   Property HardStartDoors         auto
ObjectReference[]   Property HardStartStorages      auto
ObjectReference[]   Property HardStartKeyLocations  Auto
/;