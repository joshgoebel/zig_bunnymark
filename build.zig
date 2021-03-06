const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

    const lib = b.addSharedLibrary("cart", "src/main.zig", .unversioned);
    lib.setBuildMode(mode);
    lib.setTarget(.{ .cpu_arch = .wasm32, .os_tag = .freestanding });
    lib.import_memory = true;
    lib.initial_memory = 65536 * 2;
    lib.max_memory = 65536 * 2;
    lib.global_base = 6560;
    lib.stack_size = 8192;
    lib.export_symbol_names = &[_][]const u8{ "TIC", "OVR", "BDR", "SCR" };
    lib.install();
}
