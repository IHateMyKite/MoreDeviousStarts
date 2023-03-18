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
                libs.LockDevice(Player,libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
        elseif gag == 2
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-ring"))
        else
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-pad"))
        endif    
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        ;if (DSmain.color == 1)
        ;    libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
        ;    Utility.wait(0.5)
        ;    libs.LockDevice(Player,libsx.zadx_hood_rubber_openeyes_black_Inventory)
        ;else
            libs.LockDevice(Player,libsx.zadx_hood_rubber_black_Inventory)
        ;endif
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 5
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask"))
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask-tube"))
    endif
    Utility.wait(0.5)    
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsShockSoulNips)
        Utility.wait(0.5)
        libs.LockDevice(Player,libs.beltPadded)
        Utility.wait(0.5)
        libs.LockDevice(Player,libs.braPadded)

        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"collar"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"socks"))
        ;Utility.wait(0.5)
        ;libs.LockDevice(Player,libsx.zadx_AnkleShackles_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"catsuit"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"elbowbinder"))
        ;libs.LockDevice(Player,libs.zad_armBinderHisec_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libs.plugSoulgemVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libs.plugInflatableAn)
        endif

        libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libs.beltPadded)
        Utility.wait(0.5)
        libs.LockDevice(Player,libs.braPadded)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"collar"))

        if Utility.randomInt(0,1)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
            Utility.wait(0.5)
            libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"catsuit"))
            Utility.wait(0.5)
            libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"socks"))
        else
            libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"catsuit"))
            Utility.wait(0.5)
            libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"socks"))
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
                libs.LockDevice(Player,libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
        elseif gag == 2
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-ring"))
        else
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-pad"))
        endif    
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_hood_rubber_black_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 5
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask"))
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask-tube"))
    endif

    Utility.wait(0.5)
    if (DSmain.hardcore)
        
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsShockSoulNips)
        
        libs.LockDevice(Player,libs.beltPadded)
        Utility.wait(0.5)
        libs.LockDevice(Player,libs.braPadded)

        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"collar"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        
        Utility.wait(0.5)
        if Utility.randomInt(0,1)    
            libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"catsuit-open"))
            Utility.wait(0.5)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))
        else
            libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"open"))
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        endif
        
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libs.plugSoulgemVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libs.plugInflatableAn)
        endif
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libs.beltIron)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"collar"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        Utility.wait(0.5)
        if Utility.randomInt(0,1)    
            libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"open"))
        else
            libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"normal"))
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
            libs.LockDevice(Player,libs.gagBall)
        elseif gag == 2
            libs.LockDevice(Player,libs.gagRing)
        else
            libs.LockDevice(Player,libs.gagPanel)
        endif
    endif
    if (DSmain.headGear == 2 || DSmain.headGear == 3)
        libs.LockDevice(Player,libs.blindfold)
    endif
    
    if DSmain.hardcore
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        
        libs.LockDevice(Player,libs.zad_armBinderHisec_Inventory)

    else

        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libs.plugSoulgemVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libs.plugSoulgemAn)
        endif
        libs.LockDevice(Player,libs.armbinder)
    endif

    libs.LockDevice(Player,libs.piercingVSoul)
    Utility.wait(0.5)
    libs.LockDevice(Player,libs.piercingNSoul)

    Utility.wait(0.5)
    libs.LockDevice(Player,libs.beltpadded)
    Utility.wait(0.5)
    libs.LockDevice(Player,libs.braPadded)
    Utility.wait(0.5)
    libs.LockDevice(Player,libs.cuffsPaddedLegs)
    Utility.wait(0.5)
    libs.LockDevice(Player,libs.cuffsPaddedArms)
    Utility.wait(0.5)
    libs.LockDevice(Player,libs.collarPosture)
    Utility.wait(0.5)
    libs.LockDevice(Player,libsx.bootsLocking)


    ARTHLALRumorsOfWarQuest.RegisterForSingleUpdate(0.25)
    DSmain.registerForSingleUpdate(5)
EndFunction

Function TransparentSet()
    DSmain.spawnPlayer()

    if DSmain.headGear == 50
        DSmain.headGear = Utility.randomInt(0,8)
    endif

    if DSmain.headGear == 1 || DSmain.headGear == 3
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,libsx.wtEboniteBlindfold)
    endif
    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_hood_rubber_transparent_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.wtEboniteBlindfold)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.wtEboniteBlindfold)
    endif

    if DSmain.headGear == 5
        libs.LockDevice(Player,libsx.zadx_catsuit_gasmask_white_Inventory)
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,libsx.zadx_catsuit_gasmask_filter_white_Inventory)
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,libsx.zadx_catsuit_gasmask_rebr_white_Inventory)
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,libsx.zadx_catsuit_gasmask_tube_white_Inventory)
    endif
    Utility.wait(0.5)
    libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
    Utility.wait(0.5)
    if (DSmain.hardcore)

        libs.LockDevice(Player,libsx.zadx_HobbleDressTransparentInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_restrictiveBootsTrans_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_restrictiveCollarTrans_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_restrictiveCorsetTrans_Inventory)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        
        libs.LockDevice(Player,libsx.PiercingsShockSoulNips)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_AnkleShackles_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_yoke_steel_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_PawBondageMittensWhiteInventory)

    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libsx.PlugsFilledSoulVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libs.plugInflatableAn)
        endif
        libs.LockDevice(Player,libsx.zadx_catsuit_boots_transparent_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_catsuit_transparent_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.wtEboniteArmbinder)
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
            libs.LockDevice(Player,libsx.zadx_gag_rope_bit_Inventory)
        else
            libs.LockDevice(Player,libsx.zadx_gag_rope_ball_Inventory)
        endif
        
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,libsx.zadx_blindfold_Rope_Inventory)
    endif
    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx.eboniteBlindfold)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.eboniteBlindfold)
    endif

    if DSmain.headGear == 5
        libs.LockDevice(Player,libsx.zadx_catsuit_gasmask_black_Inventory)
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,libsx.zadx_catsuit_gasmask_filter_black_Inventory)
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,libsx.zadx_catsuit_gasmask_rebr_black_Inventory)
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,libsx.zadx_catsuit_gasmask_tube_black_Inventory)
    endif
    Utility.wait(0.5)
    libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
    Utility.wait(0.5)
    if (DSmain.hardcore)
        libs.LockDevice(Player,libsx.zadx_Collar_Rope_1_Inventory)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        
        libs.LockDevice(Player,libsx.PiercingsShockSoulNips)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_Harness_Rope_Full_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_Armbinder_Rope_Strict_Inventory)
    else
        libs.LockDevice(Player,libsx.zadx_Collar_Rope_2_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx2.zadx_rope_cuffs_legs_Inventory)
        Utility.wait(0.5)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libsx.PlugsFilledSoulVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libs.plugInflatableAn)
        endif

        Utility.wait(0.5)
        libs.LockDevice(Player,libsx2.zadx_rope_crotch_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_Armbinder_Rope_Inventory)
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
        libs.LockDevice(Player,libsx2.zadx_Gag_Ball_Extreme_Red_Inventory)
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(sec_color,"blindfold"))
    endif
    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_hood_rubber_black_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(sec_color,"blindfold"))
    endif

    if DSmain.headGear == 5
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask"))
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(sec_color,"gasmask-tube"))
    endif
    
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        
        libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsShockSoulNips)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-collar"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        Utility.wait(0.5)

        int randomdevice = Utility.randomInt(1,3)
        if randomdevice == 1
            libs.LockDevice(Player,libsx2.zadx_elbowshackles_Inventory)
        elseif randomdevice == 2
            libs.LockDevice(Player,libsx.zadx_yoke_steel_Inventory)
        else 
            libs.LockDevice(Player,DSmain.randomColorNormDevice(sec_color,"armbinder"))
        endif
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(sec_color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libs.plugSoulgemVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libs.plugInflatableAn)
        endif

        libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)

        Utility.wait(1.0)

        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Silver_Inventory)

        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-collar"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-gloves"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))

        Utility.wait(1.0)

        libs.LockDevice(Player,DSmain.randomColorNormDevice(sec_color,"armbinder"))
        Utility.wait(0.5)
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
            libs.LockDevice(Player,libsx.zadx_GagEboniteHarnessBallBig_Inventory)
        else
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
        endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        
        Utility.wait(1.0)

            
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        ;libs.LockDevice(Player,libsx.bootsLocking)
        
        if Utility.randomInt(0,1)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"chas-harness"))
            Utility.wait(0.5)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
        else
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"collar"))    
            Utility.wait(0.5)
            libs.LockDevice(Player,libs.beltIron)
            Utility.wait(0.5)
            libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"open"))
        endif

        Utility.wait(1.0)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        libs.lockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libs.plugSoulgemVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libs.plugInflatableAn)
            Utility.wait(0.5)
            libs.LockDevice(Player,libs.piercingVSoul)
            Utility.wait(0.5)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"chas-harness"))
        endif

        Utility.wait(0.5)
        ;libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        ;libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        ;if Utility.randomInt(0,1)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
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
                libs.LockDevice(Player,libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
        elseif gag == 2
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-ring"))
        else
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-pad"))
        endif    
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_hood_rubber_black_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    Utility.wait(0.5)
    if DSmain.headGear == 5
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif

    Utility.wait(0.5)
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        libs.LockDevice(Player,libsx.PiercingsShockSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsShockSoulNips)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_cuffs_Padded_Arms_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        Utility.wait(0.5)
        if(Utility.randomInt(0,1))
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        else
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))
        endif
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_AnkleShackles_Silver_Inventory)
        Utility.wait(0.5)
        if Utility.randomInt(0,1)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"elbowbinder"))
        else
            libs.LockDevice(Player,libs.zad_armBinderHisec_Inventory)
        endif
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libsx.PlugsGreaterSoulVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libsx.PlugsGreaterSoulAnl)
        endif
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsCommonSoulNips)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_cuffs_Padded_Arms_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_cuffs_Padded_Legs_Silver_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        Utility.wait(0.5)
        if(Utility.randomInt(0,1))
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-boots"))
        else
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))
        endif

        Utility.wait(0.5)
        if Utility.randomInt(0,1)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
        else
            libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"open"))
        endif
        Utility.wait(0.5)
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
        libs.LockDevice(Player,libsx2.zadx_Gag_Ball_Extreme_Red_Inventory)
    EndIf
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_hood_rubber_black_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    Utility.wait(0.5)
    if DSmain.headGear == 5
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif
    Utility.wait(0.5)
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsShockSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsShockSoulNips)

        Utility.wait(0.5)

        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_cuffs_Padded_Arms_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_cuffs_Padded_Legs_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"ballet"))
        Utility.wait(0.5)
        int random = Utility.randomInt(1,3)
        if  random == 1
            libs.LockDevice(Player,libsx2.zadx_elbowshacklesHook_Inventory)
            Utility.wait(0.5)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"hobble"))
        elseif random == 2
            libs.LockDevice(Player,libsx.zadx_yoke_steel_Inventory)
            Utility.wait(0.5)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"hobble"))
        else
            if (Utility.randomInt(0,1))
                libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"leg-open"))
            else
                libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"hobbl-open"))
            endif

        endif

        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libsx.PlugsGrandSoulVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libsx.PlugsGrandSoulAnl)
        endif
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsCommonSoulNips)

        Utility.wait(0.5)    

        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_cuffs_Padded_Arms_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_cuffs_Padded_Legs_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-collar"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"ballet"))
        Utility.wait(0.5)
        if Utility.randomInt(0,1)
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"armbinder"))
            libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"hobble"))
        else
            if (Utility.randomInt(0,1))
                libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"leg-open"))
            else
                libs.LockDevice(Player,DSmain.randomColorStraitjacketDevice(DSmain.color,"hobbl-open"))
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
            libs.LockDevice(Player,libsx.zadx_HR_PearGagInventory)
        elseif gag == 2
            libs.LockDevice(Player,libsx.zadx_HR_IronBitGagInventory)
        else
            libs.LockDevice(Player,libsx.zadx_HR_IronRingGagInventory)
        endif    
    endif
    
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(1,"blindfold"))
    endif
    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(1,"blindfold"))
    endif
    Utility.wait(0.5)
    if DSmain.headGear == 5
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif
    Utility.wait(0.5)

    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs()
        endif
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsShockSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsShockSoulNips)
        
        Utility.wait(0.5)

        libs.LockDevice(Player,libs.beltIron)

        Utility.wait(0.5)
        
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessBodyInventory)

        Utility.wait(0.5)

        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessArmsInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessBraInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessLegsInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessGlovesInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessBootsInventory)
        Utility.wait(0.5)
        if Utility.randomInt(0,1)
            libs.LockDevice(Player,libsx2.zadx_elbowshackles_Inventory)
        else
            libs.LockDevice(Player,libs.Yoke)
        endif
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libsx.PlugsBlackSoulVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libsx.PlugsBlackSoulAnl)
        endif

        libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.PiercingsCommonSoulNips)

        Utility.wait(0.5)    
        libs.LockDevice(Player,libs.beltIron)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessBodyInventory)

        Utility.wait(0.5)    

        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessArmsInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessBraInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessLegsInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessGlovesInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_ChainHarnessBootsInventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_HR_IronCuffsFrontInventory)

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
        libs.LockDevice(Player,libsx.zadx_dud_Pony_Harness_Secure_Ebonite_BlackInventory)
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif
    Utility.wait(0.5)
    if DSmain.headGear == 5
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif
    Utility.wait(0.5)
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs(True,False)
        endif
        libs.LockDevice(Player,libsx.zadx_HR_PlugPonyTail01Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libs.beltPadded)
        Utility.wait(0.5)
        libs.LockDevice(Player,libs.braPadded)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"res-corset"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"har-collar"))

        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"elbowbinder"))
        Utility.wait(0.5)
        libs.lockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"mittens"))

    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libs.plugSoulgemVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libsx.PiercingsCommonSoulVag)
            Utility.wait(0.5)
            libs.LockDevice(Player,libsx.PiercingsShockSoulNips)
        endif
        libs.LockDevice(Player,libsx.zadx_HR_PlugPonyTail01Inventory)
        Utility.wait(0.5)

        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"chas-harness"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"pony-boots"))

        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"armbinder"))

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
                libs.LockDevice(Player,libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 5
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif
    Utility.wait(0.5)
    if (DSmain.hardcore)
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            DSmain.equipHardcorePlugs(True,True)
        endif
        Utility.wait(1.0)
        libs.LockDevice(Player,libsx.zadx_chastitybelt_Padded_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_chastitybra_Padded_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_Collar_Posture_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_cuffs_Padded_Arms_Gold_Inventory)
        Utility.wait(0.5)
        libs.LockDevice(Player,libsx.zadx_cuffs_Padded_Legs_Gold_Inventory)

        Utility.wait(0.5)
        libs.lockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"mittens"))
        ;Utility.wait(0.5)
    else
        if(DSmain.useAbadonPlug)
            equipAbadonPlug()
        else
            libs.LockDevice(Player,libs.plugSoulgemVag)
        endif
        Utility.wait(0.5)

        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"chas-harness"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-arms"))
        Utility.wait(0.5)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"cuffs-legs"))

        ;Utility.wait(1.0)
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
                libs.LockDevice(Player,libsx.zadx_GagEboniteHarnessBallBig_Inventory)
            else
                libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"gag-ball"))
            endif
    endif
    if DSmain.headGear == 2 || DSmain.headGear == 3
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.1)
        libs.LockDevice(Player,libsx.zadx_hood_leather_black_Inventory)
    endif

    if DSmain.headGear > 4
        libs.LockDevice(Player,libsx2.zadx_gag_tape_Inventory)
        Utility.wait(0.1)
        libs.LockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"blindfold"))
    endif

    if DSmain.headGear == 5
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask"))
    elseif DSmain.headGear == 6
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-filter"))
    elseif DSmain.headGear == 7
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-rebreather"))
    elseif DSmain.headGear == 8
        libs.LockDevice(Player,DSmain.randomColorCatsuitDevice(DSmain.color,"gasmask-tube"))
    endif

    Utility.wait(0.1)
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
        libs.lockDevice(Player,DSmain.randomColorNormDevice(DSmain.color,"mittens"))
    else
        libs.LockDevice(Player,libs.plugSoulgemVag)
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

Function LockDevice(Armor akDevice)
    Utility.wait(0.1)
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
        ;UnforgivingDevicesMain UDmain = Game.getFormFromFile(0x005901,"UnforgivingDevices.esp") as UnforgivingDevicesMain
        ;bool tempSet = UDmain.final_finisher_set
        ;UDmain.final_finisher_set = false
        ;UD_equipedCustomDevices plugScript = UDCDmain.getFirstDeviceByKeyword(libs.zad_deviousPlug,libs.zad_devious)
        libs.lockDevice(Player,AbadonPlug)
        ;UDmain.final_finisher_set = tempSet
    endif
EndFunction


Function TreasureHuntingWhore()
    Utility.Wait(3.0)
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
        
        libs.lockDevice(Player,DollsuitMain)
        ;Utility.wait(0.5)
        libs.lockDevice(Player,DollsuitHeels)
        ;Utility.wait(0.5)
        libs.lockDevice(Player,DollsuitGag)
        ;Utility.wait(0.5)
        libs.lockDevice(Player,DollsuitBlindfold)
        ;Utility.wait(0.5)
        libs.lockDevice(Player,DollsuitHood)
        ;Utility.wait(0.5)
        libs.lockDevice(Player,DollsuitPlugs)
        ;Utility.wait(0.5)
        libs.lockDevice(Player,DollsuitBelt)
        
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
