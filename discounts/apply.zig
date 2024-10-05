const Discount = @import("factory.zig").Discount;

pub fn applyPercentageDiscount(originalPrice: f64, discount: Discount) f64 {
    const percentage = discount.Percentage.discount_value;
    return originalPrice - (originalPrice * (percentage / 100));
}

pub fn applyFixedAmountDiscount(originalPrice: f64, discount: Discount) f64 {
    const fixedAmount = discount.FixedAmount.discount_value;
    return originalPrice - fixedAmount;
}
