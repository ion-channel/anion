import { Auth } from '../auth/auth'
import { Get, Delete, Post } from '../requests'
import * as Structs from './tokens.structs'

export class Tokens {
  static createToken({ name, cli = true }) {
    const params = {
      name,
      cli,
    }

    return Post(
      tokensCreateTokenEndpoint,
      params,
      Auth.appendHeaders(),
      undefined,
    )
      .then(({ data }) => data)
      .catch(error => {
        throw error
      })
  }

  static getTokens({ cli = false }) {
    const params = {
      cli,
    }

    return Get(tokensGetTokensEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Tokens(data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static deleteToken({ id }) {
    const params = {
      id,
    }

    return Delete(
      tokensDeleteTokenEndpoint,
      params,
      Auth.appendHeaders(),
      undefined,
    )
      .then(({ data }) => data)
      .catch(error => {
        throw error
      })
  }
}

const tokensGetTokensEndpoint = '/v1/tokens/getTokens'
const tokensDeleteTokenEndpoint = '/v1/tokens/deleteToken'
const tokensCreateTokenEndpoint = '/v1/tokens/createToken'
