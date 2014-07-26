# !!! Does not work
# needs runDeck() 
# but don't know where to put the .csv
# putting it in /apps doesn't work

library(rCharts)

# investment allocation glide path by age
invest <- read.csv('invest_allocation_2.csv', header = T, stringsAsFactors = F)

output$investChart <- renderChart2({ #renderChart does not display properly
        if (input$chart_type == "pie chart"){
                n <- nPlot(x = "type", y = "percent", 
                           data = invest[invest$age==input$age,], 
                           type = "pieChart")
                n$chart(margin = list(left = 50))
                n$params$width = 400
                n$params$height = 400
        }
        if (input$chart_type == "stacked area chart"){
                n <- nPlot(percent ~ age, group = "type", data = invest,
                           type = "stackedAreaChart")
                n$chart(useInteractiveGuideline = TRUE)
                n$yAxis( axisLabel = "Percentage" )
                n$xAxis( axisLabel = "Age")
                n$chart(margin = list(left = 80))
                n$params$width = 500
                n$params$height = 400
        }
        return(n)
})