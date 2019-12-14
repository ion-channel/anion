import t from 'tcomb'

export const User = t.struct(
  {
    id: t.String,
    email: t.String,
    username: t.String,
    chat_handle: t.String,
    created_at: t.String,
    updated_at: t.String,
    last_active_at: t.String,
    externally_managed: t.Bool,
    sys_admin: t.Bool,
    system: t.Bool,
    teams: t.Any,
  },
  'User',
)
