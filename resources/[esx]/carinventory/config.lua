Config = {}

Config.Locale = "fr"

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Weight = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1

Config.Vehicule = { 
    Compacts = { 
        { model = "blista", prix = 3000, price = 5300, weight = 10000 },
        { model = "blista2", prix = 7650, price = 9650, weight = 30000 },
        { model = "brioso", prix = 12000, price = 16000, weight = 10000 },
        { model = "brioso2", prix = 10000, price = 14000, weight = 10000 },
        { model = "dilettante", prix = 4000, price = 8500, weight = 10000 }, 
        { model = "issi2", prix = 5000, price = 9500, weight = 10000 }, 
        { model = "issi3", prix = 6000, price = 12000, weight = 10000 }, 
        { model = "panto", prix = 2000, price = 4500, weight = 10000 }, 
        { model = "prairie", prix = 6000, price = 12000, weight = 10000 }, 
        { model = "rhapsody", prix = 10000, price = 16000, weight = 10000 },
        { model = "asbo", prix = 4500, price = 7000, weight = 10000 },
        { model = "kanjo", prix = 10000, price = 16000, weight = 10000 },
        { model = "club", prix = 8000, price = 12743, weight = 10000 },
        { model = "weevil", prix = 20000, price = 24000, weight = 10000 },
    },
    Coupes = {
        { model = "cogcabrio", prix = 50000, price = 70500, weight = 30000 },
        { model = "exemplar", prix = 80000, price = 120000, weight = 30000 },
        { model = "f620", prix = 60000, price = 70000, weight = 30000 },
        { model = "felon", prix = 50000, price = 61000, weight = 30000 },
        { model = "felon2", prix = 52000, price = 66000, weight = 30000 },
        { model = "jackal", prix = 25000, price = 54250, weight = 30000 },
        { model = "oracle", prix = 12500, price = 22500, weight = 30000 },
        { model = "oracle2", prix = 20000, price = 30000, weight = 30000 },
        { model = "sentinel", prix = 18000, price = 26000, weight = 30000 },
        { model = "sentinel2", prix = 20500, price = 28500, weight = 30000 },
        { model = "windsor", prix = 80000, price = 114500, weight = 30000 },
        { model = "windsor2", prix = 90000, price = 137500, weight = 30000 },
        { model = "zion", prix = 30000, price = 38000, weight = 30000 },
        { model = "zion2", prix = 32000, price = 40000, weight = 30000 },
        { model = "previon", prix = 20000, price = 29750, weight = 30000 },
    },
    Motos = {
        { model = "akuma", prix = 5000, price = 9000, weight = 5000 },
        { model = "avarus", prix = 8000, price = 13500, weight = 5000 },
        { model = "bagger", prix = 2000, price = 5500, weight = 5000 },
        { model = "bati", prix = 15000, price = 19000, weight = 5000 },
        { model = "bati2", prix = 15200, price = 19200, weight = 5000 }, 
        { model = "bf400", prix = 16000, price = 20000, weight = 5000 },
        { model = "carbonrs", prix = 14000, price = 18000, weight = 5000 },
        { model = "chimera", prix = 24000, price = 28000, weight = 5000 },
        { model = "cliffhanger", prix = 27000, price = 32000, weight = 5000 },
        { model = "daemon", prix = 7500, price = 12000, weight = 5000 },
        { model = "daemon2", prix = 8500, price = 13500, weight = 5000 },
        { model = "defiler", prix = 12500, price = 16500, weight = 5000 },
        { model = "diablous", prix = 17000, price = 21000, weight = 5000 },
        { model = "diablous2", prix = 18000, price = 22000, weight = 5000 },
        { model = "double", prix = 15000, price = 19000, weight = 5000},
        { model = "enduro", prix = 4000, price = 7500, weight = 5000 },
        { model = "esskey", prix = 20000, price = 26500, weight = 5000 },
        { model = "faggio", prix = 500, price = 1100, weight = 5000 },
        { model = "faggio2", prix = 650, price = 1150, weight = 5000 },
        { model = "faggio3", prix = 850, price = 1400, weight = 5000 }, 
        { model = "fcr", prix = 8000, price = 11500, weight = 5000 },
        { model = "fcr2", prix = 10000, price = 13000, weight = 5000 },
        { model = "gargoyle", prix = 15000, price = 23000, weight = 5000 },
        { model = "hakuchou", prix = 25000, price = 31500, weight = 5000 },
        { model = "hakuchou2", prix = 34500, price = 48200, weight = 5000 },
        { model = "hexer", prix = 10000, price = 14200, weight = 5000 },
        { model = "innovation", prix = 14000, price = 18100, weight = 5000 },
        { model = "lectro", prix = 13200, price = 16200, weight = 5000 },
        { model = "manchez", prix = 10000, price = 14100, weight = 5000 },
        { model = "manchez2", prix = 21000, price = 27000, weight = 5000 },
        { model = "nemesis", prix = 4000, price = 7050, weight = 5000 },
        { model = "nightblade", prix = 19500, price = 25500, weight = 5000 },
        { model = "pcj", prix = 0, price = 8500, weight = 5000 },
        { model = "ratbike", prix = 1000, price = 2400, weight = 5000 },
        { model = "ruffian", prix = 4000, price = 8200, weight = 5000 },
        { model = "sanctus", prix = 18000, price = 24100, weight = 5000 },
        { model = "sovereign", prix = 16000, price = 19000, weight = 5000 },
        { model = "thrust", prix = 15000, price = 20000, weight = 5000 },
        { model = "vader", prix = 5000, price = 10000, weight = 5000 },
        { model = "vindicator", prix = 21000, price = 29000, weight = 5000 },
        { model = "vortex", prix = 10000, price = 14000, weight = 5000 },
        { model = "wolfsbane", prix = 10000, price = 14000, weight = 5000 },
        { model = "zombiea", prix = 12000, price = 17000, weight = 5000 },
        { model = "zombieb", prix = 15000, price = 19000, weight = 5000 },
        { model = "sanchez", prix = 15000, price = 19500, weight = 5000 },
        { model = "sanchez2", prix = 16000, price = 20500, weight = 5000 },
        { model = "stryder", prix = 15000, price = 19500, weight = 5000 },
        { model = "shinobi", prix = 21000, price = 26500, weight = 5000 },
        { model = "reever", prix = 17000, price = 21500, weight = 5000 },
    },
    Muscles = {
        { model = "blade", prix = 28000, price = 32250, weight = 25000 },
        { model = "buccaneer", prix = 22000, price = 26500, weight = 25000 },
        { model = "buccaneer2", prix = 24500 ,price = 29850, weight = 25000 },
        { model = "chino", prix = 17250, price = 21000, weight = 25000 },
        { model = "chino2", prix = 26000, price = 31765, weight = 25000 },
        { model = "clique", prix = 73000, price =  83000, weight = 30000 },
        { model = "coquette3", prix = 30000, price = 55450, weight = 25000 },
        { model = "deviant", prix = 37500, price = 42200, weight = 30000 },
        { model = "dominator", prix = 67950, price = 75000, weight = 35000 },
        { model = "dominator2", prix = 68950, price = 76000, weight = 35000 },
        { model = "dominator3", prix = 120000, price = 175200, weight = 35000 },
        { model = "dukes", prix = 38500, price = 43500, weight = 25000 },
        { model = "ellie", prix = 80250, price = 91500, weight = 25000 },
        { model = "faction", prix = 23000, price = 28350, weight = 25000 },
        { model = "faction2", prix = 29000, price = 34500, weight = 25000 },
        { model = "faction3", prix = 37650, price = 43300, weight = 25000 },
        { model = "ellie", prix = 80250, price = 91500, weight = 25000 },
        { model = "gauntlet", prix = 48000, price = 54600, weight = 30000 },
        { model = "gauntlet2", prix = 49250, price = 56000, weight = 30000 },
        { model = "gauntlet3", prix = 70000, price = 88350, weight = 30000 },
        { model = "gauntlet4", prix = 178500, price = 212950, weight = 30000 },
        { model = "hermes", prix = 60500, price = 70000, weight = 25000 },
        { model = "hotknife", prix = 65000, price = 72640, weight = 20000 },
        { model = "hustler", prix = 54000, price = 59825, weight = 20000 },
        { model = "nightshade", prix = 76000, price = 100250, weight = 25000 },
        { model = "impaler", prix = 27000, price = 30400, weight = 40000 },
        { model = "impaler2", prix = 45000, price = 49800, weight = 40000 },
        { model = "imapaler3", prix = 34500, price = 38000, weight = 40000 },
        { model = "peyote2", prix = 21500, price = 26000, weight = 25000 },
        { model = "phoenix", prix = 50555, price = 56550, weight = 30000 },
        { model = "picador", prix = 12000, price = 16200, weight = 25000 },
        { model = "ratloader", prix = 4999, price = 6500, weight = 35000 }, 
        { model = "ratloader2", prix = 17800, price = 22000 , weight = 35000 },
        { model = "ruiner", prix = 20000, price = 24100, weight = 25000 },
        { model = "sabregt", prix = 60000, price = 76550, weight = 30000 },
        { model = "sabregt2", prix = 70650, price = 109800, weight = 30000 },
        { model = "slamvan", prix = 18600, price = 22250, weight = 40000 },
        { model = "slamvan2", prix = 22000, price = 27500, weight = 40000 },
        { model = "slamvan3", prix = 26425, price = 30400, weight = 40000 },
        { model = "stalion", prix = 17000, price = 20000, weight = 25000 },
        { model = "stalion2", prix = 18000, price = 22000, weight = 25000},
        { model = "tampa", prix = 32500, price = 37500, weight = 25000 },
        { model = "tulip", prix = 78000, price = 87500, weight = 35000 },
        { model = "vamos", prix = 19200, price = 27400, weight = 25000 },
        { model = "vigero", prix = 12500, price = 17500, weight = 25000 },
        { model = "virgo", prix = 17125, price = 23150, weight = 25000 },
        { model = "virgo2", prix = 21000, price = 28450, weight = 25000 },
        { model = "virgo3", prix = 28500, price = 34200, weight = 25000 },
        { model = "voodoo", prix = 26000, price = 30000, weight = 25000 },
        { model = "voodoo2", prix = 8500, price = 12600, weight = 25000 },
        { model = "dominator7", prix = 57000, price = 69150, weight = 25000 },
        { model = "yosemite", prix = 43000, price = 51350, weight = 40000 },
        { model = "yosemite2", prix = 59600, price = 68000, weight = 40000 },
         { model = "yosemite3", prix = 59600, price = 68000, weight = 40000 },
    },
    Offroad = { 
        { model = "bfinjection", prix = 9500, price = 12000, weight = 10000 },
        { model = "bifta", prix = 11000,  price = 14000, weight = 10000 },
        { model = "blazer", prix = 6000,  price = 8000, weight = 5000 },
        { model = "blazer2", prix = 6500,  price = 8500, weight = 5000 },
        { model = "blazer3", prix = 6500, price = 8500, weight = 5000 },
        { model = "blazer4", prix = 8000, price = 10000, weight = 5000 },
        { model = "blazer5", prix = 7750, price = 9750, weight = 5000 },
        { model = "bodhi2", prix = 23500, price = 25000, weight = 15000 },
        { model = "brawler", prix = 69250, price = 76000, weight = 25000 },
        { model = "trophytruck", prix = 210000, price = 235000, weight = 50000 },
        { model = "trophytruck2", prix = 220000, price = 240500, weight = 50000 },
        { model = "caracara2", prix = 155000, price = 217000, weight = 60000 },
        { model = "dloader", prix = 16000, price = 20000, weight = 15000 },
        { model = "dubsta3", prix = 125000, price = 150000, weight = 60000 },
        { model = "everon", prix = 120000, price = 135000, weight = 60000 },
        { model = "freecrawler", prix = 83000, price = 85500, weight = 25000 },
        { model = "guardian", prix = 150000, price = 175000, weight = 50000 },
        { model = "hellion", prix = 45250, price = 55000, weight = 60000 },
        { model = "kalahari", prix = 4000, price = 10500, weight = 15000 },
        { model = "kamacho", prix = 135000, price = 173500, weight = 55000 },
        { model = "mesa3", prix = 20000, price = 29000, weight = 10000 },
        { model = "outlaw", prix = 70000, price = 75000, weight = 10000 },
        { model = "raptor", prix = 70000, price = 130000, weight = 15000 },
        { model = "rancherxl", prix = 13000, price = 21000, weight = 15000 },
        { model = "rebel", prix = 7000, price = 12500, weight = 15000 },
        { model = "rebel2", prix = 7750, price = 14000, weight = 15000 },
        { model = "riata", prix = 18000, price = 22000, weight = 15000 },
        { model = "sandking", prix = 50000, price = 65000, weight = 55000 },
        { model = "sandking2", prix = 54750, price = 62750, weight = 55000 },
        { model = "vagrant", prix = 50250, price = 67000, weight = 10000 },
        { model = "verus", prix = 4000, price = 11000, weight = 500 },
        { model = "winky", prix = 20000, price = 27000, weight = 10000 },
    },
SportivesClassiques = {
        { model = "ardent", prix = 57000, price = 61000, weight = 10000 },
        { model = "btype", prix = 231000, price = 238000, weight = 10000 },
        { model = "btype2", prix = 239000, price = 250000, weight = 10000 },
        { model = "btype3", prix = 235000, price = 242000, weight = 10000 },
        { model = "casco", prix = 146000, price = 152000, weight = 10000 },
        { model = "cheburek", prix = 13000, price = 15500, weight = 15000 },
        { model = "chettah2", prix = 71000, price = 73500, weight = 10000 },
        { model = "coquette2", prix = 114000, price = 120000, weight = 10000 },
        { model = "dynasty", prix = 18750, price = 20350, weight = 10000 },
        { model = "fagaloa", prix = 19500, price = 22000, weight = 10000 },
        { model = "feltzer3", prix = 175750, price = 215750, weight = 10000 },
        { model = "gt500", prix = 153000, price = 185600, weight = 10000 },
        { model = "infernus2", prix = 140000, price = 155000, weight = 10000 },
        { model = "jb7002", prix = 270000, price = 284250, weight = 10000 },
        { model = "mamba", prix = 122000, price = 162000, weight = 10000 },
        { model = "manana", prix = 15000, price = 19500, weight = 10000 },
        { model = "manana2", prix = 17500, price = 21250, weight = 10000 },
        { model = "michelli", prix = 24000, price = 25950, weight = 10000 },
        { model = "monroe", prix = 178000, price = 183000, weight = 10000 },
        { model = "nebula", prix = 21500, price = 23500, weight = 10000 },
        { model = "peyote", prix = 22000, price = 24250, weight = 10000 },
        { model = "peyote3", prix = 28000, price = 31100, weight = 10000 },
        { model = "pigalle", prix = 27000, price = 29500, weight = 10000 },
        { model = "rapidgt3", prix = 92320, price = 127320, weight = 10000 },
        { model = "retinue", prix = 26500, price = 28000, weight = 10000 },
        { model = "retinue2", prix = 28000, price = 30450, weight = 10000 },
        { model = "savestra", prix = 33000, price = 35100, weight = 10000 },
        { model = "stinger", prix = 415000, price = 504000, weight = 10000 },
        { model = "stingergt", prix = 407500, price = 497500, weight = 10000 },
        { model = "swinger", prix = 3850000, price = 435000, weight = 10000 },
        { model = "tornado", prix = 9000, price = 14000, weight = 10000 },
        { model = "tornado2", prix = 9750, price = 14500, weight = 10000 },
        { model = "tornado3", prix = 10550, price = 15100, weight = 10000 },
        { model = "tornado4", prix = 10750, price = 15500, weight = 10000 },
        { model = "tornado5", prix = 12000, price = 17000, weight = 10000 },
        { model = "tornado6", prix = 20000, price = 24000, weight = 10000 },
        { model = "turismo2", prix = 296000, price = 315000, weight = 15000 },
        { model = "viseris", prix = 72000, price = 76650, weight = 15000 },
        { model = "torero", prix = 172250, price = 177500, weight = 15000 },
        { model = "z190", prix = 115000, price = 165000, weight = 10000 },
        { model = "zion3", prix = 35350, price = 37000, weight = 10000 },
        { model = "ztype", prix = 1000000, price = 1200000, weight = 10000 },
    },
    Sportives = {
        { model = "ninef", prix = 105000, price = 145000, weight = 15000 },
        { model = "ninef2", prix = 128000, price = 163000, weight = 15000 },
        { model = "alpha", prix = 64500, price = 71750, weight = 20000 },
        { model = "banshee", prix = 86500, price = 97000, weight = 15000 },
        { model = "bestiagts", prix = 75000, price = 88500, weight = 20000 },
        { model = "buffalo", prix = 41000, price = 47550, weight = 30000 },
        { model = "buffalo2", prix = 107000, price = 117000, weight = 30000  },
        { model = "buffalo3", prix = 46600, price = 52000, weight = 30000  },
        { model = "buffalo5", prix = 150000, price = 175000, weight = 30000  },
        { model = "carbonizzare", prix = 89000, price = 119000, weight = 15000 },
        { model = "comet2", prix = 137000, price = 152000, weight = 15000 },
        { model = "comet3", prix = 226000, price = 276000, weight = 15000 },
        { model = "comet4", prix = 1420000, price = 177000, weight = 15000 },
        { model = "comet5", prix = 284000, price = 324000, weight = 15000 },
        { model = "comet6", prix = 295000, price = 355000, weight = 15000 },
        { model = "comet7", prix = 300000, price = 365000, weight = 15000 },
        { model = "coquette4", prix = 502000, price = 592000, weight = 15000 },
        { model = "coquette", prix = 78000, price = 108000, weight = 15000 },
        { model = "drafter", prix = 300000, price = 350000, weight = 15000 },
        { model = "elegy", prix = 300000, price = 343000, weight = 15000 },
        { model = "elegy2", prix = 112250, price = 142250, weight = 15000 },
        { model = "feltzer2", prix = 90000, price = 111250, weight = 15000 },
        { model = "flashgt", prix = 170000, price = 189000, weight = 15000 },
        { model = "furoregt", prix = 130000, price = 160000, weight = 15000 },
        { model = "fusilade", prix = 48000, price = 56000, weight = 15000 },
        { model = "futo", prix = 8500, price = 10000, weight = 15000 },
        { model = "gb200", prix = 200000, price = 245000, weight = 15000 },
        { model = "hotring", prix = 100000, price = 145000, weight = 15000 },
        { model = "issi7", prix = 115000, price = 160000, weight = 15000 },
        { model = "italigto", prix = 600000, price = 680000, weight = 15000 },
        { model = "jester", prix = 210000, price = 260000, weight = 15000 },
        { model = "jester2", prix = 215600, price = 266550, weight = 15000 },
        { model = "jugular", prix = 250000, price = 303000, weight = 30000 },
        { model = "khamelion", prix = 108000, price = 133250, weight = 15000 },
        { model = "kuruma", prix = 75000, price = 125450, weight = 30000 },
        { model = "locust", prix = 200000, price = 250000, weight = 15000 },
        { model = "lynx", prix = 310000, price = 382000, weight = 15000 },
        { model = "massacro", prix = 300000, price = 338000, weight = 15000 },
        { model = "massacro2", prix = 310000, price = 348000, weight = 15000 },
        { model = "neo", prix = 430000, price = 490000, weight = 15000 },
        { model = "neon", prix = 310000, price = 350000, weight = 15000 },
        { model = "omnis", prix = 200000, price = 245000, weight = 15000 },
        { model = "paragon", prix = 181000, price = 235000, weight = 15000 },
        { model = "pariah", prix = 340000, price = 400000, weight = 15000 },
        { model = "penumbra", prix = 51500, price = 60250, weight = 15000 },
        { model = "raiden", prix = 286420, price = 320000, weight = 30000 },
        { model = "rapidgt", prix = 120000, price = 150000, weight = 15000 },
        { model = "rapidgt2", prix = 122000, price = 155550, weight = 15000 },
        { model = "ruston", prix = 200000, price = 280000, weight = 15000 },
        { model = "revolter", prix = 270000, price = 340000, weight = 15000 },
        { model = "schafter2", prix = 67000, price = 72650 , weight = 30000 },
        { model = "schafter3", prix = 70700, price = 80000, weight = 30000 },
        { model = "schafter4", prix = 80700, price = 90000, weight = 30000 },
        { model = "schlagen", prix = 105000, price = 165000, weight = 15000 },
        { model = "specter", prix = 100000, price = 142000, weight = 15000 },
        { model = "specter2", prix = 120000, price = 162000, weight = 15000 },
        { model = "schwarzer", prix = 142000, price = 159250, weight = 20000 },
        { model = "sentinel3", prix = 61000, price = 82000, weight = 20000 },
        { model = "seven70", prix = 230000, price = 271000, weight = 15000 },
        { model = "sultan", prix = 95000, price = 127650, weight = 15000 },
        { model = "sultan2", prix = 85000, price = 97650, weight = 15000 },
        { model = "surano", prix = 101000, price = 122000, weight = 15000 },
        { model = "tampa2", price = 122000, prix = 162000, weight = 15000 },
        { model = "tropos", prix = 203650, price = 253000, weight = 15000 },
        { model = "rt3000", prix = 76500, price = 86450, weight = 15000 },
        { model = "verlierer2", prix = 175000, price = 210000, weight = 15000 },
        { model = "vectre", prix = 140000, price = 187500, weight = 15000 },
        { model = "futo2", prix = 21000, price = 30850, weight = 15000 },
        { model = "calico", prix = 71000, price = 81250, weight = 15000 },
        { model = "zr350", prix = 201000, price = 255430, weight = 15000 },
        { model = "jester4", prix = 348000, price = 398500, weight = 15000 },
        { model = "euros", prix = 210000, price = 265150, weight = 15000 },
        { model = "sultan3", prix = 191000, price = 223650, weight = 30000 },
        { model = "remus", prix = 53500, price = 62450, weight = 15000 },  
        { model = "jester3", prix = 118000, price = 167000, weight = 15000 },
        { model = "growler", prix = 123500, price = 163500, weight = 15000 },
        { model = "sugoi", prix = 100000, price = 125000, weight = 30000 },
        { model = "vstr", prix = 305000, price = 330000, weight = 30000 },
        { model = "cypher", prix = 202000, price = 250000, weight = 15000 },
        { model = "deity", prix = 350000, price = 405000, weight = 15000 },
    },
    SuperSportives = {
        { model = "adder", prix = 664000, price = 864000, weight = 10000 },
        { model = "autarch", prix = 750000, price = 987000, weight = 15000 },
        { model = "banshee2", prix = 450000, price = 562000, weight = 10000 },
        { model = "bullet", prix = 275000, price = 325000, weight = 10000 },
        { model = "cheetah", prix = 400000, price = 483000, weight = 15000 },
        { model = "cyclone", prix = 600000, price = 782000, weight = 10000 },
        { model = "deveste", prix = 1100000, price = 1354000, weight = 15000 },
        { model = "emerus", prix = 1000000, price = 1158000, weight = 15000 },
        { model = "entityxf", prix = 580000, price = 681000, weight = 10000 },
        { model = "entity2", prix = 750000, price = 899000, weight = 15000 },
        { model = "fmj", prix = 760000, price = 863000, weight = 10000 },
        { model = "gp1", prix = 570000, price = 642000, weight = 10000 },
        { model = "infernus", prix = 300000, price = 385000, weight = 10000 },
        { model = "italigtb", prix = 840000, price = 942000, weight = 10000 },
        { model = "italigtb2", prix = 870000, price = 986000, weight = 10000 },
        { model = "krieger", prix = 800000, price = 983000, weight = 10000 },
        { model = "nero", prix = 1000000, price = 1114000, weight = 10000 },
        { model = "nero2", prix = 1100000, price = 1254000, weight = 10000 },
        { model = "osiris", prix = 650000, price = 768000, weight = 10000 },
        { model = "penetrator", prix = 570000, price = 628000, weight = 10000 },
        { model = "pfister811", prix = 770000, price = 882000, weight = 10000 },
        { model = "prototipo", prix = 1000000, price = 1241000, weight = 15000 },
        { model = "reaper", prix = 710000, price = 841000, weight = 15000 },
        { model = "sc1", prix = 650000, price = 746000, weight = 15000 },
        { model = "sultanrs", prix = 140000, price = 195000, weight = 15000 },
        { model = "t20", prix = 875000, price = 945000, weight = 15000 },
        { model = "taipan", prix = 895000, price = 1008500, weight = 15000 },
        { model = "tempesta", prix = 850000, price = 941000, weight = 15000 },
        { model = "tezeract", prix = 900000, price = 1020000, weight = 15000 },
        { model = "thrax", prix = 1500000, price = 1951000, weight = 15000 },
        { model = "turismor", prix = 785000, price = 853000, weight = 15000 },
        { model = "tyrant", prix = 850000, price = 945000, weight = 15000 },
        { model = "tyrus", prix = 800000, price = 901200, weight = 15000 },
        { model = "vacca", prix = 450000, price = 557000, weight = 15000 },
        { model = "vagner", prix = 600000, price = 768000, weight = 15000 },
        { model = "visione", prix = 710000, price = 824000, weight = 15000 },
        { model = "voltic", prix = 350000, price = 482000, weight = 5000 },
        { model = "xa21", prix = 850000, price = 954400, weight = 15000 },
        { model = "zentorno", prix = 900000, price = 990000, weight = 15000 },
        { model = "zorrusso", prix = 790000, price = 873000, weight = 15000 },
        { model = "komoda", prix = 300000, price = 355000, weight = 15000 },
        { model = "imorgon", prix = 250000, price = 300000, weight = 15000 },
        { model = "italirsx", prix = 350000, price = 425500, weight = 15000 },
        { model = "ignus", prix = 1150000, price = 1425500, weight = 15000 },
    },
    Vans = {
        {model = "bison", prix = 26000, price = 49000, weight = 40000 },
        {model = "bobcatxl", prix = 20000, price = 38000, weight = 20000 },
        {model = "burrito3", prix = 22000, price =  46000, weight = 100000 },
        {model = "gburrito2", prix = 24000, price = 48000, weight = 100000 },
        {model = "camper", prix = 23000, price = 44000, weight = 80000 },
        {model = "gburrito", prix = 21000, price = 41000, weight = 100000 },
        {model = "journey", prix = 12000, price = 22000, weight = 40000 },
        {model = "moonbeam", prix = 19000, price = 29000, weight = 100000 },
        {model = "moonbeam2", prix = 29000, price = 39000, weight = 100000 },
        {model = "paradise", prix = 14000, price = 19000, weight = 40000 },
        {model = "rumpo", prix = 20000, price =  31000, weight = 100000 },
        {model = "surfer", prix = 5000, price = 7000, weight = 30000 },
        {model = "youga", prix = 13000, price = 22000, weight = 100000 },
        {model = "youga2", prix = 16000, price = 27000, weight = 100000 },
        {model = "youga3", prix = 16000, price = 27000, weight = 100000 },
        {model = "speedo", prix = 21000, price = 31000, weight = 100000 },
    },
    Berlines = {
        {model = "tailgater2", prix = 100000, price = 145000, weight = 20000},
        {model = "asea", prix = 10000, price = 25000, weight = 20000},
        {model = "asterope", prix = 15000, price = 35000, weight = 20000},
        {model = "cognoscenti", prix = 30000, price = 70000, weight =30000},
        {model = "cog55", prix = 70000, price = 115000, weight = 20000},
        {model = "emperor", prix = 2000, price = 4000, weight =20000},
        {model = "emperor2", prix = 2000, price = 4000, weight =20000},
        {model = "fugitive", prix = 10000, price = 23000, weight =35000},
        {model = "glendale", prix = 6000, price = 14000, weight =35000},
        {model = "glendale2", prix = 10000, price = 20000, weight =35000},
        {model = "ingot", prix = 1000, price = 2500, weight =20000},
        {model = "stafford", prix = 50000, price = 70000, weight =20000},
        {model = "stanier", prix = 12000, price = 14000, weight =20000},
        {model = "stretch", prix = 70000, price = 85000, weight =20000},
        {model = "intruder", prix = 6500, price = 16000, weight = 35000},
        {model = "surge", prix = 5000, price = 7000, weight =20000},
        {model = "premier", prix = 4000, price = 7000, weight =20000},
        {model = "primo", prix = 7000, price = 9000, weight =30000},
        {model = "primo2", prix = 10000, price = 20000, weight =35000},
        {model = "regina", prix = 2000, price = 4500, weight =30000},
        {model = "schafter2", prix = 38000, price = 71000, weight =30000},
        {model = "superd", prix = 60000, price = 100000, weight =20000},
        {model = "tailgater", prix = 30000, price = 50000, weight =20000},
        {model = "warrener", prix = 10000, price = 16000, weight =25000},
        {model = "washington", prix = 10000, price = 15000, weight =25000},
    },
    SUVs = {
        { model = "baller", prix = 35000, price = 55000, weight =60000},
        { model = "baller2", prix = 50000, price = 71000, weight =60000},
        { model = "baller3", prix = 75000, price = 88000, weight =60000},
        { model = "baller4", prix = 80000, price = 91000, weight =60000},
        { model = "bjxl", prix = 10000, price = 15000, weight =40000},
        { model = "cavalcade", prix = 15000, price = 20000, weight =50000},
        { model = "cavalcade2", prix = 19000, price = 24000, weight =50000},
        { model = "contender", prix = 110000, price = 140000, weight =70000},
        { model = "dubsta", prix = 48000, price = 58000, weight =50000},
        { model = "dubsta2", prix = 50000, price = 62000, weight =50000},
        { model = "fq2", prix = 13000, price = 23900, weight =50000},
        { model = "granger", prix = 30000, price = 46290, weight =60000},
        { model = "granger2", prix = 40000, price = 66290, weight =90000},
        { model = "gresley", prix = 20000, price = 28000, weight =50000},
        { model = "habanero", prix = 14000, price = 24000, weight =50000},
        { model = "huntley", prix = 41000, price = 56800, weight =40000},
        { model = "streiter", prix = 110000, price = 131000, weight =40000},
        { model = "landstalker", prix = 10000, price = 22400, weight =50000},
        { model = "landstalker2", prix = 50000, price = 71000, weight =50000},
        { model = "mesa", prix = 5000, price = 101200, weight =40000},
        { model = "novak", prix = 150000, price = 197750, weight =75000},
        { model = "patriot", prix = 0, price = 48420, weight =50000},
        { model = "patriot2", prix = 0, price = 48420, weight =50000},
        { model = "radi", prix = 5000, price = 13200, weight =30000},
        { model = "seminole2", prix = 15000, price = 33200, weight =30000},
        { model = "rocoto", prix = 20000, price = 36620, weight =60000},
        { model = "radi", prix = 5000, price = 13200, weight =30000},
        { model = "seminole", prix = 5000, price = 11500, weight =50000},
        { model = "serrano", prix = 5000, price = 10050, weight =40000},
        { model = "toros", prix = 350000, price = 410000, weight =40000},
        { model = "xls", prix = 55000, price = 78250, weight =75000},
        { model = "rebla", prix = 135000, price = 175000, weight =75000},
        { model = "iwagen", prix = 200000, price = 250000, weight =70000},
        { model = "jubilee", prix = 450000, price = 500000, weight =70000},
        { model = "astron", prix = 150000, price = 210000, weight =25000},
    },
    LSFD = { 
        { model = "lsfd", prix = 5000, price = 10000, weight = 10000 },
        { model = "lsfd2", prix = 5000, price = 10000, weight = 10000 },
        { model = "lsfd3", prix = 5000, price = 10000, weight = 10000 },
        { model = "lsfd4", prix = 5000, price = 10000, weight = 10000 },
        { model = "lsfd5", prix = 5000, price = 10000, weight = 10000 },
        { model = "lsfdtruck", prix = 5000, price = 10000, weight = 10000 },
        { model = "lsfdtruck2", prix = 5000, price = 10000, weight = 10000 },
        { model = "lsfdtruck3", prix = 5000, price = 10000, weight = 10000 },
        { model = "mocpacker2", prix = 5000, price = 10000, weight = 10000 },
    },
    LSPD = { 
        { model = "lspdb", prix = 5000, price = 10000, weight = 30000 },
        { model = "police", prix = 5000, price = 10000, weight = 30000 },
        { model = "police2", prix = 5000, price = 10000, weight = 30000 },
        { model = "police3", prix = 5000, price = 10000, weight = 30000 },
        { model = "police4", prix = 5000, price = 10000, weight = 30000 },
        { model = "polalamoold", prix = 5000, price = 10000, weight = 60000 },
        { model = "poleveron", prix = 5000, price = 10000, weight = 70000 },
        { model = "police42old", prix = 5000, price = 10000, weight = 40000 },
        { model = "policeold", prix = 5000, price = 10000, weight = 70000 },
        { model = "policeslick", prix = 5000, price = 10000, weight = 30000 },
        { model = "polriot", prix = 5000, price = 10000, weight = 100000 },
        { model = "polsadlerk9", prix = 5000, price = 10000, weight = 70000 },
        { model = "polspeedo", prix = 5000, price = 10000, weight = 100000 },
        { model = "pscout", prix = 5000, price = 10000, weight = 50000 },
        { model = "pscoutnew", prix = 5000, price = 10000, weight = 50000 },
        { model = "swatstalker", prix = 5000, price = 10000, weight = 50000 },
        { model = "mocpacker", prix = 5000, price = 10000, weight = 100000 },
    },
    LSSD = { 
        { model = "sheriff", prix = 5000, price = 10000, weight = 30000 },
        { model = "sheriff2", prix = 5000, price = 10000, weight = 30000 },
        { model = "sheriffalamo", prix = 5000, price = 10000, weight = 50000 },
        { model = "sheriffcq4", prix = 5000, price = 10000, weight = 10000 },
        { model = "sherifffug", prix = 5000, price = 10000, weight = 30000 },
        { model = "sheriffinsurgent", prix = 5000, price = 10000, weight = 100000 },
        { model = "sheriffoss", prix = 5000, price = 10000, weight = 30000 },
        { model = "sheriffroamer", prix = 5000, price = 10000, weight = 50000 },
        { model = "sheriffrumpo", prix = 5000, price = 10000, weight = 70000 },
        { model = "sheriffscout", prix = 5000, price = 10000, weight = 50000 },
        { model = "sheriffscoutnew", prix = 5000, price = 10000, weight = 50000 },
        { model = "sheriffstalker", prix = 5000, price = 10000, weight = 50000 },
        { model = "sheriffthrust", prix = 5000, price = 10000, weight = 5000 },  
    },
    SERV = { 
        { odel = "airbus", prix = 5000, price = 10000, weight = 100000 },
        { model = "bus", prix = 5000, price = 10000, weight = 100000 },
        { model = "coach", prix = 5000, price = 10000, weight = 100000 },
        { model = "pbus2", prix = 5000, price = 10000, weight = 100000 },
        { model = "rentalbus", prix = 5000, price = 10000, weight = 80000 },
        { model = "taxi", prix = 5000, price = 10000, weight = 30000 },
        { model = "trash2", prix = 5000, price = 10000, weight = 100000 },
        { model = "boxville2", prix = 5000, price = 10000, weight = 100000 },
        { model = "boxville4", prix = 5000, price = 10000, weight = 100000 },
        { model = "bison3", prix = 5000, price = 10000, weight = 70000 },
        { model = "taco", prix = 5000, price = 10000, weight = 100000 },
        { model = "speedo4", prix = 5000, price = 10000, weight = 100000 },
        { model = "speedo", prix = 5000, price = 10000, weight = 100000 },
    },
    USSS = { 
        { model = "cat", prix = 5000, price = 10000, weight = 50000 },
        { model = "halfback", prix = 5000, price = 10000, weight = 50000 },
        { model = "halfback2", prix = 5000, price = 10000, weight = 50000 },
        { model = "hazard", prix = 5000, price = 10000, weight = 100000 },
        { model = "hazard2", prix = 5000, price = 10000, weight = 100000 },
        { model = "idcar", prix = 5000, price = 10000, weight = 50000 },
        { model = "roadrunner", prix = 5000, price = 10000, weight = 50000 },
        { model = "roadrunner2", prix = 5000, price = 10000, weight = 50000 },
        { model = "roadrunner3", prix = 5000, price = 10000, weight = 50000 },
        { model = "usssminigun", prix = 5000, price = 10000, weight = 50000 },
        { model = "usssminigun2", prix = 5000, price = 10000, weight = 50000 },
        { model = "ussssuv", prix = 5000, price = 10000, weight = 50000 },
        { model = "ussssuv2", prix = 5000, price = 10000, weight = 50000 },
        { model = "watchtower", prix = 5000, price = 10000, weight = 50000 },
        { model = "watchtower2", prix = 5000, price = 10000, weight = 50000 },
        { model = "usssvan", prix = 5000, price = 10000, weight = 100000 },
        { model = "usssvan2", prix = 5000, price = 10000, weight = 100000 },
    },
    CAMION = { 
        { model = "vetir", prix = 10000, price = 20000, weight = 50000 },
        { model = "tiptruck", prix = 15000, price = 25000, weight = 50000 },
        { model = "tiptruck2", prix = 16000, price = 26000, weight = 50000 },
        { model = "rubble", prix = 15000, price = 25000, weight = 100000 },
        { model = "mixer", prix = 15000, price = 25000, weight = 100000 },
        { model = "mixer2", prix = 16000, price = 26000, weight = 50000 },
        { model = "guardian", prix = 150000, price = 200000, weight = 50000 },
        { model = "flatbed", prix = 5000, price = 10000, weight = 50000 },
        { model = "dump", prix = 25000, price = 40000, weight = 50000 },
        { model = "bulldozer", prix = 26000, price = 36000, weight = 50000 },
        { model = "benson", prix = 25000, price = 35000, weight = 50000 },
        { model = "biff", prix = 5000, price = 10000, weight = 50000 },
        { model = "hauler", prix = 45000, price = 55000, weight = 50000 },
        { model = "mule", prix = 17500, price = 27500, weight = 50000 },
        { model = "mule2", prix = 18500, price = 28500, weight = 50000 },
        { model = "mule3", prix = 20500, price = 30500, weight = 50000 },
        { model = "mule4", prix = 25500, price = 35500, weight = 50000 },
        { model = "packer", prix = 45000, price = 55000, weight = 100000 },
        { model = "phantom", prix = 75000, price = 85000, weight = 100000 },
        { model = "phantom3", prix = 85000, price = 95000, weight = 100000 },
        { model = "pounder", prix = 50000, price = 60000, weight = 200000 },
        { model = "pounder2", prix = 60000, price = 70000, weight = 200000 },
        { model = "towtruck", prix = 50000, price = 60000, weight = 50000 },
        { model = "towtruck2", prix = 60000, price = 70000, weight = 40000 },
        { model = "tractor", prix = 2000, price = 3000, weight = 1000 },
        { model = "tractor2", prix = 60000, price = 70000, weight = 100000 },
        { model = "utillitruck", prix = 40000, price = 50000, weight = 100000 },
        { model = "utillitruck2", prix = 45000, price = 55000, weight = 100000 },
        { model = "utillitruck3", prix = 60000, price = 70000, weight = 45000 },
        { model = "docktug", prix = 30000, price = 40000, weight = 5000 },
    },
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LSPD",
    ambulance = "EMS0",
    mecano = "MECA"
}