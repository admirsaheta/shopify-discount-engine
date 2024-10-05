const std = @import("std");

const Observer = fn (title: []const u8, discount_value: f64) void;

const DiscountSubject = struct {
    observers: *std.ArrayList(Observer),

    pub fn init(allocator: *std.mem.Allocator) DiscountSubject {
        return DiscountSubject{
            .observers = std.ArrayList(Observer).init(allocator),
        };
    }

    pub fn attach(self: *DiscountSubject, observer: Observer) !void {
        const result = self.observers.append(observer);
        if (result) |err| {
            return err;
        }
    }

    pub fn notify(self: *DiscountSubject, title: []const u8, discount_value: f64) void {
        for (self.observers) |observer| {
            observer(title, discount_value);
        }
    }

    pub fn deinit(self: *DiscountSubject) void {
        self.observers.deinit();
    }
};
