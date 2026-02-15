class Solution:
    def findContentChildren(self, g: List[int], s: List[int]) -> int:
        ct = 0
        s = sorted(s)
        if not s or max(s) < min(g):
            return ct
        else:
            for i in range(len(g)):
                for j in range(len(s)):
                    if s[j] >= g[i]:
                        ct += 1
                        s.pop(j)
                        break
        return ct