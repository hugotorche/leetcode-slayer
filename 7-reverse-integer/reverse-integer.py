class Solution:
    def reverse(self, x: int) -> int:
        lx = [s for s in str(x)]
        if '-' in lx:
            nx = int(''.join(lx[0:1] + lx[-1:0:-1]))
        else:
            nx = int(''.join(lx[::-1]))
        return 0 if nx > 2**31 - 1 or nx < -2**31 else nx
