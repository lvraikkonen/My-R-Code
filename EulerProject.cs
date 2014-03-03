using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EulerProject
{
    class Program
    {
        static void Main(string[] args)
        {
            //Euler7();
            //Euler10();
            //Console.WriteLine("5 is prime? {0}", isPrime(10));

            //List<int> lst;
            //lst = primeFactors(600851475143);//600851475143);
            //Int64 last = lst.Last();
            //Console.WriteLine("The largest prime factor of the number 600851475143 is {0}", last);

            //Console.WriteLine("50! equals {0}", factorial(50));
            //int[] bigFact = new int[40001];
            //bigFact = bigFactorial(10);
            //string all = factorial(100).ToString();

            List<int> result = bigFactorial(100);
            int sum = 0;
            foreach (int i in result)
            {
                sum += i;
            }
            Console.WriteLine("result sum is {0}", sum);
        }

        static int Euler7()
        {
            List<int> primes = new List<int>();

            for (int x = 2; ; x++)
            {
                if (isPrime(x))
                {
                    primes.Add(x);
                    if (primes.Count == 10001)
                        break;
                }
                else
                    continue;
            }


            Console.WriteLine("The 10001th prime is {0}", primes.Last());

            return primes.Last();
        }

        static Int64 Euler10()
        {
            Int64 sum = 2;
            Int32 i = 3;
            while (i <= 2000000)
            {
                if (isPrime(i))
                {
                    sum += i;
                }
                i += 2;
            }

            Console.WriteLine("The sum of the primes below 2 million is {0}", sum);

            return sum;
        }

        static bool isPrime(Int64 x)
        {
            bool isPrime = false;
            if (x == 2) isPrime = true;
            if (x == 3) isPrime = true;

            for (int a = 2; a <= Math.Sqrt(x); a++)
            {
                if (x % a == 0)
                {
                    isPrime = false;
                    break;
                }
                else isPrime = true;
            }

            return isPrime;
        }

        //static List<int> primeFactors(Int64 x)
        //{
        //    List<int> factors = new List<int>();

        //    for (int i = 2; i <= x / 2; i++)
        //    {
        //        if (isPrime(x))
        //            break;
        //        if(x%i==0)//is factor
        //        {
        //            if (isPrime(i))
        //                factors.Add(i);
        //        }
        //    }

        //    return factors;
        //}

        //improved one
        static List<int> primeFactors(Int64 x)
        {
            List<int> factors = new List<int>();
            if (x == 2 || x == 3)
            {
                factors.Add(int.Parse(x.ToString()));
                return factors;
            }

            for (int i = 2; i <= Math.Sqrt(x); i = i + 1)
            {

                if (isPrime(x))//prime number has no factors
                {
                    factors.Add(int.Parse(x.ToString()));
                    break;
                }
                if (x % i == 0)//is factor
                {
                    x = x / i;
                    if (isPrime(i))
                        factors.Add(i);
                    if (isPrime(x))
                    {
                        factors.Add(int.Parse(x.ToString()));
                    }
                }
            }

            return factors;
        }

        //factorial small
        static Int64 factorial(int n)
        {
            if (n == 1)
                return 1;
            else
                return n * factorial(n - 1);
        }

        //big number factorical
        static List<int> bigFactorial(int n)
        {
            int i,j,m,temp,carry;
            int[] result;
            result = new int[40000];

            result[0] = 1;
            m = 0;
            for (i = 2; i <= n; i++ )
            {
                carry = 0;
                for(j=0;j<=m;j++)
                {
                    temp = result[j] * i + carry;
                    result[j] = temp % 10;
                    carry = temp / 10;
                }
                while(carry>0)
                {
                    m++;
                    result[m] = carry % 10;
                    carry = carry / 10;
                }
            }

            List<int> resultList = new List<int>();
            for (i = 0; i <= m; i++ )
            {
                resultList.Add(result[i]);
            }

            return resultList;
        }
    }
}
