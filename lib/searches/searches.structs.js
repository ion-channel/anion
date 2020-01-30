import t from 'tcomb'

export const Search = t.struct({
  aliases: t.Any,
  confidence: t.Number,
  created_at: t.String,
  edition: t.maybe(t.String),
  external_id: t.String,
  language: t.maybe(t.String),
  name: t.String,
  org: t.String,
  part: t.maybe(t.String),
  references: t.maybe(t.String),
  source: t.maybe(t.String),
  title: t.maybe(t.String),
  up: t.maybe(t.String),
  updated_at: t.String,
  version: t.String,
  vulnerability_count: t.Number,
})

export const Searches = t.list(Search)
