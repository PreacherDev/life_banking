RegisterServerEvent('life_banking:generalWebhook')
AddEventHandler('life_banking:generalWebhook', function(ConfigWebhookLink, color, textToDiscord, name)       
   local _source = source
   local name = GetPlayerName(_source)
   generalWH(ConfigWebhookLink, color, "**LIFE BANKING**", name.. textToDiscord, "by Preacher#6392 & Alpha#7721")
end)

function generalWH(ConfigWebhookLink, color, name, message, footer)
        local embed = {
            {
                ["color"] = color,
				["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = footer,
                    ["icon_url"] = 'https://cdn.discordapp.com/attachments/939061526931832883/941277046426992690/life_services_edged.png',
                },
            }   
        }
        PerformHttpRequest(ConfigWebhookLink, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end
