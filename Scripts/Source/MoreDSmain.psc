Scriptname MoreDSmain extends Quest Conditional
{main function of More Devious Starts}

Actor Property Player  Auto

;External scripts/Quests
ARTH_LAL_StartQuest property ChargenQuest   auto
Quest               property ThisQuest      auto
Quest               property BoundAtHome    auto
zadlibs             Property libs           Auto
zadxLibs            Property libsx          Auto
zadxlibs2           Property libsx2         Auto

;Internal variables
Bool    Property hardcore                               Auto                    Hidden
Bool    Property surprise_me                            Auto                    Hidden
Int     Property headGear                               Auto                    Hidden
Int     Property color                                  Auto                    Hidden
Int     Property selectedSet                            Auto    Conditional     Hidden
Int     Property selectedLoc                            Auto                    Hidden
Bool    property THWinstalled                   = False auto    Conditional     Hidden
Bool    property UDinstalled                    = False auto    Conditional     Hidden
Bool    Property TheFacilityInstalled           = False auto    Conditional     Hidden
Bool    Property MDSReady                       = False auto    Conditional     Hidden
Bool    property THWskipIntro                           auto                    Hidden
int     property THWmod                                 auto                    Hidden
int     property THWoutfit                              auto                    Hidden
Bool    property THWhardcore                            auto                    Hidden
Int     property THWinitOutfit                          auto                    Hidden
Bool    property THWSlaveGirlQuestAllowed               auto                    Hidden
Bool    property THWTreasureHuntQuestAllowed            auto                    Hidden
Int     property Mods_Instaled                  = 0     auto    conditional     Hidden
bool    property useAbadonPlug                  = false auto    Conditional     Hidden
Bool    Property DD52installed                  = False auto    Conditional     Hidden

;Starting locations
ObjectReference[] Property WildStart        auto
ObjectReference[] Property SolstheimStart   auto
ObjectReference[] Property CityStart        auto
ObjectReference[] Property DungeonStart     auto

Event OnInit()
    checkCompatibility()
    RegisterForModEvent("DeviceActorOrgasm", "OnOrgasm")
    RegisterForModEvent("DeviceEdgedActor", "OnEdge")
    Utility.wait(1.0)
    debug.notification("More Devious Starts ready!")
    MDSReady = True
EndEvent


Function maintenance()
    checkCompatibility()
    DD52installed = Game.GetFormFromFile(0x05859F,"Devious Devices - Expansion.esm") ;use last added device to 5.2 beta to see if beta is installed
EndFunction

Event OnUpdate()
EndEvent

string Function formatString(string str,int floatPoints)
    int float_point =  StringUtil.find(str,".")
    if (float_point == -1)
        return str
    endif
    if (floatPoints + float_point + 1 > StringUtil.getLength(str))
        return str
    else
        return StringUtil.Substring(str, 0, float_point + floatPoints + 1)
    endif
EndFunction

Function equipHardcorePlugs(bool vag = True, bool anal = True)
    if (vag)
        libs.LockDevice(Player,libsx.PlugsGrandSoulVag)
    endif
    if (anal)
        ;libs.LockDevice(Player,libsx.PlugsBlackSoulAnl)
        libs.LockDevice(Player,libs.plugInflatableAn)
    endif
EndFunction

Function checkCompatibility()
    Utility.waitMenuMode(3.0)
    THWinstalled = False
    If (Game.GetModByName("TreasureHunterWhore.esp") < 255)
        THWinstalled = True
        Mods_Instaled += 1
    EndIf
    UDinstalled = False
    If (Game.GetModByName("UnforgivingDevices.esp") < 255 )
        UDinstalled = True
        Mods_Instaled += 1
    EndIf
    TheFacilityInstalled = False
    If (Game.GetModByName("The Facility.esp") < 255 )
        TheFacilityInstalled = True
        Mods_Instaled += 1
    EndIf
EndFunction

Function setDS()
    if (selectedSet >= 250 && selectedSet < 400)
        ;quests
        startQuest(selectedSet/10)
    else
        ;sets
        if (selectedSet == -1)
            selectedSet = Utility.randomInt(1,12)*10
        endif
        ChargenQuest.SetAddonQuestStage(1 , ThisQuest)
    endif
EndFunction

;quest id is from 25 to 39
Function startQuest(int quest_id)
    if (quest_id == 25) ;Bound At Home - Easy
        ChargenQuest.SetAddonQuestStage(10 , BoundAtHome)
    elseif (quest_id == 26) ;Bound At Home - Medium
        ChargenQuest.SetAddonQuestStage(20 , BoundAtHome)
    elseif (quest_id == 27) ;Bound At Home - Hard
        ChargenQuest.SetAddonQuestStage(30 , BoundAtHome)
    else
        ;not yet used
    endif
    ;self.completeQuest()
EndFunction

Function equipSet()
    setStage(1)
EndFunction

Function spawnPlayer()
    if (selectedLoc == -1)
        selectedLoc = Utility.randomInt(1,4)
    endif
    if (selectedLoc == 1) ;wilderness start
        int randomLoc = Utility.RandomInt(0,WildStart.length - 1)
        Player.Moveto(WildStart[randomLoc])
    elseif (selectedLoc == 2) ;city start
        int randomLoc = Utility.RandomInt(0,CityStart.length - 1)
        Player.Moveto(CityStart[randomLoc])
    elseif (selectedLoc == 3) ;dungeon start
        int randomLoc = Utility.RandomInt(0,DungeonStart.length - 1)
        Player.Moveto(DungeonStart[randomLoc])
    elseif (selectedLoc == 4) ;island start
        int randomLoc = Utility.RandomInt(0,SolstheimStart.length - 1)
        Player.Moveto(SolstheimStart[randomLoc])
    else
        ;incorrect location or prison, aka do nothing;
    endif    
    registerForSingleUpdate(15)
EndFunction


Armor Function randomColorCatsuitDevice(int col = 0,string dev = "catsuit")
    if (col == 0)
        col = Utility.RandomInt(1,16)
    endif
    if col == 1
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_black_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_black_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_black_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_black_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_black_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_black_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_black_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_black_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_black_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_black_Inventory 
        endif
    elseif col == 3
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_red_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_red_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_red_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_red_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_red_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_red_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_red_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_red_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_red_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_red_Inventory 
        endif
    elseif col == 2
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_white_Inventory
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_white_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_white_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_white_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_white_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_white_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_white_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_white_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_white_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_white_Inventory 
        endif
    elseif col == 4
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_blue_Inventory
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_blue_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_blue_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_blue_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_blue_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_blue_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_blue_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_blue_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_blue_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_blue_Inventory 
        endif
    elseif col == 5
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_cyan_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_cyan_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_cyan_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_cyan_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_cyan_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_cyan_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_cyan_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_cyan_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_cyan_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_cyan_Inventory 
        endif
    elseif col == 6
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_dgreen_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_dgreen_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_dgreen_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_dgreen_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_dgreen_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_dgreen_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_dgreen_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_dgreen_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_dgreen_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_dgreen_Inventory 
        endif
    elseif col == 7
        if(dev == "catsuit")
            return libsx.zadx_catsuit_dgrey_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_dgrey_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_dgrey_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_dgrey_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_dgrey_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_dgrey_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_dgrey_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_dgrey_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_dgrey_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_dgrey_Inventory 
        endif
    elseif col == 8
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_dred_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_dred_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_dred_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_dred_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_dred_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_dred_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_dred_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_dred_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_dred_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_dred_Inventory 
        endif
    elseif col == 9
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_gold_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_gold_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_gold_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_gold_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_gold_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_gold_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_gold_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_gold_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_gold_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_gold_Inventory 
        endif
    elseif col == 10
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_green_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_green_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_green_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_green_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_green_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_green_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_green_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_green_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_green_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_green_Inventory 
        endif
    elseif col == 11
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_lgrey_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_lgrey_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_lgrey_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_lgrey_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_lgrey_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_lgrey_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_lgrey_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_lgrey_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_lgrey_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_lgrey_Inventory 
        endif
    elseif col == 12
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_orange_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_orange_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_orange_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_orange_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_orange_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_orange_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_orange_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_orange_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_orange_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_orange_Inventory 
        endif
    elseif col == 13
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_pink_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_pink_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_pink_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_pink_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_pink_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_pink_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_pink_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_pink_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_pink_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_pink_Inventory 
        endif
    elseif col == 14
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_purple_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_purple_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_purple_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_purple_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_purple_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_purple_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_purple_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_purple_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_purple_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_purple_Inventory 
        endif
    elseif col == 15
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_redwhite_Inventory 
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_red_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_redwhite_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_white_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_redwhite_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_red_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_white_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_red_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_white_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_red_Inventory 
        endif
    elseif col == 16
        if(dev == "catsuit") 
            return libsx.zadx_catsuit_yellow_Inventory     
        endif
        if(dev == "collar") 
            return libsx.zadx_catsuit_collar_yellow_Inventory 
        endif
        if(dev == "gloves") 
            return libsx.zadx_catsuit_gloves_yellow_Inventory 
        endif
        if(dev == "long-gloves") 
            return libsx.zadx_catsuit_longgloves_yellow_Inventory 
        endif
        if(dev == "socks") 
            return libsx.zadx_catsuit_boots_yellow_Inventory 
        endif
        if(dev == "ballet") 
            return libsx.zadx_catsuit_balletboots_yellow_Inventory
        endif
        if(dev == "gasmask") 
            return libsx.zadx_catsuit_gasmask_yellow_Inventory 
        endif
        if(dev == "gasmask-filter") 
            return libsx.zadx_catsuit_gasmask_filter_yellow_Inventory 
        endif
        if(dev == "gasmask-rebreather") 
            return libsx.zadx_catsuit_gasmask_rebr_yellow_Inventory 
        endif
        if(dev == "gasmask-tube") 
            return libsx.zadx_catsuit_gasmask_tube_yellow_Inventory 
        endif
    endif
    return libsx.cuffsEboniteCollar
endfunction

Armor Function randomColorNormDevice(int col = 0, string dev = "armbinder")
    if (col == 0)
        col = Utility.RandomInt(1,3)
    endif
    if col == 1
        if(dev == "cuffs-arms") 
            return libsx.cuffsEboniteArms
        endif
        if(dev == "cuffs-legs") 
            return libsx.cuffsEboniteLegs 
        endif
        if(dev == "armbinder") 
            return libsx.eboniteArmbinder
        endif
        if(dev == "elbowbinder") 
            return libsx.zadx_ElbowbinderEboniteInventory 
        endif
        if (dev == "mittens")
            return libsx.zadx_PawBondageMittensLatexInventory
        endif
        if(dev == "res-boots") 
            return libsx.EbRestrictiveBoots 
        endif
        if(dev == "res-gloves") 
            return libsx.EbRestrictiveGloves
        endif
        if(dev == "res-collar") 
            return libsx.EbRestrictiveCollar 
        endif
        if(dev == "res-corset") 
            return libsx.EbRestrictiveCorset 
        endif
        if(dev == "collar") 
            return libsx.cuffsEboniteCollar 
        endif
        if(dev == "har-collar") 
            return libsx.eboniteHarnessCollar 
        endif
        if(dev == "pos-collar") 
            return libsx.collarPostureEbonite 
        endif
        if(dev == "chas-harness") 
            return libsx.eboniteHarnessBody 
        endif
        if(dev == "gag-ball-strap") 
            return libsx.gagEboniteStrapBall 
        endif
        if(dev == "gag-ball") 
            return libsx.gagEboniteBall 
        endif
        if(dev == "gag-ring") 
            return libsx.gagEboniteRing 
        endif
        if(dev == "gag-ring-strap") 
            return libsx.gagEboniteStrapRing 
        endif
        if(dev == "gag-pad") 
            return libsx.gagEbonitePanel 
        endif
        if(dev == "blindfold") 
            return libsx.eboniteBlindfold 
        endif
        if(dev == "pony-boots") 
            return libsx.EbonitePonyBoots 
        endif
        if(dev == "ballet")
            return libsx.zadx_SlaveHighHeelsInventory
        endif
        if(dev == "hobble")
            return libsx.zadx_HobbleDressLatexInventory
        endif
        if(dev == "hobble-open")
            return libsx.zadx_HobbleDressLatexOpenInventory
        endif
    elseif col == 2
        if(dev == "cuffs-arms") 
            return libsx.cuffsWTEboniteArms
        endif
        if(dev == "cuffs-legs") 
            return libsx.cuffsWTEboniteLegs 
        endif
        if(dev == "armbinder") 
            return libsx.wtEboniteArmbinder
        endif
        if(dev == "elbowbinder") 
            return libsx.zadx_ElbowbinderEboniteWhiteInventory 
        endif
        if (dev == "mittens")
            return libsx.zadx_PawBondageMittensWhiteLatexInventory
        endif
        if(dev == "res-boots") 
            return libsx.WTErestrictiveBoots 
        endif
        if(dev == "res-gloves") 
            return libsx.WTERestrictiveGloves
        endif
        if(dev == "res-collar") 
            return libsx.WTERestrictiveCollar 
        endif
        if(dev == "res-corset") 
            return libsx.WTERestrictiveCorset 
        endif
        if (dev == "collar")
            return libsx.cuffsWTEboniteCollar
        endif
        if(dev == "har-collar") 
            return libsx.wtEboniteHarnessCollar 
        endif
        if(dev == "pos-collar") 
            return libsx.collarPostureWTEbonite 
        endif
        if(dev == "chas-harness") 
            return libsx.wtEboniteHarnessBody 
        endif
        if(dev == "gag-ball-strap") 
            return libsx.gagWTEboniteStrapBall 
        endif
        if(dev == "gag-ball") 
            return libsx.gagWTEboniteBall 
        endif
        if(dev == "gag-ring") 
            return libsx.gagWTEboniteRing 
        endif
        if(dev == "gag-ring-strap") 
            return libsx.gagWTEboniteStrapRing 
        endif
        if(dev == "gag-pad") 
            return libsx.gagWTEbonitePanel 
        endif
        if(dev == "blindfold") 
            return libsx.wtEboniteBlindfold 
        endif
        if(dev == "pony-boots") 
            return libsx.WTEbonitePonyBoots 
        endif
        if(dev == "ballet")
            return libsx.zadx_SlaveHighHeelsWhiteInventory
        endif
        if(dev == "hobble")
            return libsx.zadx_HobbleDressLatexWhiteInventory
        endif
        if(dev == "hobble-open")
            return libsx.zadx_HobbleDressLatexWhiteOpenInventory
        endif
    elseif col == 3
        if(dev == "cuffs-arms") 
            return libsx.cuffsRDEboniteArms
        endif
        if(dev == "cuffs-legs") 
            return libsx.cuffsRDEboniteLegs 
        endif
        if(dev == "armbinder") 
            return libsx.RDEboniteArmbinder
        endif
        if(dev == "elbowbinder") 
            return libsx.zadx_ElbowbinderEboniteRedInventory 
        endif
        if (dev == "mittens")
            return libsx.zadx_PawBondageMittensRedLatexInventory
        endif
        if(dev == "res-boots") 
            return libsx.RDErestrictiveBoots 
        endif
        if(dev == "res-gloves") 
            return libsx.RDERestrictiveGloves
        endif
        if(dev == "res-collar") 
            return libsx.RDERestrictiveCollar 
        endif
        if(dev == "res-corset") 
            return libsx.RDERestrictiveCorset 
        endif
        if (dev == "collar")
            return libsx.cuffsRDEboniteCollar
        endif
        if(dev == "har-collar") 
            return libsx.RDEboniteHarnessCollar 
        endif
        if(dev == "pos-collar") 
            return libsx.collarPostureRDEbonite 
        endif
        if(dev == "chas-harness") 
            return libsx.RDEboniteHarnessBody 
        endif
        if(dev == "gag-ball-strap") 
            return libsx.gagRDEboniteStrapBall 
        endif
        if(dev == "gag-ball") 
            return libsx.gagRDEboniteBall 
        endif
        if(dev == "gag-ring") 
            return libsx.gagRDEboniteRing 
        endif
        if(dev == "gag-ring-strap") 
            return libsx.gagRDEboniteStrapRing 
        endif
        if(dev == "gag-pad") 
            return libsx.gagRDEbonitePanel 
        endif
        if(dev == "blindfold") 
            return libsx.RDEboniteBlindfold 
        endif
        if(dev == "pony-boots") 
            return libsx.RDEbonitePonyBoots 
        endif
        if(dev == "ballet")
            return libsx.zadx_SlaveHighHeelsRedInventory
        endif
        if(dev == "hobble")
            return libsx.zadx_HobbleDressLatexRedInventory
        endif
        if(dev == "hobble-open")
            return libsx.zadx_HobbleDressLatexRedOpenInventory
        endif
    elseif col == 4
        if(dev == "res-boots") 
            return libsx.zadx_restrictiveBootsTrans_Inventory
        endif
        if(dev == "res-gloves") 
            return libsx.zadx_catsuit_longgloves_transparent_Inventory
        endif
        if(dev == "res-collar") 
            return libsx.zadx_restrictiveCollarTrans_Inventory 
        endif
        if(dev == "res-corset") 
            return libsx.zadx_restrictiveCorsetTrans_Inventory
        endif
        if(dev == "hobble")
            return libsx.zadx_HobbleDressTransparentInventory
        endif
        
    endif
    ;shit went wrong, return harmless collar
    return libsx.cuffsEboniteCollar
    
EndFunction

Armor Function randomColorStraitjacketDevice(int col = 0, string dev = "open")
    if (col == 0)
        col = Utility.RandomInt(1,3)
    endif
    if col == 1
        if(dev == "normal")
            return libsx.zadx_StraitJacketLatexBlackInventory 
        endif
        if(dev == "open")
            return libsx.zadx_StraitJacketLatexToplessBlackInventory 
        endif
        if(dev == "leg")
            return libsx.zadx_StraitJacketLatexLegsBlackInventory 
        endif
        if(dev == "leg-open")
            return libsx.zadx_StraitJacketLatexLegsToplessBlackInventory 
        endif
        if(dev == "dress")
            return libsx2.zadx_StraitJacketFormalDressEboniteBlackInventory 
        endif
        if(dev == "dress-open")
            return libsx2.zadx_StraitJacketFormalDressEboniteBlackToplessInventory 
        endif
        if(dev == "hobbl")
            return libsx2.zadx_StraitJacketHobbleDressEboniteBlackCleavageInventory 
        endif
        if(dev == "hobbl-open")
            return libsx2.zadx_StraitJacketHobbleDressEboniteBlackOpenInventory 
        endif
        if(dev == "catsuit")
            return libsx2.zadx_StraitJacketCatsuitEboniteBlackInventory 
        endif
        if(dev == "catsuit-open")
            return libsx2.zadx_StraitJacketCatsuitEboniteBlackToplessInventory 
        endif
        if(dev == "latexdress")
            return libsx2.zadx_StraitJacketLatexDressBlackInventory 
        endif
        if(dev == "latexdress-open")
            return libsx2.zadx_StraitJacketLatexDressToplessBlackInventory 
        endif
    elseif col == 2
        if(dev == "normal")
            return libsx.zadx_StraitJacketLatexWhiteInventory 
        endif
        if(dev == "open")
            return libsx.zadx_StraitJacketLatexToplessWhiteInventory 
        endif
        if(dev == "leg")
            return libsx.zadx_StraitJacketLatexLegsWhiteInventory 
        endif
        if(dev == "leg-open")
            return libsx.zadx_StraitJacketLatexLegsToplessWhiteInventory 
        endif
        if(dev == "dress")
            return libsx2.zadx_StraitJacketFormalDressEboniteWhiteInventory 
        endif
        if(dev == "dress-open")
            return libsx2.zadx_StraitJacketFormalDressEboniteWhiteToplessInventory 
        endif
        if(dev == "hobbl")
            return libsx2.zadx_StraitJacketHobbleDressEboniteWhiteCleavageInventory 
        endif
        if(dev == "hobbl-open")
            return libsx2.zadx_StraitJacketHobbleDressEboniteWhiteOpenInventory 
        endif
        if(dev == "catsuit")
            return libsx2.zadx_StraitJacketCatsuitEboniteWhiteInventory 
        endif
        if(dev == "catsuit-open")
            return libsx2.zadx_StraitJacketCatsuitEboniteWhiteToplessInventory 
        endif
        if(dev == "latexdress")
            return libsx2.zadx_StraitJacketLatexDressWhiteInventory 
        endif
        if(dev == "latexdress-open")
            return libsx2.zadx_StraitJacketLatexDressToplessWhiteInventory 
        endif
    elseif col == 3
        if(dev == "normal")
            return libsx.zadx_StraitJacketLatexRedInventory 
        endif
        if(dev == "open")
            return libsx.zadx_StraitJacketLatexToplessRedInventory 
        endif
        if(dev == "leg")
            return libsx.zadx_StraitJacketLatexLegsRedInventory 
        endif
        if(dev == "leg-open")
            return libsx.zadx_StraitJacketLatexLegsToplessRedInventory 
        endif
        if(dev == "dress")
            return libsx2.zadx_StraitJacketFormalDressEboniteRedInventory 
        endif
        if(dev == "dress-open")
            return libsx2.zadx_StraitJacketFormalDressEboniteRedToplessInventory 
        endif
        if(dev == "hobbl")
            return libsx2.zadx_StraitJacketHobbleDressEboniteRedCleavageInventory 
        endif
        if(dev == "hobbl-open")
            return libsx2.zadx_StraitJacketHobbleDressEboniteRedOpenInventory 
        endif
        if(dev == "catsuit")
            return libsx2.zadx_StraitJacketCatsuitEboniteRedInventory 
        endif
        if(dev == "catsuit-open")
            return libsx2.zadx_StraitJacketCatsuitEboniteRedToplessInventory 
        endif
        if(dev == "latexdress")
            return libsx2.zadx_StraitJacketLatexDressRedInventory 
        endif
        if(dev == "latexdress-open")
            return libsx2.zadx_StraitJacketLatexDressToplessRedInventory 
        endif
    endif
    return libsx.cuffsEboniteCollar
EndFunction