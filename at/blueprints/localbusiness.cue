package blueprints

#Lexicon & {
    lexicon: 1
    id: "\(#domain_authority).dev.localbusiness"
    defs: {
        "main": {
            type: "record"
            key: "tid"
            record: {
                type: "object"
                required: ["name", "category", "address"]
                properties: {
                    name: {
                        type: "string"
                    }
                    description: {
                        type: "string"
                    }
                    openingHours: {
                        type: "array"
                        items: {
                            type: "string"
                        }
                    }
                    // category is not present in the original schema
                    // but Google Business Profile requires it
                    category: {
                        type: "string"
                    }
                    address: {
                        type: "string"
                    }
                    phone: {
                        type: "string"
                    }
                    url: {
                        type: "string"
                    }
                }
            }
        }
    }
}
