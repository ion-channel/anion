import t from 'tcomb'

export const Destination = t.struct(
  {
    id: t.String,
    team_id: t.String,
    location: t.String,
    region: t.String,
    name: t.String,
    type: t.String,
    deleted_at: t.maybe(t.String),
  },
  'Destination',
)

export const Destinations = t.struct(
  {
    data: t.list(Destination),
  },
  'Destinations',
)
