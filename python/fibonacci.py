
def fib(num):
    if num == 0 or num == 1:
        return 1
    else:
        return fib(num-1) + fib(num-2)
    
def fib_efficient(n, d={1:1,2:2}):
    if n in d:
        return d[n]
    else:
        ans = fib_efficient(n-1, d) + fib_efficient(n-2, d)
        d[n] = ans
        return ans
    

def inputNumber(message):
  while True:
    try:
       userInput = int(input(message))       
    except ValueError:
       print("Not an integer! Try again.")
       continue
    else:
       return userInput 
       break 

if __name__ == "__main__":
    var = inputNumber('Enter a number: ')
    print('Calculating your number: {}'.format(var))

    print(fib_efficient(var))    