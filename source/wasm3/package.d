/* 
 * Wasm3 D - Wasm3 binding for D programming language
 * Authors: Matheus Catarino França <matheus-catarino@hotmail.com>
 * License: MIT
 * Version: 0.1.0
 */
module wasm3;
public import wasm3.binding.binding;

struct Environment
{
    IM3Environment env;
    const(char)* result = null;
    alias env this;

    @disable this();
    this(scope IM3Environment e) @nogc nothrow
    {
        if (e is null)
        {
            env = m3_NewEnvironment();
        }
        else
        {
            env = e;
        }
    }

    ~this() @nogc nothrow
    {
        m3_FreeEnvironment(env);
    }

    Runtime newRuntime(uint stackSizeBytes) @nogc nothrow
    {
        return Runtime(m3_NewRuntime(env, stackSizeBytes, null));
    }

    Module parseModule(ubyte[] data, size_t size) @nogc nothrow
    {
        IM3Module m_module;
        result = m3_ParseModule(env, &m_module, data.ptr, cast(uint) size);
        return Module(m_module);
    }
}

struct Runtime
{
    IM3Runtime runtime;

    this(scope IM3Runtime rt) @nogc nothrow
    {
        runtime = rt;
    }

    void freeRuntime() @nogc nothrow
    {
        m3_FreeRuntime(runtime);
    }
}

struct Module
{
    IM3Module m_module;

    this(IM3Module mod) @nogc nothrow
    {
        m_module = mod;
    }

    void freeModule() @nogc nothrow
    {
        m3_FreeModule(m_module);
    }
}
