import t from 'tcomb'

export const Team = t.struct({
  id: t.String,
  name: t.String,
  sys_admin: t.Bool,
  poc_name: t.String,
  poc_email: t.String,
  created_at: t.String,
  updated_at: t.String,
  deleted_at: t.maybe(t.String),
}, 'Team')

export const UsersTeam = t.struct({
  id: t.String,
  name: t.String,
  sys_admin: t.Bool,
  poc_name: t.String,
  poc_email: t.String,
  created_at: t.String,
  updated_at: t.String,
  deleted_at: t.maybe(t.String),
  role: t.String,
}, 'UserTeam')

export const Teams = t.struct({
  data: t.list(UsersTeam),
}, 'UsersTeams')

export const TeamUser = t.struct({
}, 'TeamUser')

export const TeamUsers = t.struct({
  data: t.list(TeamUser),
}, 'TeamUsers')
