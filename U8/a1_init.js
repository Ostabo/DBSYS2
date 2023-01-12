m1 = {"auftragsnummer" : 1234,
    "kosten" : 6000,
    "beschreibung" : "Entwicklung Onlineshop",
    "jahr" : 2021 }
m2 = {"auftragsnummer" : 1217,
    "kosten" : 300,
    "beschreibung" : "Installation Webserver",
    "jahr" : 2020 }
m3 = {"auftragsnummer" : 1218,
    "kosten" : 500,
    "beschreibung" : "Cloud Integration",
    "jahr" : 2020 }
m4 = {"auftragsnummer" : 1222,
    "kosten" : 2000,
    "beschreibung" : "Optimierung Infrastruktur",
    "jahr" : 2021 }
m5 = {"auftragsnummer" : 1224,
    "kosten" : 3000,
    "beschreibung" : "Optimierung Infrastruktur",
    "jahr" : 2021 }
db.auftrag.insertMany([m1, m2, m3, m4, m5])
k1 = {
    "name": "Müller",
    "adresse": "Obere Laube 10 78462 Konstanz",
    "auftraege": [{
        "kosten": 6000,
        "details": new DBRef("auftrag", db.auftrag.findOne({
            "auftragsnummer": 1234})._id)},
        {
            "kosten": 300,
            "details": new DBRef("auftrag", db.auftrag.findOne({
                "auftragsnummer": 1217})._id)}]
}
k2 = {
    "name": "Maier",
    "adresse": "Seestrasse 10 78462 Konstanz",
    "auftraege": [{
        "kosten": 500,
        "details": new DBRef("auftrag", db.auftrag.findOne({
            "auftragsnummer": 1218})._id)
    },
        {
            "kosten": 2000,
            "details": new DBRef("auftrag", db.auftrag.findOne({
                "auftragsnummer": 1222})._id)}]
}
k3 = {
    "name": "Kunz",
    "adresse": "Seestrasse 1 78462 Konstanz",
    "auftraege": [{
        "kosten": 3000,
        "details": new DBRef("auftrag", db.auftrag.findOne({
            "auftragsnummer": 1224})._id)}]
}
db.kunde.insertMany([k1, k2, k3])