import { CommonConstant as Const } from '../common/CommonConstant';
import Home from "../views/Home";
import Quote from "../views/Quote";
import Mine from "../views/Mine";
import { BottomTabsList } from "../viewmodel/BottomTabsModel";

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State @Watch('onIndexChange') bottomTabIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder TabBuilder(index: number) {
    Column() {
      Image(BottomTabsList[index].icon)
        .width(36)
        .height(36)
        .fillColor(this.bottomTabIndex === index ?
        $r('app.color.bottom_tabs_font_color_selected') : $r('app.color.bottom_tabs_font_color'))
        .objectFit(ImageFit.Contain)

      Text(BottomTabsList[index].text)
        .fontSize($r('app.float.bottom_font_size'))
        .opacity(Const.OPACITY)
        .fontColor(this.bottomTabIndex === index ?
        $r('app.color.bottom_tabs_font_color_selected') : $r('app.color.bottom_tabs_font_color'))
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .border({ width: { top: Const.BORDER_WIDTH }, color: $r('app.color.color_border') })
    .backgroundColor($r('app.color.bottom_tabs_background_color'))
  }

  onIndexChange() {
    this.controller.changeIndex(this.bottomTabIndex);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
      Tabs({ barPosition: BarPosition.End, index: 0, controller: this.controller }) {
        TabContent() {
          Home()
        }.tabBar(this.TabBuilder(0))

        TabContent() {
          Quote()
        }.tabBar(this.TabBuilder(1))

        TabContent() {
          Mine()
        }.tabBar(this.TabBuilder(2))
      }
      .width(Const.FULL_PERCENT)
      .height(Const.FULL_PERCENT)
      .vertical(false)
      .scrollable(false)
      .barHeight(Const.BAR_HEIGHT)
      .onChange((index: number) => {
        this.bottomTabIndex = index;
      })
    }
    .width(Const.FULL_PERCENT)
  }
}