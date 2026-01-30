class Solution:
    def isPalindrome(self, x: int) -> bool:
        xs = str(x)
        reversed_xs = xs[::-1]
        if '-' in xs or xs != reversed_xs:
            return False
        else:
            return True
