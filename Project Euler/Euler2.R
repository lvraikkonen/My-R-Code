i <- 2
x <- c(1,2)

while(x[i] < 4e6 ) {
  x[i+1] = x[i-1] + x[i]
  i <- i + 1
}
# remove last item largeer than 4million
x <- x[-i]
sum(x[x %% 2 == 0])
