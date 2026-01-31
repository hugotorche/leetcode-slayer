class NumArray:

    def __init__(self, nums: List[int]):
        self.nums = nums
        
    def sumRange(self, left: int, right: int) -> int:
        array = self.nums
        arrayRange = array[left:right+1]
        sumRange = 0
        for i in range(len(arrayRange)):
            sumRange += arrayRange[i]
        return sumRange
            
        


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)