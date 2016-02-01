#server.R
library(shiny)
library(UsingR)
data(galton)

mod<-lm(child~parent, data=galton)
shinyServer(
  function(input, output){
    go<-eventReactive(input$calculate,{
      momi<-input$momcm/2.54
      dadi<-input$dadcm/2.54
      mphi<-(momi*1.08+dadi)/2
      chld<-predict(mod,data.frame(parent=c(mphi)),interval="predict")
      chld<-chld*2.54
      paste('Child\'s height between',format(round(chld[2],2),nsmall=2),'and',format(round(chld[3],2),nsmall=2),'cm')
    })
    output$out<-renderText({
      go()
    })
  }
)
