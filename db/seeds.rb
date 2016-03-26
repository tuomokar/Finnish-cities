I18n.locale = :fi

r1 = Region.create name:"Varsinais-Suomi", area:10910.05, population: 470880, description: "Turun kaupungin koti.", link: "http://www.varsinais-suomi.fi/fi/"
r2 = Region.create name:"Lappi", area:98984, population: 181815, description: "Joulupukin koti.", link: "http://www.lappi.fi"
r3 = Region.create name:"Kainuu", area:24451.41, population: 75226, description: "Laajojen asumattomien metsien, järvien ja vaarojen maakunta", link:"http://www.kainuu.fi"
r4 = Region.create name:"Pohjois-Pohjanmaa", area:37416.78, population: 409984, description: "Suomen toiseksi suurin maakunta", link: "http://www.pohjois-pohjanmaa.fi"
r5 = Region.create name:"Ahvenanmaa", area:1581.40, population: 29013, description: "Itsehallinnollinen saariryhmä", link:"http://www.ahvenanmaa.fi"
r6 = Region.create name:"Etelä-Karjala", area:6872.10, population: 131030, description: "Osa Suomen puolelle jääneestä osasta vanhaa Suomen Karjalaa", link:"http://www.ekarjala.fi/"
r7 = Region.create name:"Etelä-Pohjanmaa", area:13443.46, population: 192550, description: "", link:"http://www.epmatkailu.fi/"
r8 = Region.create name:"Etelä-Savo", area:0, population: 0, description: "", link:"http://www.esavo.fi"
r9 = Region.create name:"Kanta-Häme", area:105, population: 0, description: "http://www.hameenliitto.fi/fi/etusivu"
r10 = Region.create name:"Keski-Pohjanmaa", area:0, population: 0, description: "http://www.keski-pohjanmaa.fi/"
r11 = Region.create name:"Keski-Suomi", area:0, population: 0, description: "http://www.keskisuomi.fi/"
r12 = Region.create name:"Kymenlaakso", area:0, population: 0, description: "http://www.kymenlaakso.fi/"
r13 = Region.create name:"Pirkanmaa", area:0, population: 0, description: "http://www.pirkanmaa.fi/fi"
r14 = Region.create name:"Pohjanmaa", area:0, population: 0, description: "http://www.obotnia.fi/etusivu/"
r15 = Region.create name:"Pohjois-Karjala", area:0, population: 0, description: "http://pohjois-karjala.fi/"
r16 = Region.create name:"Pohjois-Savo", area:0, population: 0, description: "http://www.pohjois-savo.fi/"
r17 = Region.create name:"Päijät-Häme", area:0, population: 0, description: "http://www.paijat-hame.fi/"
r18 = Region.create name:"Uusimaa", area:0, population: 0, description: "http://www.uudenmaanliitto.fi/"
r19 = Region.create name:"Satakunta", area:0, population: 0, description: "http://www.satakunta.fi/"

I18n.locale = :en

r1.name = "Southwest Finland"
r1.description = "Home of Turku city"
r1.link = "http://www.varsinais-suomi.fi/en/"
r1.save

r2.name = "Lapland"
r2.description = "Home of Santa Claus"
r2.link = "http://www.lapland.fi/en/home"
r2.save

r3.description ="The region of vast, uninhabited forests, lakes and hills"
r3.save

r4.name = "Northern Ostrobothnia"
r4.description = "The second largest region in Finland"
r4.link = "http://www.pohjois-pohjanmaa.fi/index.php?315"
r4.save

r5.name = "Åland"
r5.description = "Autonomous archipelago region"
r5.link = "http://www.aland.org.uk/"
r5.save

r6.name = "South Karelia"
r6.description = "Part of the old Finland's Karelia that was left on Finland's side"
r6.link = "http://www.ekarjala.fi/en/"
r6.save

r7.name = "Southern Ostrobothnia"
r7.link = "http://www.epmatkailu.fi/in_english.html"
r7.save

r8.name = "Southern Savonia"
r8.link = "http://www.esavo.fi/en/page/2"
r8.save

r9.name = "Tavastia Proper"
r9.link = "http://www.hameenliitto.fi/en"
r9.save

r10.name = "Central Ostrobothnia"
r10.save

r11.name = "Central Finland"
r11.link = "http://www.keskisuomi.fi/in_english/briefly_in_english"
r11.save

r13.link = "http://www.pirkanmaa.fi/en"
r13.save

r14.name = "Ostrobothnia"
r14.link = "http://www.obotnia.fi/frontpage/"
r14.save

r15.name = "North Karelia"
r15.link = "http://pohjois-karjala.fi/en/web/english"
r15.save

r16.name = "Northern Savonia"
r16.link = "http://www.pohjois-savo.fi/en/home.html"
r16.save

r17.link = "http://www.paijat-hame.fi/in-english/"
r17.save

r18.link = "http://www.uudenmaanliitto.fi/en"
r18.save

r19.link = "http://www.satakunta.fi/en"
r19.save