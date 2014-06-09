#isPrime function
if.prime <- function(n)
{
  if(n <= 1) return (FALSE)
  if(n == 2) return (TRUE)
  for(i in 2:sqrt(n) )
  {
    if(n %% i == 0) return (FALSE)
    else return (TRUE)
  }
}

if.prime(4)
if.prime(5)
