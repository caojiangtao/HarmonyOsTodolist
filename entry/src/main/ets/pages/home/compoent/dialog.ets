@CustomDialog
export struct CustomDialogExample {
  controller: CustomDialogController
  @Link addTask:string
  @Link show:boolean
  @State title:string='Add Task'
  build() {
    Column() {
      Text(this.title)
      TextInput({ placeholder: 'input your task',text: this.addTask }).onChange((value: string) =>{
        this.addTask = value
      })
        .width(400)
        .height(40)
        .margin(20)
      Button('确定').width('50%').onClick(()=>{
        console.log('addTask--',this.addTask)
        this.show = true
      })
    }.padding(10)
  }
}
