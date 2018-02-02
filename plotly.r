library(plotly)
library(quantmod)
#packageVersion('plotly')
Sys.setenv("plotly_username"="faye7766")
Sys.setenv("plotly_api_key"="8GpBkBOFFOwUrEzwqXIA")

# Download some data
getSymbols(Symbols = c("AAPL", "MSFT", "AMZN", "GOOG"))

ds <- data.frame(Date = index(AAPL), AAPL[,6], MSFT[,6], AMZN[,6], GOOG[,6])

p <- plot_ly(ds, x = ~Date) %>%
  add_lines(y = ~AAPL.Adjusted, name = "Apple") %>%
  add_lines(y = ~MSFT.Adjusted, name = "Microsoft") %>%
  add_lines(y = ~AMZN.Adjusted, name = "Amazon") %>%
  add_lines(y = ~GOOG.Adjusted, name = "Google") %>%
  layout(
    title = "Stock Prices",
    xaxis = list(
      rangeselector = list(
        buttons = list(
          list(
            count = 3,
            label = "3 mo",
            step = "month",
            stepmode = "backward"),
          list(
            count = 6,
            label = "6 mo",
            step = "month",
            stepmode = "backward"),
          list(
            count = 1,
            label = "1 yr",
            step = "year",
            stepmode = "backward"),
          list(
            count = 1,
            label = "YTD",
            step = "year",
            stepmode = "todate"),
          list(step = "all"))),
      
      rangeslider = list(type = "date")),
    
    yaxis = list(title = "Price"))

# Create a shareable link 
chart_link = plotly_POST(p, filename="rangeslider")
chart_link
api_create(p, filename = "stockprice")
