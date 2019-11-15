import t from 'tcomb'

import { Analysis } from '../analyses/analyses.structs'
import { Project } from '../projects/projects.structs'

const analysisReport = t.struct({
  project: Project,
  project_ruleset: t.Any,
  statuses: t.Any,
  digests: t.Any,
  ruleset_evaluation: t.Any,
})

export const AnalysisReport = t.struct({
  analysis: Analysis,
  report: analysisReport,
}, 'AnalysisReport')
