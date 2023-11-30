// import axios from 'axios';
import axios, {AxiosResponse} from "@ohos/axios"

const instance = axios.create({
  timeout: 10000
})

// post请求头
instance.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
/**
 * @添加请求拦截器
 */
instance.interceptors.request.use((config) => {
  /**
   * @在发送请求之前处理
  * 1.添加时间戳防止走缓存数据
   */
  if (config.method === 'get') {
    // eslint-disable-next-line no-param-reassign
    config.params = {
      timestamp: new Date().getTime() / 1000,
      ...config.params
    };
  }
  return config;
}, (error) =>
/**
 * @对请求错误处理
 */
// eslint-disable-next-line implicit-arrow-linebreak
Promise.reject(error));

/**
 * @添加响应拦截器
 */
instance.interceptors.response.use((response) => {
  /**
   * @对响应数据处理
  * 1.研发部行情中心接口返回的特殊形式数据格式处理((json); => json)
   */
  // const { data } = response;
  // const regExp = /^\(.*\)\;$/g;
  // try {
  //   if (typeof data === 'string' && regExp.test(data)) {
  //     response.data = JSON.parse(data.replace(/^\(|\)\;$/g, ''));
  //   }
  // } catch (error) {
  //   console.log(error);
  // }
  return response;
}, (error) =>
/**
 * @对请求错误处理
 */
// eslint-disable-next-line implicit-arrow-linebreak
Promise.reject(error));


export default instance;
