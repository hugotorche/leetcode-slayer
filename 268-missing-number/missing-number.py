class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        return set(range(0, len(nums)+1)).difference(nums).pop()
