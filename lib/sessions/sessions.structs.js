import t from 'tcomb'

export const Session = t.struct({
  jwt: t.String,
}, 'Session')
