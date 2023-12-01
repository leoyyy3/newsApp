import { homeRecommend } from '../../common/apis/homeApi';
import { AxiosResponse } from '@ohos/axios';
import { RecommendItem, RecommendHeadItem } from '../../viewmodel/HomeElementItem';

// @Entry
@Component
export default struct RecommentNews {
  @State message: string = 'RecommentNews';
  @State recommendList: Array<RecommendItem | RecommendHeadItem> = [];

  aboutToAppear(){
    console.log("reocmmend_list-----------------------")
    homeRecommend().then((res: AxiosResponse<any>) => {
      this.message = JSON.stringify(res.data.datas.news);
      this.recommendList = res.data.datas.news;
    })
  }

  @Builder NormalNews(item) {
    Column(){
      Text(item.title)
        .fontSize(16)
        .fontColor("#333")
        .width("100%")
        .lineHeight(24)
      Row(){
        if(item.isTopNews === 1){
          Text("置顶")
            .fontColor("#f95355")
            .fontSize(12)
              // .width(150)
            .lineHeight(20)
            .margin({
              right: 8
            })
        }
        Text(item.media)
          .fontSize(12)
          .fontColor("#999")
          .lineHeight(20)

      }
      .justifyContent(FlexAlign.Start)
      .align(Alignment.Start)
      .width("100%")

      Divider().strokeWidth(1).color("#efefef").margin({
        top: 8,
      })
    }
  }

  @Builder TuoshuiNews(item) {

  }


  build() {

    List(){
      ForEach(this.recommendList, (item) => {
        ListItem(){
          if(item.title){
            this.NormalNews(item)
          }
          if(item.lineType && item.lineType === '1082'){
            this.TuoshuiNews(item)
          }

        }
        .margin({
          bottom: 8
        })

      })
    }
    .height('100%')
    .padding(10)
  }
}

