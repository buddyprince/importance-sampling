library(shiny)

shinyServer(function(input, output) {
  IS_bernoulli = eventReactive(input$action_1,{
    withProgress(message = 'Simulating...', value = 0, style = "old",{
      importance_simulation_bernoulli(
        n = input$n_bernoulli,
        threshold = input$q_bernoulli,
        p = input$p,
        iteration = input$iter_bernoulli
      )
    })
  })
  output$text_1 = renderPrint({cat(IS_bernoulli()[[1]])})
  output$table_1 = renderDataTable(
    data.frame(
      times = 1:input$iter_bernoulli,
      estimator = IS_bernoulli()[[2]]
    ),
    options = list(scrollX = T, pageLength = 10)
  )
  
  
  IS_normal = eventReactive(input$action_2,{
    withProgress(message = 'Simulating...', value = 0, style = "old",{
      importance_simulation_normal(
        n = input$n_normal,
        threshold = input$q_normal,
        mean = input$mean,
        var = input$var,
        iteration = input$iter_normal
      )
    })
  })
  output$text_2 = renderPrint({cat("Final Result:",IS_normal()[[1]])})
  output$table_2 = renderDataTable(
    data.frame(
      times = 1:input$iter_normal,
      estimator = IS_normal()[[2]]
    ),
    options = list(scrollX = T, pageLength = 10)
  )
  
  IS_uniform = eventReactive(input$action_3,{
    withProgress(message = 'Simulating...', value = 0, style = "old",{
      importance_simulation_uniform(
        n = input$n_uniform,
        threshold = input$q_uniform,
        a = input$a,
        b = input$b,
        iteration = input$iter_uniform
      )
    })
  })
  output$text_3 = renderPrint({cat(IS_uniform()[[1]])})
  output$table_3 = renderDataTable(
    data.frame(
      times = 1:input$iter_uniform,
      estimator = IS_uniform()[[2]]
    ),
    options = list(scrollX = T, pageLength = 10)
  )
    
})
