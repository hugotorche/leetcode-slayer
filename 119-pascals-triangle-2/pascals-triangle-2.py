class Solution:
    def getRow(self, rowIndex: int) -> List[int]:
        x = []
        for i in range(rowIndex + 1):
            coef = 1
            y = []
            for j in range(0, i + 1):
                y.append(coef)
                coef = coef * (i - j) // (j + 1)
            x.append(y)
        return x[-1]
