db.kunde.deleteMany({})
db.auftrag.deleteMany({})

db.auftrag.insertOne({
    "auftragsnummer": 1234,
    "kosten": 5600,
    "beschreibung": "Neubau Gaupe",
    "jahr": 2018,
    "arbeitsstunden": 14
})

db.auftrag.insertOne({
    "auftragsnummer": 1277,
    "kosten": 3100,
    "beschreibung": "Einbau Dachfenster",
    "jahr": 2017,
    "arbeitsstunden": 8
})

db.auftrag.insertOne({
    "auftragsnummer": 1287,
    "kosten": 3400,
    "beschreibung": "Ueberdachung",
    "jahr": 2017,
    "arbeitsstunden": 8
})

db.auftrag.insertOne({
    "auftragsnummer": 1235,
    "kosten": 7500,
    "beschreibung": "Neubau Gaupe",
    "jahr": 2016,
    "arbeitsstunden": 16
})


db.kunde.insertOne(
    {
        "name": "Maier",
        "wohnort": "Konstanz",
        "auftraege": [{
            "kosten": 5500,
            "details": new DBRef("auftrag",
                db.auftrag.findOne({"auftragsnummer": 1234})._id)
        },
            {
                "kosten": 3100,
                "details": new DBRef("auftrag", db.auftrag.findOne({"auftragsnummer": 1277})._id)
            },
            {
                "kosten": 3400,
                "details": new DBRef("auftrag", db.auftrag.findOne({"auftragsnummer": 1287})._id)
            }]
    }
)

db.kunde.insertOne(
    {
        "name": "Mangold",
        "wohnort": "Konstanz",
        "auftraege": ({
            "kosten": 7500,
            "details": new DBRef("auftrag", db.auftrag.findOne({"auftragsnummer": 1235})._id)
        })
    }
)


// Aufgaben

// Aufgabe a)
// Wie viel Einnahmen haben die Kunden aus Konstanz jeweils beauftragt?
db.kunde.aggregate([
    { $match: {"wohnort": "Konstanz"}},
    { $project: {"auftraege.kosten" : 1, "wohnort": 1}},
    {
        $group: {
            "_id": "$wohnort",
            "einnahmen": {$sum: "$auftraege.kosten"}
        }
    }
]) // falsch

// Aufgabe b)
// In welchem Jahr hat die Zimmerei am Neubau von Gaupen am meisten Geld eingenommen?
db.auftrag.find({
    beschreibung: "Neubau Gaupe"
}, {_id: 0, jahr: 1, kosten: 1}).sort({kosten: -1}).limit(1)


// Aufgabe c)
// Bei welchem Auftrag war das Verhaeltnis Kosten pro Arbeitsstunden am guenstigsten fuer die Zimmerei?
db.auftrag.aggregate([
    {$project: {_id:0, "kpa": {$divide: ["$kosten", "$arbeitsstunden"]}, "beschreibung": "$beschreibung"}},
    {$sort: {"kpa": 1}},
    {$limit: 1}
])

// Aufgabe d)
// Die Kosten sind redundant bei den Auftraegen und beim Kunde gespeichert.
// Ãœberpruefen Sie, ob diese beiden Kosten irgendwo nicht identisch sind.
// Geben Sie alle Kundennamen zusammen mit der Auftragsnummer aus, bei denen diese
// Kosten nicht gleich sind.


// Loesungen
// Bitte erst nach laengerem Programmieren anschauen !


// a)
// Wie viel Einnahmen haben die Kunden aus Konstanz jeweils beauftragt?
db.kunde.aggregate([
    {"$match": {"wohnort": "Konstanz"}},
    {"$project": {"name": "$name", "einnahmen": {$sum: "$auftraege.kosten"}}}
]);


// b)
// An welchen Arbeiten hat die Zimmerei am meisten Geld eingenommen?
db.auftrag.aggregate([
    {$group: {"_id": "$beschreibung", "summe": {"$sum": "$kosten"}}},
    {$sort: {"summe": -1}},
    {$limit: 1}
]);


// c)
// Bei welchem Auftrag war das Verhaeltnis Kosten pro Arbeitsstunden am guenstigsten fuer die Zimmerei?
db.auftrag.aggregate([
    {"$project": {"beschreibung": "$beschreibung", "kostenprostd": {$divide: ["$kosten", "$arbeitsstunden"]}}},
    {$sort: {"kostenprostd": -1}},
    {$limit: 1}
]);


// d)
// Die Kosten sind redundant bei den Auftraegen und beim Kunde gespeichert.
// Ueberpruefen Sie, ob diese beiden Kosten irgendwo nicht identisch sind.
// Geben Sie alle Kundennamen zusammen mit der Auftragsnummer aus, bei denen diese
// Kosten nicht gleich sind.
db.kunde.aggregate([
    {$unwind: "$auftraege"},
    {$project: {"name": "$name", "auftrag": "$auftraege.details", "kkosten": "$auftraege.kosten"}},
    {
        $lookup:
            {
                from: "auftrag",
                localField: "auftrag.$id",
                foreignField: "_id",
                as: "auftragsdetail"
            }
    },
    {$unwind: "$auftragsdetail"},
    {$match: {$expr: {$ne: ["$kkosten", "$auftragsdetail.kosten"]}}},
    {$project: {"kundenname": "$name", "auftragsnummer": "$auftragsdetail.auftragsnummer", "_id": 0}}
]);

// Anmerkung: diese Loesung ist nicht die kuerzeste, sie ist aber sehr anschaulich,
// wenn man sie Zeile fuer Zeile aufbaut

