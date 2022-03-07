ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('life_banking:getMoney', function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)
	local playerCash = xPlayer.getMoney()
    local playerBank = xPlayer.getAccount('bank').money

    cb(playerCash, playerBank)


end)

RegisterServerEvent('life_banking:deposit')
AddEventHandler('life_banking:deposit', function(amount)
	local _source = source
	amount = tonumber(amount)
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('life_banking:result', _source, Translation[Config.Locale]['invalid_amount'])
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
		-- TriggerClientEvent('life_banking:result', _source, Translation[Config.Locale]['withdraw_successful'])
	end
end)

RegisterNetEvent('life_banking:useTemplateWithdraw')
AddEventHandler('life_banking:useTemplateWithdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerAccMoney = xPlayer.getAccount('bank').money
	if amount <= playerAccMoney then 
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
	else 
		TriggerClientEvent('life_banking:result', _source, Translation[Config.Locale]['not_enough_money'])
	end
end)

RegisterNetEvent('life_banking:useTemplateDeposit')
AddEventHandler('life_banking:useTemplateDeposit', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerMoney = xPlayer.getMoney() 
	if amount <= playerMoney then 
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', amount)
	else 
		TriggerClientEvent('life_banking:result', _source, Translation[Config.Locale]['not_enough_money'])
	end
end)

RegisterServerEvent('life_banking:withdraw')
AddEventHandler('life_banking:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('life_banking:result', _source, Translation[Config.Locale]['invalid_amount'])
	else
		
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
		-- TriggerClientEvent('life_banking:result', _source, Translation[Config.Locale]['deposit_successful'])
	end
end)

RegisterServerEvent('life_banking:transferSV')
AddEventHandler('life_banking:transferSV', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	local toSteam = GetPlayerName(steam) -- für webhook
	local balance = 0

	if(zPlayer == nil or zPlayer == -1) then
		TriggerClientEvent('life_banking:result', _source, Translation[Config.Locale]['id_not_existing'])
	else
		balance = xPlayer.getAccount('bank').money
		zbalance = zPlayer.getAccount('bank').money
		
		if tonumber(_source) == tonumber(to) then
			TriggerClientEvent('life_banking:result', _source, Translation[Config.Locale]['good_try'])
		else
			if balance < tonumber(amountt) or tonumber(amountt) <= 0 then
				TriggerClientEvent('life_banking:result', _source, Translation[Config.Locale]['not_enough_money'])
			else
				xPlayer.removeAccountMoney('bank', tonumber(amountt))
				zPlayer.addAccountMoney('bank', tonumber(amountt))
				TriggerClientEvent('life_banking:result', _source,  Translation[Config.Locale]['account_currency_label']..amountt.. Translation[Config.Locale]['transfer_successful'])
			end
		end
	end
end)


	
