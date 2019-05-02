import t from 'tcomb'

export const Tag = t.struct({
  id: t.String,
  team_id: t.String,
  name: t.String,
  description: t.String,
  created_at: t.String,
  updated_at: t.String,
}, 'Tag')
