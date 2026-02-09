class Solution:
    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:
        nums_exter = set(nums1) - set(nums2)
        nums_inter = set(nums1) - nums_exter
        return list(nums_inter)