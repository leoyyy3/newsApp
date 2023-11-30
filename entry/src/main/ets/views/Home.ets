import HomeTab from "./components/HomeTab"

// @Entry
@Component
export default struct Home {
  @State message: string = 'Login'

  build() {
    Column() {
      Row({ space: 10 }) {
        Image('https://logotool.hexun.com/1ef22ea-96.jpg')
          .width(40)
          .height(40)
          .borderRadius(20)

        Stack() {
          TextInput()
            .height(40)
            .width("100%")
            .padding({ left: 40 })

          Image($r('app.media.search'))
            .width(30)
            .height(30)
            .borderRadius(20)
            .fillColor("#999")
            .margin({ left: 8 })
        }
        .alignContent(Alignment.Start)
        .layoutWeight(1)

        Image($r('app.media.message'))
          .width(38)
          .height(38)
          .fillColor("#999")
          .borderRadius(20)
      }.width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(12)
      HomeTab()
    }
  }
}