import t from 'tcomb'

export const Token = t.struct(
  {
    jti: t.maybe(t.String),
    sub: t.maybe(t.String),
    iat: t.maybe(t.Integer),
    exp: t.maybe(t.Integer),
    name: t.maybe(t.String),
    cli: t.Bool,
  },
  'Token',
)

export const Tokens = t.struct(
  {
    data: t.list(Token),
  },
  'Tokens',
)
