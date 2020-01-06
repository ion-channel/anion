import t from 'tcomb'

import { Alias } from '../aliases/aliases.structs'
import { Analysis } from '../analyses/analyses.structs'
import { Project } from '../projects/projects.structs'
import { Tag } from '../tags/tags.structs'

const analysisReport = t.struct({
  project: Project,
  project_ruleset: t.Any,
  statuses: t.Any,
  digests: t.Any,
  ruleset_evaluation: t.Any,
})

export const AnalysisReport = t.struct(
  {
    analysis: Analysis,
    report: analysisReport,
  },
  'AnalysisReport',
)

export const ProjectReport = t.struct(
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
    deploy_key: t.maybe(t.String),
    should_monitor: t.Bool,
    poc_name: t.String,
    poc_email: t.String,
    username: t.maybe(t.String),
    password: t.maybe(t.String),
    key_fingerprint: t.String,
    private: t.Bool,
    aliases: t.list(Alias),
    tags: t.list(Tag),

    ruleset_name: t.maybe(t.String),
    analysis_summary: t.Any,
  },
  'ProjectReport',
)

export const ProjectsReport = t.struct(
  {
    data: t.list(ProjectReport),
  },
  'ProjectsReport',
)

export const Widget = t.struct(
  {
    title: t.String,
    data: t.maybe(t.Any),
    errored: t.maybe(t.Bool),
    errored_message: t.maybe(t.String),
  },
  'Widget',
)

export const PortfolioReport = t.struct(
  {
    project_summaries: t.list(Widget),
    project_status_summaries: t.list(Widget),
    vulnerability_summaries: t.list(t.Any),
  },
  'PortfolioReport',
)

export const VulnListItem = t.struct(
  {
    title: t.String,
    projects_affected: t.Number,
    product: t.String,
    rating: t.Number,
    system: t.String,
  },
  'VulnListItem',
)

export const VulnerabilityListReport = t.struct(
  {
    cve_list: t.list(VulnListItem),
  },
  'VulnerabilityListReport',
)

export const AffectedProject = t.struct(
  {
    id: t.String,
    name: t.String,
    version: t.String,
    vulnerabilities: t.Integer,
  },
  'AffectedProject',
)

export const AffectedProjects = t.struct(
  {
    data: t.list(AffectedProject),
  },
  'AffectedProjects',
)
