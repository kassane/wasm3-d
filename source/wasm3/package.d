// D import file generated from importC
module wasm3;

extern (C)
@nogc @system nothrow:

alias M3Result = const(char)*;
alias IM3Environment = M3Environment*;
alias IM3Runtime = M3Runtime*;
alias IM3Module = M3Module*;
alias IM3Function = M3Function*;
alias IM3Global = M3Global*;

struct M3ErrorInfo
{
    const(char)* result = void;
    M3Runtime* runtime = void;
    M3Module* mod = void;
    M3Function* func = void;
    const(char)* file = void;
    uint line = void;
    const(char)* message = void;
}

struct M3BacktraceFrame
{
    uint moduleOffset = void;
    M3Function* func = void;
    M3BacktraceFrame* next = void;
}

alias IM3BacktraceFrame = M3BacktraceFrame*;
struct M3BacktraceInfo
{
    M3BacktraceFrame* frames = void;
    M3BacktraceFrame* lastFrame = void;
}

alias IM3BacktraceInfo = M3BacktraceInfo*;
enum M3ValueType
{
    c_m3Type_none = 0,
    c_m3Type_i32 = 1,
    c_m3Type_i64 = 2,
    c_m3Type_f32 = 3,
    c_m3Type_f64 = 4,
    c_m3Type_unknown,
}

alias c_m3Type_none = M3ValueType.c_m3Type_none;
alias c_m3Type_i32 = M3ValueType.c_m3Type_i32;
alias c_m3Type_i64 = M3ValueType.c_m3Type_i64;
alias c_m3Type_f32 = M3ValueType.c_m3Type_f32;
alias c_m3Type_f64 = M3ValueType.c_m3Type_f64;
alias c_m3Type_unknown = M3ValueType.c_m3Type_unknown;
struct M3TaggedValue
{
    M3ValueType type = void;
    M3ValueUnion value = {0};
}

union M3ValueUnion
{
    uint i32;
    ulong i64;
    float f32;
    double f64;
}

alias IM3TaggedValue = M3TaggedValue*;
struct M3ImportInfo
{
    const(char)* moduleUtf8 = void;
    const(char)* fieldUtf8 = void;
}

alias IM3ImportInfo = M3ImportInfo*;
struct M3ImportContext
{
    void* userdata = void;
    M3Function* func = void;
}

alias IM3ImportContext = M3ImportContext*;
extern __gshared const(char*) m3Err_none;
extern __gshared const(char*) m3Err_mallocFailed;
extern __gshared const(char*) m3Err_incompatibleWasmVersion;
extern __gshared const(char*) m3Err_wasmMalformed;
extern __gshared const(char*) m3Err_misorderedWasmSection;
extern __gshared const(char*) m3Err_wasmUnderrun;
extern __gshared const(char*) m3Err_wasmOverrun;
extern __gshared const(char*) m3Err_wasmMissingInitExpr;
extern __gshared const(char*) m3Err_lebOverflow;
extern __gshared const(char*) m3Err_missingUTF8;
extern __gshared const(char*) m3Err_wasmSectionUnderrun;
extern __gshared const(char*) m3Err_wasmSectionOverrun;
extern __gshared const(char*) m3Err_invalidTypeId;
extern __gshared const(char*) m3Err_tooManyMemorySections;
extern __gshared const(char*) m3Err_tooManyArgsRets;
extern __gshared const(char*) m3Err_moduleNotLinked;
extern __gshared const(char*) m3Err_moduleAlreadyLinked;
extern __gshared const(char*) m3Err_functionLookupFailed;
extern __gshared const(char*) m3Err_functionImportMissing;
extern __gshared const(char*) m3Err_malformedFunctionSignature;
extern __gshared const(char*) m3Err_noCompiler;
extern __gshared const(char*) m3Err_unknownOpcode;
extern __gshared const(char*) m3Err_restrictedOpcode;
extern __gshared const(char*) m3Err_functionStackOverflow;
extern __gshared const(char*) m3Err_functionStackUnderrun;
extern __gshared const(char*) m3Err_mallocFailedCodePage;
extern __gshared const(char*) m3Err_settingImmutableGlobal;
extern __gshared const(char*) m3Err_typeMismatch;
extern __gshared const(char*) m3Err_typeCountMismatch;
extern __gshared const(char*) m3Err_missingCompiledCode;
extern __gshared const(char*) m3Err_wasmMemoryOverflow;
extern __gshared const(char*) m3Err_globalMemoryNotAllocated;
extern __gshared const(char*) m3Err_globaIndexOutOfBounds;
extern __gshared const(char*) m3Err_argumentCountMismatch;
extern __gshared const(char*) m3Err_argumentTypeMismatch;
extern __gshared const(char*) m3Err_globalLookupFailed;
extern __gshared const(char*) m3Err_globalTypeMismatch;
extern __gshared const(char*) m3Err_globalNotMutable;
extern __gshared const(char*) m3Err_trapOutOfBoundsMemoryAccess;
extern __gshared const(char*) m3Err_trapDivisionByZero;
extern __gshared const(char*) m3Err_trapIntegerOverflow;
extern __gshared const(char*) m3Err_trapIntegerConversion;
extern __gshared const(char*) m3Err_trapIndirectCallTypeMismatch;
extern __gshared const(char*) m3Err_trapTableIndexOutOfRange;
extern __gshared const(char*) m3Err_trapTableElementIsNull;
extern __gshared const(char*) m3Err_trapExit;
extern __gshared const(char*) m3Err_trapAbort;
extern __gshared const(char*) m3Err_trapUnreachable;
extern __gshared const(char*) m3Err_trapStackOverflow;
M3Environment* m3_NewEnvironment();
void m3_FreeEnvironment(M3Environment* i_environment);
alias M3SectionHandler = const(char)* function(M3Module* i_module, const(char)* name, const(ubyte)* start, const(
        ubyte)* end);
void m3_SetCustomSectionHandler(M3Environment* i_environment, const(char)* function(
        M3Module* i_module, const(char)* name, const(ubyte)* start, const(ubyte)* end) i_handler);
M3Runtime* m3_NewRuntime(M3Environment* io_environment, uint i_stackSizeInBytes, void* i_userdata);
void m3_FreeRuntime(M3Runtime* i_runtime);
ubyte* m3_GetMemory(M3Runtime* i_runtime, uint* o_memorySizeInBytes, uint i_memoryIndex);
uint m3_GetMemorySize(M3Runtime* i_runtime);
void* m3_GetUserData(M3Runtime* i_runtime);
const(char)* m3_ParseModule(M3Environment* i_environment, M3Module** o_module, const(ubyte)* i_wasmBytes, uint i_numWasmBytes);
void m3_FreeModule(M3Module* i_module);
const(char)* m3_LoadModule(M3Runtime* io_runtime, M3Module* io_module);
const(char)* m3_CompileModule(M3Module* io_module);
const(char)* m3_RunStart(M3Module* i_module);
alias M3RawCall = const(void)* function(M3Runtime* runtime, M3ImportContext* _ctx, uint* _sp, void* _mem);
const(char)* m3_LinkRawFunction(M3Module* io_module, const(char)* i_moduleName, const(char)* i_functionName, const(char)* i_signature, const(
        void)* function(M3Runtime* runtime, M3ImportContext* _ctx, uint* _sp, void* _mem) i_function);
const(char)* m3_LinkRawFunctionEx(M3Module* io_module, const(char)* i_moduleName, const(char)* i_functionName, const(char)* i_signature, const(
        void)* function(M3Runtime* runtime, M3ImportContext* _ctx, uint* _sp, void* _mem) i_function, const(
        void)* i_userdata);
const(char)* m3_GetModuleName(M3Module* i_module);
void m3_SetModuleName(M3Module* i_module, const(char)* name);
M3Runtime* m3_GetModuleRuntime(M3Module* i_module);
M3Global* m3_FindGlobal(M3Module* io_module, const(char)* i_globalName);
const(char)* m3_GetGlobal(M3Global* i_global, M3TaggedValue* o_value);
const(char)* m3_SetGlobal(M3Global* i_global, M3TaggedValue* i_value);
M3ValueType m3_GetGlobalType(M3Global* i_global);
const(char)* m3_Yield();
const(char)* m3_FindFunction(M3Function** o_function, M3Runtime* i_runtime, const(char)* i_functionName);
const(char)* m3_GetTableFunction(M3Function** o_function, M3Module* i_module, uint i_index);
uint m3_GetArgCount(M3Function* i_function);
uint m3_GetRetCount(M3Function* i_function);
M3ValueType m3_GetArgType(M3Function* i_function, uint i_index);
M3ValueType m3_GetRetType(M3Function* i_function, uint i_index);
const(char)* m3_CallV(M3Function* i_function, ...);
const(char)* m3_CallVL(M3Function* i_function, __builtin_va_list i_args);
const(char)* m3_Call(M3Function* i_function, uint i_argc, const(void)*[0] i_argptrs);
const(char)* m3_CallArgv(M3Function* i_function, uint i_argc, const(char)** i_argv);
const(char)* m3_GetResultsV(M3Function* i_function, ...);
const(char)* m3_GetResultsVL(M3Function* i_function, __builtin_va_list o_rets);
const(char)* m3_GetResults(M3Function* i_function, uint i_retc, const(void)*[0] o_retptrs);
void m3_GetErrorInfo(M3Runtime* i_runtime, M3ErrorInfo* o_info);
void m3_ResetErrorInfo(M3Runtime* i_runtime);
const(char)* m3_GetFunctionName(M3Function* i_function);
M3Module* m3_GetFunctionModule(M3Function* i_function);
void m3_PrintRuntimeInfo(M3Runtime* i_runtime);
void m3_PrintM3Info();
void m3_PrintProfilerInfo();
M3BacktraceInfo* m3_GetBacktrace(M3Runtime* i_runtime);

alias m3ret_t = const(void)*;
alias voidptr_t = const(void)*;
alias cstr_t = const(char)*;
alias ccstr_t = const(char*);
alias bytes_t = const(ubyte)*;
alias cbytes_t = const(ubyte*);
alias m3opcode_t = ushort;
alias m3reg_t = int;
alias m3slot_t = uint;
alias m3stack_t = uint*;
alias cvptr_t = const(void*);
alias code_t = void*;
alias pc_t = void**;
struct M3MemoryHeader
{
    M3Runtime* runtime = void;
    void* maxStack = void;
    uint length = void;
}

struct M3CodeMappingPage;
struct M3CodePageHeader
{
    M3CodePage* next = void;
    uint lineIndex = void;
    uint numLines = void;
    uint sequence = void;
    uint usageCount = void;
}

static extern __gshared const(char*)[0] c_waTypes;
static extern __gshared const(char*)[0] c_waCompactTypes;
const(char)* m3Error(const(char)* i_result, M3Runtime* i_runtime, M3Module* i_module, M3Function* i_function, const(
        char)* i_file, uint i_lineNum, const(char)* i_errorMessage, ...);
void m3_Abort(const(char)* message);
void* m3_Malloc_Impl(uint i_size);
void* m3_Realloc_Impl(void* i_ptr, uint i_newSize, uint i_oldSize);
void m3_Free_Impl(void* i_ptr);
void* m3_CopyMem(const(void)* i_from, uint i_size);
const(char)* NormalizeType(ubyte* o_type, byte i_convolutedWasmType);
bool IsIntType(ubyte i_wasmType);
bool IsFpType(ubyte i_wasmType);
bool Is64BitType(ubyte i_m3Type);
uint SizeOfType(ubyte i_m3Type);
const(char)* Read_u64(uint* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* Read_u32(uint* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* Read_f64(double* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* Read_f32(float* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* Read_u8(ubyte* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* Read_opcode(ushort* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* ReadLebUnsigned(uint* o_value, uint i_maxNumBits, const(ubyte)** io_bytes, const(
        ubyte*) i_end);
const(char)* ReadLebSigned(int* o_value, uint i_maxNumBits, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* ReadLEB_u32(uint* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* ReadLEB_u7(ubyte* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* ReadLEB_i7(byte* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* ReadLEB_i32(int* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* ReadLEB_i64(int* o_value, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* Read_utf8(const(char)** o_utf8, const(ubyte)** io_bytes, const(ubyte*) i_end);
const(char)* SPrintValue(void* i_value, ubyte i_type);
uint SPrintArg(char* o_string, uint i_stringBufferSize, const(void)* i_sp, ubyte i_type);
void ReportError(M3Runtime* io_runtime, M3Module* i_module, M3Function* i_function, const(char*) i_errorMessage, const(
        char*) i_file, uint i_lineNum);
const(char)* m3_LinkLibC(M3Module* io_module);
const(char)* m3_LinkSpecTest(M3Module* io_module);
struct m3_wasi_context_t
{
    int exit_code = void;
    uint argc = void;
    const(char*)* argv = void;
}

const(char)* m3_LinkWASI(M3Module* io_module);
m3_wasi_context_t* m3_GetWasiContext();
struct M3CodePage
{
    M3CodePageHeader info = void;
    void*[1] code = void;
}

alias IM3CodePage = M3CodePage*;
M3CodePage* NewCodePage(M3Runtime* i_runtime, uint i_minNumLines);
void FreeCodePages(M3CodePage** io_list);
uint NumFreeLines(M3CodePage* i_page);
void** GetPageStartPC(M3CodePage* i_page);
void** GetPagePC(M3CodePage* i_page);
void EmitWord_impl(M3CodePage* i_page, void* i_word);
void EmitWord32(M3CodePage* i_page, uint i_word);
void EmitWord64(M3CodePage* i_page, uint i_word);
void PushCodePage(M3CodePage** io_list, M3CodePage* i_codePage);
M3CodePage* PopCodePage(M3CodePage** io_list);
M3CodePage* GetEndCodePage(M3CodePage* i_list);
uint CountCodePages(M3CodePage* i_list);
alias IM3Operation = const(void)* function(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* RunCode(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
struct M3FuncType
{
    M3FuncType* next = void;
    ushort numRets = void;
    ushort numArgs = void;
    ubyte[0] types = void;
}

alias IM3FuncType = M3FuncType*;
const(char)* AllocFuncType(M3FuncType** o_functionType, uint i_numTypes);
bool AreFuncTypesEqual(M3FuncType* i_typeA, M3FuncType* i_typeB);
ushort GetFuncTypeNumParams(M3FuncType* i_funcType);
ubyte GetFuncTypeParamType(M3FuncType* i_funcType, ushort i_index);
ushort GetFuncTypeNumResults(M3FuncType* i_funcType);
ubyte GetFuncTypeResultType(M3FuncType* i_funcType, ushort i_index);
struct M3Function
{
    M3Module* mod = void;

    const(ubyte)* wasm = void;
    const(ubyte)* wasmEnd = void;
    const(char)*[3] names = void;
    const(char)* export_name = void;
    ushort numNames = void;
    M3FuncType* funcType = void;
    void** compiled = void;
    ushort maxStackSlots = void;
    ushort numRetSlots = void;
    ushort numRetAndArgSlots = void;
    ushort numLocals = void;
    ushort numLocalBytes = void;
    bool ownsWasmCode = void;
    ushort numConstantBytes = void;
    void* constants = void;
}

void Function_Release(M3Function* i_function);
void Function_FreeCompiledCode(M3Function* i_function);
const(char)* GetFunctionImportModuleName(M3Function* i_function);
const(char)** GetFunctionNames(M3Function* i_function, ushort* o_numNames);
ushort GetFunctionNumArgs(M3Function* i_function);
ubyte GetFunctionArgType(M3Function* i_function, uint i_index);
ushort GetFunctionNumReturns(M3Function* i_function);
ubyte GetFunctionReturnType(M3Function* i_function, ushort i_index);
uint GetFunctionNumArgsAndLocals(M3Function* i_function);
const(char)* SPrintFunctionArgList(M3Function* i_function, uint* i_sp);
enum
{
    c_waOp_block = 2,
    c_waOp_loop = 3,
    c_waOp_if = 4,
    c_waOp_else = 5,
    c_waOp_end = 11,
    c_waOp_branch = 12,
    c_waOp_branchTable = 14,
    c_waOp_branchIf = 13,
    c_waOp_call = 16,
    c_waOp_getLocal = 32,
    c_waOp_setLocal = 33,
    c_waOp_teeLocal = 34,
    c_waOp_getGlobal = 35,
    c_waOp_store_f32 = 56,
    c_waOp_store_f64 = 57,
    c_waOp_i32_const = 65,
    c_waOp_i64_const = 66,
    c_waOp_f32_const = 67,
    c_waOp_f64_const = 68,
    c_waOp_extended = 252,
    c_waOp_memoryCopy = 64522,
    c_waOp_memoryFill = 64523,
}
struct M3CompilationScope
{
    M3CompilationScope* outer = void;
    void** pc = void;
    void** patches = void;
    int depth = void;
    ushort exitStackIndex = void;
    ushort blockStackIndex = void;
    M3FuncType* type = void;
    ushort opcode = void;
    bool isPolymorphic = void;
}

alias IM3CompilationScope = M3CompilationScope*;
struct M3Compilation
{
    M3Runtime* runtime = void;
    M3Module* mod = void;
    const(ubyte)* wasm = void;
    const(ubyte)* wasmEnd = void;
    const(ubyte)* lastOpcodeStart = void;
    M3CompilationScope block = void;
    M3Function* func = void;
    M3CodePage* page = void;
    ushort stackFirstDynamicIndex = void;
    ushort stackIndex = void;
    ushort slotFirstConstIndex = void;
    ushort slotMaxConstIndex = void;
    ushort slotFirstLocalIndex = void;
    ushort slotFirstDynamicIndex = void;
    ushort maxStackSlots = void;
    uint[120] constants = void;
    ushort[2000] wasmStack = void;
    ubyte[2000] typeStack = void;
    ubyte[2000 * 2] m3Slots = void;
    ushort slotMaxAllocatedIndexPlusOne = void;
    ushort[2] regStackIndexPlusOne = void;
    ushort previousOpcode = void;
}

alias IM3Compilation = M3Compilation*;
alias M3Compiler = const(char)* function(M3Compilation*, ushort);
struct M3OpInfo
{
    byte stackOffset = void;
    ubyte type = void;
    const(void)* function(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0)[4] operations = void;
    const(char)* function(M3Compilation*, ushort) compiler = void;
}

alias IM3OpInfo = const M3OpInfo*;
const(M3OpInfo)* GetOpInfo(ushort opcode);
static ubyte GetSingleRetType(M3FuncType* ftype);
static extern __gshared const(ushort) c_m3RegisterUnallocated;
static extern __gshared const(ushort) c_slotUnused;
static bool IsRegisterAllocated(M3Compilation* o, uint i_register);
static bool IsStackPolymorphic(M3Compilation* o);
static bool IsRegisterSlotAlias(ushort i_slot);
static bool IsFpRegisterSlotAlias(ushort i_slot);
static bool IsIntRegisterSlotAlias(ushort i_slot);
ushort GetMaxUsedSlotPlusOne(M3Compilation* o);
const(char)* CompileBlock(M3Compilation* io, M3FuncType* i_blockType, ushort i_blockOpcode);
const(char)* CompileBlockStatements(M3Compilation* io);
const(char)* CompileFunction(M3Function* io_function);
const(char)* CompileRawFunction(M3Module* io_module, M3Function* io_function, const(void)* i_function, const(
        void)* i_userdata);
struct M3MemoryInfo
{
    uint initPages = void;
    uint maxPages = void;
}

struct M3Memory
{
    M3MemoryHeader* mallocated = void;
    uint numPages = void;
    uint maxPages = void;
}

alias IM3Memory = M3Memory*;
struct M3DataSegment
{
    const(ubyte)* initExpr = void;
    const(ubyte)* data = void;
    uint initExprSize = void;
    uint memoryRegion = void;
    uint size = void;
}

struct M3Global
{

    union
    {
        int i32Value;
        int i64Value;
        double f64Value;
        float f32Value;
    }

    const(char)* name = void;
    const(ubyte)* initExpr = void;
    uint initExprSize = void;
    ubyte type = void;
    bool imported = void;
    bool isMutable = void;
}

struct M3Module
{
    M3Runtime* runtime = void;
    M3Environment* environment = void;
    const(ubyte)* wasmStart = void;
    const(ubyte)* wasmEnd = void;
    const(char)* name = void;
    uint numFuncTypes = void;
    M3FuncType** funcTypes = void;
    uint numFuncImports = void;
    uint numFunctions = void;
    uint allFunctions = void;
    M3Function* functions = void;
    int startFunc = void;
    uint numDataSegments = void;
    M3DataSegment* dataSegments = void;
    uint numGlobals = void;
    M3Global* globals = void;
    uint numElementSegments = void;
    const(ubyte)* elementSection = void;
    const(ubyte)* elementSectionEnd = void;
    M3Function** table0 = void;
    uint table0Size = void;
    const(char)* table0ExportName = void;
    M3MemoryInfo memoryInfo = void;
    M3ImportInfo memoryImport = void;
    bool memoryImported = void;
    const(char)* memoryExportName = void;
    M3Module* next = void;
}

const(char)* Module_AddGlobal(M3Module* io_module, M3Global** o_global, ubyte i_type, bool i_mutable, bool i_isImported);
const(char)* Module_PreallocFunctions(M3Module* io_module, uint i_totalFunctions);
const(char)* Module_AddFunction(M3Module* io_module, uint i_typeIndex, M3ImportInfo* i_importInfo);
M3Function* Module_GetFunction(M3Module* i_module, uint i_functionIndex);
void Module_GenerateNames(M3Module* i_module);
void FreeImportInfo(M3ImportInfo* i_info);
struct M3Environment
{
    M3FuncType* funcTypes = void;
    M3FuncType*[c_m3Type_unknown] retFuncTypes = void;
    M3CodePage* pagesReleased = void;
    const(char)* function(M3Module* i_module, const(char)* name, const(ubyte)* start, const(ubyte)* end) customSectionHandler = void;
}

void Environment_Release(M3Environment* i_environment);
void Environment_AddFuncType(M3Environment* i_environment, M3FuncType** io_funcType);
struct M3Runtime
{
    M3Compilation compilation = void;
    M3Environment* environment = void;
    M3CodePage* pagesOpen = void;
    M3CodePage* pagesFull = void;
    uint numCodePages = void;
    uint numActiveCodePages = void;
    M3Module* modules = void;
    void* stack = void;
    void* originStack = void;
    uint stackSize = void;
    uint numStackSlots = void;
    M3Function* lastCalled = void;
    void* userdata = void;
    M3Memory memory = void;
    uint memoryLimit = void;
    M3ErrorInfo error = void;
    char[256] error_message = void;
    uint newCodePageSequence = void;
}

void InitRuntime(M3Runtime* io_runtime, uint i_stackSizeInBytes);
void Runtime_Release(M3Runtime* io_runtime);
const(char)* ResizeMemory(M3Runtime* io_runtime, uint i_numPages);
alias ModuleVisitor = void* function(M3Module* i_module, void* i_info);
void* ForEachModule(M3Runtime* i_runtime, void* function(M3Module* i_module, void* i_info) i_visitor, void* i_info);
void* v_FindFunction(M3Module* i_module, const(char)* i_name);
M3CodePage* AcquireCodePage(M3Runtime* io_runtime);
M3CodePage* AcquireCodePageWithCapacity(M3Runtime* io_runtime, uint i_lineCount);
void ReleaseCodePage(M3Runtime* io_runtime, M3CodePage* i_codePage);
void ProfileHit(const(char)* i_operationName);

static uint rotl32(uint n, uint c);
static uint rotr32(uint n, uint c);
static uint rotl64(uint n, uint c);
static uint rotr64(uint n, uint c);

static float min_f32(float a, float b);
static float max_f32(float a, float b);
static double min_f64(double a, double b);
static double max_f64(double a, double b);
static const(void)* Call(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Equal_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Equal_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Equal_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Equal_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_NotEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_NotEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_NotEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_NotEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_LessThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_LessThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_LessThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_LessThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_LessThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_LessThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_GreaterThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_GreaterThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_GreaterThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_GreaterThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_GreaterThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_GreaterThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_LessThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_LessThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_LessThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_LessThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_LessThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_LessThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_GreaterThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_GreaterThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_GreaterThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_GreaterThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_GreaterThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_GreaterThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_LessThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_LessThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_LessThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_LessThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_LessThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_LessThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_GreaterThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_GreaterThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_GreaterThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_GreaterThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_GreaterThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_GreaterThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_LessThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_LessThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_LessThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_LessThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_LessThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_LessThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_GreaterThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_GreaterThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_GreaterThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_GreaterThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_GreaterThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_GreaterThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Equal_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Equal_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Equal_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Equal_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_NotEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_NotEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_NotEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_NotEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_LessThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_LessThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_LessThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_LessThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_LessThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_LessThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_GreaterThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_GreaterThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_GreaterThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_GreaterThan_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_GreaterThan_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_GreaterThan_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_LessThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_LessThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_LessThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_LessThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_LessThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_LessThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_GreaterThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_GreaterThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_GreaterThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_GreaterThanOrEqual_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_GreaterThanOrEqual_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_GreaterThanOrEqual_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Add_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Add_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Add_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Add_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Multiply_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Multiply_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Multiply_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Multiply_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Subtract_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Subtract_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Subtract_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Subtract_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Subtract_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Subtract_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_ShiftLeft_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_ShiftLeft_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_ShiftLeft_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_ShiftLeft_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_ShiftLeft_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_ShiftLeft_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_ShiftRight_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_ShiftRight_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_ShiftRight_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_ShiftRight_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_ShiftRight_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_ShiftRight_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_ShiftRight_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_ShiftRight_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_ShiftRight_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_ShiftRight_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_ShiftRight_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_ShiftRight_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_And_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_And_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Or_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Or_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Xor_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Xor_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_And_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_And_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Or_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Or_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Xor_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Xor_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Add_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Add_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Add_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Add_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Multiply_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Multiply_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Multiply_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Multiply_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Subtract_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Subtract_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Subtract_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Subtract_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Subtract_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Subtract_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Divide_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Divide_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Divide_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Divide_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Divide_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Divide_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Rotl_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Rotl_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Rotl_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Rotr_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Rotr_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Rotr_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Rotl_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Rotl_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Rotl_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Rotr_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Rotr_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Rotr_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Divide_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Divide_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Divide_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Divide_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Divide_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Divide_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Divide_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Divide_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Divide_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Divide_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Divide_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Divide_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Remainder_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Remainder_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Remainder_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Remainder_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Remainder_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Remainder_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Remainder_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Remainder_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Remainder_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Remainder_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Remainder_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Remainder_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Min_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Min_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Min_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Max_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Max_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Max_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Min_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Min_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Min_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Max_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Max_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Max_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_CopySign_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_CopySign_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_CopySign_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_CopySign_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_CopySign_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_CopySign_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Abs_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Abs_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Abs_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Abs_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Ceil_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Ceil_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Ceil_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Ceil_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Floor_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Floor_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Floor_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Floor_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Trunc_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Trunc_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Trunc_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Trunc_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Sqrt_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Sqrt_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Sqrt_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Sqrt_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Nearest_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Nearest_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Nearest_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Nearest_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Negate_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Negate_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Negate_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Negate_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_EqualToZero_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_EqualToZero_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_EqualToZero_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_EqualToZero_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Wrap_i64_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Wrap_i64_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Extend8_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Extend8_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Extend16_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Extend16_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend8_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend8_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend16_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend16_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Trunc_f32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Trunc_f32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Trunc_f32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Trunc_f32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Trunc_f32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Trunc_f32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Trunc_f32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Trunc_f32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Trunc_f64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Trunc_f64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Trunc_f64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Trunc_f64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Trunc_f64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Trunc_f64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Trunc_f64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_Trunc_f64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Trunc_f32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Trunc_f32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Trunc_f32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Trunc_f32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Trunc_f32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Trunc_f32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Trunc_f32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Trunc_f32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Trunc_f64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Trunc_f64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Trunc_f64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Trunc_f64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Trunc_f64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Trunc_f64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Trunc_f64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_Trunc_f64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_TruncSat_f32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_TruncSat_f32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_TruncSat_f32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_TruncSat_f32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_TruncSat_f32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_TruncSat_f32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_TruncSat_f32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_TruncSat_f32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_TruncSat_f64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_TruncSat_f64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_TruncSat_f64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_TruncSat_f64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_TruncSat_f64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_TruncSat_f64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_TruncSat_f64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u32_TruncSat_f64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_TruncSat_f32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_TruncSat_f32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_TruncSat_f32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_TruncSat_f32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_TruncSat_f32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_TruncSat_f32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_TruncSat_f32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_TruncSat_f32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_TruncSat_f64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_TruncSat_f64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_TruncSat_f64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_TruncSat_f64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_TruncSat_f64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_TruncSat_f64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_TruncSat_f64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_u64_TruncSat_f64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend_i32_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend_i32_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend_u32_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Extend_u32_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Demote_f64_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Demote_f64_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Promote_f32_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Promote_f32_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_i32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_i32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_i32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_i32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_u32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_u32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_u32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_u32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_i64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_i64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_i64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_i64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_u64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_u64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_u64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Convert_u64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_i32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_i32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_i32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_i32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_u32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_u32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_u32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_u32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_i64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_i64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_i64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_i64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_u64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_u64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_u64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Convert_u64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Reinterpret_f32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Reinterpret_f32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Reinterpret_f32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Reinterpret_f32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Reinterpret_f64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Reinterpret_f64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Reinterpret_f64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Reinterpret_f64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Reinterpret_i32_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Reinterpret_i32_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Reinterpret_i32_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Reinterpret_i32_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Reinterpret_i64_r_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Reinterpret_i64_r_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Reinterpret_i64_s_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Reinterpret_i64_s_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_GetGlobal_s32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_GetGlobal_s64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetGlobal_i32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetGlobal_i64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Call(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_CallIndirect(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_CallRawFunction(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_MemSize(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_MemGrow(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_MemCopy(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_MemFill(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Compile(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Entry(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Loop(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Branch(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_If_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_If_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_BranchTable(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetRegister_i32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetSlot_i32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_PreserveSetSlot_i32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetRegister_i64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetSlot_i64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_PreserveSetSlot_i64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetRegister_f32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetSlot_f32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_PreserveSetSlot_f32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetRegister_f64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetSlot_f64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_PreserveSetSlot_f64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_CopySlot_32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_PreserveCopySlot_32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_CopySlot_64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_PreserveCopySlot_64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_i32_rss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_i32_srs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_i32_ssr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_i32_sss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_i64_rss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_i64_srs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_i64_ssr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_i64_sss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f32_rss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f32_rrs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f32_rsr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f32_sss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f32_srs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f32_ssr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f64_rss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f64_rrs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f64_rsr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f64_sss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f64_srs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Select_f64_ssr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Return(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_BranchIf_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_BranchIf_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_BranchIfPrologue_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_BranchIfPrologue_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_ContinueLoop(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_ContinueLoopIf(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Const32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Const64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Unsupported(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_Unreachable(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_End(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetGlobal_s32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetGlobal_s64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetGlobal_f32(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_SetGlobal_f64(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Load_f32_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Load_f32_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Load_f64_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Load_f64_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_i8_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_i8_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_u8_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_u8_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_i16_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_i16_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_u16_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_u16_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_i32_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Load_i32_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_i8_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_i8_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_u8_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_u8_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_i16_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_i16_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_u16_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_u16_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_i32_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_i32_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_u32_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_u32_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_i64_r(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Load_i64_s(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Store_f32_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Store_f32_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Store_f32_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f32_Store_f32_rr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Store_f64_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Store_f64_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Store_f64_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_f64_Store_f64_rr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Store_u8_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Store_u8_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Store_u8_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Store_i16_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Store_i16_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Store_i16_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Store_i32_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Store_i32_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i32_Store_i32_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_u8_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_u8_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_u8_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_i16_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_i16_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_i16_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_i32_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_i32_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_i32_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_i64_rs(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_i64_sr(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);
static const(void)* op_i64_Store_i64_ss(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0);

auto m3ApiOffsetToPtr(__MP198)(__MP198 offset)
{
    return cast(void*)(cast(ubyte*) _mem + cast(uint) offset);
}

auto m3ApiPtrToOffset(__MP199)(__MP199 ptr)
{
    return cast(uint)(cast(ubyte*) ptr - cast(ubyte*) _mem);
}

auto m3ApiIsNullPtr(__MP207)(__MP207 addr)
{
    return cast(void*) addr <= _mem;
}

auto m3ApiReadMem8(__MP215)(__MP215 ptr)
{
    return *cast(ubyte*) ptr;
}

auto m3ApiReadMem16(__MP216)(__MP216 ptr)
{
    return *cast(ushort*) ptr;
}

auto m3ApiReadMem32(__MP217)(__MP217 ptr)
{
    return *cast(uint*) ptr;
}

auto m3ApiReadMem64(__MP218)(__MP218 ptr)
{
    return *cast(uint*) ptr;
}

enum int M3_HAS_TAIL_CALL = 1;
auto M3_MIN(__MP237, __MP238)(__MP237 A, __MP238 B)
{
    return A < B ? A : B;
}

auto M3_MAX(__MP239, __MP240)(__MP239 A, __MP240 B)
{
    return A > B ? A : B;
}

auto M3_INIT(__MP241)(__MP241 field)
{
    return memset(&field, 0, field.sizeof);
}

auto M3_COUNT_OF(__MP242)(__MP242 x)
{
    return x.sizeof / 0[x].sizeof / cast(uint) !(x.sizeof % 0[x].sizeof);
}

enum int d_m3MaxFunctionStackHeight = 2000;
enum int d_m3MaxLinearMemoryPages = 65_536;
auto d_m3MaxFunctionSlots()()
{
    return d_m3MaxFunctionStackHeight * 2;
}

enum int d_m3MaxConstantTableSize = 120;
enum int d_m3MaxDuplicateFunctionImpl = 3;
enum int d_m3CascadedOpcodes = 1;
enum int d_m3VerboseErrorMessages = 1;
enum int d_m3FixedHeapAlign = 16;
enum int d_m3Use32BitSlots = 1;
enum int d_m3ProfilerSlotMask = 65_535;
enum int d_m3RecordBacktraces = 0;
enum int d_m3EnableExceptionBreakpoint = 0;
enum int d_m3EnableOpProfiling = 0;
enum int d_m3EnableOpTracing = 0;
enum int d_m3EnableWasiTracing = 0;
enum int d_m3EnableStrace = 0;
enum int d_m3LogParse = 0;
enum int d_m3LogModule = 0;
enum int d_m3LogCompile = 0;
enum int d_m3LogWasmStack = 0;
enum int d_m3LogEmit = 0;
enum int d_m3LogCodePages = 0;
enum int d_m3LogRuntime = 0;
enum int d_m3LogNativeStack = 0;
enum int d_m3LogHeapOps = 0;
enum int d_m3LogTimestamps = 0;
enum int d_m3HasFloat = 1;
enum int d_m3SkipStackCheck = 0;
enum int d_m3SkipMemoryBoundsCheck = 0;
enum int d_m3EnableCodePageRefCounting = 0;
auto d_m3ImplementFloat()()
{
    return d_m3HasFloat || d_m3NoFloatDynamic;
}

enum int d_m3MemPageSize = 65_536;
enum int d_m3Reg0SlotAlias = 60_000;
auto d_m3Fp0SlotAlias()()
{
    return d_m3Reg0SlotAlias + 2;
}

enum int d_m3MaxSaneTypesCount = 100_0000;
enum int d_m3MaxSaneFunctionsCount = 1000_000;
enum int d_m3MaxSaneImportsCount = 100_000;
enum int d_m3MaxSaneExportsCount = 100_000;
enum int d_m3MaxSaneGlobalsCount = 1000_000;
enum int d_m3MaxSaneElementSegments = 1000_0000;
enum int d_m3MaxSaneDataSegments = 100_000;
enum int d_m3MaxSaneTableSize = 1000_0000;
enum int d_m3MaxSaneUtf8Length = 10_000;
enum int d_m3MaxSaneFunctionArgRetCount = 1000;
enum int d_externalKind_function = 0;
enum int d_externalKind_table = 1;
enum int d_externalKind_memory = 2;
enum int d_externalKind_global = 3;

auto m3_Malloc(__MP244, __MP245)(__MP244 NAME, __MP245 SIZE)
{
    return m3_Malloc_Impl(SIZE);
}

auto m3_Realloc(__MP246, __MP247, __MP248, __MP249)(__MP246 NAME, __MP247 PTR, __MP248 NEW, __MP249 OLD)
{
    return m3_Realloc_Impl(PTR, NEW, OLD);
}

auto EmitWord(__MP258, __MP259)(__MP258 page, __MP259 val)
{
    return EmitWord_impl(page, cast(void*) val);
}

auto m3MemData(__MP260)(__MP260 mem)
{
    return cast(ubyte*)(cast(M3MemoryHeader*) mem + 1);
}

auto jumpOpImpl(__MP264)(__MP264 PC)
{
    return (cast(const(void)* function(void** _pc, uint* _sp, M3MemoryHeader* _mem, int _r0, double _fp0))*PC)(PC + 1, d_m3OpArgs);
}

void* memset(return scope void* s, int c, size_t n) pure;
