class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        uniques = set()
        duplicates = set()
        for num in nums:
            if num in uniques:
                duplicates.add(num)
            else:
                uniques.add(num)
        return list(uniques - duplicates)[0]
