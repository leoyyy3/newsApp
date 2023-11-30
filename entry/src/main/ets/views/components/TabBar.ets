// import {AxiosResponse} from "@ohos/axios"
// import axios from "../utils/http";
// import NewsList from "./NewsList"
import { homeNewsList } from "../../common/apis/homeApi"

class NewsTypeBean {
  id: number = 0;
  name: ResourceStr = '';
}

interface Tab {
  name: string;
  id: number;
  version: number;
}

interface Response<T> {
  datas: T[];
  errorMsg: string;
  status: number;
}

@Component
export default struct TabBar {
  @State currentIndex: number = 0;
  @State currentPage: number = 1;
  @State tabList: Tab[] = [];
  @State tabBarArray: Array<NewsTypeBean> = [
    {
      name: "724",
      id: 0
    }, {
    name: "视频",
    id: 1
  }, {
    name: "视频",
    id: 2
  }, {
    name: "视频",
    id: 3
  }, {
    name: "视频",
    id: 4
  }, {
    name: "视频",
    id: 5
  }, {
    name: "视频",
    id: 6
  }, {
    name: "视频",
    id: 7
  }
  ];

  async aboutToAppear(){
    console.log('apper------')
    const res = await homeNewsList();
    this.tabList = this.getTabList(res.data.datas.tabs, 100);
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
      Text(this.tabList[index].name)
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
      ForEach(this.tabList, (tabsItem, idx) => {
        TabContent() {
          Text("content")
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
