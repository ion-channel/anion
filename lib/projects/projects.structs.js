import t from 'tcomb'
import { Alias } from '../aliases/aliases.structs'
import { Tag } from '../tags/tags.structs'

export const Project = t.struct(
  {
    id: t.String,
    team_id: t.String,
    ruleset_id: t.String,
    name: t.String,
    type: t.String,
    source: t.String,
    branch: t.String,
    description: t.String,
    active: t.Bool,
    chat_channel: t.String,
    created_at: t.String,
    updated_at: t.String,
    deploy_key: t.String,
    should_monitor: t.Bool,
    monitor_frequency: t.String,
    poc_name: t.String,
    poc_email: t.String,
    username: t.String,
    password: t.String,
    key_fingerprint: t.String,
    private: t.Bool,
    aliases: t.list(Alias),
    tags: t.list(Tag),
  },
  'Project',
)

export const UpdateProject = t.struct(
  {
    id: t.String,
    team_id: t.String,
    ruleset_id: t.String,
    name: t.String,
    branch: t.String,
    description: t.String,
    active: t.Bool,
    chat_channel: t.String,
    deploy_key: t.maybe(t.String),
    should_monitor: t.Bool,
    poc_name: t.String,
    poc_email: t.String,
    username: t.maybe(t.String),
    password: t.maybe(t.String),
    monitor_frequency: t.String,
    aliases: t.list(Alias),
    tags: t.maybe(t.list(Tag)),
  },
  'UpdateProject',
)

export const Projects = t.struct(
  {
    data: t.list(Project),
  },
  'Projects',
)
