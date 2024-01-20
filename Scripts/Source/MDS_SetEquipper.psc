Scriptname MDS_SetEquipper extends Quest

ReferenceAlias  Property Alias_PlayerAlias          Auto
zadlibs         Property libs                       Auto
Actor           Property Player                     Auto
Quest           Property ARTHLALRumorsOfWarQuest    Auto
zadxLibs        Property libsx                      Auto
zadxlibs2       Property libsx2                     Auto
MoreDSmain      Property DSmain                     Auto

Function RuberDollSet()
    DSmain.spawnPlayer()

    int sec_color = DSmain.color
    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,3)
        sec_color =  Utility.RandomInt(1,16)
    endif

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,8)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        int gag = Utility.randomInt(1,3)
        if gag == 1
            if DSmain.color == 1
                LockDevice(libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
        elseif gag == 2
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ring"))
        else
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-pad"))
        endif    
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        ;if (DSmain.color == 1)
        ;    LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
        ;    DSmain.WaitLock(0.5)
        ;    LockDevice(libsx.zadx_hood_rubber_openeyes_black_Inventory)
        ;else
            LockDevice(libsx.zadx_hood_rubber_black_Inventory)
        ;endif
        LockDevice(libsx2.zadx_gag_tape_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask-tube"))
    endif
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        LockDevice(libsx.PiercingsCommonSoulVag)
        LockDevice(libsx.PiercingsShockSoulNips)
        LockDevice(libs.beltPadded)
        LockDevice(libs.braPadded)

        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"collar"))
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"socks"))
        ;LockDevice(libsx.zadx_AnkleShackles_Silver_Inventory)
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"catsuit"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"elbowbinder"))
        ;LockDevice(libs.zad_armBinderHisec_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libs.plugSoulgemVag)
            LockDevice(libs.plugInflatableAn)
        endif

        LockDevice(libsx.PiercingsCommonSoulVag)
        LockDevice(libs.beltPadded)
        LockDevice(libs.braPadded)
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"collar"))

        if Utility.randomInt(0,1)
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
            LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"catsuit"))
            LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"socks"))
        else
            LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"catsuit"))
            LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"socks"))
        endif

    endif

    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
;END CODE
EndFunction

Function StraitjacketSet()
    DSmain.spawnPlayer()
    int sec_color = DSmain.color
    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,3)
        sec_color =  Utility.RandomInt(1,16)
    endif

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,8)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        int gag = Utility.randomInt(1,3)
        if gag == 1
            if DSmain.color == 1
                LockDevice(libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
        elseif gag == 2
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ring"))
        else
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-pad"))
        endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_rubber_black_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        DSmain.WaitLock(0.5)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask-tube"))
    endif

    if (DSmain.hardcore)
        
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        LockDevice(libsx.PiercingsCommonSoulVag)
        LockDevice(libsx.PiercingsShockSoulNips)
        LockDevice(libs.beltPadded)
        LockDevice(libs.braPadded)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"collar"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        if Utility.randomInt(0,1)
            LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"catsuit-open"))
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))
        else
            LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"open"))
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        endif
        
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libs.plugSoulgemVag)
            LockDevice(libs.plugInflatableAn)
        endif
        LockDevice(libsx.PiercingsCommonSoulVag)
        LockDevice(libs.beltIron)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"collar"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        if Utility.randomInt(0,1)
            LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"open"))
        else
            LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"normal"))
        endif
    endif

    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function OldSchoolSet()
    DSmain.spawnPlayer()
    if DSmain.headGear == 50
    DSmain.headGear = Utility.randomInt(0,3)
    endif

    if (DSmain.headGear == 1 || DSmain.headGear == 3)
        int gag = Utility.randomInt(1,3)
        if gag == 1
            LockDevice(libs.gagBall)
        elseif gag == 2
            LockDevice(libs.gagRing)
        else
            LockDevice(libs.gagPanel)
        endif
    endif
    if (DSmain.headGear == 2 || DSmain.headGear == 3)
        LockDevice(libs.blindfold)
    endif
    
    if DSmain.hardcore
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        LockDevice(libs.zad_armBinderHisec_Inventory)
    else

        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libs.plugSoulgemVag)
            LockDevice(libs.plugSoulgemAn)
        endif
        LockDevice(libs.armbinder)
    endif

    LockDevice(libs.piercingVSoul)
    LockDevice(libs.piercingNSoul)
    LockDevice(libs.beltpadded)
    LockDevice(libs.braPadded)
    LockDevice(libs.cuffsPaddedLegs)
    LockDevice(libs.cuffsPaddedArms)
    LockDevice(libs.collarPosture)
    LockDevice(libsx.bootsLocking)


    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function TransparentSet()
    DSmain.spawnPlayer()

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,8)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        LockDevice(libsx2.zadx_gag_tape_Inventory)
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(libsx.wtEboniteBlindfold)
    endif
    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_rubber_transparent_Inventory)
        LockDevice(libsx.wtEboniteBlindfold)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.wtEboniteBlindfold)
    endif

    if DSmain.headGear == 5
        LockDevice(libsx.zadx_catsuit_gasmask_white_Inventory)
    elseif DSmain.headGear == 6
        LockDevice(libsx.zadx_catsuit_gasmask_filter_white_Inventory)
    elseif DSmain.headGear == 7
        LockDevice(libsx.zadx_catsuit_gasmask_rebr_white_Inventory)
    elseif DSmain.headGear == 8
        LockDevice(libsx.zadx_catsuit_gasmask_tube_white_Inventory)
    endif
    
    LockDevice(libsx.PiercingsCommonSoulVag)
    if (DSmain.hardcore)
        LockDevice(libsx.zadx_HobbleDressTransparentInventory)
        LockDevice(libsx.zadx_restrictiveBootsTrans_Inventory)
        LockDevice(libsx.zadx_restrictiveCollarTrans_Inventory)
        LockDevice(libsx.zadx_restrictiveCorsetTrans_Inventory)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        
        LockDevice(libsx.PiercingsShockSoulNips)
        LockDevice(libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_AnkleShackles_Silver_Inventory)
        LockDevice(libsx.zadx_yoke_steel_Inventory)
        LockDevice(libsx.zadx_PawBondageMittensWhiteInventory)
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libsx.PlugsFilledSoulVag)
            LockDevice(libs.plugInflatableAn)
        endif
        LockDevice(Game.GetFormFromFile(0x00182E,"Devious Devices - Expansion.esm") as Armor)
        LockDevice(libsx.zadx_catsuit_boots_transparent_Inventory)
        ;LockDevice(libsx.zadx_catsuit_transparent_Inventory)
        LockDevice(libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Silver_Inventory)
        LockDevice(libsx.wtEboniteArmbinder)
    endif


    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function RopeSet()
    DSmain.spawnPlayer()

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,8)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        if Utility.randomInt(0,1)
            LockDevice(libsx.zadx_gag_rope_bit_Inventory)
        else
            LockDevice(libsx.zadx_gag_rope_ball_Inventory)
        endif
        
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(libsx.zadx_blindfold_Rope_Inventory)
    endif
    if DSmain.headGear == 4
        LockDevice(libsx.eboniteBlindfold)
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.eboniteBlindfold)
    endif

    if DSmain.headGear == 5
        LockDevice(libsx.zadx_catsuit_gasmask_black_Inventory)
    elseif DSmain.headGear == 6
        LockDevice(libsx.zadx_catsuit_gasmask_filter_black_Inventory)
    elseif DSmain.headGear == 7
        LockDevice(libsx.zadx_catsuit_gasmask_rebr_black_Inventory)
    elseif DSmain.headGear == 8
        LockDevice(libsx.zadx_catsuit_gasmask_tube_black_Inventory)
    endif
    
    LockDevice(libsx.PiercingsCommonSoulVag)
    
    if (DSmain.hardcore)
        LockDevice(libsx.zadx_Collar_Rope_1_Inventory)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        LockDevice(libsx.PiercingsShockSoulNips)
        LockDevice(libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_Harness_Rope_Full_Inventory)
        LockDevice(libsx.zadx_Armbinder_Rope_Strict_Inventory)
    else
        LockDevice(libsx.zadx_Collar_Rope_2_Inventory)
        LockDevice(libsx2.zadx_rope_cuffs_legs_Inventory)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libsx.PlugsFilledSoulVag)
            LockDevice(libs.plugInflatableAn)
        endif
        LockDevice(libsx2.zadx_rope_crotch_Inventory)
        LockDevice(libsx.zadx_Armbinder_Rope_Inventory)
    endif
    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function RestrictiveSet()
    DSmain.spawnPlayer()

    int sec_color = 1
    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,4)
        sec_color =  DSmain.color 
    endif

    sec_color =  DSmain.color 

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,8)
    endif

    if sec_color == 4
        sec_color = Utility.RandomInt(1,3)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        LockDevice(libsx2.zadx_Gag_Ball_Extreme_Red_Inventory)
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(sec_color,"blindfold"))
    endif
    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_rubber_black_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(sec_color,"blindfold"))
    endif

    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"gasmask-tube"))
    endif
    
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        
        LockDevice(libsx.PiercingsCommonSoulVag)
        LockDevice(libsx.PiercingsShockSoulNips)
        LockDevice(libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Silver_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-collar"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))

        int randomdevice = Utility.randomInt(1,3)
        if randomdevice == 1
            LockDevice(libsx2.zadx_elbowshackles_Inventory)
        elseif randomdevice == 2
            LockDevice(libsx.zadx_yoke_steel_Inventory)
        else 
            LockDevice(DSmain.randomColorNormDevice(sec_color,"armbinder"))
        endif
        LockDevice(DSmain.randomColorNormDevice(sec_color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libs.plugSoulgemVag)
            LockDevice(libs.plugInflatableAn)
        endif

        LockDevice(libsx.PiercingsCommonSoulVag)
        LockDevice(libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Silver_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-collar"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-gloves"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        LockDevice(DSmain.randomColorNormDevice(sec_color,"armbinder"))
    endif
    
    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function SimpleSet()
    DSmain.spawnPlayer()

    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,3)
    endif

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,3)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        if(DSmain.color == 1)
            LockDevice(libsx.zadx_GagEboniteHarnessBallBig_Inventory)
        else
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
        endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        ;LockDevice(libsx.bootsLocking)
        
        if Utility.randomInt(0,1)
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"chas-harness"))
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
        else
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"collar"))
            LockDevice(libs.beltIron)
            LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"open"))
        endif

        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libs.plugSoulgemVag)
            LockDevice(libs.plugInflatableAn)
            LockDevice(libs.piercingVSoul)
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"chas-harness"))
        endif

        ;LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        ;LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        ;if Utility.randomInt(0,1)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
        ;endif
    endif

    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function NormalSet()
    DSmain.spawnPlayer()

    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,3)
    endif

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,8)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        int gag = Utility.randomInt(1,3)
        if gag == 1
            if DSmain.color == 1
                LockDevice(libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
        elseif gag == 2
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ring"))
        else
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-pad"))
        endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_rubber_black_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    DSmain.WaitLock(0.5)
    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif
    
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        LockDevice(libsx.PiercingsShockSoulVag)
        LockDevice(libsx.PiercingsShockSoulNips)
        LockDevice(libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_cuffs_Padded_Arms_Silver_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        if(Utility.randomInt(0,1))
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        else
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))
        endif
        LockDevice(libsx.zadx_AnkleShackles_Silver_Inventory)
        if Utility.randomInt(0,1)
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"elbowbinder"))
        else
            LockDevice(libs.zad_armBinderHisec_Inventory)
        endif
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libsx.PlugsGreaterSoulVag)
            LockDevice(libsx.PlugsGreaterSoulAnl)
        endif
        
        LockDevice(libsx.PiercingsCommonSoulVag)
        LockDevice(libsx.PiercingsCommonSoulNips)
        LockDevice(libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Silver_Inventory)
        LockDevice(libsx.zadx_cuffs_Padded_Arms_Silver_Inventory)
        LockDevice(libsx.zadx_cuffs_Padded_Legs_Silver_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        
        if(Utility.randomInt(0,1))
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        else
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))
        endif

        if Utility.randomInt(0,1)
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
        else
            LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"open"))
        endif
    endif

    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function HardSet()
    DSmain.spawnPlayer()

    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,3)
    endif

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,8)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        LockDevice(libsx2.zadx_Gag_Ball_Extreme_Red_Inventory)
    EndIf
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_rubber_black_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        LockDevice(libsx.PiercingsShockSoulVag)
        LockDevice(libsx.PiercingsShockSoulNips)
        LockDevice(libsx.zadx_chastitybelt_Padded_Gold_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Gold_Inventory)
        LockDevice(libsx.zadx_cuffs_Padded_Arms_Gold_Inventory)
        LockDevice(libsx.zadx_cuffs_Padded_Legs_Gold_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"ballet"))
        int random = Utility.randomInt(1,3)
        if  random == 1
            LockDevice(libsx2.zadx_elbowshacklesHook_Inventory)
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"hobble"))
        elseif random == 2
            LockDevice(libsx.zadx_yoke_steel_Inventory)
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"hobble"))
        else
            if (Utility.randomInt(0,1))
                LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"leg-open"))
            else
                LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"hobbl-open"))
            endif

        endif

        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libsx.PlugsGrandSoulVag)
            LockDevice(libsx.PlugsGrandSoulAnl)
        endif
        LockDevice(libsx.PiercingsCommonSoulVag)
        LockDevice(libsx.PiercingsCommonSoulNips)
        LockDevice(libsx.zadx_chastitybelt_Padded_Gold_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Gold_Inventory)
        LockDevice(libsx.zadx_cuffs_Padded_Arms_Gold_Inventory)
        LockDevice(libsx.zadx_cuffs_Padded_Legs_Gold_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-collar"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"ballet"))
        if Utility.randomInt(0,1)
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"hobble"))
        else
            if (Utility.randomInt(0,1))
                LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"leg-open"))
            else
                LockDevice(DSmain.randomColorStraitjacketDevice(DSmain.color,"hobbl-open"))
            endif
        endif

    endif

    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function ChainSet()
    DSmain.spawnPlayer()

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,8)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        int gag = Utility.randomInt(1,3)
        if gag == 1
            LockDevice(libsx.zadx_HR_PearGagInventory)
        elseif gag == 2
            LockDevice(libsx.zadx_HR_IronBitGagInventory)
        else
            LockDevice(libsx.zadx_HR_IronRingGagInventory)
        endif
    endif
    
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(1,"blindfold"))
    endif
    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(1,"blindfold"))
    endif
    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        LockDevice(libsx.PiercingsShockSoulVag)
        LockDevice(libsx.PiercingsShockSoulNips)
        LockDevice(libs.beltIron)
        LockDevice(libsx.zadx_HR_ChainHarnessBodyInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessArmsInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessBraInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessLegsInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessGlovesInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessBootsInventory)
        if Utility.randomInt(0,1)
            LockDevice(libsx2.zadx_elbowshackles_Inventory)
        else
            LockDevice(libs.Yoke)
        endif
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libsx.PlugsBlackSoulVag)
            LockDevice(libsx.PlugsBlackSoulAnl)
        endif

        LockDevice(libsx.PiercingsCommonSoulVag)
        LockDevice(libsx.PiercingsCommonSoulNips)
        LockDevice(libs.beltIron)
        LockDevice(libsx.zadx_HR_ChainHarnessBodyInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessArmsInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessBraInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessLegsInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessGlovesInventory)
        LockDevice(libsx.zadx_HR_ChainHarnessBootsInventory)
        LockDevice(libsx.zadx_HR_IronCuffsFrontInventory)

    endif

    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function PonySet()
    DSmain.spawnPlayer()

    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,3)
    endif

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,3)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3 
        LockDevice(libsx.zadx_dud_Pony_Harness_Secure_Ebonite_BlackInventory)
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs(True,False)
        endif
        LockDevice(libsx.zadx_HR_PlugPonyTail01Inventory)
        LockDevice(libs.beltPadded)
        LockDevice(libs.braPadded)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"har-collar"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"elbowbinder"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"mittens"))

    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            LockDevice(libs.plugSoulgemVag)
            LockDevice(libsx.PiercingsCommonSoulVag)
            LockDevice(libsx.PiercingsShockSoulNips)
        endif
        LockDevice(libsx.zadx_HR_PlugPonyTail01Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"chas-harness"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"armbinder"))

    endif

    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function ChastitySet()
    DSmain.spawnPlayer()
    
    DSmain.color = 1
    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,3)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
            if DSmain.color == 1
                LockDevice(libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif
    
    if (DSmain.hardcore)
        DSmain.equipHardcorePlugs(True,True)
        LockDevice(libsx.zadx_chastitybelt_Padded_Gold_Inventory)
        LockDevice(libsx.zadx_chastitybra_Padded_Gold_Inventory)
        LockDevice(libsx.zadx_Collar_Posture_Gold_Inventory)
        LockDevice(libsx.zadx_cuffs_Padded_Arms_Gold_Inventory)
        LockDevice(libsx.zadx_cuffs_Padded_Legs_Gold_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        LockDevice(libs.plugSoulgemVag)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"chas-harness"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
    endif

    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function BrandNewSet()
    DSmain.spawnPlayer()
    
    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,3)
    endif

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,3)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
            if DSmain.color == 1
                LockDevice(libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif

    if (DSmain.hardcore)
        DSmain.equipHardcorePlugs(True,True)
        if DSmain.color == 1
            LockDevice(libsx2.zadx_BoxBinderOutfit_Inventory)
            LockDevice(libsx2.zadx_ebonite_heels_black_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Arms_Black_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Black_Inventory)
            LockDevice(libsx2.zadx_Collar_Posture_Black_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_Padded_Black_Inventory)
            LockDevice(libsx2.zadx_chastitybra_Padded_Black_Inventory)
        elseif DSmain.color == 2
            LockDevice(Game.GetFormFromFile(0x00242F,"Devious Devices - Expansion.esm") as Armor)
            LockDevice(libsx2.zadx_ebonite_heels_white_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Arms_White_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_White_Inventory)
            LockDevice(libsx2.zadx_Collar_Posture_White_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_Padded_White_Inventory)
            LockDevice(libsx2.zadx_chastitybra_Padded_White_Inventory)
        elseif DSmain.color == 3
            LockDevice(Game.GetFormFromFile(0x00242D,"Devious Devices - Expansion.esm") as Armor)
            LockDevice(libsx2.zadx_ebonite_heels_red_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Arms_Red_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Red_Inventory)
            LockDevice(libsx2.zadx_Collar_Posture_Red_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_Padded_Red_Inventory)
            LockDevice(libsx2.zadx_chastitybra_Padded_Red_Inventory)
        endif
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        LockDevice(libs.plugSoulgemVag)
        if DSmain.color == 1
            LockDevice(libsx2.zadx_BoxBinder_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Collar_Black_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Black_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_PaddedOpen_Black_Inventory)
        elseif DSmain.color == 2
            LockDevice(Game.GetFormFromFile(0x00242B,"Devious Devices - Expansion.esm") as Armor)
            LockDevice(libsx2.zadx_cuffs_Padded_Collar_White_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_White_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_PaddedOpen_White_Inventory)
        elseif DSmain.color == 3
            LockDevice(Game.GetFormFromFile(0x002429,"Devious Devices - Expansion.esm") as Armor)
            LockDevice(libsx2.zadx_cuffs_Padded_Collar_Red_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Red_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_PaddedOpen_Red_Inventory)
        endif

    endif

    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function PetsuitSet()
    DSmain.spawnPlayer()
    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,3)
    endif
    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,3)
    endif
    if DSmain.headGear == 1 || DSmain.headGear == 3
        if DSmain.color == 1
            LockDevice(libsx.zadx_GagEboniteHarnessBallBig_Inventory)
        else
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
        endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
         LockDevice(libsx.zadx_hood_leather_black_Inventory)
    endif
    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif

    int sec_color = DSmain.color
    
    if (DSmain.hardcore)
        DSmain.equipHardcorePlugs(True,True)
        
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"socks"))
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"catsuit"))
        if DSmain.color == 1
            LockDevice(libsx2.zadx_PetSuit_Black_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Arms_Black_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Black_Inventory)
            LockDevice(libsx2.zadx_Collar_Posture_Black_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_Padded_Black_Inventory)
            LockDevice(libsx2.zadx_chastitybra_Padded_Black_Inventory)
        elseif DSmain.color == 2
            LockDevice(libsx2.zadx_PetSuit_White_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Arms_White_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_White_Inventory)
            LockDevice(libsx2.zadx_Collar_Posture_White_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_Padded_White_Inventory)
            LockDevice(libsx2.zadx_chastitybra_Padded_White_Inventory)
        elseif DSmain.color == 3
            LockDevice(libsx2.zadx_PetSuit_Red_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Arms_Red_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Red_Inventory)
            LockDevice(libsx2.zadx_Collar_Posture_Red_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_Padded_Red_Inventory)
            LockDevice(libsx2.zadx_chastitybra_Padded_Red_Inventory)
        endif
        LockDevice(DSmain.randomColorNormDevice(sec_color,"mittens"))
    else
        LockDevice(libs.plugSoulgemVag)
        if DSmain.color == 1
            LockDevice(libsx2.zadx_PetSuit_Black_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Collar_Black_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Black_Inventory)
            LockDevice(Game.GetFormFromFile(0x001E3D,"Devious Devices - Expansion.esm") as Armor) ;chastity harness, no collar. DUnno why its not added to libs script
        elseif DSmain.color == 2
            LockDevice(libsx2.zadx_PetSuit_White_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Collar_White_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_White_Inventory)
            LockDevice(Game.GetFormFromFile(0x05735C,"Devious Devices - Expansion.esm") as Armor) ;chastity harness, no collar. DUnno why its not added to libs script
        elseif DSmain.color == 3
            LockDevice(libsx2.zadx_PetSuit_Red_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Collar_Red_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Red_Inventory)
            LockDevice(Game.GetFormFromFile(0x000E10,"Devious Devices - Expansion.esm") as Armor) ;chastity harness, no collar. DUnno why its not added to libs script
        endif
        LockDevice(DSmain.randomColorNormDevice(sec_color,"mittens"))
    endif
    
    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function YokeSet()
    DSmain.spawnPlayer()
    if DSmain.color == 0
        DSmain.color = Utility.RandomInt(1,3)
    endif
    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,3)
    endif
    if DSmain.headGear == 1 || DSmain.headGear == 3
        if DSmain.color == 1
            LockDevice(libsx.zadx_GagEboniteHarnessBallBig_Inventory)
        else
            LockDevice(DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
        endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
         LockDevice(libsx.zadx_hood_leather_black_Inventory)
    endif
    if DSmain.headGear > 4
        LockDevice(libsx2.zadx_gag_tape_Inventory)
        LockDevice(DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 5
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        LockDevice(DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif

    int sec_color = DSmain.color
    
    if Utility.randomInt(0,1)
        LockDevice(libs.Yoke)
    else
        LockDevice(libsx.zadx_yoke_steel_Inventory)
    endif
    
    if (DSmain.hardcore)
        DSmain.equipHardcorePlugs(True,True)
        
        ;LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"socks"))
        LockDevice(DSmain.randomColorNormDevice(sec_color,"pony-boots"))
        
        LockDevice(DSmain.randomColorCatsuitDevice(sec_color,"catsuit"))
        
        if DSmain.color == 1
            LockDevice(libsx2.zadx_cuffs_Padded_Arms_Black_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Black_Inventory)
            LockDevice(libsx2.zadx_Collar_Posture_Black_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_Padded_Black_Inventory)
            LockDevice(libsx2.zadx_chastitybra_Padded_Black_Inventory)
        elseif DSmain.color == 2
            LockDevice(libsx2.zadx_cuffs_Padded_Arms_White_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_White_Inventory)
            LockDevice(libsx2.zadx_Collar_Posture_White_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_Padded_White_Inventory)
            LockDevice(libsx2.zadx_chastitybra_Padded_White_Inventory)
        elseif DSmain.color == 3
            LockDevice(libsx2.zadx_cuffs_Padded_Arms_Red_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Red_Inventory)
            LockDevice(libsx2.zadx_Collar_Posture_Red_Inventory)
            LockDevice(libsx2.zadx_chastitybelt_Padded_Red_Inventory)
            LockDevice(libsx2.zadx_chastitybra_Padded_Red_Inventory)
        endif
        LockDevice(DSmain.randomColorNormDevice(sec_color,"mittens"))
    else
        LockDevice(libs.plugSoulgemVag)
        if DSmain.color == 1
            LockDevice(libsx2.zadx_cuffs_Padded_Collar_Black_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Black_Inventory)
            LockDevice(Game.GetFormFromFile(0x001E3D,"Devious Devices - Expansion.esm") as Armor) ;chastity harness, no collar. DUnno why its not added to libs script
        elseif DSmain.color == 2
            LockDevice(libsx2.zadx_cuffs_Padded_Collar_White_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_White_Inventory)
            LockDevice(Game.GetFormFromFile(0x05735C,"Devious Devices - Expansion.esm") as Armor) ;chastity harness, no collar. DUnno why its not added to libs script
        elseif DSmain.color == 3
            LockDevice(libsx2.zadx_cuffs_Padded_Collar_Red_Inventory)
            LockDevice(libsx2.zadx_cuffs_Padded_Legs_Red_Inventory)
            LockDevice(Game.GetFormFromFile(0x000E10,"Devious Devices - Expansion.esm") as Armor) ;chastity harness, no collar. DUnno why its not added to libs script
        endif
    endif
    
    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function LockDevice(Armor akDevice)
    DSmain.WaitLock(0.25)
    libs.LockDevice(Player,akDevice)
EndFunction

Function AbadonPlug()
    DSmain.spawnPlayer()
    equipAbadonPlug()
    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function equipAbadonPlug()
    if (DSmain.UDinstalled)
        Armor AbadonPlug = Game.getFormFromFile(0x135DDE,"UnforgivingDevices.esp") as Armor
        LockDevice(AbadonPlug)
    endif
EndFunction

Function TreasureHuntingWhore()
    Utility.wait(3.0)
    Quest THWquest = Game.getFormFromFile(0x005E6F, "TreasureHunterWhore.esp") as Quest
    Quest THWStopSlaveGirl = Game.getFormFromFile(0x0388F1, "TreasureHunterWhore.esp") as Quest
    Quest THWFindTreasure = Game.getFormFromFile(0x000D62, "TreasureHunterWhore.esp") as Quest

    THWTreasureHunterScript THWmain = THWFindTreasure as THWTreasureHunterScript

    THWPlayerAliasBaseScript THWalias = THWquest.GetAlias(0) as THWPlayerAliasBaseScript

    DSmain.THWhardcore = (THWalias.Config.HardcoreBondage)
    DSmain.THWinitOutfit = (THWalias.Config.BondageType)

    if (DSmain.THWoutfit == 0)
        THWalias.Config.HardcoreBondage = False
    else
        THWalias.Config.HardcoreBondage = True
        THWalias.Config.BondageType = DSmain.THWoutfit - 1
    endif

    DSmain.THWSlaveGirlQuestAllowed = THWalias.Config.SlaveGirlQuestAllowed
    THWalias.Config.SlaveGirlQuestAllowed = ((DSmain.THWmod == 0) || (DSmain.THWmod == 2))

    DSmain.THWTreasureHuntQuestAllowed = THWalias.Config.TreasureHuntQuestAllowed
    THWalias.Config.TreasureHuntQuestAllowed = ((DSmain.THWmod == 1) || (DSmain.THWmod == 2))

    if (DSmain.THWskipIntro)    
        ;copied and modified from og THWPlayerAliasBaseScript.psc
        If THWalias.Config.SlaveGirlQuestAllowed && THWalias.Config.TreasureHuntQuestAllowed
            If Utility.randomInt(0,1)
                THWalias.THWTreasureHunterQuestGlobal.SetValueInt(1)
                THWFindTreasure.start()
            Else            
                THWalias.THWSlaveGirlQuestGlobal.SetValueInt(1)
                THWStopSlaveGirl.start()
            EndIf
        ElseIf THWalias.Config.SlaveGirlQuestAllowed  && !THWalias.Config.TreasureHuntQuestAllowed 
            THWalias.THWSlaveGirlQuestGlobal.SetValueInt(1)
            THWStopSlaveGirl.start()
        ElseIf !THWalias.Config.SlaveGirlQuestAllowed && THWalias.Config.TreasureHuntQuestAllowed
            THWalias.THWTreasureHunterQuestGlobal.SetValueInt(1)
            THWFindTreasure.start()
        Else    
            ;no problemo
            THWalias.THWTreasureHunterQuestGlobal.SetValueInt(1) 
            THWFindTreasure.start()
        EndIf    
        debug.trace("[MDS] THW start: STARTED")

        THWalias.PlayerRef.EquipItem(THWmain.THWNoFastTravel as Armor, true, true)
        THWmain.DisablePlayerControl()
        THWalias.EquipItems()
        ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
        registerForSingleUpdate(5.0)
        THWmain.QuestStart()
    else
        THWalias.PrepScene()
    endif
EndFunction

Function TheFacilityDollSuit()
    if DSmain.TheFacilityInstalled
        DSmain.spawnPlayer()

        Armor DollsuitMain = Game.getFormFromFile(0x233A4F,"The Facility.esp") as Armor
        Armor DollsuitHood = Game.getFormFromFile(0x233A4B,"The Facility.esp") as Armor
        Armor DollsuitGag = Game.getFormFromFile(0x233A49,"The Facility.esp") as Armor
        Armor DollsuitBlindfold = Game.getFormFromFile(0x233A47,"The Facility.esp") as Armor
        Armor DollsuitHeels = Game.getFormFromFile(0x233A4D,"The Facility.esp") as Armor
        Armor DollsuitPlugs = Game.getFormFromFile(0x233A42,"The Facility.esp") as Armor
        Armor DollsuitBelt = Game.getFormFromFile(0x233A44,"The Facility.esp") as Armor
        
        LockDevice(DollsuitMain)
        LockDevice(DollsuitHeels)
        LockDevice(DollsuitGag)
        LockDevice(DollsuitBlindfold)
        LockDevice(DollsuitHood)
        LockDevice(DollsuitPlugs)
        LockDevice(DollsuitBelt)
        
        ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
        DSmain.registerForSingleUpdate(5)
    else
        debug.notification("MDS: Rubber Facility not installed!")
    endif
EndFunction

Event OnUpdate()
    if (DSmain.THWinstalled)
        Quest THWquest = Game.getFormFromFile(0x005E6F, "TreasureHunterWhore.esp") as Quest
        Quest THWStopSlaveGirl = Game.getFormFromFile(0x0388F1, "TreasureHunterWhore.esp") as Quest
        Quest THWFindTreasure = Game.getFormFromFile(0x000D62, "TreasureHunterWhore.esp") as Quest
        THWPlayerAliasBaseScript THWalias = THWquest.GetAlias(0) as THWPlayerAliasBaseScript
        if (THWFindTreasure.GetStage() == 10 || THWStopSlaveGirl.GetStage() == 10)
                ;THW started, returrn MCM values to init values
                THWalias.Config.HardcoreBondage =  DSmain.THWhardcore 
                THWalias.Config.BondageType = DSmain.THWinitOutfit 
                THWalias.Config.SlaveGirlQuestAllowed =  DSmain.THWSlaveGirlQuestAllowed
                THWalias.Config.TreasureHuntQuestAllowed =  DSmain.THWTreasureHuntQuestAllowed  
                CompleteQuest()
        else
            registerForSingleUpdate(1.0)
        endif
    endif
EndEvent
