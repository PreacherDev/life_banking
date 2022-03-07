Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
local inZone = false
_menuPool = NativeUI.CreatePool()

noAnimationForBank = false

Citizen.CreateThread(function()
	while true do
		if nearBank() or nearATM() then
			ESX.ShowHelpNotification(Translation[Config.Locale]['open_key'])
			_menuPool:ProcessMenus()
			if not noAnimationForBank then 
				noAnimationForBank = true
				if IsControlJustPressed(0, 38) and not _menuPool:IsAnyMenuOpen() and Config.UseSoundandAnimation then
					TriggerEvent('life_banking:startAnim')
					Citizen.Wait(1400)
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound.file, Config.Sound.volume)
					Citizen.Wait(500)
					if Config.UseSoundandAnimation then 
						Citizen.Wait(6700)
					else 
						Citizen.Wait(0)
					end
					openMenu()
				elseif IsControlJustPressed(0, 38) and not _menuPool:IsAnyMenuOpen() and not Config.UseSoundandAnimation then
					TriggerEvent('life_banking:startAnim')
					Citizen.Wait(1900)
					if Config.UseSoundandAnimation then 
						Citizen.Wait(3700)
					else 
						Citizen.Wait(0)
					end
					openMenu()
				end
			elseif noAnimationForBank then 
				noAnimationForBank = false
				if IsControlJustPressed(0, 38) and not _menuPool:IsAnyMenuOpen() then
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1900)
					
					
					openMenu()
				end
			end
		else 
			Citizen.Wait(800)
		end
		Citizen.Wait(2)
	end
end)

function openMenu()

	mainMenu = NativeUI.CreateMenu(Translation[Config.Locale]['menu_header'], Config.MenuColor..Translation[Config.Locale]['menu_header_desc'])
	_menuPool:Add(mainMenu)

	local addShowBankAcc = NativeUI.CreateItem(Translation[Config.Locale]['account_balance'], Config.MenuColor..Translation[Config.Locale]['account_balance_desc'] )
	mainMenu:AddItem(addShowBankAcc)
	
	subMenuDW = _menuPool:AddSubMenu(mainMenu, Translation[Config.Locale]['subMenu_header'], Config.MenuColor..Translation[Config.Locale]['subMenu_desc'])
	subMenuDW.ParentItem:RightLabel(Config.MenuColor..Translation[Config.Locale]['subMenu_rightlabel'])
	subMenuDW:AddItem(mainMenu)

	subMenuD = _menuPool:AddSubMenu(subMenuDW, Translation[Config.Locale]['subMenuD_header'], Config.MenuColor..Translation[Config.Locale]['subMenuD_desc'])
	subMenuD.ParentItem:RightLabel(Config.MenuColor..Translation[Config.Locale]['subMenu_rightlabel'])
	subMenuD:AddItem(subMenuDW)

	subMenuW = _menuPool:AddSubMenu(subMenuDW, Translation[Config.Locale]['subMenuW_header'], Config.MenuColor..Translation[Config.Locale]['subMenuW_desc'])
	subMenuW.ParentItem:RightLabel(Config.MenuColor..Translation[Config.Locale]['subMenu_rightlabel'])
	subMenuW:AddItem(subMenuDW)

	local addDeposit = NativeUI.CreateItem(Translation[Config.Locale]['deposit'], Config.MenuColor..Translation[Config.Locale]['deposit_desc'])
	addDeposit:RightLabel(Config.MenuColor..Translation[Config.Locale]['deposit_rightlabel'])
	subMenuD:AddItem(addDeposit)

	local addWithdraw = NativeUI.CreateItem(Translation[Config.Locale]['withdraw'], Config.MenuColor..Translation[Config.Locale]['withdraw_desc'])
	addWithdraw:RightLabel(Config.MenuColor..Translation[Config.Locale]['withdraw_rightlabel'])
	subMenuW:AddItem(addWithdraw)

	subMenuDTemplate = _menuPool:AddSubMenu(subMenuD, Translation[Config.Locale]['subMenuDTemplate_header'], Config.MenuColor..Translation[Config.Locale]['subMenuDTemplate_desc'])
	subMenuDTemplate.ParentItem:RightLabel(Config.MenuColor..Translation[Config.Locale]['subMenu_rightlabel'])
	subMenuDTemplate:AddItem(subMenuD)

	subMenuWTemplate = _menuPool:AddSubMenu(subMenuW, Translation[Config.Locale]['subMenuWTemplate_header'], Config.MenuColor..Translation[Config.Locale]['subMenuWTemplate_desc'])
	subMenuWTemplate.ParentItem:RightLabel(Config.MenuColor..Translation[Config.Locale]['subMenu_rightlabel'])
	subMenuWTemplate:AddItem(subMenuW)

	local addWithdraw50 = NativeUI.CreateItem(Translation[Config.Locale]['withdraw_50'], Config.MenuColor..Translation[Config.Locale]['withdraw_50_desc'])
	addWithdraw50:RightLabel(Config.MenuColor..Translation[Config.Locale]['withdraw_rightlabel'])
	subMenuWTemplate:AddItem(addWithdraw50)

	local addWithdraw100 = NativeUI.CreateItem(Translation[Config.Locale]['withdraw_100'], Config.MenuColor..Translation[Config.Locale]['withdraw_100_desc'])
	addWithdraw100:RightLabel(Config.MenuColor..Translation[Config.Locale]['withdraw_rightlabel'])
	subMenuWTemplate:AddItem(addWithdraw100)

	local addWithdraw200 = NativeUI.CreateItem(Translation[Config.Locale]['withdraw_200'], Config.MenuColor..Translation[Config.Locale]['withdraw_200_desc'])
	addWithdraw200:RightLabel(Config.MenuColor..Translation[Config.Locale]['withdraw_rightlabel'])
	subMenuWTemplate:AddItem(addWithdraw200)

	local addWithdraw500 = NativeUI.CreateItem(Translation[Config.Locale]['withdraw_500'], Config.MenuColor..Translation[Config.Locale]['withdraw_500_desc'])
	addWithdraw500:RightLabel(Config.MenuColor..Translation[Config.Locale]['withdraw_rightlabel'])
	subMenuWTemplate:AddItem(addWithdraw500)

	local addWithdraw1000 = NativeUI.CreateItem(Translation[Config.Locale]['withdraw_1000'], Config.MenuColor..Translation[Config.Locale]['withdraw_1000_desc'])
	addWithdraw1000:RightLabel(Config.MenuColor..Translation[Config.Locale]['withdraw_rightlabel'])
	subMenuWTemplate:AddItem(addWithdraw1000)

	local addWithdraw5000 = NativeUI.CreateItem(Translation[Config.Locale]['withdraw_5000'], Config.MenuColor..Translation[Config.Locale]['withdraw_5000_desc'])
	addWithdraw5000:RightLabel(Config.MenuColor..Translation[Config.Locale]['withdraw_rightlabel'])
	subMenuWTemplate:AddItem(addWithdraw5000)


	local addDeposit50 = NativeUI.CreateItem(Translation[Config.Locale]['deposit_50'], Config.MenuColor..Translation[Config.Locale]['deposit_50_desc'])
	addDeposit50:RightLabel(Config.MenuColor..Translation[Config.Locale]['deposit_rightlabel'])
	subMenuDTemplate:AddItem(addDeposit50)

	local addDeposit100 = NativeUI.CreateItem(Translation[Config.Locale]['deposit_100'], Config.MenuColor..Translation[Config.Locale]['deposit_100_desc'])
	addDeposit100:RightLabel(Config.MenuColor..Translation[Config.Locale]['deposit_rightlabel'])
	subMenuDTemplate:AddItem(addDeposit100)

	local addDeposit200 = NativeUI.CreateItem(Translation[Config.Locale]['deposit_200'], Config.MenuColor..Translation[Config.Locale]['deposit_200_desc'])
	addDeposit200:RightLabel(Config.MenuColor..Translation[Config.Locale]['deposit_rightlabel'])
	subMenuDTemplate:AddItem(addDeposit200)

	local addDeposit500 = NativeUI.CreateItem(Translation[Config.Locale]['deposit_500'], Config.MenuColor..Translation[Config.Locale]['deposit_500_desc'])
	addDeposit500:RightLabel(Config.MenuColor..Translation[Config.Locale]['deposit_rightlabel'])
	subMenuDTemplate:AddItem(addDeposit500)

	local addDeposit1000 = NativeUI.CreateItem(Translation[Config.Locale]['deposit_1000'], Config.MenuColor..Translation[Config.Locale]['deposit_1000_desc'])
	addDeposit1000:RightLabel(Config.MenuColor..Translation[Config.Locale]['deposit_rightlabel'])
	subMenuDTemplate:AddItem(addDeposit1000)

	local addDeposit5000 = NativeUI.CreateItem(Translation[Config.Locale]['deposit_5000'], Config.MenuColor..Translation[Config.Locale]['deposit_5000_desc'])
	addDeposit5000:RightLabel(Config.MenuColor..Translation[Config.Locale]['deposit_rightlabel'])
	subMenuDTemplate:AddItem(addDeposit5000)

	ESX.TriggerServerCallback('life_banking:getMoney', function(cash, bank)
		addShowBankAcc:RightLabel(Translation[Config.Locale]['account_currency_label'] ..Config.MenuColor.. bank)
		
		subMenuD.OnItemSelect = function (index, item, Sender)
			if item == addDeposit then 
				local onScreenDisplayResult_amount = CreateDialog(Translation[Config.Locale]['amount_input_cash'] .. Translation[Config.Locale]['account_currency_label'] .. Config.MenuColor..cash .. '~w~'..Translation[Config.Locale]['amount_input2'])
				if (onScreenDisplayResult_amount ~= nil) then
					if tonumber(onScreenDisplayResult_amount) and tonumber(onScreenDisplayResult_amount) > 0 then
						if Config.UseSoundandAnimation then
							TriggerEvent('life_banking:startAnim2')
							Citizen.Wait(1200)
							TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
							Citizen.Wait(4800)
							TriggerServerEvent('life_banking:deposit', onScreenDisplayResult_amount)
							TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..onScreenDisplayResult_amount..Config.Webhooks['deposit'].stars)
							ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..onScreenDisplayResult_amount..' '..Translation[Config.Locale]['depos_happened'])
						elseif not Config.UseSoundandAnimation then
							TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..onScreenDisplayResult_amount..Config.Webhooks['deposit'].stars)
							TriggerServerEvent('life_banking:deposit', onScreenDisplayResult_amount)
							ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..onScreenDisplayResult_amount..' '..Translation[Config.Locale]['depos_happened'])
						end
					end
				end
			end
		end

		subMenuW.OnItemSelect = function (index, item, Sender)
			if item == addWithdraw then 
				local onScreenDisplayResult_amount = CreateDialog(Translation[Config.Locale]['amount_input_bank'] .. Translation[Config.Locale]['account_currency_label'] ..Config.MenuColor.. bank .. '~w~'..Translation[Config.Locale]['amount_input2'])
				if (onScreenDisplayResult_amount ~= nil) then
					if tonumber(onScreenDisplayResult_amount) and tonumber(onScreenDisplayResult_amount) > 0 then
						if Config.UseSoundandAnimation then
							TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
							Citizen.Wait(4800)
							TriggerEvent('life_banking:startAnim2')
							Citizen.Wait(1200)
							TriggerServerEvent('life_banking:withdraw', onScreenDisplayResult_amount)
							ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..onScreenDisplayResult_amount..' '..Translation[Config.Locale]['withd_happened'])
							TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..onScreenDisplayResult_amount..Config.Webhooks['withdraw'].stars)
						elseif not Config.UseSoundandAnimation then
							TriggerServerEvent('life_banking:withdraw', onScreenDisplayResult_amount)
							ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..onScreenDisplayResult_amount..' '..Translation[Config.Locale]['withd_happened'])
							TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..onScreenDisplayResult_amount..Config.Webhooks['withdraw'].stars)
						end
					end
				end
			end
		end

		subMenuDTemplate.OnItemSelect = function (index, item, Sender)
			if Config.UseSoundandAnimation then
				if item == addDeposit50 then 
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D1)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D1..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D1..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit100 then
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D2)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D2..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D2..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit200 then
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D3)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D3..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D3..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit500 then
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D4)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D4..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D4..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit1000 then 
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D5)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D5..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D5..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit5000 then 
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D6)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D6..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D6..Config.Webhooks['deposit'].stars)
				end
			elseif not Config.UseSoundandAnimation then 
				if item == addDeposit50 then 
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D1)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D1..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D1..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit100 then 
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D2)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D2..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D2..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit200 then 
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D3)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D3..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D3..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit500 then 
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D4)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D4..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D4..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit1000 then 
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D5)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D5..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D5..Config.Webhooks['deposit'].stars)
				elseif item == addDeposit5000 then 
					TriggerServerEvent('life_banking:useTemplateDeposit', Config.TemplateAmount.D6)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.D6..' '..Translation[Config.Locale]['depos_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['deposit'].link, Config.Webhooks['deposit'].color, Config.Webhooks['deposit'].message..Config.TemplateAmount.D6..Config.Webhooks['deposit'].stars)
				end
			end
		end

		subMenuWTemplate.OnItemSelect = function (index, item, Sender)
			if Config.UseSoundandAnimation then
				if item == addWithdraw50 then 
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W1)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W1..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W1..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw100 then 
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W2)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W2..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W2..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw200 then 
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W3)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W3..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W3..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw500 then 
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W4)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W4..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W4..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw1000 then 
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W5)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W5..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W5..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw5000 then 
					TriggerEvent('life_bankingCL:PlayOnOne', Config.Sound['cashcounter'].file, Config.Sound['cashcounter'].volume)
					Citizen.Wait(4800)
					TriggerEvent('life_banking:startAnim2')
					Citizen.Wait(1200)
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W6)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W6..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W6..Config.Webhooks['withdraw'].stars)
				end
			elseif not Config.UseSoundandAnimation then
				if item == addWithdraw50 then 
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W1)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W1..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W1..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw100 then 
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W2)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W2..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W2..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw200 then 
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W3)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W3..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W3..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw500 then 
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W4)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W4..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W4..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw1000 then 
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W5)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W5..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W5..Config.Webhooks['withdraw'].stars)
				elseif item == addWithdraw5000 then 
					TriggerServerEvent('life_banking:useTemplateWithdraw', Config.TemplateAmount.W6)
					ESX.ShowNotification(Translation[Config.Locale]['account_currency_label']..Config.TemplateAmount.W6..' '..Translation[Config.Locale]['withd_happened'])
					TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['withdraw'].link, Config.Webhooks['withdraw'].color, Config.Webhooks['withdraw'].message..Config.TemplateAmount.W6..Config.Webhooks['withdraw'].stars)
				end
			end
		end
	
		if not Config.UsePhoneTransferOnly then
			local addSMonToPlay = NativeUI.CreateItem(Translation[Config.Locale]['send_money'], Config.MenuColor..Translation[Config.Locale]['send_money_desc'])
			addSMonToPlay:RightLabel(Config.MenuColor..Translation[Config.Locale]['send_money_rightlabel'])
			subMenuDW:AddItem(addSMonToPlay)
			addSMonToPlay.Activated = function (index, item, Sender)
				if item == addSMonToPlay then 
					local onScreenDisplayResult_toPlayer = CreateDialog(Config.MenuColor..Translation[Config.Locale]['id_input'])
					local onScreenDisplayResult_amount2 = CreateDialog(Config.MenuColor..Translation[Config.Locale]['amount_input_bank']..Config.MenuColor.. Translation[Config.Locale]['account_currency_label'] ..Config.MenuColor.. bank .. '~w~'..Translation[Config.Locale]['amount_input2'])
					if (onScreenDisplayResult_toPlayer ~= nil) and (onScreenDisplayResult_amount2 ~= nil) then
						if tonumber(onScreenDisplayResult_toPlayer) and tonumber(onScreenDisplayResult_toPlayer) and tonumber(onScreenDisplayResult_amount2) and tonumber(onScreenDisplayResult_amount2) > 0 then
							TriggerServerEvent('life_banking:transferSV', onScreenDisplayResult_toPlayer, onScreenDisplayResult_amount2)
							TriggerServerEvent('life_banking:generalWebhook', Config.Webhooks['transfered'].link, Config.Webhooks['transfered'].color, Config.Webhooks['transfered'].message..onScreenDisplayResult_amount2..Config.Webhooks['transfered'].stars..Config.Webhooks['transfered'].sendTo..'**'..onScreenDisplayResult_toPlayer..'**')
						end
					elseif (onScreenDisplayResult_toPlayer == nil) then
						print(onScreenDisplayResult_toPlayer)
					end
				end
			end
		end 
		
		mainMenu:Visible(true)
		_menuPool:RefreshIndex()
		_menuPool:MouseControlsEnabled (false)
		_menuPool:MouseEdgeEnabled (false)
		_menuPool:ControlDisablingEnabled(false)
	end)
end

function nearATM()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)
    
	for k, v in pairs(Config.ATMList) do
		local pos = GetEntityCoords(PlayerPedId())
		local ATM = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, v.propHash, false, false, false)
		local ATMPos = GetEntityCoords(ATM)
		local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, ATMPos.x, ATMPos.y, ATMPos.z, true)
		if distance < 1.8 then
			return true
		end
	end
end

function nearBank()
	
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(Config.BANKS) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 1.8 then
			noAnimationForBank = true
			return true
		end
	end
end

AddEventHandler('onResourceStop', function(life_banking)
	if (GetCurrentResourceName() ~= life_banking) then
		return
	end
	print("stopped life_banking")
	SetEntityAsNoLongerNeeded(ped_hash)
	SetEntityAsNoLongerNeeded(npc)
end)

AddEventHandler('onResourceStart', function(life_banking)
	if (GetCurrentResourceName() ~= life_banking) then
		return
	end
	TriggerServerEvent('life_banking:getitemsP')
	print("started life_banking")
end)

Citizen.CreateThread(function()
	if Config.ShowBANKBlipsOnMap then
		for k,v in ipairs(Config.BANKS) do
			local blip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite(blip, v.id)
			SetBlipScale(blip, Config.BANKBlipSize)
			SetBlipColour(blip, Config.BANKBlipColor)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(tostring(v.name))
			EndTextCommandSetBlipName(blip)
		end
	end
end)

function CreateDialog(OnScreenDisplayTitle)
	AddTextEntry(OnScreenDisplayTitle, OnScreenDisplayTitle)
	DisplayOnscreenKeyboard(1, OnScreenDisplayTitle, "", "", "", "", "", 32)
	while (UpdateOnscreenKeyboard() == 0) do
		DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
		local displayResult = GetOnscreenKeyboardResult()
		return displayResult
	end
end

RegisterNetEvent('life_banking:result')
AddEventHandler('life_banking:result', function(message)
	ESX.ShowNotification(message)
end)

RegisterNetEvent('life_banking:startAnim')
AddEventHandler('life_banking:startAnim', function()
	Citizen.CreateThread(function()
		if Config.UseSoundandAnimation then
			RequestAnimDict(Config.Animations.Dict)
			RequestAnimDict(Config.Animations.Dict2)
			RequestAnimDict(Config.Animations.Dict3)

			while not HasAnimDictLoaded(Config.Animations.Dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(PlayerPedId(), Config.Animations.Dict, Config.Animations.Anim ,8.0, -8.0, -1, 0, 0, false, false, false )

			Citizen.Wait(3000)

			while not HasAnimDictLoaded(Config.Animations.Dict2) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(PlayerPedId(), Config.Animations.Dict2, Config.Animations.Anim2 ,8.0, -8.0, -1, 0, 0, false, false, false )

			Citizen.Wait(100)

			while not HasAnimDictLoaded(Config.Animations.Dict3) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(PlayerPedId(), Config.Animations.Dict3, Config.Animations.Anim3 ,8.0, -8.0, -1, 0, 0, false, false, false )
		elseif not Config.UseSoundandAnimation then
			RequestAnimDict(Config.Animations.Dict)

			while not HasAnimDictLoaded(Config.Animations.Dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(PlayerPedId(), Config.Animations.Dict, Config.Animations.Anim ,8.0, -8.0, -1, 0, 0, false, false, false )
		end
	end)
end)

RegisterNetEvent('life_banking:startAnim2')
AddEventHandler('life_banking:startAnim2', function()
	Citizen.CreateThread(function()
		RequestAnimDict(Config.Animations.Dict4)
		while not HasAnimDictLoaded(Config.Animations.Dict4) do
			Citizen.Wait(0)
		end
		TaskPlayAnim(PlayerPedId(), Config.Animations.Dict4, Config.Animations.Anim4 ,8.0, -8.0, -1, 0, 0, false, false, false )
	end)
end)
