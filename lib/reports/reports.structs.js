import t from 'tcomb'

export const ScanStatus = t.struct({
  id: t.String,
  team_id: t.String,
  project_id: t.String,
  analysis_status_id: t.String,
  message: t.String,
  name: t.String,
  read: t.maybe(t.String),
  status: t.String,
  created_at: t.String,
  updated_at: t.String,
}, 'ScanStatus')

export const Delivery = t.struct({
  id: t.String,
  team_id: t.String,
  project_id: t.String,
  analysis_id: t.String,
  destination: t.String,
  status: t.String,
  filename: t.String,
  created_at: t.String,
  updated_at: t.String,
}, 'Delivery')

export const AnalysisStatus = t.struct({
  id: t.String,
  team_id: t.String,
  project_id: t.String,
  message: t.String,
  branch: t.String,
  status: t.String,
  created_at: t.String,
  updated_at: t.String,
  scan_status: t.list(ScanStatus),
  deliveries: t.list(Delivery),
}, 'AnalysisStatus')

export const Navigation = t.struct({
  analysis: t.Type(AnalysisStatus),
  latest_analysis: t.Type(AnalysisStatus),
}, 'Navigation')
