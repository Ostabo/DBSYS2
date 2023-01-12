// a
db.auftrag.find(
    {
        "jahr": 2021,
        $or: [
            {"beschreibung": "Entwicklung Onlineshop"},
            {"beschreibung": "Installation Webserver"}
        ]
    }
)

// b
db.auftrag.find(
    {
        "jahr": 2021,
    },
    {
        "_id": 0,
        "beschreibung": 1,
    }
)

// c
db.kunde.find(
    {
        "auftraege.kosten": {$gt: 5000}
    },
    {
        "_id": 0,
        "name": 1,
    }
)

// d
db.kunde.find(
    {
        "auftraege.details.$ref": "auftrag", // <- line is optional
        "auftraege.details.$id": db.auftrag.findOne({"auftragsnummer": 1222})._id
    },
    {
        "_id": 0,
        "name": 1,
    }
)

// e
db.kunde.aggregate(
    {
        $unwind: "$auftraege"
    },
    {
        $group: {
            _id: "$name",
            summe: {$sum: "$auftraege.kosten"}
        }
    }
)

// f
db.auftrag.aggregate(
    {
        $match: {
            "beschreibung": "Entwicklung Onlineshop"
        }
    },
    {
        $group: {
            _id: "$jahr",
            summe: {$sum: "$kosten"}
        }
    }
)

// g
db.auftrag.aggregate(
    {
        $match: {
            "jahr": 2021
        }
    },
    {
        $group: {
            _id: "$beschreibung",
            summe: {$sum: "$kosten"}
        }
    },
    {
        $sort: {
            summe: -1
        }
    }
)

