local standardVolumeOutput = 1.0;

RegisterNetEvent('life_bankingCL:PlayOnOne')
AddEventHandler('life_bankingCL:PlayOnOne', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)
