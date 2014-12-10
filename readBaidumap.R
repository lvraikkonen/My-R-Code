library(ggmap)
library(RgoogleMaps)
library(png)

#map_Beijing<-dubigmap()
#ggmap(map_Beijing)

##zoom=13 : Beijing

map_China <- dubigmap(center=c(105.016076,35.850917),zoom=6)
ggmap(map_China)


#下载并拼接百度地图
dubigmap <- function(center=c(116.395645,39.929986),zoom=13,size = c(640,640),lgsize=2){
  des<-c(2.3313056/2^zoom * size[1], 1.86832416/2^zoom * size[2])
  map<-vector("list",(lgsize*2-1)^2)
  #map<-getdumap(center=c(116.403874,39.914888),zoom,size)
  for(i in 1:(lgsize*2-1)){
    for(j in 1:(lgsize*2-1)){
      maptmp <- getdumap(center+c(des[1],des[2])*c(i-lgsize,j-lgsize),zoom,size)
      if(j==1){
        if(i==1){
          xmin <- attr(maptmp, "bb")$ll.lon
          ymin <- attr(maptmp, "bb")$ll.lat
        }
        maplat<-maptmp
      }else{
        maplat<-cbind(maptmp,maplat)
      }
    }
    if(i==1){
      map<-maplat
    }else{
      map<-rbind(map,maplat)
    }
  }
  xmax <- attr(maptmp, "bb")$ur.lon
  ymax <- attr(maptmp, "bb")$ur.lat
  class(map) <- c("ggmap", "raster")
  attr(map, "bb") <- data.frame(ll.lat = ymin, ll.lon = xmin,ur.lat = ymax, ur.lon = xmax)
  map
  #map2<-getdumap(center=c(116.403874,39.914888)+c(des[1],0),zoom,size)
}

#读取百度地图函数
getdumap <- function (center = c(lon = -95.3632715, lat = 29.7632836), 
                    zoom = 13, 
                    size = c(640,640), 
                    scale = 2, 
                    format = c("png8", "gif", "jpg", "jpg-baseline", "png32"), 
                    maptype = c("terrain","satellite", "roadmap", "hybrid"),
                    language = "en-EN", region, markers, path, visible, style, 
                    sensor = FALSE, messaging = FALSE, 
                    urlonly = FALSE, filename = "ggmapTemp", 
                    color = c("color", "bw"), ...) 
{
  #读取字符串
  args <- as.list(match.call(expand.dots = TRUE)[-1])
  argsgiven <- names(args)
  #中心判别
  if ("center" %in% argsgiven) {
    if (!((is.numeric(center) && length(center) == 2) || 
            (is.character(center) && length(center) == 1))) {
      stop("center of map misspecified, see ?get_googlemap.", 
           call. = F)
    }
    if (all(is.numeric(center))) {
      lon <- center[1]
      lat <- center[2]
      if (lon < -180 || lon > 180) {
        stop("longitude of center must be between -180 and 180 degrees.", 
             " note ggmap uses lon/lat, not lat/lon.", call. = F)
      }
      if (lat < -90 || lat > 90) {
        stop("latitude of center must be between -90 and 90 degrees.", 
             " note ggmap uses lon/lat, not lat/lon.", call. = F)
      }
    }
  }
  #放大倍数判别
  if ("zoom" %in% argsgiven) {
    if (!(is.numeric(zoom) && zoom == round(zoom) && zoom > 
            0)) {
      stop("zoom must be a whole number between 1 and 21", 
           call. = F)
    }
  }
  #图片尺寸
  if ("size" %in% argsgiven) {
    stopifnot(all(is.numeric(size)) && all(size == round(size)) && 
                all(size > 0))
  }
  #图片精细度
  if ("scale" %in% argsgiven) {
    stopifnot(scale %in% c(1, 2, 4))
  }
  #标注
  if ("markers" %in% argsgiven) {
    markers_stop <- TRUE
    if (is.data.frame(markers) && all(apply(markers[, 1:2], 
                                            2, is.numeric))) 
      markers_stop <- FALSE
    if (class(markers) == "list" && all(sapply(markers, function(elem) {
      is.data.frame(elem) && all(apply(elem[, 1:2], 2, 
                                       is.numeric))
    }))) 
      markers_stop <- FALSE
    if (is.character(markers) && length(markers) == 1) 
      markers_stop <- FALSE
    if (markers_stop) 
      stop("improper marker specification, see ?get_googlemap.", 
           call. = F)
  }
  #折现标注
  if ("path" %in% argsgiven) {
    path_stop <- TRUE
    if (is.data.frame(path) && all(apply(path[, 1:2], 2, 
                                         is.numeric))) 
      path_stop <- FALSE
    if (class(path) == "list" && all(sapply(path, function(elem) {
      is.data.frame(elem) && all(apply(elem[, 1:2], 2, 
                                       is.numeric))
    }))) 
      path_stop <- FALSE
    if (is.character(path) && length(path) == 1) 
      path_stop <- FALSE
    if (path_stop) 
      stop("improper path specification, see ?get_googlemap.", 
           call. = F)
  }
  #出现此标识推出
  if ("visible" %in% argsgiven) {
    message("visible argument untested.")
    visible_stop <- TRUE
    if (is.data.frame(visible) && all(apply(visible[, 1:2], 
                                            2, is.numeric))) 
      visible_stop <- FALSE
    if (is.character(visible)) 
      visible_stop <- FALSE
    if (visible_stop) 
      stop("improper visible specification, see ?get_googlemap.", 
           call. = F)
  }
  #地图类型
  if ("style" %in% argsgiven) {
    message("style argument untested.")
    style_stop <- TRUE
    if (is.character(style) && length(style) == 1) 
      style_stop <- FALSE
    if (style_stop) 
      stop("improper style specification, see ?get_googlemap.", 
           call. = F)
  }
  if ("sensor" %in% argsgiven) 
    stopifnot(is.logical(sensor))
  if ("messaging" %in% argsgiven) 
    stopifnot(is.logical(messaging))
  if ("urlonly" %in% argsgiven) 
    stopifnot(is.logical(urlonly))
  if ("filename" %in% argsgiven) {
    filename_stop <- TRUE
    if (is.character(filename) && length(filename) == 1) 
      filename_stop <- FALSE
    if (filename_stop) 
      stop("improper filename specification, see ?get_googlemap.", 
           call. = F)
  }
  if ("checkargs" %in% argsgiven) {
    .Deprecated(msg = "checkargs argument deprecated, args are always checked after v2.1.")
  }
  format <- match.arg(format)
  if (format != "png8") 
    stop("currently only the png format is supported.", call. = F)
  maptype <- match.arg(maptype)
  color <- match.arg(color)
  if (!missing(markers) && class(markers) == "list") 
    markers <- plyr:::list_to_dataframe(markers)
  if (!missing(path) && is.data.frame(path)) 
    path <- list(path)
  #修改1：开始连接变量
  base_url <- "http://api.map.baidu.com/staticimage?"
  center_url <- if (all(is.numeric(center))) {
    center <- round(center, digits = 6)
    lon <- center[1]
    lat <- center[2]
    #修改4
    paste("center=", paste(lon , lat, sep = ","), sep = "")
  }
  else {
    centerPlus <- gsub(" ", "+", center)
    paste("center=", centerPlus, sep = "")
  }
  zoom_url <- paste("zoom=", zoom, sep = "")
  #修改2,
  #修改为百度长短格式，高度增加20%,用来删除百度标签
  size_url <- paste(paste("height=",size[2]*1.2,sep=""),paste("width=",size[1],sep=""),sep="&")
  scale_url <- if (!missing(scale)) {
    paste("scale=", scale)
  }
  else {
    ""
  }
  format_url <- if (!missing(format) && format != "png8") {
    paste("format=", format)
  }
  else {
    ""
  }
  maptype_url <- paste("maptype=", maptype, sep = "")
  language_url <- if (!missing(language)) {
    paste("language=", language)
  }
  else {
    ""
  }
  region_url <- if (!missing(region)) {
    paste("region=", region)
  }
  else {
    ""
  }
  markers_url <- if (!missing(markers)) {
    if (is.data.frame(markers)) {
      paste("markers=", paste(apply(markers, 1, function(v) paste(rev(round(v,6)), collapse = ",")), collapse = "|"), sep = "")
    }
    else {
      paste("markers=", markers, sep = "")
    }
  }
  else {
    ""
  }
  path_url <- if (!missing(path)) {
    if (is.list(path)) {
      ps <- sapply(path, function(one_path) {
        paste("path=", paste(apply(one_path, 1, function(v) paste(rev(round(v,6)), collapse = ",")), collapse = "|"), sep = "")
      })
      paste(ps, collapse = "&")
    }
    else {
      paste("path=", path, sep = "")
    }
  }
  else {
    ""
  }
  visible_url <- if (!missing(visible)) {
    if (is.data.frame(visible)) {
      paste("visible=", paste(apply(visible, 1, function(v) paste(rev(round(v,6)), collapse = ",")), collapse = "|"), sep = "")
    }
    else {
      paste("visible=", paste(visible, collapse = "|"), 
            sep = "")
    }
  }
  else {
    ""
  }
  style_url <- if (!missing(style)) {
    paste("style=", style)
  }
  else {
    ""
  }
  sensor_url <- paste("sensor=", tolower(as.character(sensor)), 
                      sep = "")
  #修改3
  #post_url <- paste(center_url, zoom_url, size_url,sep = "&")
  
  post_url <- paste(center_url, zoom_url, size_url, scale_url, 
                    format_url, language_url, region_url, markers_url, 
                    path_url, visible_url, style_url, sep = "&")
  url <- paste(base_url, post_url, sep = "")
  url <- gsub("[&]+", "&", url)
  if (substr(url, nchar(url), nchar(url)) == "&") {
    url <- substr(url, 1, nchar(url) - 1)
  }
  url <- URLencode(url)
  if (urlonly) 
    return(url)
  if (nchar(url) > 2048) 
    stop("max url length is 2048 characters.", call. = FALSE)
  destfile <- if (format %in% c("png8", "png32")) {
    paste(filename, "png", sep = ".")
  }
  else if (format %in% c("jpg", "jpg-baseline")) {
    paste(filename, "jpg", sep = ".")
  }
  else {
    paste(filename, "gif", sep = ".")
  }
  download.file(url, destfile = destfile, quiet = !messaging, 
                mode = "wb")
  message(paste0("Map from URL : ", url))
  message("Google Maps API Terms of Service : http://developers.google.com/maps/terms")
  map <- readPNG(destfile)
  #取出来的图切除上下各10%
  #map<-map[,(0.1*size[1]):size[1]]
  map<-map[(0.1*size[2]+1):(size[2]*1.1),,]
  if (color == "color") {
    map <- apply(map, 2, rgb)
  }
  else if (color == "bw") {
    mapd <- dim(map)
    map <- gray(0.3 * map[, , 1] + 0.59 * map[, , 2] + 0.11 * 
                  map[, , 3])
    dim(map) <- mapd[1:2]
  }
  class(map) <- c("ggmap", "raster")
  if (is.character(center)) 
    center <- as.numeric(geocode(center))
  #修改六，发现谷妹度嫂的坐标变换关系不一致
  #ll <- center-c(2.3313056/2^zoom * size[2]/2,1.86832416/2^zoom * size[1]/2)
  #ur <- center+c(2.3313056/2^zoom * size[2]/2,1.86832416/2^zoom * size[1]/2)
  ll <- XY2LatLon(list(lat = center[2],lon = center[1] , zoom = zoom), 
                  #注意以下需要先long后lat
                  -size[1]*5.05/6, -size[2]*5.05/6)
  ur <- XY2LatLon(list(lat = center[2],lon = center[1], zoom = zoom), 
                  size[1]*5/6, size[2]*5.07/6)
  attr(map, "bb") <- data.frame(ll.lat = ll[1], ll.lon = ll[2], 
                                ur.lat = ur[1], ur.lon = ur[2])
  #修改七
  map<-t(map)
  dim(map)<-c(size[2],size[1])
  map
}