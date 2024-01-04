const std = @import("std");

const microzig = @import("microzig");
const rp2040 = microzig.hal;
const time = rp2040.time;

const pin_config = rp2040.pins.GlobalConfiguration{
    .GPIO16 = .{
        .name = "led",
        .direction = .out,
    },
};

pub fn main() !void {
    const pins = pin_config.apply();

    time.sleep_ms(500);
    pins.led.put(1);
    time.sleep_ms(200);
    pins.led.put(0);

}
