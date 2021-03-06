if select(3, UnitClass("player")) == 6 then
function Blood()
	--ChatOverlay(getNumEnnemies("player",10))
	if AoEModesLoaded ~= "Blood DK AoE Modes" then
		BloodOptions();
		BloodToggles();
	end

	-- Locals
	local runicPower, runesBlood, runesUnholy, runesFrost, runesDeath = UnitPower("player"), getRunes("blood"), getRunes("unholy"), getRunes("frost"), getRunes("death")

	-- Food/Invis Check
	if canRun() ~= true or UnitInVehicle("Player") then return false; end
	if IsMounted("player") then return false; end

	if UnitAffectingCombat("player") then

		-- Mind Freeze
		if isChecked("Mind Freeze") == true and targetDistance <= 4 then
			if canInterrupt(_MindFreeze, getValue("Mind Freeze")) then
				castSpell("target",_MindFreeze,false);
			end
		end

    	-- Anti Magic Shell
    	if isChecked("Anti-Magic Shell") == true and getHP("player") <= getValue("Anti-Magic Shell") and targetDistance <= 20 then
    		if castSpell("player",_AntiMagicShell,true) then return; end
    	end

    	-- Dancing Rune Weapon
    	if isChecked("Dancing Rune Weapon") == true and getHP("player") <= getValue("Dancing Rune Weapon") then
    		if castSpell("player",_DancingRuneWeapon,true) then return; end
    	end

    	-- Conversion
        if isChecked("Conversion") == true and getHP("player") <= getValue("Conversion") then
    		if castSpell("player",_Conversion,true) then return; end
    	end

    	-- Vampiric Blood
        if isChecked("Vampiric Blood") == true and getHP("player") <= getValue("Vampiric Blood") then
    		if castSpell("player",_VampiricBlood,true) then return; end
    	end

    	-- Icebound Fortitude
        if isChecked("Icebound Fortitude") == true and getHP("player") <= getValue("Icebound Fortitude") then
    		if castSpell("player",_IceboundFortitude,true) then return; end
    	end

    	-- Rune Tap
        if isChecked("Rune Tap") == true and getHP("player") <= getValue("Rune Tap") then
    		if castSpell("player",_RuneTap,true) then return; end
    	end

    	-- Empower Rune Weapon
        if isChecked("Empower Rune Weapon") == true and getHP("player") <= getValue("Empower Rune Weapon") then
    		if castSpell("player",_EmpowerRuneWeapon,true) then return; end
    	end
	end


	if isCasting() or getSpellCD(61304) > 0 then return false; end

    -- Presence
    if isKnown(_BloodPresence) and isChecked("Presence") then
    	if getValue("Presence") == 1 and UnitBuffID("player",_BloodPresence) == nil then
    		if castSpell("player",_BloodPresence,true) then return; end
    	elseif getValue("Presence") == 2 and UnitBuffID("player",_FrostPresence) == nil then
    		if castSpell("player",_FrostPresence,true) then return; end
    	end
    elseif isChecked("Frost Presence") then
    	if getValue("Presence") == 2 and UnitBuffID("player",_FrostPresence) == nil then
    		if castSpell("player",_FrostPresence,true) then return; end
    	end
    end

	-- Horn of Winter
	if getBuffRemain("player",_HornOfWinter) <= 4 then
		if castSpell("player",_HornOfWinter,true) then return; end
	end

	if isInCombat("player") and isAlive() and (isEnnemy() or isDummy("target")) then

	    -- Death Siphon
	    if runesDeath >= 1 and getHP("player") <= getValue("Death Siphon") then
	    	if castSpell("target",_DeathSiphon,false) then return; end
	    end

		-- Raise Dead
		if isSelected("Raise Dead") then
			if castSpell("player",_RaiseDead,true) then return; end
		end

    	-- Bone Shield
    	if isChecked("Bone Shield") and UnitBuffID("player",_BoneShield) == nil then
    		if castSpell("player",_BoneShield,true) then return; end
    	end

    	-- Death and Decay
		if isSelected("Death And Decay") and (getRunes("unholy") >= 1 or getRunes("death") >= 1) then
			if getGround("target") == true and UnitExists("target") and ((isDummy("target") and getDistance("target","targettarget") <= 10) or getDistance("target","targettarget") <= 20) then
				if castGroundBetween("target",_DeathAndDecay,30) then return; end
			end
		end    	

	    -- Blood Tap
	    if getBuffStacks("player",114851) >= 5 and canTap() then
	    	if castSpell("player",_BloodTap,true) then return; end
	    end

	    -- Runic Dump
	    if runicPower >= 90 then
	    	if isKnown(_RuneStrike) and targetDistance < 4 then
	    		if castSpell("target",_RuneStrike,false) then return; end
	   		else
	   			-- Death Coil
	    		if castSpell("target",_DeathCoil,false) then return; end
	    	end
	    end

	    if ScanTimer == nil or ScanTimer <= GetTime() - 1 then
	    	meleeEnnemies, targetEnnemies, ScanTimer = getNumEnnemies("player",4), getEnnemies("target",10), GetTime(); 
	    end

	    -- Pestilence - Bring
	    local PestiSpell;
	    if isKnown(_RoilingBlood) then PestiSpell = _BloodBoil; else PestiSpell = _Pestilence; end	    
	    if targetDistance < 8 and (runesBlood >= 1 or runesDeath >= 1) and (pestiTimer == nil or pestiTimer <= GetTime() - 2) then
			if canCast(PestiSpell) then
				if not UnitDebuffID("target",55078,"player") then
					for i = 1, #targetEnnemies do
						local Guid = targetEnnemies[i]
						ISetAsUnitID(Guid,"thisUnit");
						if getCreatureType("thisUnit") == true and getDebuffRemain("thisUnit",55078,"player") >= 2 and getDistance("target","thisUnit") < 8 then
							if PestiSpell == _BloodBoil then
								if castSpell("player",PestiSpell,true) then pestiTimer = GetTime(); return; end	
							else	
								if castSpell("thisUnit",PestiSpell,true) then pestiTimer = GetTime(); return; end	
							end						
						end
					end	
				end
			end
	    end

	    -- Blood Boil - Refresh
	    if targetDistance <= 5 and (runesBlood >= 1 or runesDeath >= 1) and ((UnitDebuffID("target",55078,"player") ~= nil and getDebuffRemain("target",55078,"player") < 6)) then
	    	if castSpell("player",_BloodBoil,true) then return; end
	    end

	    -- Outbreak
	    if UnitDebuffID("target",55078,"player") == nil then
	    	if castSpell("target",_Outbreak,false) then return; end
	    end

	    -- Plague Strike
	    if (runesUnholy >= 1 or runesDeath >= 1) and getDebuffRemain("target",55078,"player") < 4 then
	    	if castSpell("target",_PlagueStrike,false) then return; end
	    end

	    -- Icy Touch
	    if (runesFrost >= 1 or (runesDeath >= 1 and getDebuffRemain("target",55078,"player") > 4)) and getDebuffRemain("target",55095) < 4 then
		    if castSpell("target",_IcyTouch,false) then return; end
	    end

	    -- Pestilence/Rolling Blood - Spread
	    if targetDistance < 8 and #targetEnnemies > 2 and (runesBlood >= 1 or runesDeath >= 1) and (pestiTimer == nil or pestiTimer <= GetTime() - 1) then
			if canCast(PestiSpell) then
				if getDebuffRemain("target",55078,"player") >= 2 then
					for i = 1, #targetEnnemies do
						local Guid = targetEnnemies[i]
						ISetAsUnitID(Guid,"thisUnit");
						if getCreatureType("thisUnit") == true and UnitDebuffID("thisUnit",55078,"player") == nil and getDistance("target","thisUnit") < 8 then
							if PestiSpell == _BloodBoil then
								if castSpell("player",PestiSpell,true) then pestiTimer = GetTime(); return; end	
							else	
								if castSpell("target",PestiSpell,true) then pestiTimer = GetTime(); return; end	
							end								
						end
					end	
				end
			end
	    end

	    -- Heart Strike//Blood Strike
	    if runesBlood > 1 or (runesDeath > 1 and UnitDebuffID("target",55078,"player") ~= nil) then
	    	if isKnown(_HeartStrike) and #targetEnnemies < 3 then
	    		if castSpell("target",_HeartStrike,false) then return; end
	    	elseif isKnown(_HeartStrike) == false and #targetEnnemies < 3 then
	    		if castSpell("target",_BloodStrike,false) then return; end
	    	else
	    		if castSpell("player",_BloodBoil,true) then return; end
	    	end
	    end

	    -- Death Strike
	    if UnitDebuffID("target",55078,"player") ~= nil and (runesFrost >= 1 and runesUnholy >= 1) 
	      or (runesFrost >= 1 and runesDeath >= 1)
	      or (runesDeath >= 1 and runesUnholy >= 1)
	      or (runesDeath >= 2) then
	    	if castSpell("target",_DeathStrike,false) then return; end
	    end
	   
	    -- Blood Boil - Scarlet Fever
	    if targetDistance <= 5 and UnitBuffID("player",81141) ~= nil then
	    	if castSpell("player",_BloodBoil,true) then return; end
	    end

	    -- Icy Touch
	    if runesFrost > 1 then
	    	if castSpell("target",_IcyTouch,false) then return; end
	    end

	    -- Soul Reaper
	    if getHP("target") < 35 then
	    	if castSpell("target",_SoulReaper,false) then return; end
	    end

	    -- Rune Strike//Death Coil
	    if runicPower >= 40 then
		    if isKnown(_RuneStrike) and targetDistance < 5 then
		    	if castSpell("target",_RuneStrike,false) then return; end
		    else
		    	if castSpell("target",_DeathCoil,false) then return; end
		    end
		end

	    -- Horn of Winter
	    if UnitBuffID("player",_HornOfWinter) == nil then
	    	if castSpell("player",_HornOfWinter,true) then return; end
	    end
	end
end
end




