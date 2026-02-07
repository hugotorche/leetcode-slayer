class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        nums_range = set(range(0, len(nums)+1))
        return list(nums_range - set(nums))[0]
