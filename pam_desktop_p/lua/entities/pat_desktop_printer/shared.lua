ENT.Type = "anim"
ENT.Base = "pat_desktop_base"
ENT.PrintName = ""
ENT.Author = "Pat & Mikael (PAM)"
ENT.Spawnable = false;
ENT.AdminSpawnable = false;
--
ENT.desktop = {};
ENT.desktop.config = {};

-- If you're editing the printer, I suggest you turn this on. use Entity:desktopPrint( msg ) to print only when this is true.
ENT.desktop.debug = false;

-- What theme do you wanna use?
-- By default there is Dark and Light (case sensitive)
ENT.desktop.currentTheme = "Dark";

-- What language do you use?
-- By default there is EN (case sensitive)
ENT.desktop.currentLanguage = "EN";

-- Name of the printer
ENT.desktop.config.printerName = "Desktop Printer";

-- Model of the printer. You probably shouldn't change this as the overlay is bound to it
ENT.desktop.config.printerModel = "models/props_c17/consolebox01a.mdl";

-- Overlay is black, dont change this until I add an theme system
ENT.desktop.config.printerColor = Color( 0, 0, 0, 120 );

-- Again, when I add a theme system
ENT.desktop.config.printerMaterial = "";

-- When trying out modifiers, I suggest turning debug on as it shows values of speed and money output, etc.

-- A modifier for CPU money printing. Try for yourself or use the spreadsheet in ScriptFodder desc
ENT.desktop.config.cpuPrintModifier = 150;

-- Speed of printer. Try for yourself or use the spreadsheet in ScriptFodder desc
ENT.desktop.config.ramPrintSpeedModifier = 75;

-- How much it can store. GB * moneyPerGigabyte. 1000 GB * 20 = it can store 20000
ENT.desktop.config.moneyPerGigabyte = 20;

-- A modifier for GPU corrupt decreasement chance. Try for yourself or use the spreadsheet in ScriptFodder desc
ENT.desktop.config.gpuCorruptModifier = 100;

-- How many % of the orginial money should it print if it corrupts?
ENT.desktop.config.corruptMoneyPercentage = 50;

-- Overlay draw distance. This is to reduce lag
ENT.desktop.config.hudDisapearDistance = 500;

-- What health does it start on?
ENT.desktop.config.startHealth = 100;

-- What armor does it start on?
ENT.desktop.config.startArmor = 100;

-- Animation order
-- 1 = Name, X and withdraw enters the scene at same time and ends at same time.
-- 2 = Name -> X -> WITHDRAW
-- 3 = Name -> Withdraw -> X
-- 4 = Withdraw -> Name & X
-- 5 = X -> Withdraw -> Name
ENT.desktop.config.animationOrder = 2;

-- Built in VIP support.
-- This changes how much it prints.
-- 1 is the normal amount.
-- 2 is double the normal amount.
-- It's simply just a modifier.
-- To add a new group do

-- ["groupname"] = { modifier = insertcustommodifier };
-- DO ; OR , JUST ONE OF THEM

ENT.desktop.config.vipGroups =
{
	["user"] = { modifier = 1 };
	["admin"] = { modifier = 1.25 };
	["superadmin"] = { modifier = 1.5 };
	["vip"] = { modifier = 1.25 };
}

-- 1 = DarkRP money
-- 2 = Pointshop 2 Points;
-- 3 = Pointshop 1 Points;
-- 4 = ng-vrondakis levelling system XP;
ENT.desktop.config.printType = 1;

-- Language.
ENT.desktop.language =
{

	["EN"] =
	{
		-- Overlay without motherboard
		nakedPrinterText1 = "For this to work you will\nneed a motherboard";
		nakedPrinterText2 = "And get those while you're at it too";
		cpu = "Processor (CPU)";
		gpu = "Graphics Card (GPU)";
		ram = "RAM";
		hdd = "Harddisk";

		noMotherboard = "NO MOTHERBOARD";
		noGPU = "NO GRAPHICS CARD";
		noCPU = "NO PROCESSOR";
		noRAM = "NO RAM";
		noHDD = "NO HARDDISK";

		withdraw = "WITHDRAW";
		points = "POINTS";
		experience = "EXPERIENCE";
		currencyPrefix = "$";
		shortExperience = "XP";
		armor = "ARMOR";
		health = "HEALTH";

		-- Help panel
		helpButton1Title = "How does this work?";
		helpButton1 =
		[[
		First you have to purchase a motherboard which you can purchase through the F4 menu.
		Insert that motherboard into the printer by making them touch each other.
		After that you buy a GPU, GPU, HDD and some RAM and do the same.

		The print amount is affected by the CPU(s)
		The print speed is affected by the RAM
		The chance of corruption is affected by the GPU(s)
		The storage capacity is affected by the HDD(s)
		]];

		helpButton2Title = "What does CPU, GPU, etc mean?";
		helpButton2 =
		[[
		CPU = Central Processing Unit, also known as a processor.
		GPU = Graphics Processing Unit, also known as a graphics card.
		RAM = Random Access Memory.
		HDD = Harddisk drive, also known as a harddisk.
		MOBO = Motherboard.
		]];

	}

}

-- Themes
ENT.desktop.theme =
{

	-- Dark theme
	[1] =
	{
		-- You have to either write White or Dark (caps sensitive)
		-- Dark = icons are dark, it's for light themes
		-- Light = icons are light, it's for dark themes
		icons = "Dark";

		-- Header & general
		headerColor = Color( 222, 222, 222 );
		headerTextColor = Color( 25, 24, 27 );
		backgroundColor = Color( 239, 235, 235 );
		headerBorderColor = Color( 139, 149, 164 );
		closeAndQuestionMarkTextColor = Color( 25, 24, 27 );

		-- Information panel
		healthBarColor = Color( 187, 57, 57 );
		healthBarTextColor = Color( 66, 63, 65 );
		armorBarColor = Color( 57, 136, 187 );
		armorBarTextColor = Color( 66, 63, 65 );
		partTextColor = Color( 25,24,27 );

		-- Help panel
		dropDownTitleTextColor = Color( 25, 24, 27 );
		dropDownTitleColor = Color( 222, 222, 222 );
		dropDownTitleHoverColor = Color( 212, 212, 212 );
		dropDownPanelColor = Color( 232, 229, 229 );
		dropDownTextColor = Color( 22, 21, 24 );

		--Withdraw
		withdrawTextColor = Color( 25,24,27 );
		withdrawColor = Color( 57, 187, 115 );
		withdrawHoverColor = Color( 77, 207, 135 );
	},

	-- Light theme
	[2] =
	{
		icons = "Light";

		-- Header & general
		headerColor = Color( 27, 27, 27 );
		headerTextColor = Color( 232, 229, 229 );
		backgroundColor = Color( 18, 18, 18 );
		headerBorderColor = Color( 24, 24, 24 );
		closeAndQuestionMarkTextColor = Color( 232, 229, 229 );

		-- Information panel
		healthBarColor = Color( 185, 41, 41 );
		healthBarTextColor = Color( 200, 200, 200 );
		armorBarColor = Color( 41, 128, 185 );
		armorBarTextColor = Color( 200, 200, 200 );
		partTextColor = Color( 238, 241, 241 );

		-- Help panel
		dropDownTitleTextColor = Color( 232, 229, 229 );
		dropDownTitleColor = Color( 27, 27, 27 );
		dropDownTitleHoverColor = Color( 37, 37, 37 );
		dropDownPanelColor = Color( 32, 32, 32 );
		dropDownTextColor = Color( 200, 200, 200 );

		--Withdraw
		withdrawTextColor = Color( 232, 229, 229 );
		withdrawColor = Color( 27, 27, 27 );
		withdrawHoverColor = Color( 32, 32, 32 );
	},
	[3] =
	{
		icons = "Light";

		-- Header & general
		headerColor = Color( 55, 67, 85 );
		headerTextColor = Color( 232, 229, 229 );
		backgroundColor = Color( 18, 18, 18 );
		headerBorderColor = Color( 24, 24, 24 );
		closeAndQuestionMarkTextColor = Color( 232, 229, 229 );

		-- Information panel
		healthBarColor = Color( 185, 41, 41 );
		healthBarTextColor = Color( 200, 200, 200 );
		armorBarColor = Color( 41, 128, 185 );
		armorBarTextColor = Color( 200, 200, 200 );
		partTextColor = Color( 238, 241, 241 );

		-- Help panel
		dropDownTitleTextColor = Color( 232, 229, 229 );
		dropDownTitleColor = Color( 27, 27, 27 );
		dropDownTitleHoverColor = Color( 37, 37, 37 );
		dropDownPanelColor = Color( 32, 32, 32 );
		dropDownTextColor = Color( 200, 200, 200 );

		--Withdraw
		withdrawTextColor = Color( 232, 229, 229 );
		withdrawColor = Color( 27, 27, 27 );
		withdrawHoverColor = Color( 32, 32, 32 );
	}

}
