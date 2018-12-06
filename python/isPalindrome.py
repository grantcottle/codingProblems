
def isPalindrome(s):
    def toChar(s):
        s = s.lower()
        ans = ''
        for c in s:
            if c in 'abcdefghijklmnopqrstuvwxyz':
                ans = ans + c
        return ans

    def isPal(s):
        if len(s) <= 1:
            return True
        else:
            return s[0] == s[-1] and isPal(s[1:-1])
    
    return isPal(toChar(s))

if __name__ == "__main__":
    var = input('Enter a word or sentance: ')
    print('Checking if: {} is a palindrome'.format(var))
    print(isPalindrome(var))    