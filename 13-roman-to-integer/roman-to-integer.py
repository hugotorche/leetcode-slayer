class Solution:
    def romanToInt(self, s: str) -> int:
        ls = list(s)    
        romanMap = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
        totalInt = 0
        for i in range(len(ls)):
            if i > 0 and ls[i] in ['V', 'X'] and ls[i-1] == 'I':
                totalInt += romanMap[ls[i]] - 2
            elif i > 0 and ls[i] in ['L', 'C'] and ls[i-1] == 'X':
                totalInt += romanMap[ls[i]] - 20
            elif i > 0 and ls[i] in ['D', 'M'] and ls[i-1] == 'C':
                totalInt += romanMap[ls[i]] - 200
            else:
                totalInt += romanMap[ls[i]]
        return totalInt
