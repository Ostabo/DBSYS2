db.abt.insertMany([{"anr": "K51", "aname": "Entwicklung", "ort": "Erlangen"},
    {"anr": "K53", "aname": "Buchh", "ort": "Nürnberg"},
    {"anr": "K55", "aname": "Personal", "ort": "Nürnberg"}])
db.pers.insertOne({
    "pnr": 123, "name": "Mueller", "jahrg": 1958,
    "eindat": new Date("1986-03-01"), "gehalt": 68000, "beruf": "Kaufmann",
    "abteilung": new DBRef("abt", db.abt.findOne({"aname": "Entwicklung"})._id)
})
db.pers.insertOne({
    "pnr": 406, "name": "Coy", "jahrg": 1950,
    "eindat": new Date("1980-09-01"), "gehalt": 80000, "beruf": "Programmierer",
    "vorgesetzter": new DBRef("pers", db.pers.findOne({"name": "Mueller"})._id),
    "abteilung": new DBRef("abt", db.abt.findOne({"aname": "Personal"})._id)
})
db.pers.insertOne({
    "pnr": 829, "name": "Schmidt", "jahrg": 1960,
    "eindat": new Date("1990-06-01"), "gehalt": 74000, "beruf": "Kaufmann",
    "vorgesetzter": new DBRef("pers", db.pers.findOne({"name": "Mueller"})._id),
    "abteilung": new DBRef("abt", db.abt.findOne({"aname": "Buchh"})._id)
})
db.pers.insertOne({
    "pnr": 874, "name": "Abel",
    "eindat": new Date("1994-05-01"), "gehalt": 62000, "beruf": "Softw.Entwickler",
    "vorgesetzter": new DBRef("pers", db.pers.findOne({"name": "Schmidt"})._id),
    "abteilung": new DBRef("abt", db.abt.findOne({"aname": "Personal"})._id)
})
db.pers.insertOne({
    "pnr": 503, "name": "Junghans",
    "gehalt": 55000, "beruf": "Programmierer",
    "vorgesetzter": new DBRef("pers", db.pers.findOne({"name": "Mueller"})._id),
    "abteilung": new DBRef("abt", db.abt.findOne({"aname": "Entwicklung"})._id)
})
