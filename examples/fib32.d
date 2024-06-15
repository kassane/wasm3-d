module fib32;

import std.file : exists;
import std.stdio : writeln, printf, File;
import std.algorithm : endsWith;
import wasm3;

struct Fib
{
    @disable this();
    this(uint stackByteSize)
    {
        env = Environment(null);
        if (env is null)
        {
            writeln("Failed to create environment\n");
            return;
        }
        rt = env.newRuntime(stackByteSize);
        if (rt.runtime is null)
        {
            writeln("Failed to init runtime\n");
            return;
        }
    }

    void loadFile(string filename)
    {
        assert(exists(filename), "File does not exist: " ~ filename);
        auto f = File(filename, "rb");
        if (!f.isOpen)
        {
            writeln("Failed to open file!\n");
            return;
        }
        buffer.length = 1024 * 512;
        while (!f.eof)
        {
            wasmBytes = cast(ubyte[]) f.rawRead(buffer);
            if (wasmBytes.length == 0)
            {
                writeln("Failed to read .wasm file\n");
                return;
            }
        }
        writeln("Wasm file size: ", wasmBytes.length);
        f.close();
        mod = env.parseModule(wasmBytes, wasmBytes.length);
        result = env.result;
        if (result !is null)
        {
            writeln("env.parseModule: ");
            printf("%s\n", result);
            return;
        }
    }

    void loadContent(ubyte[] content, uint len)
    {
        mod = env.parseModule(content, len);
        result = env.result;
        if (result !is null)
        {
            writeln("env.parseModule: ");
            printf("%s\n", result);
            return;
        }
    }

    void run()
    {
        result = m3_LoadModule(rt.runtime, mod.m_module);
        if (result !is null)
        {
            writeln("m3_LoadModule: ");
            printf("%s\n", result);
            return;
        }

        result = m3_FindFunction(&func, rt.runtime, "fib");
        if (result !is null)
        {
            writeln("m3_FindFunction: ");
            printf("%s\n", result);
            return;
        }

        result = m3_CallV(func, 24);
        if (result !is null)
        {
            writeln("m3_Call: ");
            printf("%s\n", result);
            return;
        }

        int* value = cast(int*)(rt.runtime.stack);
        printf("Result: %d\n", *value);
    }

    IM3Function func;
    Environment env;
    Runtime rt;
    Module mod;
    const(char)* result = void;
    ubyte[] buffer;
    ubyte[] wasmBytes = void;
}

void main(string[] args)
{

    Fib f = Fib(1024);
    if (args.length > 1 && args[1].endsWith(".wasm"))
    {
        f.loadFile(args[1]);
    }
    else
    {
        f.loadContent(fib32_wasm, fib32_wasm.length);
    }
    f.run();
}

ubyte[62] fib32_wasm = [
    0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x01, 0x06, 0x01, 0x60,
    0x01, 0x7f, 0x01, 0x7f, 0x03, 0x02, 0x01, 0x00, 0x07, 0x07, 0x01, 0x03,
    0x66, 0x69, 0x62, 0x00, 0x00, 0x0a, 0x1f, 0x01, 0x1d, 0x00, 0x20, 0x00,
    0x41, 0x02, 0x49, 0x04, 0x40, 0x20, 0x00, 0x0f, 0x0b, 0x20, 0x00, 0x41,
    0x02, 0x6b, 0x10, 0x00, 0x20, 0x00, 0x41, 0x01, 0x6b, 0x10, 0x00, 0x6a,
    0x0f, 0x0b
];
