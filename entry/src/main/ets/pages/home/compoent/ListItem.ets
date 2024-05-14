import {ToDoData,Root,Root2} from "../../../mock/ListData"

@Component
 export  default  struct ToDoList {
  @State isComplete: boolean = false;
  private content?: string;
  build() {
    Flex({ justifyContent: FlexAlign.Start }) {
      Toggle({ type: ToggleType.Checkbox, isOn:this.isComplete  })
        .size({ width: 20, height: 20 }).margin({top:13,right:10})
        .selectedColor('#007DFF')
      Text(this.content).height(46).decoration({ type: this.isComplete
        ? TextDecorationType.LineThrough
        : TextDecorationType.None })
    }.backgroundColor('#cccc').width('100%').padding({left:10,right:10}).margin({top:10}).borderRadius(5)   .onClick(() => {
      console.log('this.isComplete--',this.isComplete)
      this.isComplete = !this.isComplete;
    })
  }
}