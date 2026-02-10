class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        d_joined = ''.join(map(str, digits))
        d_plusone = str(int(d_joined) + 1)
        return [int(d) for d in d_plusone]