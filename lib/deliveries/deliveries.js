import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './deliveries.structs'

export class Deliveries {
  static getDestinations({ teamId }) {
    const params = {
      id: teamId,
    }

    return Get(getDestinationsEndpoint, params, Auth.appendHeaders())
      .then(resp => {
        Structs.Destinations(resp.data)
        return resp.data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const getDestinationsEndpoint = '/v1/teams/getDeliveryDestinations'
