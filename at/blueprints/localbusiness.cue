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
                required: ["name", "category", "address", "contactPoint"]
                properties: {
                    name: {
                        type: "string"
                    }
                    description: {
                        type: "string"
                    }
                    openingHours: {
                        type: "ref"
                        ref: "#openingHours"
                    }
                    // category is not present in the original schema.org LocalBusiness.
                    // It is added here to allow for a more flexible categorization of businesses.
                    // It is based on schema.org's @type property, Open Street Map's (OSM) map features,
                    // Open Geospatial Consortium's (OGC) Points of Interest model, Ordnance Survey GB's
                    // (OSGB) classification schema, and Google Places' types.
                    category: {
                        type: "array"
                        items: {
                            type: "ref"
                            ref: "#category"
                        }
                    }
                    address: {
                        type: "ref"
                        ref: "#address"
                    }
                    contactPoint: {
                        type: "array"
                        items: {
                            type: "ref"
                            ref: "#contactPoint"
                        }
                    }
                    url: {
                        type: "string"
                    }
                }
            }
        }
        "category": {
            type: "object"
            required: ["main"]
            properties: {
                main: {
                    type: "string"
                }
                sub: {
                    type: "string"
                }
                specific: {
                    type: "string"
                }
            }
        }
        "address": {
            type: "object"
            required: ["addressCountry", "addressLocality", "streetAddress"]
            properties: {
                addressCountry: {
                    type: "string"
                }
                // schema.org prefers a single region property, but other references
                // use up to two administrative levels.
                addressAdministrativeLevel1: {
                    type: "string"
                }
                addressAdministrativeLevel2: {
                    type: "string"
                }
                addressLocality: {
                    type: "string"
                }
                postalCode: {
                    type: "string"
                }
                streetAddress: {
                    type: "string"
                }
            }
        }
        "contactPoint": {
            type: "object"
            properties: {
                contactType: {
                    type: "string"
                }
                telephone: {
                    type: "string"
                }
                email: {
                    type: "string"
                }
            }
        }
        "openingHours": {
            type: "array"
            items: {
                type: "string"
            }
        }
    }
}
