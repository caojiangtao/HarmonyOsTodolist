import ToDoList from  './compoent/ListItem'
import {ToDoData,Root,Root2} from "../../mock/ListData"
import {CustomDialogExample} from "./compoent/dialog"
@Entry
@Component

struct Index {
  @State message: string = 'toDoList'
  @State addTask:string=''
  @State @Watch('update') show:boolean = false
  @State list:Root=ToDoData
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({addTask:$addTask,show:$show}),
    autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: 0 },
    gridCount: 4,
    customStyle: false
  })

  @Builder itemEnd(index:number) {
    Row () {
      Button("Del").margin("4vp").onClick(()=>{
        console.log('event----',index)
        this.list.splice(index,1)
      })
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }
  // @Watch 回调
  update() {
    console.log('onCountUpdated---',this.show)
    console.log('监听到obj的变化')
    if(this.show && this.addTask) {
      this.list.push({ name: this.addTask });
      this.dialogController.close()
      this.show= false
    } else {
      this.dialogController.close()
      this.show= false
    }
  }
  // 在自定义组件即将析构销毁时将dialogControlle删除和置空
  aboutToDisappear() {
    delete this.dialogController, // 删除dialogController
    this.dialogController = undefined // 将dialogController置空
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }


  build() {
      Column() {
          Text(this.message)
            .fontSize(20).height(40)
          List() {
            ForEach(this.list as Root, (item: Root2,index) => {
              ListItem(){
                ToDoList({ content: item.name })
              }.swipeAction({ end:this.itemEnd(index)})
            })
          }
          Text('+').backgroundColor('#ccc').height(45).width('100%').borderRadius(5).margin({top:16,bottom:16})
            .textAlign(TextAlign.Center).fontSize(30).onClick(()=>{
            if (this.dialogController != undefined) {
              this.dialogController.open()
            }
          })
      }.margin(16)
    }
}