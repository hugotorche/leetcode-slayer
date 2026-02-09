class Solution:
    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:
        nums_inter = set(nums1) - (set(nums1) - set(nums2))
        return list(nums_inter)