const DiscountType = enum {
    Fixed,
    Percentage,
};

const Discount = union(enum) { Percentage: struct {
    title: []const u8,
    discount_value: f64,
}, FixedAmount: struct {
    title: []const u8,
    discount_value: f64,
} };

fn createDiscount(discountType: DiscountType, title: []const u8, discount_value: f64) Discount {
    return switch (discountType) {
        .Percentage => Discount.Percentage{ .title = title, .discount_value = discount_value },
        .Fixed => Discount.FixedAmount{ .title = title, .discount_value = discount_value },
    };
}
