pub const DiscountType = enum {
    FixedAmount,
    Percentage,
};

pub const Discount = union(DiscountType) {
    FixedAmount: struct {
        title: []const u8,
        discount_value: f64,
    },
    Percentage: struct {
        title: []const u8,
        discount_value: f64,
    },
};

pub fn createDiscount(discountType: DiscountType, title: []const u8, discount_value: f64) !Discount {
    return switch (discountType) {
        .FixedAmount => Discount{ .tag = DiscountType.FixedAmount, .FixedAmount = Discount.FixedAmount{ .title = title, .discount_value = discount_value } },
        .Percentage => Discount{ .tag = DiscountType.Percentage, .Percentage = Discount.Percentage{ .title = title, .discount_value = discount_value } },
    };
}
