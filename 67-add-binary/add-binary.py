class Solution:
    def addBinary(self, a: str, b: str) -> str:
        len_a = len(a)
        len_b = len(b)

        if len_a < len_b:
            a, b = b, a
            len_a, len_b = len_b, len_a

        b_ind = len_b - 1
        carry = 0
        result = []

        for i in range(len_a - 1, -1, -1):

            bit1 = int(a[i])
            bit_sum = bit1 + carry

            if b_ind >= 0:
                bit2 = int(b[b_ind])
                bit_sum += bit2
                b_ind -= 1

            bit = bit_sum % 2
            carry = bit_sum // 2

            result.append(str(bit))

        if carry > 0:
            result.append('1')

        return ''.join(result[::-1])
