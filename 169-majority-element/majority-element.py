class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        nums_half = len(nums) / 2
        for num in set(nums):
            num_count = nums.count(num)   
            if num_count > nums_half:
                return num
     