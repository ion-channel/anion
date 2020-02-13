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

export const Product = t.struct({
  id: t.Number,
  name: t.String,
  org: t.String,
  version: t.String,
  created_at: t.String,
  updated_at: t.String,
  title: t.String,
  external_id: t.String,
})

export const Products = t.list(Product)
