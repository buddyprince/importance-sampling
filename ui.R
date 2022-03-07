library(shiny)
library(shinydashboard)

shinyUI(dashboardPage(
  dashboardHeader(title = "Importance Sampling"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Bernoulli", tabName = "tab_1"),
      menuItem("Normal", tabName = "tab_2"),
      menuItem("Uniform", tabName = "tab_3")
    )
  ),
  
  dashboardBody(tabItems(
    tabItem(tabName = "tab_1",
            fluidRow(
              box(title = "Bernoulli", status = "primary", solidHeader = T, width = 6,
                  numericInput(inputId = "p",
                               label = "Probability of success:",
                               value = 0.5,
                               min = 0,
                               step = 0.1,
                               width = '50%'
                  )
              ),
              box(title = "Tail event", status = "primary", solidHeader = T, width = 6,
                  numericInput(inputId = "n_bernoulli",
                               label = "Number of R.V.:",
                               value = 100,
                               min = 1,
                               step = 1,
                               width = '50%'
                  ),
                  numericInput(inputId = "q_bernoulli",
                               label = "Quantity of tail events:",
                               value = 60,
                               min = 1,
                               step = 1,
                               width = '50%'
                  ),
                  numericInput(inputId = "iter_bernoulli",
                               label = "Simulation times:",
                               value = 100,
                               min = 1,
                               step = 100,
                               width = '50%'
                  ),
                  actionButton(inputId = "action_1",label = "Simulate")
              )
            ),
            
            fluidRow(
              box(title = "Result", status = "primary", solidHeader = T, width = 6,
                  textOutput(outputId = "text_1")
              ),
              box(title = "Iteration", status = "primary", solidHeader = T, width = 6,
                  dataTableOutput(outputId = "table_1")
              )
            )
    ),
    
    
    
    tabItem(tabName = "tab_2",
            fluidRow(
              box(title = "Normal", status = "primary", solidHeader = T, width = 6,
                  numericInput(inputId = "mean",
                               label = "Mean:",
                               value = 0,
                               step = 1,
                               width = '50%'
                  ),
                  numericInput(inputId = "var",
                               label = "Varience:",
                               value = 1,
                               min = 0,
                               step = 1,
                               width = '50%'
                  )
              ),
              box(title = "Tail event", status = "primary", solidHeader = T, width = 6,
                  numericInput(inputId = "n_normal",
                               label = "Number of R.V.:",
                               value = 100,
                               min = 1,
                               step = 1,
                               width = '50%'
                  ),
                  numericInput(inputId = "q_normal",
                               label = "Quantity of tail events:",
                               value = 60,
                               min = 1,
                               step = 1,
                               width = '50%'
                  ),
                  numericInput(inputId = "iter_normal",
                               label = "Simulation times:",
                               value = 500,
                               min = 1,
                               step = 100,
                               width = '50%'
                  ),
                  actionButton(inputId = "action_2",label = "Simulate")
              )
            ),
            
            fluidRow(
              box(title = "Result", status = "primary", solidHeader = T, width = 6,
                  
                  dataTableOutput(outputId = "table_2")
              ),
              box(title = "Iteration", status = "primary", solidHeader = T, width = 6,
                  textOutput(outputId = 'text_2'),
              )
            )
    ),
    
    tabItem(tabName = "tab_3",
            fluidRow(
              box(title = "Uniform(a,b)", status = "primary", solidHeader = T, width = 6,
                  numericInput(inputId = "a",
                               label = "a:",
                               value = 0,
                               step = 0,
                               width = '50%'
                  ),
                  numericInput(inputId = "b",
                               label = "b:",
                               value = 1,
                               step = 0,
                               width = '50%'
                  )
              ),
              
              box(title = "Tail event", status = "primary", solidHeader = T, width = 6,
                  numericInput(inputId = "n_uniform",
                               label = "Number of R.V.:",
                               value = 100,
                               min = 1,
                               step = 1,
                               width = '50%'
                  ),
                  numericInput(inputId = "q_uniform",
                               label = "Quantity of tail events:",
                               value = 60,
                               min = 1,
                               step = 1,
                               width = '50%'
                  ),
                  numericInput(inputId = "iter_uniform",
                               label = "Simulation times:",
                               value = 500,
                               min = 1,
                               step = 100,
                               width = '50%'
                  ),
                  actionButton(inputId = "action_3",label = "Simulate")
              )
            ),
            
            fluidRow(
              box(title = "Result", status = "primary", solidHeader = T, width = 6,
                  textOutput(outputId = "text_3")
              ),
              box(title = "Iteration", status = "primary", solidHeader = T, width = 6,
                  dataTableOutput(outputId = "table_3")
              )
            )
    )
    
  )
  
  
  ))
)
