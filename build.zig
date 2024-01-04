const std = @import("std");
const rp2040 = @import("rp2040");


pub fn build(b: *std.Build) void {
    const microzig = @import("microzig").init(b, "microzig");
    const optimize = b.standardOptimizeOption(.{});


    const firmware = microzig.addFirmware(b, .{
        .name = "microzig",
        .target = rp2040.boards.raspberry_pi.pico,
        .optimize = optimize,
        .source_file = .{ .path = "src/main.zig" },
    });

    microzig.installFirmware(b, firmware, .{});

    // For debugging, we also always install the firmware as an ELF file
    microzig.installFirmware(b, firmware, .{ .format = .elf });
}

const Example = struct {
    target: @import("microzig").Target,
    name: []const u8,
    file: []const u8,
};