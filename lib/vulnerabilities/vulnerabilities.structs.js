import t from 'tcomb'

export const Vulnerability = t.struct({
  id: t.Number,
  external_id: t.String,
  title: t.String,
  summary: t.String,
  score: t.String,
  score_version: t.String,
  score_system: t.String,
})

export const Vulnerabilities = t.list(Vulnerability)
