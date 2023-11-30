// import {AxiosResponse} from "@ohos/axios"
// import axios from "../utils/http";
// import NewsList from "./NewsList"
import { homeNewsList, homeChannelList } from "../../common/apis/homeApi"
import hilog from '@ohos.hilog';
import { AxiosResponse } from '@ohos/axios';

class NewsTypeBean {
  id: number = 0;
  name: ResourceStr = '';
}

interface Tab {
  title: string;
  channelId: number;
  abcid: number;
}

interface Response<T> {
  info: T[];
  errorMsg: string;
  status: number;
}

@Component
export default struct HomeTab {
  @State currentIndex: number = 1;
  @State currentPage: number = 1;
  @State tabList: Tab[] = [];
  @State resstr: string = ''

  async aboutToAppear(){
    const res: AxiosResponse<any> = await homeChannelList();
    this.tabList = res.data.info.subscribelist;
  }

  getTabList(arr, targetId): Tab[] {
    var resultArr = null
    for (var i = 0; i < arr.length; i ++) {
      if (arr[i].id === targetId) {
        resultArr = arr[i]
      }
    }

    return resultArr.subTabs
  }

  @Builder TabBuilder(index: number) {
    Column() {
      Text(this.tabList[index].title)
        .height(38)
        .padding({ left: 12, right: 12 })
        .fontSize(this.currentIndex === index ? 16 : 14)
        .fontWeight(this.currentIndex === index ? 700 : 500)
        .fontColor(this.currentIndex === index ? "#333" : "#999")
        .backgroundColor('#efefef')
      Divider()
        .strokeWidth(2)
        .width(20)
        .color('#000')
        .opacity(this.currentIndex === index ? 1 : 0)
        .offset({ y: -2 })
    }
  }

  build() {
    Tabs() {
      // TabContent() {
      //   Text(this.resstr)
      //     .width("100%")
      //     .height(80)
      //     .fontSize(14)
      //     .fontColor("#000")
      //   // NewsList({ currentIndex: $currentIndex, newsid: tabsItem.id, newsidx: idx})
      // }
      ForEach(this.tabList, (tabsItem, idx) => {
        TabContent() {
          Text("this.tabList.length.toString()")
            .width("100%")
            .height(80)
            .fontSize(14)
            .fontColor("#000")
          // NewsList({ currentIndex: $currentIndex, newsid: tabsItem.id, newsidx: idx})
        }
        .tabBar(this.TabBuilder(idx))
      }, (tabsItem) => JSON.stringify(tabsItem.id));
    }
    .barHeight(40)
    .barMode(BarMode.Scrollable)
    .onChange((index: number) => {
      this.currentIndex = index;
      this.currentPage = 1;
    })
    .vertical(false)
    // .margin({ top: 10 })
  }
}
