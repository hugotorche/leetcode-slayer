class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        nums_len = len(nums)
        for i in range(nums_len):
            num_i = nums[i]
            for j in range(nums_len):
                num_j = nums[j]
                if num_i + num_j == target and i != j:
                    return [i, j]
        