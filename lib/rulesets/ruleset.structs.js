import t from 'tcomb'

export const AppliedRulesetSummary = t.struct(
  {
    project_id: t.String,
    team_id: t.String,
    analysis_id: t.String,
    rule_evaluation_summary: t.Any,
    created_at: t.String,
    updated_at: t.String,
  },
  'AppliedRulesetSummary',
)
const ProjectAnalysis = t.struct(
  {
    analysis_id: t.String,
    created_at: t.String,
    pass: t.Boolean,
    project_id: t.String,
    team_id: t.String,
  },
  'ProjectAnalysis',
)

const Meta = t.struct(
  {
    last_update: t.String,
    offset: t.Number,
    total_count: t.Number,
  },
  'Meta',
)

export const ProjectHistory = t.struct(
  {
    data: t.list(ProjectAnalysis),
    meta: Meta,
  },
  'ProjectHistory',
)

export const RuleSet = t.struct(
  {
    id: t.String,
    name: t.String,
    description: t.String,
    team_id: t.String,
    created_at: t.String,
    rule_ids: t.list(t.String),
  },
  'RuleSet',
)

export const RuleSets = t.struct(
  {
    data: t.list(RuleSet),
  },
  'RuleSets',
)

export const Rule = t.struct(
  {
    id: t.String,
    name: t.String,
    description: t.String,
    category: t.String,
    results: t.maybe(t.Object),
    scan_type: t.String,
  },
  'Rule',
)

export const Rules = t.struct({ data: t.list(Rule) }, 'Rules')
