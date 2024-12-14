package blueprints

#Lexicon: {
    lexicon: 1
    id: string
    revision?: int
    description?: string
    defs: [string]: #definition
}

#definition: {
    // Only "record" definitions are supported in this lexicon
    type: "query" | "procedure" | "subscription" | "record"
    description?: string
}

#definition: {
    type: "record"
    key: "tid" | "nsid" | "any" | "record-key" // "literal:<value>" not supported
    record: #field & {
        type: "object"
    }
}

#field: {
    type: string
    description?: string
}

#field: {
    type: "null"
} | {
    type: "boolean"
    default?: bool
    const?: bool
} | {
    type: "integer"
    minimum?: int
    maximum?: int
    enum?: [...int]
    default?: int
    const?: int
} | {
    type: "string"
    format?: "at-identifier" | "at-uri" | "cid" | "datetime" | "did" | "handle" | "nsid" | "tid" | "record-key" | "uri" | "language"
    maxLength?: int
    minLength?: int
    maxGraphemes?: int
    minGraphemes?: int
    knownValues?: [...string]
    enum?: [...string]
    default?: string
    const?: string
} | {
    type: "bytes"
    minLength?: int
    maxLength?: int
} | {
    type: "cid-link"
} | {
    type: "array"
    items: #field
    minLength?: int
    maxLength?: int
} | {
    type: "object"
    required?: [...string]
    nullable?: [...string]
    properties: [string]: #field
} | {
    type: "blob"
    accept?: [...string]
    maxSize?: int
} | {
    type: "ref"
    ref: string
} | {
    type: "union"
    refs: [...string]
    closed?: bool
}
