import t from 'tcomb'

export const Alias = t.struct(
  {
    id: t.String,
    name: t.String,
    org: t.String,
    created_at: t.String,
    updated_at: t.String,
    version: t.String,
  },
  'Alias',
)
