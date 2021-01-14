import t from 'tcomb'

export const Delivery = t.struct(
  {
    id: t.String,
    team_id: t.String,
    project_id: t.String,
    analysis_id: t.String,
    destination: t.String,
    status: t.String,
    filename: t.String,
    hash: t.String,
    message: t.String,
    created_at: t.String,
    updated_at: t.String,
    delivered_at: t.String,
  },
  'Delivery',
)

export const ScanStatus = t.struct(
  {
    id: t.String,
    analysis_status_id: t.String,
    project_id: t.String,
    team_id: t.String,
    message: t.String,
    name: t.String,
    read: t.String,
    status: t.String,
    created_at: t.String,
    updated_at: t.String,
  },
  'ScanStatus',
)

export const AnalysisStatus = t.struct(
  {
    analysis_event_src: t.String,
    branch: t.String,
    created_at: t.String,
    deliveries: t.dict(t.String, Delivery),
    id: t.String,
    message: t.String,
    project_id: t.String,
    scan_status: t.list(ScanStatus),
    status: t.String,
    team_id: t.String,
    unreachable_error: t.Boolean,
    updated_at: t.String,
  },
  'AnalysisStatus',
)
