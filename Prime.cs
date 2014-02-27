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
            Euler10();
            //Console.WriteLine("5 is prime? {0}", isPrime(10));
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

        static bool isPrime(int x)
        {
            bool isPrime = false;
            if (x == 2) isPrime = true;
            if (x == 3) isPrime = true;

            for (int a = 2; a <= Math.Sqrt(x); a++)
            {
                if (x % a == 0) { 
                    isPrime = false;
                    break;
                }
                else isPrime = true;
            }

            return isPrime;
        }
    }
}
