if select(3,UnitClass("player")) == 2 then
	--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
	--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
	--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
	--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
	--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
	--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
	--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]

	_ArdentDefender             =   31850
	_AvengersShield             =   31935
	_AvengingWrath              =   31884
	_BeaconOfLight              =   53563
	_Berserking                 =   26297  
	_BlessingOfKings            =   20217
	_BlessingOfMight            =   19740
	_BlindingLight              =   115750
	_BloodFury                  =   20572 
	_Cleanse                    =   4987
	_Consecration               =   26573
	_CrusaderStrike             =   35395
	_Denounce                   =   2812
	_DevotionAura               =   31821
	_DivineFavor                =   31842
	_DivineLight                =   82326
	_DivinePlea                 =   54428
	_DivineProtection           =   498
	_DivineShield               =   642
	_DivineStorm                =   53385
	_EternalFlame               =   114163
	_ExecutionSentence          =   114157
	_Exorcism                   =   879
	_FistOfJustice              =   105593
	_FlashOfLight               =   19750
	_HandOfFreedom              =   1044
	_HandOfProtection           =   1022
	_HandOfPurity               =   114039
	_HandOfSacrifice            =   6940
	_HandOfSalvation            =   1038
	_HammerOfJustice            =   853
	_HammerOfTheRighteous       =   53595
	_HammerOfWrath              =   24275
	_HolyAvenger                =   105809
	_HolyLight                  =   635
	_HolyPrism                  =   114165
	_HolyRadiance               =   82327
	_HolyShock                  =   20473
	_HolyWrath                  =   119072
	_GiftOfTheNaaru             =   59542
	_GuardianOfAncientKings     =   86659
	_GuardianOfAncientKingsHoly =   86669
	_GuardianOfAncientKingsRet  =   86698
	_Inquisition                =   84963
	_Judgment                  =   20271
	_LayOnHands                 =   633
	_LightOfDawn                =   85222
	_LightsHammer               =   114158
	_MassExorcism               =   122032
	_MassResurection            =   83968
	_Rebuke                     =   96231
	_Reckoning                  =   62124
	_Redemption                 =   7328
	_RighteousFury              =   25780           
	_Repentance                 =   20066
	_SanctifiedWrath            =   53376
	_SacredShield               =   20925
	_SealOfInsight              =   20165
	_SealOfRighteousness        =   20154
	_SealOfThruth               =   31801
	_SelflessHealer             =   85804
	_ShieldOfTheRighteous       =   53600
	_SpeedOfLight               =   85499
	_TemplarsVerdict            =   85256
	_TurnEvil                   =   10326       
	_WordOfGlory                =   85673

	function Blessings()
		if UnitBuffID("player",144051) ~= nil then return false end
		local BlessingCount = 0
		for i = 1, #nNova do
			local _, MemberClass = select(2,UnitClass(nNova[i].unit))
			if UnitExists(nNova[i].unit) then 
				if MemberClass ~= nil then
					if MemberClass == "DRUID" then BlessingCount = BlessingCount + 1 end                
					if MemberClass == "MONK" then BlessingCount = BlessingCount + 1 end                 
					if MemberClass == "PALADIN" then BlessingCount = BlessingCount + 50 end 
					if MemberClass == "SHAMAN" then BlessingCount = BlessingCount + 1000 end
				end     
			end 
		end 
		if BlessingCount > 50 and BlessingCount < 1000 then
			MyBlessing = _BlessingOfMight
		else
			MyBlessing = _BlessingOfKings
		end
		if ActiveBlessingsValue == 2 then
			MyBlessing = _BlessingOfKings
		elseif ActiveBlessingsValue == 3 then
			MyBlessing = _BlessingOfMight
		end 
		if MyBlessing == _BlessingOfMight and not Spells[_BlessingOfMight].known then MyBlessing = _BlessingOfKings end
		if MyBlessing == _BlessingOfKings and not Spells[_BlessingOfKings].known then BuffTimer = GetTime() + 600 return false end  
		if BuffTimer == nil or BuffTimer < GetTime() then
			for i=1, #nNova do
				if not UnitBuffID(nNova[i].unit,MyBlessing) then
					BuffTimer = GetTime() + random(15,30);
					if castSpell("player",MyBlessing) then return; end
				end
			end 
		end
	end

--[[]]	   --[[]]	--[[           ]]	--[[]]				--[[]]	  --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[]]				--[[]]	  --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[]]				   --[[    ]]	   
--[[           ]]	--[[]]	   --[[]]	--[[]]				   --[[    ]]
--[[           ]]	--[[]]	   --[[]]	--[[]]					 --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[]]
 
--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

--[[           ]]	--[[           ]]	--[[           ]] 	--[[           ]]
--[[           ]]	--[[           ]]	--[[           ]] 	--[[           ]]
--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]	   --[[]]		 --[[ ]]
--[[         ]]		--[[         ]]	    --[[]]	   --[[]]		 --[[ ]]
--[[       ]]		--[[        ]]		--[[]]	   --[[]]		 --[[ ]]
--[[]]				--[[]]	  --[[]]	--[[           ]]	 	 --[[ ]]		
--[[]] 				--[[]]	   --[[]]	--[[           ]]		 --[[ ]]

    function PaladinProtFunctions()
        function SacredShield()
            local SacredShieldCheck = BadBoy_data["Check Sacred Shield"];
            local SacredShield = BadBoy_data["Box Sacred Shield"];
            if UnitBuffID("player",20925) then SacredShieldTimer = select(7, UnitBuffID("player",20925)) - GetTime() else SacredShieldTimer = 0 end
            if SacredShieldCheck and getHP("player") <= SacredShield then
                if ((isMoving("player") or UnitAffectingCombat("player")) and not UnitBuffID("player",20925)) or (LastVengeance ~= nil and (GetVengeance() > (BadBoy_data["Box Sacred Vengeance"] + LastVengeance))) then
                    LastVengeance = GetVengeance()
                    return true;
                end
                if SacredShieldTimer <= 3 then
                    return true;
                end
            end 
            return false;
        end

        function GetHolyGen()
            local Delay = 0.3;
            if UnitPower("player", 9) <= 4 and getSpellCD(_CrusaderStrike) < Delay or getSpellCD(_Judgment) < Delay or UnitBuffID("player", 85416) then 
                return true;
            else
                return false;
            end
        end
		
		-- Functionality regarding interrupting target(s) spellcasting
		-- Rebuke is used if available and implemented as of now. This could be enhanced to use other spells for interrup
		-- returns of the cast is succesful or not.
		-- ToDos:  Add multiple interrupts such as binding light(if within 10 yards and facing, Fist of Justice(stuns), Avengers shield
		-- Should perhaps move out the spellCD and ranged outside canInterrupt?? So first check if range and cd is ok for cast, then check for timeframe?d
		function ProtPaladinInterrupt()
			--See what spell we want to use
			if isChecked("Rebuke") then
				if canInterrupt(_Rebuke, tonumber(BadBoy_data["Box Rebuke"])) and getDistance("player","target") <= 4 then 
					return castSpell("target",_Rebuke,false);
				end
			end
			-- Should add Avengers Shield
			-- Should add Fist of Justice
			-- Should add Blinding Light with facing logic.
			return false
		end
		
		function ProtPaladinSurvivalSelf() -- Check if we are close to dying and act accoridingly
			local _HolyPower = UnitPower("player", 9);
			local playerHP = getHP("player")
			
			-- Lay on Hands
			if getHP("player") <= getValue("Lay On Hands") then
				if castSpell("player",_LayOnHands,true) then 
					return; 
				end
			end
			
			if BadBoy_data["Check ------ Defensive -------"] == 1 then 
				-- Divine Protection
				if BadBoy_data["Check Divine Protection"] == 1 and getHP("player") <= BadBoy_data["Box Divine Protection"] then -- Should we check if damage is physical?
					if castSpell("player",_DivineProtection,true) then 
						return; 
					end
				end
				
				-- Ardent Defender
				if BadBoy_data["Check Ardent Defender"] == 1 and getHP("player") <= BadBoy_data["Box Ardent Defender"] then
					if castSpell("player",_ArdentDefender,true) then 
						return;  --Here we return as we should
					end
				end
				
				-- Guardian of the Ancient Kings
				if BadBoy_data["Check GotAK Prot"] == 1 and getHP("player") <= BadBoy_data["Box GotAK Prot"] then 
					if castSpell("player",_GuardianOfAncientKings,true) then 
						return; 
					end
				end
			end
			
			
			--other radical means of survival?
			-- Missing LayOnHands and Divine Shield, also perhaps Avenging Wrath for increased self healing.
			-- Eternal flame/sacred Shield/Word Of Glory
			-- Fol ?? Really? With Selfless healer?
			-- Hand of Protection
			-- Hand of Salvation
			-- 
		end
		
		-- ProtPaladinSurvivalOther() -- Check if raidmember are close to dying and act accoridingly
		function ProtPaladinSurvivalOther() -- Check if we are close to dying and act accoridingly
			local _HolyPower = UnitPower("player", 9);
						
			-- Lay on Hands
			if nNova[1].hp <= getValue("Lay On Hands") then
				if castSpell(nNova[1].unit,_LayOnHands,true) then 
					return; 
				end
			end
			-- Eternal flame/sacred Shield/Word Of Glory
			-- Fol
			-- Hand of Protection
			-- Hand of Sacrifice
			-- Hand of Salvation
			-- 
		end
			
		function ProtPaladinBuffs() -- Make sure that we are buffed, 2 modes, inCombat and Out Of Combat, Blessings, RF, -- ProtPaladinBuffs()
			-- Righteous Fury
			if isChecked("Righteous Fury") then
				if UnitBuffID("player",_RighteousFury)== nil then
					if castSpell("player",_RighteousFury, true) then 
						return; 
					end
				end
			end
			--Blessings Logic here
			
		end

	
		-- Handles Seal logic dependent on situation
		function ProtPaladinSealLogic()
		-- Seems to have 2 values Check Seal 0 = not checked, 1 = checked
		-- Drop Seal:  1 = Insight,  2 = Truth, 3 = Swap, 
		-- Prot have 3 Seals, 
		--		Seal of Truth which gives 12% more damage and applies census
		--		Seal of Righteousness give 9% damage to all anemies around u
		--		Seal of insight, boost healing spells by 5%, chance to heal close wounded ally
		-- Seal of Insight is pretty much the only one to use, but the options is there.
			local seal = getValue("Seal");
			local numEnnemies = getNumEnnemies("player",4) -- Should perhaps get this as parameter to get better performance.
			if seal == 1 then 
				if GetShapeshiftForm() ~= 3 then 
					if castSpell("player",_SealOfInsight,true) then 
						return; 
					end
					return false
				end 
			end
			if seal == 2 then 
				if GetShapeshiftForm() ~= 1 then 
					if castSpell("player",_SealOfThruth,true) then --Should be changed to SealOfTruth
						return; 
					end 
				end 
			end
			if seal == 3 then
				if getHP("player") < 50 then 
					if GetShapeshiftForm() ~= 3 then 
						if castSpell("player",_SealOfInsight,true) then 
							return; 
						end
					end 
				elseif getHP("player") > 60 and numEnnemies < 3 then 
					if GetShapeshiftForm() ~= 1 then 
						if castSpell("player",_SealOfThruth,true) then 
							return; 
						end 
					end 
				elseif getHP("player") > 60 and GetShapeshiftForm() ~= 2 then 
					if castSpell("player",_SealOfRighteousness,true) then 
						return; 
					end 
				end
			end
		end
			
		-- ProtPaladinDispells() -- Handling the dispelling self and party
		-- ProtPaladinCooldowns() -- Handles the use of offensive Coolsdowns, ProtPaladinSurvival... handles the defensive.
		
		function ProtPaladinHolyPowerConsumers() -- Handle the use of HolyPower
			-- We can use Hoy Power on Shield of Right or Word OF Glory(inclduing Sacred Shield and Eternal Flame)
			-- since this are Off GCD we can use them regardless so we return false here 
			-- Use SoR if we have 5 HP and dont need heal and have Eternal Flame/Sacred Shield on us
			-- Cast Eternal Flame/sacred Shield on us if we have more then 3 HP and buffs are ending
			-- Cast Eternal Flame/Word if we are below HP threshold
			-- Cast Eternal Flame/Word if party member is below HP threshold and config set
			
			-- Eternal Flame/Word Of Glory
			if isKnown(_EternalFlame) then
				if getHP("player") <= getValue("Self Flame") and not UnitBuffID("player",_EternalFlame) then
					if castSpell("player",_EternalFlame,true) then 
						return; 
					end
				elseif nNova[1].hp <= getValue("Eternal Flame") then --we do not check if we are supposed to heal party here. Should be added
					if castSpell(nNova[1].unit,_EternalFlame,true) and not UnitBuffID(nNova[1].unit,_EternalFlame) then 
						return; 
					end
				end
			else
				if getHP("player") <= getValue("Self Glory") and getBuffStacks("player",114637) > 3 then
					if castSpell("player",_WordOfGlory,true) then 
						return; 
					end
				elseif nNova[1].hp <= getValue("Word Of Glory") then
					if castSpell(nNova[1].unit,_WordOfGlory,true) then 
						return; 
					end
				end
			end

			-- sacred_shield,if=talent.sacred_shield.enabled
			-- We are not raid shielding here.
			if isKnown(_SacredShield) then
				if isChecked("Sacred Shield") and UnitBuffID("player",_SacredShield) == nil then
					if castSpell("player",_SacredShield,true) then return; end
				end	
			end
			
			-- shield_of_the_righteous,if=holy_power>=5|buff.divine_purpose.react|incoming_damage_1500ms>=health.max*0.3
			if canCast(_ShieldOfTheRighteous) and _HolyPower == 5 then 
				if getDistance("player","target") <= 4 then
					if castSpell("target",_ShieldOfTheRighteous,false) then 
						return; 
					end
				else
					-- we our target is not in melee range, check for target that we can cast on that is.
					for i = 1, GetTotalObjects(TYPE_UNIT) do
						local Guid = IGetObjectListEntry(i)
						ISetAsUnitID(Guid,"thisUnit");
						if getFacing("player","thisUnit") == true and getDistance("player","thisUnit") <= 4 then
							if castSpell("thisUnit",_ShieldOfTheRighteous,true) then 
								return; 
							end								
						end
					end	
				end
			end
		end
		
		function ProtPaladingHolyPowerCreaters() -- Handle the normal rotation
			-- judgment,if=talent.sanctified_wrath.enabled&buff.avenging_wrath.react
			-- Grand Crusader
			-- We should cast Avengers Shield if we have Grand Crusader buff which proccs Holy Power
			if canCast(_AvengersShield) == true and UnitBuffID("player", 85416) ~= nil then
				if getLineOfSight("player","thisUnit") and getDistance("player","target") <= 30 then
					if castSpell("target",_AvengersShield,false) then 
						return; 
					end	
				else
					for i = 1, GetTotalObjects(TYPE_UNIT) do
						local Guid = IGetObjectListEntry(i)
						ISetAsUnitID(Guid,"thisUnit");
						if getLineOfSight("player","thisUnit") == true and getFacing("player","thisUnit") == true and getDistance("player","thisUnit") <= 30 then
							if isCasting("thisUnit") then
								if castSpell("thisUnit",_AvengersShield,false) then 
									return; 
								end	
							else 
								ISetAsUnitID(Guid,"validUnit");
							end							
						end
					end
					
					if UnitExists("validUnit") then 
						if castSpell("validUnit",_AvengersShield,false) then 
							return; 
						end	
					end
				end
			end		

			-- wait,sec=cooldown.judgment.remains,if=talent.sanctified_wrath.enabled&cooldown.judgment.remains>0&cooldown.judgment.remains<=0.5
			local strike = strike; -- We use either Crusader Strike or Hammer of Right dependent on how mnya unfriendly
			if BadBoy_data["AoE"] == 3 or meleeEnnemies > 2 then 
				strike = _HammerOfTheRighteous; 
			else 
				strike = _CrusaderStrike; 
			end --Where is BadBoy_data[] taken from?
			
			-- crusader_strike
			if isInMelee() then
				if castSpell("target",strike,false) then 
					return; 
				end
			else
				for i = 1, GetTotalObjects(TYPE_UNIT) do
					local Guid = IGetObjectListEntry(i)
					ISetAsUnitID(Guid,"thisUnit");
					if getFacing("player","thisUnit") == true and isInMelee("thisUnit") then
						if castSpell("thisUnit",strike,false) then 
							return; 
						end								
					end
				end
			end				

			-- wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.5
			-- judgment
			if canCast(_Judgment) and getDistance("player","target") <= 30 then
				if castSpell("target",_Judgment,true) then 
					return; 
				end
			elseif canCast(_Judgment) then
				for i = 1, GetTotalObjects(TYPE_UNIT) do
					local Guid = IGetObjectListEntry(i)
					ISetAsUnitID(Guid,"thisUnit");
					if getDistance("player","thisUnit") <= 30 then
						if castSpell("thisUnit",_Judgment,true) then 
							return; 
						end								
					end
				end
			end	
		
			-- wait,sec=cooldown.judgment.remains,if=cooldown.judgment.remains>0&cooldown.judgment.remains<=0.5&(cooldown.crusader_strike.remains-cooldown.judgment.remains)>=0.5
			if GetHolyGen() == true then 
				return; 
			end

			-- avengers_shield
			if canCast(_AvengersShield) == true then
				if getLineOfSight("player","thisUnit") and getDistance("player","target") <= 30 then
					if castSpell("target",_AvengersShield,false) then 
						return; 
					end	
				else
					for i = 1, GetTotalObjects(TYPE_UNIT) do
						local Guid = IGetObjectListEntry(i)
						ISetAsUnitID(Guid,"thisUnit");
						if getLineOfSight("player","thisUnit") == true and getFacing("player","thisUnit") == true and getDistance("player","thisUnit") <= 30 then
							if isCasting("thisUnit") then
								if castSpell("thisUnit",_AvengersShield,false) then 
									return; 
								end	
							else 
								ISetAsUnitID(Guid,"validUnit");
							end							
						end
					end
					if UnitExists("validUnit") then 
						if castSpell("validUnit",_AvengersShield,false) then 
							return; 
						end	
					end
				end
			end					 

			-- execution_sentence,if=talent.execution_sentence.enabled
			if isSelected("Execution Sentence") then
				if (isDummy("target") or (UnitHealth("target") >= 150*UnitHealthMax("player")/100)) then
					if castSpell("target",_ExecutionSentence,false) then 
						return; 
					end
				end
			end		
		
			-- lights_hammer,if=talent.lights_hammer.enabled
			if isSelected("Light's Hammer") then
				if getGround("target") == true and isMoving("target") == false and UnitExists("target") and (isDummy("target") or getDistance("target","targettarget") <= 5) then
					if castGround("target",_LightsHammer,30) then 
						return; 
					end
				end
			end

			-- hammer_of_wrath
			if canCast(_HammerOfWrath) and getLineOfSight("player","target") and getDistance("player","target") <= 30 and getHP("target") <= 20 then
				if castSpell("target",_HammerOfWrath,false) then 
					return; 
				end
			elseif canCast(_HammerOfWrath) then
				for i = 1, GetTotalObjects(TYPE_UNIT) do
					local Guid = IGetObjectListEntry(i)
					ISetAsUnitID(Guid,"thisUnit");
					if getHP("thisUnit") <= 20 and getLineOfSight("player","thisUnit") and getDistance("player","thisUnit") < 30 and getFacing("player","thisUnit") == true then
						if castSpell("thisUnit",_HammerOfWrath,false) then 
							return; 
						end								
					end
				end			
			end
			-- holy_wrath
			if canCast(_HolyWrath) and isInMelee("target") then
				if castSpell("target",_HolyWrath,true) then 
					return; 
				end
			elseif canCast(_HolyWrath) then
				for i = 1, GetTotalObjects(TYPE_UNIT) do
					local Guid = IGetObjectListEntry(i)
					ISetAsUnitID(Guid,"thisUnit");
					if getDistance("player","thisUnit") < 10 then
						if castSpell("thisUnit",_HolyWrath,true) then 
							return; 
						end								
					end
				end	
			end
			-- consecration,if=target.debuff.flying.down&!ticking
			if canCast(_Consecration) and isInMelee() then
				if castSpell("target",_Consecration,true) then 
					return; 
				end
			elseif canCast(_Consecration) then
				for i = 1, GetTotalObjects(TYPE_UNIT) do
					local Guid = IGetObjectListEntry(i)
					ISetAsUnitID(Guid,"thisUnit");
					if getDistance("player","thisUnit") < 10 then
						if castSpell("thisUnit",_Consecration,true) then 
							return; 
						end								
					end
				end	
			end

			-- holy_prism,if=talent.holy_prism.enabled
			if numEnnemies > 1 then
				if castSpell("player",_HolyPrism,false) then 
					return; 
				end
			else
				if castSpell("target",_HolyPrism,false) then 
					return; 
				end
			end
		end
		
		function ProtPaladinOffensiveCooldowns() -- Handles the usage of offensive CDs if toggled
			-- avenging_wrath
			-- No logic here, we should use this as either protection or dps boost. Should be part of Defensive CDs
			if isInMelee() and isSelected("Avenging Wrath") then
				if castSpell("player",_AvengingWrath,true) then 
					return; 
				end
			end

			-- holy_avenger,if=talent.holy_avenger.enabled
			-- No logic here, we should use this as either protection or dps boost. Should be part of Defensive CDs
			if isInMelee() and isSelected("Holy Avenger") then
				if castSpell("player",_HolyAvenger,true) then 
					return; 
				end
			end	
		end
	end
--[[           ]]	--[[           ]]	--[[           ]]
--[[           ]]	--[[           ]]	--[[           ]]
--[[]]	   --[[]]	--[[]]					 --[[ ]]
--[[         ]]		--[[           ]]	  	 --[[ ]]
--[[        ]]		--[[]]				  	 --[[ ]]
--[[]]	  --[[]]	--[[           ]]	 	 --[[ ]]		
--[[]]	   --[[]] 	--[[           ]]		 --[[ ]]
end