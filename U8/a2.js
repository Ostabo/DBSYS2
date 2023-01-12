// a -- Maybe complicated ?
db.pers.aggregate(
    {
        $project: {
            _id: 0,
            name: 1,
            gehalt: 1,
            vorgesetzter: 1,
        }
    },
    {
        $lookup: {
            from: "pers",
            localField: "vorgesetzter.$id",
            foreignField: "_id",
            as: "vorgesetzter"
        }
    },
    {
        $unwind: "$vorgesetzter"
    },
    {
        $project: {
            name: 1,
            gehalt: 1,
            earns_more: {
                $cmp: ["$gehalt", "$vorgesetzter.gehalt"]
            }
        }
    },
    {
        $match: {
            "earns_more": 1
        }
    },
    {
        $project: {
            name: 1,
            gehalt: 1
        }
    }
)

// b
db.abt.aggregate(
    {
        $lookup: {
            from: "pers",
            localField: "_id",
            foreignField: "abteilung.$id",
            as: "pers"
        }
    },
    {
        $unwind: "$pers"
    },
    {
        $group: {
            _id: "$ort",
            sum: {
                $sum: "$pers.gehalt"
            }
        }
    },
    {
        $sort: {
            sum: -1
        }
    },
    {
        $limit: 1
    }
)