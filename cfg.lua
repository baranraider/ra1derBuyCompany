QBCore = exports["qb-core"]:GetCoreObject()
Config = {}
Config.PedCoord = vector3(-139.105, -633.922, 167.82)
Config.PedHeading = 5.943
Config.StartJobGrade = 2 -- Satın aldığınız mesleklerin patron grade'i | hepsinin aynı olması gerekiyor.
Config.FinishJob = "unemployed" -- Script'te ki Kiralama süresi bittiğinde geri verecek job.
Config.FinishJobGrade = 1 -- Kiralama süresi bittiğinde unemployed perminin vereceği grade
Config.SqlType = "oxmysql" --or ghmattimysql
Config.Ped = "ig_bankman"


meslekler = {
    {
        meslek = "Burger Shot",
        txt = "San Andreas Avenue",
        job = "burger",
        ucret = 75000
    },
    {
        meslek = "Bennys Original Motorworks",
        txt = "Power Street",
        job = "mechanic_bennys",
        ucret = 150000
    },
    {
        meslek = "Hayes Auto Bodyshop",
        txt = "Boulevard Del Perro",
        job = "mechanic_hayes",
        ucret = 175000
    },
    {
        meslek = "Hayes Motorsport Workshop",
        txt = "Roy Lowenst'ein Boulevard",
        job = "mechanic_hayes2",
        ucret = 150000
    },
    {
        meslek = "6STR Tunner Workstation",
        txt = "Signal Street",
        job = "mechanic_tunner",
        ucret = 200000
    },
    {
        meslek = "Ottos Autos",
        txt = "Populer Street",
        job = "mechanic_ottos",
        ucret = 175000
    },
    {
        meslek = "Premium Deluxe Motorsport",
        txt = "Power Street",
        job = "cardealer",
        ucret = 400000
    },
    {
        meslek = "LS Agent (Emlakçılık)",
        txt = "San Andreas Avenue",
        job = "realestate",
        ucret = 300000
    },
    {
        meslek = "Gunshop",
        txt = "Power Street",
        job = "gunshop",
        ucret = 500000
    },
}

Config.Text = {
    ['finishjob'] = 'Gerekli İmzalar Atıldı',
	['alreadyboss'] = "Zaten bir işletmede çalışıyorsun veya Sahibisin",
	['rentbusiness'] = "İşletmeyi Kiraladın",
	['nomoney'] = "Yeteri Kadar Paran Yok!",
	["renterror"] = "Bu İşletmeyi Kiralamayamazsın.",
    ["targetname"] = "İşletme Kirala"
}


