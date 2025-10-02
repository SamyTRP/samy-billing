Config = {}


Config.command = "faturakes"


Config.AllowedJobs = {
    ["police"] = true,
    ["ambulance"] = true,
    ["mechanic"] = true,
    ["mechanic2"] = true,
    ["mechanic3"] = true,
    ["mechanic4"] = true,
    ["catcafe"] = true,
    ["vanilla"] = true,
    ["burgershot"] = true,
    ["tequilas"] = true
}


Config.Commission = 0.05


Config.Locale = "tr"


Config.Lang = {
    ["tr"] = {
        notifyError = "Hata",
        notifySuccess = "Başarılı",

        menuTitle = "Fatura Kes",
        selectPlayer = "Oyuncu",
        amountLabel = "Fatura Tutarı",
        amountPlaceholder = "1000",
        reasonLabel = "Fatura Nedeni",
        reasonPlaceholder = "Hız ihlali",

        errorNoPlayers = "Yakında oyuncu yok!",
        errorNoNames = "Oyuncu isimleri alınamadı!",
        errorInvalid = "Geçerli bir tutar ve neden giriniz!",
        successBill = "Fatura kesildi. Komisyon: $%s",
        errorJob = "Bu meslek fatura kesemez!",
    },
    ["en"] = {
        notifyError = "Error",
        notifySuccess = "Success",

        menuTitle = "Issue Invoice",
        selectPlayer = "Player",
        amountLabel = "Invoice Amount",
        amountPlaceholder = "1000",
        reasonLabel = "Invoice Reason",
        reasonPlaceholder = "Speeding",

        errorNoPlayers = "No nearby players!",
        errorNoNames = "Could not fetch player names!",
        errorInvalid = "Enter a valid amount and reason!",
        successBill = "Invoice sent. Commission: $%s",
        errorJob = "Your job cannot issue invoices!",
    }
}


function _L(key, ...)
    local text = Config.Lang[Config.Locale][key] or key
    if ... then
        return (text):format(...)
    else
        return text
    end
end
