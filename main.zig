const std = @import("std");
const createDiscount = @import("discounts/factory.zig").createDiscount;
const DiscountType = @import("discounts/factory.zig").DiscountType;
const applyPercentageDiscount = @import("discounts/apply.zig").applyPercentageDiscount;
const applyFixedAmountDiscount = @import("discounts/apply.zig").applyFixedAmountDiscount;

pub fn main() void {
    std.debug.print("Shopify Discount Engine\n", .{});

    const percentageDiscount = createDiscount(DiscountType.Percentage, "10% Off", 10.0) catch |err| {
        std.debug.print("Error creating percentage discount: {}\n", .{err});
        return;
    };

    const fixedAmountDiscount = createDiscount(DiscountType.FixedAmount, "5 Off", 5.0) catch |err| {
        std.debug.print("Error creating fixed amount discount: {}\n", .{err});
        return;
    };

    const originalPrice = 100.0;

    const discountedPricePercentage = applyPercentageDiscount(originalPrice, percentageDiscount);
    const discountedPriceFixed = applyFixedAmountDiscount(originalPrice, fixedAmountDiscount);

    std.debug.print("Original Price: {}\n", .{originalPrice});
    std.debug.print("Discounted Price with Percentage Discount: {}\n", .{discountedPricePercentage});
    std.debug.print("Discounted Price with Fixed Amount Discount: {}\n", .{discountedPriceFixed});
}
