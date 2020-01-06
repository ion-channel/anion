import { Auth } from '../auth/auth'
import { Get, Delete } from '../requests'
import * as Structs from './tokens.structs'

export class Tokens {
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
      tokensDeleteTokensEndpoint,
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
const tokensDeleteTokensEndpoint = '/v1/tokens/deleteToken'
