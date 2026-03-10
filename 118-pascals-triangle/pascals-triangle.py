class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        x = []
        for i in range(numRows):
            coef = 1
            y = []
            for j in range(0, i + 1):
                y.append(coef)
                coef = coef * (i - j) // (j + 1)
            x.append(y)
        return x
