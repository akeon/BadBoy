if select(3,UnitClass("player")) == 2 then
--[[]]	   --[[]]	--[[           ]]	--[[]]				--[[]]	  --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[]]				--[[]]	  --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[]]				   --[[    ]]	   
--[[           ]]	--[[]]	   --[[]]	--[[]]				   --[[    ]]
--[[           ]]	--[[]]	   --[[]]	--[[]]					 --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[]]
 
function PaladinHolyConfig()

    ClearConfig();

    thisConfig = 0;
    -- Title
    CreateNewTitle(thisConfig,"Holy Gabbz");

    -- Wrapper
    CreateNewWrap(thisConfig,"----- Buffs -----");

    -- Blessing
    CreateNewCheck(thisConfig,"Blessing");
    CreateNewText(thisConfig,"Blessing");

    -- Seal
    CreateNewCheck(thisConfig,"Seal");
    CreateNewDrop(thisConfig, "Seal", 1, "Choose Seal to use.", "|cffFFDD11Insight", "|cff00FBEETruth", "|cff00EE00Swap")
    CreateNewText(thisConfig,"Seal");

    -- Wrapper
    CreateNewWrap(thisConfig,"----- Cooldowns -----")

    -- Avenging Wrath
    CreateNewCheck(thisConfig,"Avenging Wrath");
    CreateNewDrop(thisConfig, "Avenging Wrath", 1, "CD")
    CreateNewText(thisConfig,"Avenging Wrath");

    if isKnown(_HolyAvenger) then
        -- Holy Avenger
        CreateNewCheck(thisConfig,"Holy Avenger");
        CreateNewDrop(thisConfig, "Holy Avenger", 1, "CD")
        CreateNewText(thisConfig,"Holy Avenger");
    elseif isKnown(_SanctifiedWrath) then
        -- Sanctified Wrath
        CreateNewCheck(thisConfig,"Sanctified Wrath");
        CreateNewDrop(thisConfig, "Sanctified Wrath", 1, "CD")
        CreateNewText(thisConfig,"Sanctified Wrath");
    end

    -- Wrapper
    CreateNewWrap(thisConfig,"----- DPS Tweaks -----")

    if isKnown(_LightsHammer) then
        -- Light's Hammer
        CreateNewCheck(thisConfig,"Light's Hammer");
        CreateNewDrop(thisConfig, "Light's Hammer", 1, "CD")
        CreateNewText(thisConfig,"Light's Hammer");
    end    

    -- Wrapper
    CreateNewWrap(thisConfig,"------ Defensive -------");

    -- Guardian of Ancient Kings
    CreateNewCheck(thisConfig,"GotAK Prot");
    CreateNewBox(thisConfig, "GotAK Prot", 0, 100  , 1, 30, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFGuardian of Ancient Kings");
    CreateNewText(thisConfig,"GotAK Prot");

    -- Divine Protection
    CreateNewCheck(thisConfig,"Divine Protection");
    CreateNewBox(thisConfig, "Divine Protection", 0, 100  , 1, 75, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFDivine Protection");
    CreateNewText(thisConfig,"Divine Protection");

    -- Ardent Defender
    CreateNewCheck(thisConfig,"Ardent Defender");
    CreateNewBox(thisConfig, "Ardent Defender", 0, 100  , 1, 20, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFArdent Defender");
    CreateNewText(thisConfig,"Ardent Defender");


   -- Wrapper
    CreateNewWrap(thisConfig,"-------- Healing -------");

    -- Tier 3 talents
    if isKnown(_SacredShield) then
        CreateNewCheck(thisConfig,"Sacred Shield");
        CreateNewBox(thisConfig, "Sacred Shield", 0, 100  , 1, 95, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFSacred Shield");
        CreateNewText(thisConfig,"Sacred Shield");
        CreateNewCheck(thisConfig,"Sacred Vengeance");
        CreateNewBox(thisConfig, "Sacred Vengeance", 5, 500  , 5, 350, "|cffFF0000Value*1000\n|cffFFBB00Vengeance gain needed to recast \n|cffFFFFFFSacred Shield");
        CreateNewText(thisConfig,"Sacred Vengeance"); 
    elseif isKnown(_SelflessHealer) then
        CreateNewCheck(thisConfig,"Selfless Healer");
        CreateNewBox(thisConfig, "Selfless Healer", 0, 100  , 1, 35, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFSelfless Healer on Raid");
        CreateNewText(thisConfig,"Selfless Healer");       
    else
        CreateNewCheck(thisConfig,"Self Flame");
        CreateNewBox(thisConfig, "Self Flame", 0, 100  , 1, 75, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFEternal Flame on Self");
        CreateNewText(thisConfig,"Self Flame");  
        CreateNewCheck(thisConfig,"Eternal Flame");
        CreateNewBox(thisConfig, "Eternal Flame", 0, 100  , 1, 35, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFEternal Flame on Raid");
        CreateNewText(thisConfig,"Eternal Flame"); 
    end
    if isKnown(_SelflessHealer) or isKnown(_SacredShield) then
        CreateNewCheck(thisConfig,"Self Glory");
        CreateNewBox(thisConfig, "Self Glory", 0, 100  , 1, 70, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFWord Of Glory on Self");
        CreateNewText(thisConfig,"Self Glory");  
        CreateNewCheck(thisConfig,"Word Of Glory");
        CreateNewBox(thisConfig, "Word Of Glory", 0, 100  , 1, 70, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFWord Of Glory on Raid");
        CreateNewText(thisConfig,"Word Of Glory"); 
    end

    if isKnown(_HandOfPurity) == true then
        CreateNewCheck(thisConfig,"Hand of Purity");
        CreateNewBox(thisConfig, "Hand of Purity", 0, 100  , 1, 50, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFHand of Purity");
        CreateNewText(thisConfig,"Hand of Purity"); 
    end

    CreateNewCheck(thisConfig,"Lay On Hands");
    CreateNewBox(thisConfig, "Lay On Hands", 0, 100  , 1, 12, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFLay On Hands");
    CreateNewText(thisConfig,"Lay On Hands"); 

    CreateNewCheck(thisConfig,"LoH Targets");
    CreateNewDrop(thisConfig, "LoH Targets", 1, "|cffFF0000Wich Targets\n|cffFFBB00We want to use \n|cffFFFFFFLay On Hands", "|cffFF0000Me.Only", "|cffFFDD11Me.Prio", "|cff00FBEETank/Heal","|cff00FF00All");
    CreateNewText(thisConfig,"LoH Targets"); 

    CreateNewCheck(thisConfig,"Hand Of Sacrifice");
    CreateNewBox(thisConfig, "Hand Of Sacrifice", 0, 100  , 1, 35, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFHand Of Sacrifice");
    CreateNewText(thisConfig,"Hand Of Sacrifice");   

    -- Wrapper
    CreateNewWrap(thisConfig,"-------- Utilities -------");

    -- Rebuke
    CreateNewCheck(thisConfig,"Rebuke");
    CreateNewBox(thisConfig, "Rebuke", 0, 100  , 5, 35 , "|cffFFBB00Over what % of cast we want to \n|cffFFFFFFRebuke.");
    CreateNewText(thisConfig,"Rebuke");
    
    -- General Configs
    CreateGeneralsConfig();

    WrapsManager();
end

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


--[[This function will create a Value Box.]]
-- function CreateNewBox(value,textString,minValue,maxValue,step,base,tip1)

--[[This function will create a Check Box.]]
-- function CreateNewCheck(value, textString, tip1)

--[[This function will create a Menu, up to 10 values can be passed.]]
-- function CreateNewDrop(value, textString, base, tip1, value1, value2, value3, value4, value5, value6, value7, value8, value9, value10)

--[[This function will create the TextString.
This function must always be last, it will increase table row.]]
-- function CreateNewText(value, textString)

--[[This function will create the Title String.
This function will use table row #1.]]
-- function CreateNewTitle(value, textString)



function PaladinProtConfig()

    ClearConfig();

    thisConfig = 0;
    -- Title
    CreateNewTitle(thisConfig,"Protection CodeMyLife");

    -- Wrapper
    CreateNewWrap(thisConfig,"----- Buffs -----");

    -- Blessing
    CreateNewCheck(thisConfig,"Blessing");
    CreateNewText(thisConfig,"Blessing");

    -- Righteous Fury
    CreateNewCheck(thisConfig,"Righteous Fury");
    CreateNewText(thisConfig,"Righteous Fury");

    -- Seal
    CreateNewCheck(thisConfig,"Seal");
    CreateNewDrop(thisConfig, "Seal", 1, "Choose Seal to use.", "|cffFFDD11Insight", "|cff00FBEETruth", "|cff00EE00Swap")
    CreateNewText(thisConfig,"Seal");

    -- Wrapper
    CreateNewWrap(thisConfig,"----- Cooldowns -----")

    -- Avenging Wrath
    CreateNewCheck(thisConfig,"Avenging Wrath");
    CreateNewDrop(thisConfig, "Avenging Wrath", 1, "CD")
    CreateNewText(thisConfig,"Avenging Wrath");

    if isKnown(_HolyAvenger) then
    	-- Holy Avenger
    	CreateNewCheck(thisConfig,"Holy Avenger");
    	CreateNewDrop(thisConfig, "Holy Avenger", 1, "CD")
        CreateNewText(thisConfig,"Holy Avenger");
    elseif isKnown(_SanctifiedWrath) then
        -- Sanctified Wrath
        CreateNewCheck(thisConfig,"Sanctified Wrath");
        CreateNewDrop(thisConfig, "Sanctified Wrath", 1, "CD")
        CreateNewText(thisConfig,"Sanctified Wrath");
    end

    -- Wrapper
    CreateNewWrap(thisConfig,"----- DPS Tweaks -----")

    if isKnown(_LightsHammer) then
        -- Light's Hammer
        CreateNewCheck(thisConfig,"Light's Hammer");
        CreateNewDrop(thisConfig, "Light's Hammer", 1, "CD")
        CreateNewText(thisConfig,"Light's Hammer");
    end    

    -- Wrapper
    CreateNewWrap(thisConfig,"------ Defensive -------");

    -- Guardian of Ancient Kings
    CreateNewCheck(thisConfig,"GotAK Prot");
    CreateNewBox(thisConfig, "GotAK Prot", 0, 100  , 1, 30, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFGuardian of Ancient Kings");
    CreateNewText(thisConfig,"GotAK Prot");

    -- Divine Protection
    CreateNewCheck(thisConfig,"Divine Protection");
    CreateNewBox(thisConfig, "Divine Protection", 0, 100  , 1, 75, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFDivine Protection");
    CreateNewText(thisConfig,"Divine Protection");

    -- Ardent Defender
    CreateNewCheck(thisConfig,"Ardent Defender");
    CreateNewBox(thisConfig, "Ardent Defender", 0, 100  , 1, 20, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFArdent Defender");
    CreateNewText(thisConfig,"Ardent Defender");


   -- Wrapper
    CreateNewWrap(thisConfig,"-------- Healing -------");

    -- Tier 3 talents
    if isKnown(_SacredShield) then
        CreateNewCheck(thisConfig,"Sacred Shield");
        CreateNewBox(thisConfig, "Sacred Shield", 0, 100  , 1, 95, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFSacred Shield");
        CreateNewText(thisConfig,"Sacred Shield");
        CreateNewCheck(thisConfig,"Sacred Vengeance");
        CreateNewBox(thisConfig, "Sacred Vengeance", 5, 500  , 5, 350, "|cffFF0000Value*1000\n|cffFFBB00Vengeance gain needed to recast \n|cffFFFFFFSacred Shield");
        CreateNewText(thisConfig,"Sacred Vengeance"); 
    elseif isKnown(_SelflessHealer) then
        CreateNewCheck(thisConfig,"Selfless Healer");
        CreateNewBox(thisConfig, "Selfless Healer", 0, 100  , 1, 35, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFSelfless Healer on Raid");
        CreateNewText(thisConfig,"Selfless Healer");       
    else
        CreateNewCheck(thisConfig,"Self Flame");
        CreateNewBox(thisConfig, "Self Flame", 0, 100  , 1, 75, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFEternal Flame on Self");
        CreateNewText(thisConfig,"Self Flame");  
        CreateNewCheck(thisConfig,"Eternal Flame");
        CreateNewBox(thisConfig, "Eternal Flame", 0, 100  , 1, 35, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFEternal Flame on Raid");
        CreateNewText(thisConfig,"Eternal Flame"); 
    end
    if isKnown(_SelflessHealer) or isKnown(_SacredShield) then
        CreateNewCheck(thisConfig,"Self Glory");
        CreateNewBox(thisConfig, "Self Glory", 0, 100  , 1, 70, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFWord Of Glory on Self");
        CreateNewText(thisConfig,"Self Glory");  
        CreateNewCheck(thisConfig,"Word Of Glory");
        CreateNewBox(thisConfig, "Word Of Glory", 0, 100  , 1, 70, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFWord Of Glory on Raid");
        CreateNewText(thisConfig,"Word Of Glory"); 
    end

    if isKnown(_HandOfPurity) == true then
        CreateNewCheck(thisConfig,"Hand of Purity");
        CreateNewBox(thisConfig, "Hand of Purity", 0, 100  , 1, 50, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFHand of Purity");
        CreateNewText(thisConfig,"Hand of Purity"); 
    end

    CreateNewCheck(thisConfig,"Lay On Hands");
    CreateNewBox(thisConfig, "Lay On Hands", 0, 100  , 1, 12, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFLay On Hands");
    CreateNewText(thisConfig,"Lay On Hands"); 

    CreateNewCheck(thisConfig,"LoH Targets");
    CreateNewDrop(thisConfig, "LoH Targets", 1, "|cffFF0000Wich Targets\n|cffFFBB00We want to use \n|cffFFFFFFLay On Hands", "|cffFF0000Me.Only", "|cffFFDD11Me.Prio", "|cff00FBEETank/Heal","|cff00FF00All");
    CreateNewText(thisConfig,"LoH Targets"); 

    CreateNewCheck(thisConfig,"Hand Of Sacrifice");
    CreateNewBox(thisConfig, "Hand Of Sacrifice", 0, 100  , 1, 35, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFHand Of Sacrifice");
    CreateNewText(thisConfig,"Hand Of Sacrifice");   

    -- Wrapper
    CreateNewWrap(thisConfig,"-------- Utilities -------");

    -- Rebuke
    CreateNewCheck(thisConfig,"Rebuke");
    CreateNewBox(thisConfig, "Rebuke", 0, 100  , 5, 35 , "|cffFFBB00Over what % of cast we want to \n|cffFFFFFFRebuke.");
    CreateNewText(thisConfig,"Rebuke");
    
    -- General Configs
    CreateGeneralsConfig();

    WrapsManager();
end

--[[           ]]	--[[           ]]	--[[           ]]
--[[           ]]	--[[           ]]	--[[           ]]
--[[]]	   --[[]]	--[[]]					 --[[ ]]
--[[         ]]		--[[           ]]	  	 --[[ ]]
--[[        ]]		--[[]]				  	 --[[ ]]
--[[]]	  --[[]]	--[[           ]]	 	 --[[ ]]		
--[[]]	   --[[]] 	--[[           ]]		 --[[ ]]

function PaladinRetConfig()

    ClearConfig();

    thisConfig = 0;
    -- Title
    CreateNewTitle(thisConfig,"Protection CodeMyLife");

    -- Wrapper
    CreateNewWrap(thisConfig,"----- Buffs -----");

    -- Blessing
    CreateNewCheck(thisConfig,"Blessing");
    CreateNewText(thisConfig,"Blessing");

    -- Righteous Fury
    CreateNewCheck(thisConfig,"Righteous Fury");
    CreateNewText(thisConfig,"Righteous Fury");

    -- Seal
    CreateNewCheck(thisConfig,"Seal");
    CreateNewDrop(thisConfig, "Seal", 1, "Choose Seal to use.", "|cffFFDD11Insight", "|cff00FBEETruth", "|cff00EE00Swap")
    CreateNewText(thisConfig,"Seal");

    -- Wrapper
    CreateNewWrap(thisConfig,"----- Cooldowns -----")

    -- Avenging Wrath
    CreateNewCheck(thisConfig,"Avenging Wrath");
    CreateNewDrop(thisConfig, "Avenging Wrath", 1, "CD")
    CreateNewText(thisConfig,"Avenging Wrath");

    if isKnown(_HolyAvenger) then
        -- Holy Avenger
        CreateNewCheck(thisConfig,"Holy Avenger");
        CreateNewDrop(thisConfig, "Holy Avenger", 1, "CD")
        CreateNewText(thisConfig,"Holy Avenger");
    elseif isKnown(_SanctifiedWrath) then
        -- Sanctified Wrath
        CreateNewCheck(thisConfig,"Sanctified Wrath");
        CreateNewDrop(thisConfig, "Sanctified Wrath", 1, "CD")
        CreateNewText(thisConfig,"Sanctified Wrath");
    end

    -- Wrapper
    CreateNewWrap(thisConfig,"----- DPS Tweaks -----")

    if isKnown(_LightsHammer) then
        -- Light's Hammer
        CreateNewCheck(thisConfig,"Light's Hammer");
        CreateNewDrop(thisConfig, "Light's Hammer", 1, "CD")
        CreateNewText(thisConfig,"Light's Hammer");
    end    

    -- Wrapper
    CreateNewWrap(thisConfig,"------ Defensive -------");

    -- Guardian of Ancient Kings
    CreateNewCheck(thisConfig,"GotAK Prot");
    CreateNewBox(thisConfig, "GotAK Prot", 0, 100  , 1, 30, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFGuardian of Ancient Kings");
    CreateNewText(thisConfig,"GotAK Prot");

    -- Divine Protection
    CreateNewCheck(thisConfig,"Divine Protection");
    CreateNewBox(thisConfig, "Divine Protection", 0, 100  , 1, 75, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFDivine Protection");
    CreateNewText(thisConfig,"Divine Protection");

    -- Ardent Defender
    CreateNewCheck(thisConfig,"Ardent Defender");
    CreateNewBox(thisConfig, "Ardent Defender", 0, 100  , 1, 20, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFArdent Defender");
    CreateNewText(thisConfig,"Ardent Defender");


   -- Wrapper
    CreateNewWrap(thisConfig,"-------- Healing -------");

    -- Tier 3 talents
    if isKnown(_SacredShield) then
        CreateNewCheck(thisConfig,"Sacred Shield");
        CreateNewBox(thisConfig, "Sacred Shield", 0, 100  , 1, 95, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFSacred Shield");
        CreateNewText(thisConfig,"Sacred Shield");
        CreateNewCheck(thisConfig,"Sacred Vengeance");
        CreateNewBox(thisConfig, "Sacred Vengeance", 5, 500  , 5, 350, "|cffFF0000Value*1000\n|cffFFBB00Vengeance gain needed to recast \n|cffFFFFFFSacred Shield");
        CreateNewText(thisConfig,"Sacred Vengeance"); 
    elseif isKnown(_SelflessHealer) then
        CreateNewCheck(thisConfig,"Selfless Healer");
        CreateNewBox(thisConfig, "Selfless Healer", 0, 100  , 1, 35, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFSelfless Healer on Raid");
        CreateNewText(thisConfig,"Selfless Healer");       
    else
        CreateNewCheck(thisConfig,"Self Flame");
        CreateNewBox(thisConfig, "Self Flame", 0, 100  , 1, 75, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFEternal Flame on Self");
        CreateNewText(thisConfig,"Self Flame");  
        CreateNewCheck(thisConfig,"Eternal Flame");
        CreateNewBox(thisConfig, "Eternal Flame", 0, 100  , 1, 35, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFEternal Flame on Raid");
        CreateNewText(thisConfig,"Eternal Flame"); 
    end
    if isKnown(_SelflessHealer) or isKnown(_SacredShield) then
        CreateNewCheck(thisConfig,"Self Glory");
        CreateNewBox(thisConfig, "Self Glory", 0, 100  , 1, 70, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFWord Of Glory on Self");
        CreateNewText(thisConfig,"Self Glory");  
        CreateNewCheck(thisConfig,"Word Of Glory");
        CreateNewBox(thisConfig, "Word Of Glory", 0, 100  , 1, 70, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFWord Of Glory on Raid");
        CreateNewText(thisConfig,"Word Of Glory"); 
    end

    if isKnown(_HandOfPurity) == true then
        CreateNewCheck(thisConfig,"Hand of Purity");
        CreateNewBox(thisConfig, "Hand of Purity", 0, 100  , 1, 50, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFHand of Purity");
        CreateNewText(thisConfig,"Hand of Purity"); 
    end

    CreateNewCheck(thisConfig,"Lay On Hands");
    CreateNewBox(thisConfig, "Lay On Hands", 0, 100  , 1, 12, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFLay On Hands");
    CreateNewText(thisConfig,"Lay On Hands"); 

    CreateNewCheck(thisConfig,"LoH Targets");
    CreateNewDrop(thisConfig, "LoH Targets", 1, "|cffFF0000Wich Targets\n|cffFFBB00We want to use \n|cffFFFFFFLay On Hands", "|cffFF0000Me.Only", "|cffFFDD11Me.Prio", "|cff00FBEETank/Heal","|cff00FF00All");
    CreateNewText(thisConfig,"LoH Targets"); 

    CreateNewCheck(thisConfig,"Hand Of Sacrifice");
    CreateNewBox(thisConfig, "Hand Of Sacrifice", 0, 100  , 1, 35, "|cffFFBB00Under what |cffFF0000%HP|cffFFBB00 to use \n|cffFFFFFFHand Of Sacrifice");
    CreateNewText(thisConfig,"Hand Of Sacrifice");   

    -- Wrapper
    CreateNewWrap(thisConfig,"-------- Utilities -------");

    -- Rebuke
    CreateNewCheck(thisConfig,"Rebuke");
    CreateNewBox(thisConfig, "Rebuke", 0, 100  , 5, 35 , "|cffFFBB00Over what % of cast we want to \n|cffFFFFFFRebuke.");
    CreateNewText(thisConfig,"Rebuke");
    
    -- General Configs
    CreateGeneralsConfig();

    WrapsManager();
end

--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]


end