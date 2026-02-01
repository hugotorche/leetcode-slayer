class Solution:
    def romanToInt(self, s: str) -> int:
        ls = list(s)    
        romanDic = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
        totalInt = romanDic[ls[0]]
        for i in range(1, len(ls)):
            totalInt += romanDic[ls[i]]
            if ls[i] in ['V', 'X'] and ls[i-1] == 'I':
                totalInt += - 2
            elif ls[i] in ['L', 'C'] and ls[i-1] == 'X':
                totalInt += - 20
            elif ls[i] in ['D', 'M'] and ls[i-1] == 'C':
                totalInt += - 200
        return totalInt
