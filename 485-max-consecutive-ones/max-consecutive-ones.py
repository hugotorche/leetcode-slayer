class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        consecutive = 0
        max_num = 0
        for num in nums:
            consecutive += num
            if num == 0:
                if consecutive > max_num:
                    max_num = consecutive
                consecutive = 0
        if consecutive > max_num:
                    max_num = consecutive
        return max_num
