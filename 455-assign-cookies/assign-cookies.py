class Solution:
    def findContentChildren(self, g: List[int], s: List[int]) -> int:
        ct = 0
        g = sorted(g)
        s = sorted(s)
        if not s:
            return ct
        elif max(s) < min(g):
            return ct
        else:
            for i in range(len(g)):
                for j in range(len(s)):
                    if s[j] >= g[i]:
                        ct += 1
                        s.pop(j)
                        break
        return ct