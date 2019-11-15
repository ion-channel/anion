import t from 'tcomb'

export const Analysis = t.struct({
  id: t.String,
  team_id: t.String,
  project_id: t.String,
  name: t.String,
  text: t.maybe(t.String),
  type: t.String,
  source: t.String,
  branch: t.String,
  description: t.maybe(t.String),
  status: t.String,
  ruleset_id: t.String,
  created_at: t.String,
  updated_at: t.String,
  duration: t.Number,
  trigger_hash: t.String,
  trigger_text: t.String,
  trigger_author: t.String,
  scan_summaries: t.list(t.Any),
  public: t.Boolean,
}, 'Analysis')
