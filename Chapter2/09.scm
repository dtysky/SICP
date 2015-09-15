 #lang planet neil/sicp

;width(i1 + i2)
;= (i1_upper + i2_upper - i1_lower - i2_lower) / 2
;= (i1_upper - i1_lower) / 2 + (i2_upper - i2_lower) / 2
;= width(i1) + width(i2)

;width(i1 - i2)
;= (i1_upper - i2_upper - i1_lower + i2_lower) / 2
;= (i1_upper - i1_lower) / 2 - (i2_upper - i2_lower) / 2
;= width(i1) - width(i2)

;width(i1 * i2)
;= (max(i1_upper * i2_upper, i1_lower * i2_lower， i1_upper * i1_lower, i2_upper * i2_lower) - min(i1_upper * i2_upper, i1_lower * i2_lower, i1_upper * i1_lower, i2_upper * i2_lower)) / 2
;width(i1) * width(i2)
;= (i1_upper - i1_lower) / 2 * (i2_upper - i2_lower) / 2