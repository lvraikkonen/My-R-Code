library(ggmap)
library(XML)

# 从网页上抓取数据，并进行清理
webpage <-'http://data.earthquake.cn/datashare/globeEarthquake_csn.html'
tables <- readHTMLTable(webpage,stringsAsFactors = FALSE)
raw <- tables[[6]]
data <- raw[-1,c(1,3,4)]
names(data) <- c('date','lan','lon')
data$lan <- as.numeric(data$lan)
data$lon <- as.numeric(data$lon)
data$date <- as.Date(data$date,  "%Y-%m-%d")
# 用ggmap包从baidu读取地图数据，并将之前的数据标注在地图上。
map_China <- dubigmap(center=c(105.016076,35.850917),zoom=7,size = c(720,720))
ggmap(map_China) +
  geom_point(data = data, aes(x = lon,y = lan),colour='red') +
  stat_density2d(aes(x=lon,y=lan,fill=..level..,alpha=..level..),
                 size=2,bins=4,data=data,geom='polygon')