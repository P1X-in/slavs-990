var days = {
    1: {
        'name': 'Jaskółka',
        'description': 'Początek wezwań wiosny.',
        'mission': '',
    },
    9: {
        'name': 'Wiosenny Nowy Rok',
        'description': 'Modły o urodzaj, przewidywania pogody na lato.',
        'mission': 'prepare_for_small_celebration',
    },
    13: {
        'name': 'Wiosenny Tydzień Jaryły',
        'description': 'Modły do Jaryły, śpiewanie pieśni pochwalnych.',
        'mission': 'prepare_for_small_celebration',
    },
    16: {
        'name': 'Wierzbica',
        'description': 'Chłostanie gałązką wierzby. Oświęcenie pasieki, modły o pszczoły.',
        'mission': '',
    }, 
    18: {
        'name': 'Święto Dadźboga',
        'description': 'Modły do Dadźboga, korowody dziewcząt.',
        'mission': '',
    }, 
    20: {
        'name': 'Nawski Wielki Dzień',
        'description': 'Na ziemie przybywają dusze zmarłych - nawie. Przed wschodem słońca ludzie kąpią się w rzekach lub symbolicznie oblewają wodą.',
        'mission': '',
    }, 
    25: {
        'name': 'Święto wiosny',
        'description': 'Rozpalanie ognisk i skakanie przezeń celem oczyszczenia, wrzucanie do rzek ofiar z chleba.',
        'mission': '',
    }, 
    26: {
        'name': 'Wielkie Święto Peruna',
        'description': 'Oświęcenie ziarna, rozpoczęcie zasiewów. Oczekiwanie na pierwszą wiosenną burzę.',
        'mission': '',
    }, 
    41: {
        'name': 'Wodnik Wiosenny',
        'description': 'Składanie ofiar wodnikom, by nie zatapiały ludzkich siedzib.',
        'mission': '',
    }, 
    45: {
        'name': 'Święto Jarowita',
        'description': 'Tańce, pieśni, radowanie się i weselenie, zabawa, rytualne tarzanie się po ziemi.',
        'mission': '',
    }, 
    52: {
        'name': 'Wielka Mokosz',
        'description': 'Święto dziewcząt - składanie ofiar z białych kogutów.',
        'mission': '',
    }, 
    53: {
        'name': 'Święto Jaryły',
        'description': 'Święto mężczyzn - składanie ofiar z kogutów, palenie ognisk i spryskiwanie ich rytualnym piwem..',
        'mission': '',
    }, 
    60: {
        'name': 'Święto Welesa',
        'description': 'Składanie ofiar Welesowi, wypędzanie bydła na pastwiska.',
        'mission': '',
    }, 
    62: {
        'name': 'Rusalia',
        'description': 'Kobiety składają ofiary dla rusałek - kawałki plótna oraz wianki.',
        'mission': '',
    }, 
    71: {
        'name': 'Zielnik',
        'description': 'Zbiory ziół leczniczych, rytualne spożywanie posiłków w lasach i na polach.',
        'mission': '',
    }, 
    106: {
        'name': 'Świętowit Letni',
        'description': 'Wznoszenie modłów do Świętowita o obfite plony.',
        'mission': '',
    }, 
    111: {
        'name': 'Noc Kupały',
        'description': 'Pierwszy dzień lata. Święto obchodzone ku czci ognia. Zabawy w lasach i nad rzekami, skakanie przez ogień, puszczanie wianków na wodę, poszukiwanie kwiatu paproci. Łączenie się w pary, szczęśliwy czas poczynania dzieci.',
        'mission': '',                                                                                                                                                                                                                                                                                         'mission': '',
    }, 
    112: {
        'name': 'Święto Siemargła',
        'description': 'Modły do Siemargła, składanie ofiar.',
        'mission': '',
    }, 
    120: {
        'name': 'Wodnik Letni',
        'description': 'Składanie ofiar wodnikom z pierwszej złowionej ryby, tytoniu i piwa.',
        'mission': '',
    }, 
    121: {
        'name': 'Pogrzeb Jaryły',
        'description': 'Spalanie kukły Jaryły.',
        'mission': '',
    }, 
    123: {
        'name': 'Święto Swaroga',
        'description': 'Czczenie Swaroga jako boga kowalstwa, początek Sianokosów.',
        'mission': '',
    }, 
    127: {
        'name': 'Letnie Święto Miesiąca',
        'description': 'Modły do Chorsa, personifikacji księżyca.',
        'mission': '',
    }, 
    141: {
        'name': 'Perunowy Tydzień',
        'description': 'Wznoszenie modłów do Peruna, świętowanie w dębowych gajach, składanie ofiar z wieprzowiny, wołowiny, kogutów.',
        'mission': 'prepare_large_celebration',
    }, 
    143: {
        'name': 'Perunica Letnia',
        'description': 'Czczenie Błyskawicy. Tego dnia nie należało pracować w polu, by nie ściągać na siebie jej gniewu.',
        'mission': '',
    }, 
    158: {
        'name': 'Spas Jabłkowy',
        'description': 'Święcenie i spożywanie jabłek, gruszek i innych darów sadu.',
        'mission': '',
    }, 
    168: {
        'name': 'Spas Chlebowy',
        'description': 'Święcenie i spożywanie chleba z nowego ziarna, okazywanie wdzięczności bogom za urodzaj.',
        'mission': '',
    }, 
    169: {
        'name': 'Święto Leszego',
        'description': 'Oddawanie czci Leszemu, składanie ofiary z chleba na polanach w lasach.',
        'mission': 'prepare_small_celebration',
    },
    172: {
        'name': 'Letni Strzybóg',
        'description': 'Czczenie Strzyboga, obserwowanie wiatrów i wróżenie z ich kierunków.',
        'mission': '',
    }, 
    187: {
        'name': 'Perunica Jesienna',
        'description': 'Święto na cześć błyskawicy i gromu, które na zimę zasypiają. Palenie ognisk z gałęzi tarniny.',
        'mission': '',
    }, 
    191: {
        'name': 'Rodzanice',
        'description': 'Modły kobiet o dobry połóg, zdrowie niemowląt i całej rodziny.',
        'mission': '',
    }, 
    203: {
        'name': 'Jesienny Strzybóg',
        'description': 'Modły do Strzyboga o dobrą pogodę, prognozowanie pogody na jesień z kierunków wiatrów.',
        'mission': '',
    }, 
    206: {
        'name': 'Święto plonów',
        'description': 'Pierwszy dzień jesieni. Święto plonów, poświęcone tegorocznym zbiorom.',
        'mission': '',
    }, 
    207: {
        'name': 'Święto Domowika i Owinnika',
        'description': 'Składanie ofiar Domowikowi i Owinnikowi - z koguta oraz miseczek napełnionych owsianką.',
        'mission': '',
    }, 
    209: {
        'name': 'Świętowid Jesienny',
        'description': 'Święto urodzaju. Modły w chromie Świętowita, składanie ofiar, wróżby z obrzędowego napoju o przyszłej zimie.',
        'mission': '',
    }, 
    210: {
        'name': 'Pasieka',
        'description': 'Święto pszczelarzy.',
        'mission': '',
    }, 
    214: {
        'name': 'Jesienne Święto Matki Ziemi',
        'description': 'Początek jesienno-zimowych robót. Okres wyprawiania wesel.',
        'mission': '',
    }, 
    238: {
        'name': 'Dziady',
        'description': 'Dzień wspominania przodków. "Dziady" odwiedzają swoje rodzinne domy, zostają ugoszczone gorącym, parującym posiłkiem.',
        'mission': '',
    }, 
    244: {
        'name': 'Święto Mokoszy',
        'description': 'Kobiety oddają cześć Mokoszy. Ofiarują jej przędziwo i płótno.',
        'mission': '',
    }, 
    252: {
        'name': 'Tury',
        'description': 'Święto myśliwych i początek sezonu polowań. Myśliwi składają ofiary i wznoszą modły o dobre polowania.',
        'mission': '',
    }, 
    268: {
        'name': 'Święto Doli',
        'description': 'Wróżby.',
        'mission': '',
    }, 
    280: {
        'name': 'Spas Zimowy',
        'description': 'Dzień nadejścia zimy.',
        'mission': '',
    }, 
    295: {
        'name': 'Zimowe Staniesłońca',
        'description': 'Czczenie Swaroga, uroczyste spożywanie świętej wieczerzy.',
        'mission': '',
    }, 
    297: {
        'name': 'Święto Roda',
        'description': 'Wygłaszanie zamówień ku czci Roda i Rodzanic, wypiekanie dla nich ciast, warzenie piwa i miodu.',
        'mission': '',
    }, 
    338: {
        'name': 'Gromnica',
        'description': 'Zima spotyka się z wiosną. Modły do słońca - Swaroga, czczenie wszystkich bogów.',
        'mission': '',
    }, 
    345: {
        'name': 'Welesowy Tydzień',
        'description': 'Czczenie Welesa, wywracanie kożuchów futrem na wierzch.',
        'mission': 'prepare_large_celebration',
    }, 
    357: {
        'name': 'Wiosenny Strzybóg',
        'description': 'Odprawianie modłów do boga wiatrów, przewidywanie pogody na wiosnę i lato.',
        'mission': '',
    }, 
    365: {
        'name': 'Nowolecie',
        'description': 'Wiosenny Nowy Rok.',
        'mission': '',
    }
}

var ordinary_day = {
    'name': '',
    'description': 'Kolejny zwykły dzień.',
    'mission': '',
}
