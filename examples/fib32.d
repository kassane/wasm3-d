module examples.fib32;

import wasm3;
import std.file;
import std.stdio;

struct Wasm3D
{
    @disable this();
    this(uint stackByteSize)
    {
        env = m3_NewEnvironment();
        if (env is null)
        {
            writeln("Failed to create environment\n");
            return;
        }
        runtime = m3_NewRuntime(env, stackByteSize, null);
        if (runtime is null)
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
        result = m3_ParseModule(env, &mod, wasmBytes.ptr, cast(uint) wasmBytes.length);
        if (result !is null)
        {
            writeln("m3_ParseModule: ");
            printf("%s\n", result);
            return;
        }
    }

    void loadContent(const(ubyte)* content, uint len)
    {
        result = m3_ParseModule(env, &mod, content, len);
        if (result !is null)
        {
            writeln("m3_ParseModule: ");
            printf("%s\n", result);
            return;
        }
    }

    void run()
    {
        result = m3_LoadModule(runtime, mod);
        if (result !is null)
        {
            writeln("m3_LoadModule: ");
            printf("%s\n", result);
            return;
        }

        result = m3_FindFunction(&func, runtime, "fib");
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

        int* value = cast(int*)(runtime.stack);
        printf("Result: %d\n", *value);
    }

    ~this()
    {
        m3_FreeRuntime(runtime);
        m3_FreeEnvironment(env);
    }

    M3Environment* env = null;
    M3Runtime* runtime = null;
    IM3Function func;
    IM3Module mod;
    const(char)* result = void;
    ubyte[] buffer;
    ubyte[] wasmBytes = void;
}

void main()
{

    Wasm3D wasm3d = Wasm3D(1024);
    if (exists("fib32.wasm"))
    {
        wasm3d.loadFile("fib32.wasm");
    }
    else
    {
        wasm3d.loadContent(fib32_wasm.ptr, fib32_wasm.length);
    }
    wasm3d.run();
}

ubyte[62] fib32_wasm = [
    0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x01, 0x06, 0x01, 0x60,
    0x01, 0x7f, 0x01, 0x7f, 0x03, 0x02, 0x01, 0x00, 0x07, 0x07, 0x01, 0x03,
    0x66, 0x69, 0x62, 0x00, 0x00, 0x0a, 0x1f, 0x01, 0x1d, 0x00, 0x20, 0x00,
    0x41, 0x02, 0x49, 0x04, 0x40, 0x20, 0x00, 0x0f, 0x0b, 0x20, 0x00, 0x41,
    0x02, 0x6b, 0x10, 0x00, 0x20, 0x00, 0x41, 0x01, 0x6b, 0x10, 0x00, 0x6a,
    0x0f, 0x0b
];
