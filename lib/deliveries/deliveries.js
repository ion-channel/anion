import { Auth } from '../auth/auth'
import { Get, Post } from '../requests'
import * as Structs from './deliveries.structs'

export class Deliveries {
  static getDestinations({ teamId }) {
    const params = {
      id: teamId,
    }

    return Get(getDestinationsEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Destinations(data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static createDestination(body) {
    // required shape of body: team_id location region name type
    return Post(createDestinationEndpoint, null, Auth.appendHeaders(), body)
  }
}

const getDestinationsEndpoint = '/v1/teams/getDeliveryDestinations'
const createDestinationEndpoint = '/v1/teams/createDeliveryDestination'
