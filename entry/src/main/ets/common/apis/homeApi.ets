import request from "../http";
import { wapi, nwapi } from './hosts'

interface Response<T> {
  info: T[];
  errorMsg: string;
  status: number;
}

export function homeNewsList() {
  return request.get(`${wapi}/jsonConfig/jsonInfo?name=vipTabConfig`)
}

export function homeChannelList<T>() {
  return request.get<T>(`${nwapi}/version/selectchannellist`)
}

export function homeRecommend<T>() {
  return request.get<T>(`${wapi}/headlines/recommend.cc`)
}