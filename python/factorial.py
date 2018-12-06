
def fact(num):
    if num <= 1:
        return 1
    else:
        return num * fact(num-1)

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
    print(fact(var))    