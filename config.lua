Config = {}

Config.Locale = 'de'

Config.UsePhoneTransferOnly = false -- true, if you use Phone transfer/disables transfer in BANK/ATM menu, false to show it
Config.UseSoundandAnimation = true

Config.Animations = {
	Dict =  'amb@prop_human_atm@male@enter',
	Anim =  'enter',
	Dict2 =  'amb@prop_human_atm@male@base',
	Anim2 =  'base',
	Dict3 =  'amb@prop_human_atm@male@idle_a',
	Anim3 =  'idle_c',
	Dict4 =  'mp_common',
	Anim4 =  'givetake1_a',
	
}

Config.ShowBANKBlipsOnMap = true
Config.BANKBlipColor = 2
Config.BANKBlipSize = 0.8
Config.Sound = {
	file = 'Ringtone', -- use filename(wihtout the '.ogg' ending) from life_entry/client/html/sounds or create your own 
	volume = 0.3,
	['cashcounter'] = {file = 'moneyCounter', volume = 0.5},
}
-- Amount of Template Withdraw(W1-W6/Deposit(D1-D6)
Config.TemplateAmount = {
-- Deposit:
	D1 = 50,
	D2 = 100,
	D3 = 200,
	D4 = 500,
	D5 = 1000,
	D6 = 5000,
-- Withdraw:
	W1 = 50,
	W2 = 100,
	W3 = 200,
	W4 = 500,
	W5 = 1000,
	W6 = 5000,
}

Config.BANKS = {
	{name="Bank", id=108, x=-2962.582, y=482.627, z=15.703}, -- copy&paste to easily add a new bank
	{name="Bank", id=108, x=-112.202, y=6469.295, z=31.626},
	{name="Pacific Bank", id=108, x=241.727, y=220.706, z=106.286},
	{name="Bank", id=108, x=1175.0643310547, y=2706.6435546875, z=38.094036102295},
	{name="Bank", id=108, x=149.87, y=-1040.58, z=29.37},
	{name="Bank", id=108, x=314.11, y=-279.01, z=54.17}
}	

Config.ATMList = {
	 {name = 'ATM', propHash = -870868698, id = 277}, -- prop hashes so there is no need to add every ATM or new ATM f.e. in an added MLO.
	 {name = 'ATM', propHash = -1126237515, id = 277}, -- comment out the ones you don't want to use
	 {name = 'ATM', propHash = -1364697528, id = 277},
	 {name = 'ATM', propHash = 506770882 , id = 277},
}

Config.Webhooks = { -- colorlist in life_entry/webhookcolors.txt
    ['withdraw'] = {
        link = 'YOUR_WEBHOOK_HERE',
        color =  3447003,
        message = ' just withdrawn **$',
		stars = '**'
    },
    ['deposit'] = {
        link = 'YOUR_WEBHOOK_HERE',
		color =  3447003,
        message = ' just deposited **$',
		stars = '**'
    },
    ['transfered'] = {
		link = 'YOUR_WEBHOOK_HERE',
		color =  3447003, 
        message = ' just transfered **$',
		stars = '**',
		sendTo = ' to Player with ID '
    },
}

-- ↓ local menu colors ↓
local red = '~r~'
local green = '~g~'
local blue = '~b~'
local yellow = '~y~'
local purple = '~p~'
local grey = '~c~'
local dark_grey = '~m~'
local orange = '~o~'
local standardcolor = '' -- no color/standard NativeUI color (needs to be non colored)
-- ↓ menu color from local menu colors ↓
Config.MenuColor = blue

Translation = {
    ['de'] = {
        ['open_key'] = 'Drücke ~INPUT_PICKUP~ um das '..Config.MenuColor..'Bankmenü ~w~zu öffnen',
        ['menu_header'] = 'Banking',
        ['menu_header_desc'] = 'Hauptmenü',
        ['account_balance'] = 'Kontostand:',
        ['depos_happened'] = 'eingezahlt',
		['withd_happened'] = 'ausgezahlt',
		['account_currency_label'] = Config.MenuColor..'$',
        ['account_balance_desc'] = 'Aktueller Kontostand',
		['subMenu_header'] = 'Geld ein-/auszahlen',
        ['subMenu_desc'] = '',
		['subMenuW_header'] = 'Auszahlungen',
        ['subMenuW_desc'] = '',
		['subMenuD_header'] = 'Einzahlungen',
        ['subMenuD_desc'] = '',
        ['subMenu_rightlabel'] = '→→→',
		['subMenuDTemplate_header'] = 'Vorgefertigte Beträge',
		['subMenuDTemplate_desc'] = 'Zahle schneller vorgefertigte Beträge ein',
		['subMenuWTemplate_header'] = 'Vorgefertigte Beträge',
		['subMenuWTemplate_desc'] = 'Zahle schneller vorgefertigte Beträge aus',
		['withdraw_50'] = '$50',
		['withdraw_50_desc'] = '',
		['withdraw_100'] = '$100',
		['withdraw_100_desc'] = '',
		['withdraw_200'] = '$200',
		['withdraw_200_desc'] = '',
		['withdraw_500'] = '$500',
		['withdraw_500_desc'] = '',
		['withdraw_1000'] = '$1000',
		['withdraw_1000_desc'] = '',
		['withdraw_5000'] = '$5000',
		['withdraw_5000_desc'] = '',
		['deposit_50'] = '$50',
		['deposit_50_desc'] = '',
		['deposit_100'] = '$100',
		['deposit_100_desc'] = '',
		['deposit_200'] = '$200',
		['deposit_200_desc'] = '',
		['deposit_500'] = '$500',
		['deposit_500_desc'] = '',
		['deposit_1000'] = '$1000',
		['deposit_1000_desc'] = '',
		['deposit_5000'] = '$5000',
		['deposit_5000_desc'] = '',
        ['withdraw'] = 'Auszahlen',
        ['withdraw_desc'] = 'Geld auszahlen',
        ['withdraw_rightlabel'] = '→',
        ['deposit'] = 'Einzahlen',
        ['deposit_desc'] = 'Geld einzahlen',
        ['deposit_rightlabel'] = '→',
        ['amount_input_bank'] = 'Kontostand: ',
        ['amount_input_cash'] = 'Bargeld: ',
        ['amount_input2'] = '~w~ | Betrag eingeben:',
        ['id_input'] = 'Spieler ID ~w~eingeben:',
        ['send_money'] = 'Geld senden',
        ['send_money_desc'] = 'Geld an Person senden',
        ['send_money_rightlabel'] = '→',
        -- Notification
        ['invalid_amount'] = '~r~Ungültiger Betrag',
        ['transfer_successful'] = ' erfolgreich überwiesen',
        ['id_not_existing'] = '~r~Empfänger nicht gefunden',
        ['good_try'] = '~r~Überweisungen an dein eigenes Konto sind nicht möglich',
        ['not_enough_money'] = '~r~Nicht genügend Geld',
    },
    ['en'] = {
		['open_key'] = 'Press ~INPUT_PICKUP~ to access the '..Config.MenuColor..'banking menu',
        ['menu_header'] = 'Banking',
        ['menu_header_desc'] = 'Main Menu',
        ['account_balance'] = 'Balance:',
		['depos_happened'] = 'deposited',
		['withd_happened'] = 'withdrawn',
        ['account_currency_label'] = '$',
        ['account_balance_desc'] = 'Current Balance',
		['subMenu_header'] = 'Deposit/Withdraw money',
        ['subMenu_desc'] = '',
		['subMenuW_header'] = 'Withdraw',
        ['subMenuW_desc'] = '',
		['subMenuD_header'] = 'Deposit',
        ['subMenuD_desc'] = '',
        ['subMenu_rightlabel'] = '→→→',
		['subMenuDTemplate_header'] = 'Pre-set Amounts',
		['subMenuDTemplate_desc'] = 'Deposit faster with Pre-set Amounts',
		['subMenuWTemplate_header'] = 'Pre-set Amounts',
		['subMenuWTemplate_desc'] = 'Withdraw faster with Pre-set Amounts',
		['withdraw_50'] = '$50',
		['withdraw_50_desc'] = '',
		['withdraw_100'] = '$100',
		['withdraw_100_desc'] = '',
		['withdraw_200'] = '$200',
		['withdraw_200_desc'] = '',
		['withdraw_500'] = '$500',
		['withdraw_500_desc'] = '',
		['withdraw_1000'] = '$1000',
		['withdraw_1000_desc'] = '',
		['withdraw_5000'] = '$5000',
		['withdraw_5000_desc'] = '',
		['deposit_50'] = '$50',
		['deposit_50_desc'] = '',
		['deposit_100'] = '$100',
		['deposit_100_desc'] = '',
		['deposit_200'] = '$200',
		['deposit_200_desc'] = '',
		['deposit_500'] = '$500',
		['deposit_500_desc'] = '',
		['deposit_1000'] = '$1000',
		['deposit_1000_desc'] = '',
		['deposit_5000'] = '$5000',
		['deposit_5000_desc'] = '',
        ['withdraw'] = 'Withdraw',
        ['withdraw_desc'] = 'Withdraw money',
        ['withdraw_rightlabel'] = '→',
        ['deposit'] = 'Deposit',
        ['deposit_desc'] = 'Deposit Money',
        ['deposit_rightlabel'] = '→',
        ['amount_input_bank'] = 'Balance: ',
        ['amount_input_cash'] = 'Cash: ',
        ['amount_input2'] = '~w~ | Insert Amount:',
        ['id_input'] = 'Insert Player ID ~w~:',
        ['send_money'] = 'Transfer money',
        ['send_money_desc'] = 'Transfer money to another account',
        ['send_money_rightlabel'] = '→',
        -- Notification
        ['invalid_amount'] = '~r~Invalid amount',
        ['transfer_successful'] = ' successful transfered',
        ['id_not_existing'] = '~r~Recipient not found',
        ['good_try'] = '~r~Transfer to your own account does not work',
        ['not_enough_money'] = '~r~Not enough money',
    },

    -- for easy adding new language -- don't forget to change >>Config.Locale = 'your_new_language'<< on top of the config.lua
    
    -- ['your_new_language'] = {
		-- 	['open_key'] = 'Press ~INPUT_PICKUP~ to access the banking menu',
		-- 	['menu_header'] = 'Banking',
		-- 	['menu_header_desc'] = 'Main Menu',
		-- 	['account_balance'] = 'Balance:',
		-- 	['account_currency_label'] = '$',
		-- 	['account_balance_desc'] = 'Current Balance',
		-- 	['subMenu_header'] = 'Deposit/Withdraw money',
		-- 	['subMenu_desc'] = '',
		-- 	['subMenuW_header'] = 'Withdraw',
		-- 	['subMenuW_desc'] = '',
		-- 	['subMenuD_header'] = 'Deposit',
		-- 	['subMenuD_desc'] = '',
		-- 	['subMenu_rightlabel'] = '→→→',
		-- 	['subMenuDTemplate_header'] = 'Pre-set Amounts',
		-- 	['subMenuDTemplate_desc'] = 'Deposit faster with Pre-set Amounts',
		-- 	['subMenuWTemplate_header'] = 'Pre-set Amounts',
		-- 	['subMenuWTemplate_desc'] = 'Withdraw faster with Pre-set Amounts',
		-- 	['withdraw_50'] = '$50',
		-- 	['withdraw_50_desc'] = '',
		-- 	['withdraw_100'] = '$100',
		-- 	['withdraw_100_desc'] = '',
		-- 	['withdraw_200'] = '$200',
		-- 	['withdraw_200_desc'] = '',
		-- 	['withdraw_500'] = '$500',
		-- 	['withdraw_500_desc'] = '',
		-- 	['withdraw_1000'] = '$1000',
		-- 	['withdraw_1000_desc'] = '',
		-- 	['withdraw_5000'] = '$5000',
		-- 	['withdraw_5000_desc'] = '',
		-- 	['deposit_50'] = '$50',
		-- 	['deposit_50_desc'] = '',
		-- 	['deposit_100'] = '$100',
		-- 	['deposit_100_desc'] = '',
		-- 	['deposit_200'] = '$200',
		-- 	['deposit_200_desc'] = '',
		-- 	['deposit_500'] = '$500',
		-- 	['deposit_500_desc'] = '',
		-- 	['deposit_1000'] = '$1000',
		-- 	['deposit_1000_desc'] = '',
		-- 	['deposit_5000'] = '$5000',
		-- 	['deposit_5000_desc'] = '',
		-- 	['withdraw'] = 'Withdraw',
		-- 	['withdraw_desc'] = 'Withdraw money',
		-- 	['withdraw_rightlabel'] = '→',
		-- 	['deposit'] = 'Deposit',
		-- 	['deposit_desc'] = 'Deposit Money',
		-- 	['deposit_rightlabel'] = '→',
		-- 	['amount_input_bank'] = 'Balance: ',
		-- 	['amount_input_cash'] = 'Cash: ',
		-- 	['amount_input2'] = '~w~ | Insert Amount:',
		-- 	['id_input'] = 'Insert Player ID ~w~:',
		-- 	['send_money'] = 'Transfer money',
		-- 	['send_money_desc'] = 'Transfer money to another account',
		-- 	['send_money_rightlabel'] = '→',
		-- 	-- Notification
		-- 	['invalid_amount'] = '~r~Invalid amount',
		-- 	['withdraw_successful'] = 'Withdraw successful',
		-- 	['deposit_successful'] = 'Deposit successful',
		-- 	['transfer_successful'] = 'Transfer successful',
		-- 	['id_not_existing'] = '~r~Recipient not found',
		-- 	['good_try'] = '~r~Transfer to your own account does not work',
		-- 	['not_enough_money'] = '~r~Not enough money',
		-- },
}
