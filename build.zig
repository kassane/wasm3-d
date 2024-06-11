const std = @import("std");
const abs = @import("abs");
const builtin = @import("builtin");

pub fn build(b: *std.Build) !void {
    // ldc2/ldmd2 not have mingw-support
    const target = b.standardTargetOptions(.{
        .default_target = if (builtin.os.tag == .windows)
            try std.Target.Query.parse(.{
                .arch_os_abi = "native-windows-msvc",
            })
        else
            .{},
    });
    const optimize = b.standardOptimizeOption(.{
        .preferred_optimize_mode = .ReleaseSmall,
    });

    var dflags = std.ArrayList([]const u8).init(b.allocator);
    defer dflags.deinit();

    // local includedir
    try dflags.append("-Isource");

    // common flags
    try dflags.append("-w");
    try dflags.append("--preview=all");

    try buildD(b, .{
        .name = "fib32",
        .target = target,
        .optimize = optimize,
        // .betterC = true, // disable D runtimeGC (default: falsed)
        .sources = &.{
            "examples/fib32.d",
        },
        .dflags = dflags.items,
        .artifact = buildWasm3lib(b, .{
            .target = target,
            .optimize = optimize,
        }),
    });
}

fn buildD(b: *std.Build, options: abs.DCompileStep) !void {
    const exe = try abs.ldcBuildStep(b, options);
    b.default_step.dependOn(&exe.step);
}

fn buildWasm3lib(b: *std.Build, options: struct {
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
}) *std.Build.Step.Compile {
    const dep = b.dependency("wasm3", .{
        .target = options.target,
        .optimize = options.optimize,
        .libm3 = true,
    });
    return dep.artifact("m3");
}
