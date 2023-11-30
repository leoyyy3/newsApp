import router from '@ohos.router'
@Entry
@Component
export default struct Open {
  @State translate_Y_text1: number = -200
  @State translate_Y_text2: number = 200

  // aboutToAppear() {
  //   setTimeout(() => {
  //     this.translate_Y = 0;
  //   }, 10)
  //
  //   const timer = setTimeout(() => {
  //     router.pushUrl({
  //       url: "pages/Index"
  //     })
  //     clearTimeout(timer);
  //   }, 4000, [])
  // }

  build() {
    Row() {
      Column() {
        Text($r('app.string.open_text1'))
          .fontSize(50)
          .fontColor(Color.Orange)
          .fontWeight(FontWeight.Bold)
          .translate({
            y: this.translate_Y_text1
          })
          .animation({
            delay: 500,
            duration: 2000,
            curve: Curve.FastOutSlowIn,
            tempo: 1
          })
          .onAppear(() => {
            this.translate_Y_text1 = 0;
            const timer = setTimeout(() => {
              router.pushUrl({
                url: "pages/Index"
              })
              clearTimeout(timer);
            }, 4000, [])
          })

        Text($r('app.string.open_text2'))
          .fontSize(50)
          .fontColor("#999")
          .fontWeight(FontWeight.Bold)
          .translate({
            y: this.translate_Y_text2
          })
          .animation({
            delay: 500,
            duration: 2000,
            curve: Curve.FastOutSlowIn,
            tempo: 1
          })
          .onAppear(() => {
            this.translate_Y_text2 = 0;

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}