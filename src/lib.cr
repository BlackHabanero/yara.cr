@[Link(ldflags: "`command -v pkg-config > /dev/null && pkg-config --libs yara 2> /dev/null|| printf %s '-lyara'`")]
lib LibYara
  YR_AC_MAX_TRANSITION_TABLE_SIZE     = 8388608
  YR_AC_ROOT_STATE                    =       0
  YR_AC_SLOT_OFFSET_BITS              =       9
  YR_ATOMS_PER_RULE_WARNING_THRESHOLD =   10000
  YR_LEX_BUF_SIZE                     =    8192
  YR_MAJOR_VERSION                    =       3
  YR_MAX_ARENA_PAGES                  =      32
  YR_MAX_ATOM_LENGTH                  =       4
  YR_MAX_ATOM_QUALITY                 =     255
  YR_MAX_COMPILER_ERROR_EXTRA_INFO    =     256
  YR_MAX_FAST_RE_STACK                =     300
  YR_MAX_FUNCTION_ARGS                =     128
  YR_MAX_INCLUDE_DEPTH                =      16
  YR_MAX_LOOP_NESTING                 =       4
  YR_MAX_OVERLOADED_FUNCTIONS         =      10
  YR_MAX_STRING_MATCHES               = 1000000
  YR_MAX_THREADS                      =      32
  YR_MICRO_VERSION                    =       0
  YR_MINOR_VERSION                    =      11
  YR_MIN_ATOM_QUALITY                 =       0
  YR_STRING_CHAINING_THRESHOLD        =     200
  alias Int32T = X__Int32T
  alias Int64T = X__Int64T
  alias Int8T = X__Int8T
  alias JmpBuf = X__JmpBufTag[1]
  alias OffT = X__OffT
  alias PthreadKeyT = LibC::UInt
  alias PthreadT = LibC::ULong
  alias ReMatchCallbackFunc = (Uint8T*, LibC::Int, LibC::Int, Void* -> LibC::Int)
  alias Uint16T = X__Uint16T
  alias Uint32T = X__Uint32T
  alias Uint64T = X__Uint64T
  alias Uint8T = X__Uint8T
  alias X_IoCodecvt = Void
  alias X_IoLockT = Void
  alias X_IoMarker = Void
  alias X_IoWideData = Void
  alias X_YrStopwatch = Void*
  alias X__Int32T = LibC::Int
  alias X__Int64T = LibC::Long
  alias X__Int8T = LibC::Char
  alias X__JmpBuf = LibC::Long[8]
  alias X__Off64T = LibC::Long
  alias X__OffT = LibC::Long
  alias X__Uint16T = LibC::UShort
  alias X__Uint32T = LibC::UInt
  alias X__Uint64T = LibC::ULong
  alias X__Uint8T = UInt8
  alias YrAcMatchTable = YrAcMatchTableEntry
  alias YrAcTransition = Uint32T
  alias YrAcTransitionTable = YrAcTransition*
  alias YrAtomsQualityFunc = (YrAtomsConfig*, YrAtom* -> LibC::Int)
  alias YrCallbackFunc = (LibC::Int, Void*, Void* -> LibC::Int)
  alias YrCompilerCallbackFunc = (LibC::Int, LibC::Char*, LibC::Int, LibC::Char*, Void* -> Void)
  alias YrCompilerIncludeCallbackFunc = (LibC::Char*, LibC::Char*, LibC::Char*, Void* -> LibC::Char*)
  alias YrCompilerIncludeFreeFunc = (LibC::Char*, Void* -> Void)
  alias YrCompilerReAstCallbackFunc = (YrRule*, LibC::Char*, ReAst*, Void* -> Void)
  alias YrExtDeclarationsFunc = (YrObject* -> LibC::Int)
  alias YrExtFinalizeFunc = (YrModule* -> LibC::Int)
  alias YrExtInitializeFunc = (YrModule* -> LibC::Int)
  alias YrExtLoadFunc = (YrScanContext*, YrObject*, Void*, LibC::SizeT -> LibC::Int)
  alias YrExtUnloadFunc = (YrObject* -> LibC::Int)
  alias YrHashTableFreeValueFunc = (Void* -> LibC::Int)
  alias YrMemoryBlockFetchDataFunc = (YrMemoryBlock* -> Uint8T*)
  alias YrMemoryBlockIteratorFunc = (YrMemoryBlockIterator* -> YrMemoryBlock*)
  alias YrModuleFunc = (YrValue*, YrScanContext*, YrObjectFunction* -> LibC::Int)
  alias YrMutex = PthreadMutexT
  alias YrScanner = YrScanContext
  alias YrStreamReadFunc = (Void*, LibC::SizeT, LibC::SizeT, Void* -> LibC::SizeT)
  alias YrStreamWriteFunc = (Void*, LibC::SizeT, LibC::SizeT, Void* -> LibC::SizeT)
  alias YrThreadId = PthreadT
  alias YrThreadStorageKey = PthreadKeyT
  enum X_YrConfigName
    YrConfigStackSize         = 0
    YrConfigMaxStringsPerRule = 1
    YrConfigMaxMatchData      = 2
    YrConfigLast              = 3
  end
  fun ac_add_string = yr_ac_add_string(automaton : YrAcAutomaton*, string : YrString*, atom : YrAtomListItem*, matches_arena : YrArena*) : LibC::Int
  fun ac_automaton_create = yr_ac_automaton_create(automaton : YrAcAutomaton**) : LibC::Int
  fun ac_automaton_destroy = yr_ac_automaton_destroy(automaton : YrAcAutomaton*) : LibC::Int
  fun ac_compile = yr_ac_compile(automaton : YrAcAutomaton*, arena : YrArena*, tables : YrAcTables*) : LibC::Int
  fun ac_print_automaton = yr_ac_print_automaton(automaton : YrAcAutomaton*)
  fun arena_allocate_memory = yr_arena_allocate_memory(arena : YrArena*, size : LibC::SizeT, allocated_memory : Void**) : LibC::Int
  fun arena_allocate_struct = yr_arena_allocate_struct(arena : YrArena*, size : LibC::SizeT, allocated_memory : Void**, ...) : LibC::Int
  fun arena_append = yr_arena_append(target_arena : YrArena*, source_arena : YrArena*) : LibC::Int
  fun arena_base_address = yr_arena_base_address(arena : YrArena*) : Void*
  fun arena_coalesce = yr_arena_coalesce(arena : YrArena*) : LibC::Int
  fun arena_create = yr_arena_create(initial_size : LibC::SizeT, flags : LibC::Int, arena : YrArena**) : LibC::Int
  fun arena_destroy = yr_arena_destroy(arena : YrArena*)
  fun arena_duplicate = yr_arena_duplicate(arena : YrArena*, duplicated : YrArena**) : LibC::Int
  fun arena_load_stream = yr_arena_load_stream(stream : YrStream*, arena : YrArena**) : LibC::Int
  fun arena_make_ptr_relocatable = yr_arena_make_ptr_relocatable(arena : YrArena*, base : Void*, ...) : LibC::Int
  fun arena_next_address = yr_arena_next_address(arena : YrArena*, address : Void*, offset : LibC::SizeT) : Void*
  fun arena_page_for_address = yr_arena_page_for_address(arena : YrArena*, address : Void*) : YrArenaPage*
  fun arena_print = yr_arena_print(arena : YrArena*)
  fun arena_reserve_memory = yr_arena_reserve_memory(arena : YrArena*, size : LibC::SizeT) : LibC::Int
  fun arena_save_stream = yr_arena_save_stream(arena : YrArena*, stream : YrStream*) : LibC::Int
  fun arena_write_data = yr_arena_write_data(arena : YrArena*, data : Void*, size : LibC::SizeT, written_data : Void**) : LibC::Int
  fun arena_write_string = yr_arena_write_string(arena : YrArena*, string : LibC::Char*, written_string : LibC::Char**) : LibC::Int
  fun atoms_extract_from_re = yr_atoms_extract_from_re(config : YrAtomsConfig*, re_ast : ReAst*, modifier : YrModifier, atoms : YrAtomListItem**, min_atom_quality : LibC::Int*) : LibC::Int
  fun atoms_extract_from_string = yr_atoms_extract_from_string(config : YrAtomsConfig*, string : Uint8T*, string_length : LibC::Int, modifier : YrModifier, atoms : YrAtomListItem**, min_atom_quality : LibC::Int*) : LibC::Int
  fun atoms_extract_triplets = yr_atoms_extract_triplets(re_node : ReNode*, atoms : YrAtomListItem**) : LibC::Int
  fun atoms_heuristic_quality = yr_atoms_heuristic_quality(config : YrAtomsConfig*, atom : YrAtom*) : LibC::Int
  fun atoms_list_destroy = yr_atoms_list_destroy(list_head : YrAtomListItem*)
  fun atoms_min_quality = yr_atoms_min_quality(config : YrAtomsConfig*, atom_list : YrAtomListItem*) : LibC::Int
  fun atoms_table_quality = yr_atoms_table_quality(config : YrAtomsConfig*, atom : YrAtom*) : LibC::Int
  fun bitmask_find_non_colliding_offset = yr_bitmask_find_non_colliding_offset(a : LibC::ULong*, b : LibC::ULong*, len_a : Uint32T, len_b : Uint32T, off_a : Uint32T*) : Uint32T
  fun calloc = yr_calloc(count : LibC::SizeT, size : LibC::SizeT) : Void*
  fun compiler_add_fd = yr_compiler_add_fd(compiler : YrCompiler*, rules_fd : LibC::Int, namespace_ : LibC::Char*, file_name : LibC::Char*) : LibC::Int
  fun compiler_add_file = yr_compiler_add_file(compiler : YrCompiler*, rules_file : File*, namespace_ : LibC::Char*, file_name : LibC::Char*) : LibC::Int
  fun compiler_add_string = yr_compiler_add_string(compiler : YrCompiler*, rules_string : LibC::Char*, namespace_ : LibC::Char*) : LibC::Int
  fun compiler_create = yr_compiler_create(compiler : YrCompiler**) : LibC::Int
  fun compiler_define_boolean_variable = yr_compiler_define_boolean_variable(compiler : YrCompiler*, identifier : LibC::Char*, value : LibC::Int) : LibC::Int
  fun compiler_define_float_variable = yr_compiler_define_float_variable(compiler : YrCompiler*, identifier : LibC::Char*, value : LibC::Double) : LibC::Int
  fun compiler_define_integer_variable = yr_compiler_define_integer_variable(compiler : YrCompiler*, identifier : LibC::Char*, value : Int64T) : LibC::Int
  fun compiler_define_string_variable = yr_compiler_define_string_variable(compiler : YrCompiler*, identifier : LibC::Char*, value : LibC::Char*) : LibC::Int
  fun compiler_destroy = yr_compiler_destroy(compiler : YrCompiler*)
  fun compiler_get_current_file_name = yr_compiler_get_current_file_name(compiler : YrCompiler*) : LibC::Char*
  fun compiler_get_error_message = yr_compiler_get_error_message(compiler : YrCompiler*, buffer : LibC::Char*, buffer_size : LibC::Int) : LibC::Char*
  fun compiler_get_rules = yr_compiler_get_rules(compiler : YrCompiler*, rules : YrRules**) : LibC::Int
  fun compiler_load_atom_quality_table = yr_compiler_load_atom_quality_table(compiler : YrCompiler*, filename : LibC::Char*, warning_threshold : UInt8) : LibC::Int
  fun compiler_set_atom_quality_table = yr_compiler_set_atom_quality_table(compiler : YrCompiler*, table : Void*, entries : LibC::Int, warning_threshold : UInt8)
  fun compiler_set_callback = yr_compiler_set_callback(compiler : YrCompiler*, callback : YrCompilerCallbackFunc, user_data : Void*)
  fun compiler_set_include_callback = yr_compiler_set_include_callback(compiler : YrCompiler*, include_callback : YrCompilerIncludeCallbackFunc, include_free : YrCompilerIncludeFreeFunc, user_data : Void*)
  fun compiler_set_re_ast_callback = yr_compiler_set_re_ast_callback(compiler : YrCompiler*, re_ast_callback : YrCompilerReAstCallbackFunc, user_data : Void*)
  fun current_thread_id = yr_current_thread_id : YrThreadId
  fun execute_code = yr_execute_code(context : YrScanContext*) : LibC::Int
  fun filemap_map = yr_filemap_map(file_path : LibC::Char*, pmapped_file : YrMappedFile*) : LibC::Int
  fun filemap_map_ex = yr_filemap_map_ex(file_path : LibC::Char*, offset : OffT, size : LibC::SizeT, pmapped_file : YrMappedFile*) : LibC::Int
  fun filemap_map_fd = yr_filemap_map_fd(file : LibC::Int, offset : OffT, size : LibC::SizeT, pmapped_file : YrMappedFile*) : LibC::Int
  fun filemap_unmap = yr_filemap_unmap(pmapped_file : YrMappedFile*)
  fun filemap_unmap_fd = yr_filemap_unmap_fd(pmapped_file : YrMappedFile*)
  fun finalize = yr_finalize : LibC::Int
  fun finalize_thread = yr_finalize_thread
  fun free = yr_free(ptr : Void*)
  fun get_configuration = yr_get_configuration(x0 : YrConfigName, x1 : Void*) : LibC::Int
  fun get_tidx = yr_get_tidx : LibC::Int
  fun hash = yr_hash(seed : Uint32T, buffer : Void*, len : LibC::SizeT) : Uint32T
  fun hash_table_add = yr_hash_table_add(table : YrHashTable*, key : LibC::Char*, ns : LibC::Char*, value : Void*) : LibC::Int
  fun hash_table_add_raw_key = yr_hash_table_add_raw_key(table : YrHashTable*, key : Void*, key_length : LibC::SizeT, ns : LibC::Char*, value : Void*) : LibC::Int
  fun hash_table_clean = yr_hash_table_clean(table : YrHashTable*, free_value : YrHashTableFreeValueFunc)
  fun hash_table_create = yr_hash_table_create(size : LibC::Int, table : YrHashTable**) : LibC::Int
  fun hash_table_destroy = yr_hash_table_destroy(table : YrHashTable*, free_value : YrHashTableFreeValueFunc)
  fun hash_table_lookup = yr_hash_table_lookup(table : YrHashTable*, key : LibC::Char*, ns : LibC::Char*) : Void*
  fun hash_table_lookup_raw_key = yr_hash_table_lookup_raw_key(table : YrHashTable*, key : Void*, key_length : LibC::SizeT, ns : LibC::Char*) : Void*
  fun hash_table_remove = yr_hash_table_remove(table : YrHashTable*, key : LibC::Char*, ns : LibC::Char*) : Void*
  fun hash_table_remove_raw_key = yr_hash_table_remove_raw_key(table : YrHashTable*, key : Void*, key_length : LibC::SizeT, ns : LibC::Char*) : Void*
  fun heap_alloc = yr_heap_alloc : LibC::Int
  fun heap_free = yr_heap_free : LibC::Int
  fun initialize = yr_initialize : LibC::Int
  fun malloc = yr_malloc(size : LibC::SizeT) : Void*
  fun modules_do_declarations = yr_modules_do_declarations(module_name : LibC::Char*, main_structure : YrObject*) : LibC::Int
  fun modules_finalize = yr_modules_finalize : LibC::Int
  fun modules_initialize = yr_modules_initialize : LibC::Int
  fun modules_load = yr_modules_load(module_name : LibC::Char*, context : YrScanContext*) : LibC::Int
  fun modules_unload_all = yr_modules_unload_all(context : YrScanContext*) : LibC::Int
  fun mutex_create = yr_mutex_create(x0 : YrMutex*) : LibC::Int
  fun mutex_destroy = yr_mutex_destroy(x0 : YrMutex*) : LibC::Int
  fun mutex_lock = yr_mutex_lock(x0 : YrMutex*) : LibC::Int
  fun mutex_unlock = yr_mutex_unlock(x0 : YrMutex*) : LibC::Int
  fun object_array_get_item = yr_object_array_get_item(object : YrObject*, flags : LibC::Int, index : LibC::Int) : YrObject*
  fun object_array_set_item = yr_object_array_set_item(object : YrObject*, item : YrObject*, index : LibC::Int) : LibC::Int
  fun object_copy = yr_object_copy(object : YrObject*, object_copy : YrObject**) : LibC::Int
  fun object_create = yr_object_create(type : Int8T, identifier : LibC::Char*, parent : YrObject*, object : YrObject**) : LibC::Int
  fun object_destroy = yr_object_destroy(object : YrObject*)
  fun object_dict_get_item = yr_object_dict_get_item(object : YrObject*, flags : LibC::Int, key : LibC::Char*) : YrObject*
  fun object_dict_set_item = yr_object_dict_set_item(object : YrObject*, item : YrObject*, key : LibC::Char*) : LibC::Int
  fun object_from_external_variable = yr_object_from_external_variable(external : YrExternalVariable*, object : YrObject**) : LibC::Int
  fun object_function_create = yr_object_function_create(identifier : LibC::Char*, arguments_fmt : LibC::Char*, return_fmt : LibC::Char*, func : YrModuleFunc, parent : YrObject*, function : YrObject**) : LibC::Int
  fun object_get_float = yr_object_get_float(object : YrObject*, field : LibC::Char*, ...) : LibC::Double
  fun object_get_integer = yr_object_get_integer(object : YrObject*, field : LibC::Char*, ...) : Int64T
  fun object_get_root = yr_object_get_root(object : YrObject*) : YrObject*
  fun object_get_string = yr_object_get_string(object : YrObject*, field : LibC::Char*, ...) : SizedString*
  fun object_has_undefined_value = yr_object_has_undefined_value(object : YrObject*, field : LibC::Char*, ...) : LibC::Int
  fun object_lookup = yr_object_lookup(root : YrObject*, flags : LibC::Int, pattern : LibC::Char*, ...) : YrObject*
  fun object_lookup_field = yr_object_lookup_field(object : YrObject*, field_name : LibC::Char*) : YrObject*
  fun object_print_data = yr_object_print_data(object : YrObject*, indent : LibC::Int, print_identifier : LibC::Int)
  fun object_set_canary = yr_object_set_canary(object : YrObject*, canary : LibC::Int)
  fun object_set_float = yr_object_set_float(value : LibC::Double, object : YrObject*, field : LibC::Char*, ...) : LibC::Int
  fun object_set_integer = yr_object_set_integer(value : Int64T, object : YrObject*, field : LibC::Char*, ...) : LibC::Int
  fun object_set_string = yr_object_set_string(value : LibC::Char*, len : LibC::SizeT, object : YrObject*, field : LibC::Char*, ...) : LibC::Int
  fun object_structure_set_member = yr_object_structure_set_member(object : YrObject*, member : YrObject*) : LibC::Int
  fun re_ast_contains_dot_star = yr_re_ast_contains_dot_star(re_ast : ReAst*) : LibC::Int
  fun re_ast_create = yr_re_ast_create(re_ast : ReAst**) : LibC::Int
  fun re_ast_destroy = yr_re_ast_destroy(re_ast : ReAst*)
  fun re_ast_emit_code = yr_re_ast_emit_code(re_ast : ReAst*, arena : YrArena*, backwards_code : LibC::Int) : LibC::Int
  fun re_ast_extract_literal = yr_re_ast_extract_literal(re_ast : ReAst*) : SizedString*
  fun re_ast_print = yr_re_ast_print(re_ast : ReAst*)
  fun re_ast_split_at_chaining_point = yr_re_ast_split_at_chaining_point(re_ast : ReAst*, remainder_re_ast : ReAst**, min_gap : Int32T*, max_gap : Int32T*) : LibC::Int
  fun re_compile = yr_re_compile(re_string : LibC::Char*, flags : LibC::Int, code_arena : YrArena*, re : Re**, error : ReError*) : LibC::Int
  fun re_exec = yr_re_exec(context : YrScanContext*, code : Uint8T*, input_data : Uint8T*, input_forwards_size : LibC::SizeT, input_backwards_size : LibC::SizeT, flags : LibC::Int, callback : ReMatchCallbackFunc, callback_args : Void*, matches : LibC::Int*) : LibC::Int
  fun re_fast_exec = yr_re_fast_exec(context : YrScanContext*, code : Uint8T*, input_data : Uint8T*, input_forwards_size : LibC::SizeT, input_backwards_size : LibC::SizeT, flags : LibC::Int, callback : ReMatchCallbackFunc, callback_args : Void*, matches : LibC::Int*) : LibC::Int
  fun re_match = yr_re_match(context : YrScanContext*, re : Re*, target : LibC::Char*) : LibC::Int
  fun re_node_append_child = yr_re_node_append_child(node : ReNode*, child : ReNode*)
  fun re_node_create = yr_re_node_create(type : LibC::Int) : ReNode*
  fun re_node_destroy = yr_re_node_destroy(node : ReNode*)
  fun re_node_prepend_child = yr_re_node_prepend_child(node : ReNode*, child : ReNode*)
  fun re_parse = yr_re_parse(re_string : LibC::Char*, re_ast : ReAst**, error : ReError*) : LibC::Int
  fun re_parse_hex = yr_re_parse_hex(hex_string : LibC::Char*, re_ast : ReAst**, error : ReError*) : LibC::Int
  fun realloc = yr_realloc(ptr : Void*, size : LibC::SizeT) : Void*
  fun rule_disable = yr_rule_disable(rule : YrRule*)
  fun rule_enable = yr_rule_enable(rule : YrRule*)
  fun rules_define_boolean_variable = yr_rules_define_boolean_variable(rules : YrRules*, identifier : LibC::Char*, value : LibC::Int) : LibC::Int
  fun rules_define_float_variable = yr_rules_define_float_variable(rules : YrRules*, identifier : LibC::Char*, value : LibC::Double) : LibC::Int
  fun rules_define_integer_variable = yr_rules_define_integer_variable(rules : YrRules*, identifier : LibC::Char*, value : Int64T) : LibC::Int
  fun rules_define_string_variable = yr_rules_define_string_variable(rules : YrRules*, identifier : LibC::Char*, value : LibC::Char*) : LibC::Int
  fun rules_destroy = yr_rules_destroy(rules : YrRules*) : LibC::Int
  fun rules_get_stats = yr_rules_get_stats(rules : YrRules*, stats : YrRulesStats*) : LibC::Int
  fun rules_load = yr_rules_load(filename : LibC::Char*, rules : YrRules**) : LibC::Int
  fun rules_load_stream = yr_rules_load_stream(stream : YrStream*, rules : YrRules**) : LibC::Int
  fun rules_print_profiling_info = yr_rules_print_profiling_info(rules : YrRules*)
  fun rules_reset_profiling_info = yr_rules_reset_profiling_info(rules : YrRules*)
  fun rules_save = yr_rules_save(rules : YrRules*, filename : LibC::Char*) : LibC::Int
  fun rules_save_stream = yr_rules_save_stream(rules : YrRules*, stream : YrStream*) : LibC::Int
  fun rules_scan_fd = yr_rules_scan_fd(rules : YrRules*, fd : LibC::Int, flags : LibC::Int, callback : YrCallbackFunc, user_data : Void*, timeout : LibC::Int) : LibC::Int
  fun rules_scan_file = yr_rules_scan_file(rules : YrRules*, filename : LibC::Char*, flags : LibC::Int, callback : YrCallbackFunc, user_data : Void*, timeout : LibC::Int) : LibC::Int
  fun rules_scan_mem = yr_rules_scan_mem(rules : YrRules*, buffer : Uint8T*, buffer_size : LibC::SizeT, flags : LibC::Int, callback : YrCallbackFunc, user_data : Void*, timeout : LibC::Int) : LibC::Int
  fun rules_scan_proc = yr_rules_scan_proc(rules : YrRules*, pid : LibC::Int, flags : LibC::Int, callback : YrCallbackFunc, user_data : Void*, timeout : LibC::Int) : LibC::Int
  fun scan_verify_match = yr_scan_verify_match(context : YrScanContext*, ac_match : YrAcMatch*, data : Uint8T*, data_size : LibC::SizeT, data_base : Uint64T, offset : LibC::SizeT) : LibC::Int
  fun scanner_create = yr_scanner_create(rules : YrRules*, scanner : YrScanner**) : LibC::Int
  fun scanner_define_boolean_variable = yr_scanner_define_boolean_variable(scanner : YrScanner*, identifier : LibC::Char*, value : LibC::Int) : LibC::Int
  fun scanner_define_float_variable = yr_scanner_define_float_variable(scanner : YrScanner*, identifier : LibC::Char*, value : LibC::Double) : LibC::Int
  fun scanner_define_integer_variable = yr_scanner_define_integer_variable(scanner : YrScanner*, identifier : LibC::Char*, value : Int64T) : LibC::Int
  fun scanner_define_string_variable = yr_scanner_define_string_variable(scanner : YrScanner*, identifier : LibC::Char*, value : LibC::Char*) : LibC::Int
  fun scanner_destroy = yr_scanner_destroy(scanner : YrScanner*)
  fun scanner_last_error_rule = yr_scanner_last_error_rule(scanner : YrScanner*) : YrRule*
  fun scanner_last_error_string = yr_scanner_last_error_string(scanner : YrScanner*) : YrString*
  fun scanner_scan_fd = yr_scanner_scan_fd(scanner : YrScanner*, fd : LibC::Int) : LibC::Int
  fun scanner_scan_file = yr_scanner_scan_file(scanner : YrScanner*, filename : LibC::Char*) : LibC::Int
  fun scanner_scan_mem = yr_scanner_scan_mem(scanner : YrScanner*, buffer : Uint8T*, buffer_size : LibC::SizeT) : LibC::Int
  fun scanner_scan_mem_blocks = yr_scanner_scan_mem_blocks(scanner : YrScanner*, iterator : YrMemoryBlockIterator*) : LibC::Int
  fun scanner_scan_proc = yr_scanner_scan_proc(scanner : YrScanner*, pid : LibC::Int) : LibC::Int
  fun scanner_set_callback = yr_scanner_set_callback(scanner : YrScanner*, callback : YrCallbackFunc, user_data : Void*)
  fun scanner_set_flags = yr_scanner_set_flags(scanner : YrScanner*, flags : LibC::Int)
  fun scanner_set_timeout = yr_scanner_set_timeout(scanner : YrScanner*, timeout : LibC::Int)
  fun set_configuration = yr_set_configuration(x0 : YrConfigName, x1 : Void*) : LibC::Int
  fun set_tidx = yr_set_tidx(x0 : LibC::Int)
  fun stopwatch_elapsed_us = yr_stopwatch_elapsed_us(stopwatch : YrStopwatch) : Uint64T
  fun stopwatch_start = yr_stopwatch_start(stopwatch : YrStopwatch)
  fun strdup = yr_strdup(str : LibC::Char*) : LibC::Char*
  fun stream_read = yr_stream_read(ptr : Void*, size : LibC::SizeT, count : LibC::SizeT, stream : YrStream*) : LibC::SizeT
  fun stream_write = yr_stream_write(ptr : Void*, size : LibC::SizeT, count : LibC::SizeT, stream : YrStream*) : LibC::SizeT
  fun strndup = yr_strndup(str : LibC::Char*, n : LibC::SizeT) : LibC::Char*
  fun thread_storage_create = yr_thread_storage_create(x0 : YrThreadStorageKey*) : LibC::Int
  fun thread_storage_destroy = yr_thread_storage_destroy(x0 : YrThreadStorageKey*) : LibC::Int
  fun thread_storage_get_value = yr_thread_storage_get_value(x0 : YrThreadStorageKey*) : Void*
  fun thread_storage_set_value = yr_thread_storage_set_value(x0 : YrThreadStorageKey*, x1 : Void*) : LibC::Int

  struct Re
    flags : Uint32T
    code : Uint8T[0]
  end

  struct ReAst
    flags : Uint32T
    root_node : ReNode*
  end

  struct ReClass
    negated : Uint8T
    bitmap : Uint8T[32]
  end

  struct ReError
    message : LibC::Char[384]
  end

  struct ReFiber
    ip : Uint8T*
    sp : Int32T
    rc : Int32T
    stack : Uint16T[1024]
    prev : ReFiber*
    next : ReFiber*
  end

  struct ReFiberList
    head : ReFiber*
    tail : ReFiber*
  end

  struct ReFiberPool
    fiber_count : LibC::Int
    fibers : ReFiberList
  end

  struct ReNode
    type : LibC::Int
    greedy : LibC::Int
    re_class : ReClass*
    children_head : ReNode*
    children_tail : ReNode*
    prev_sibling : ReNode*
    next_sibling : ReNode*
    forward_code : Uint8T*
    backward_code : Uint8T*
  end

  struct X_IoFile
    _flags : LibC::Int
    _io_read_ptr : LibC::Char*
    _io_read_end : LibC::Char*
    _io_read_base : LibC::Char*
    _io_write_base : LibC::Char*
    _io_write_ptr : LibC::Char*
    _io_write_end : LibC::Char*
    _io_buf_base : LibC::Char*
    _io_buf_end : LibC::Char*
    _io_save_base : LibC::Char*
    _io_backup_base : LibC::Char*
    _io_save_end : LibC::Char*
    _markers : X_IoMarker*
    _chain : X_IoFile*
    _fileno : LibC::Int
    _flags2 : LibC::Int
    _old_offset : X__OffT
    _cur_column : LibC::UShort
    _vtable_offset : LibC::Char
    _shortbuf : LibC::Char[1]
    _lock : X_IoLockT*
    _offset : X__Off64T
    _codecvt : X_IoCodecvt*
    _wide_data : X_IoWideData*
    _freeres_list : X_IoFile*
    _freeres_buf : Void*
    __pad5 : LibC::SizeT
    _mode : LibC::Int
    _unused2 : LibC::Char[20]
  end

  struct X_SizedString
    length : Uint32T
    flags : Uint32T
    c_string : LibC::Char[1]
  end

  struct X_YrArena
    flags : LibC::Int
    page_list_head : YrArenaPage*
    current_page : YrArenaPage*
  end

  struct X_YrArenaPage
    new_address : Uint8T*
    address : Uint8T*
    size : LibC::SizeT
    used : LibC::SizeT
    reloc_list_head : YrReloc*
    reloc_list_tail : YrReloc*
    next : X_YrArenaPage*
    prev : X_YrArenaPage*
  end

  struct YrCompiler
    errors : LibC::Int
    current_line : LibC::Int
    last_error : LibC::Int
    last_error_line : LibC::Int
    error_recovery : JmpBuf
    sz_arena : YrArena*
    rules_arena : YrArena*
    strings_arena : YrArena*
    code_arena : YrArena*
    re_code_arena : YrArena*
    compiled_rules_arena : YrArena*
    externals_arena : YrArena*
    namespaces_arena : YrArena*
    metas_arena : YrArena*
    matches_arena : YrArena*
    automaton_arena : YrArena*
    automaton : YrAcAutomaton*
    rules_table : YrHashTable*
    objects_table : YrHashTable*
    strings_table : YrHashTable*
    current_namespace : YrNamespace*
    current_rule : YrRule*
    fixup_stack_head : YrFixup*
    namespaces_count : LibC::Int
    loop_address : Uint8T[4]
    loop_identifier : LibC::Char[4]
    loop_depth : LibC::Int
    loop_for_of_mem_offset : LibC::Int
    file_name_stack : LibC::Char*[16]
    file_name_stack_ptr : LibC::Int
    last_error_extra_info : LibC::Char[256]
    lex_buf : LibC::Char[8192]
    lex_buf_ptr : LibC::Char*
    lex_buf_len : LibC::UShort
    include_base_dir : LibC::Char[1024]
    user_data : Void*
    incl_clbk_user_data : Void*
    re_ast_clbk_user_data : Void*
    callback : YrCompilerCallbackFunc
    include_callback : YrCompilerIncludeCallbackFunc
    include_free : YrCompilerIncludeFreeFunc
    re_ast_callback : YrCompilerReAstCallbackFunc
    atoms_config : YrAtomsConfig
  end

  struct X_YrFixup
    address : Void*
    next : X_YrFixup*
  end

  struct X_YrHashTable
    size : LibC::Int
    buckets : YrHashTableEntry*[1]
  end

  struct X_YrHashTableEntry
    key : Void*
    key_length : LibC::SizeT
    ns : LibC::Char*
    value : Void*
    next : X_YrHashTableEntry*
  end

  struct X_YrMappedFile
    file : LibC::Int
    size : LibC::SizeT
    data : Uint8T*
  end

  struct X_YrReloc
    offset : Uint32T
    next : X_YrReloc*
  end

  struct X_YrStream
    user_data : Void*
    read : YrStreamReadFunc
    write : YrStreamWriteFunc
  end

  struct X__JmpBufTag
    __jmpbuf : X__JmpBuf
    __mask_was_saved : LibC::Int
    __saved_mask : X__SigsetT
  end

  struct X__PthreadInternalList
    __prev : X__PthreadInternalList*
    __next : X__PthreadInternalList*
  end

  struct X__PthreadMutexS
    __lock : LibC::Int
    __count : LibC::UInt
    __owner : LibC::Int
    __nusers : LibC::UInt
    __kind : LibC::Int
    __spins : LibC::Short
    __elision : LibC::Short
    __list : X__PthreadListT
  end

  struct X__SigsetT
    __val : LibC::ULong[16]
  end

  struct YrAcAutomaton
    tables_size : Uint32T
    t_table_unused_candidate : Uint32T
    bitmask : LibC::ULong*
    t_table : YrAcTransitionTable
    m_table : YrAcMatchTable
    root : YrAcState*
  end

  struct YrAcMatch
    backtrack : Uint16T
  end

  struct YrAcState
    depth : Uint8T
    input : Uint8T
    t_table_slot : Uint32T
    failure : YrAcState*
    first_child : YrAcState*
    siblings : YrAcState*
    matches : YrAcMatch*
  end

  struct YrAcTables
    transitions : YrAcTransitionTable
    matches : YrAcMatchTable
  end

  struct YrArrayItems
    count : LibC::Int
    objects : YrObject*[1]
  end

  struct YrAtom
    length : Uint8T
    bytes : Uint8T[4]
    mask : Uint8T[4]
  end

  struct YrAtomListItem
    atom : YrAtom
    backtrack : Uint16T
    forward_code : Uint8T*
    backward_code : Uint8T*
    next : YrAtomListItem*
  end

  struct YrAtomQualityTableEntry
    atom : Uint8T[4]
    quality : Uint8T
  end

  struct YrAtomTree
    root_node : YrAtomTreeNode*
  end

  struct YrAtomTreeNode
    type : Uint8T
    atom : YrAtom
    re_nodes : ReNode*[4]
    children_head : YrAtomTreeNode*
    children_tail : YrAtomTreeNode*
    next_sibling : YrAtomTreeNode*
  end

  struct YrAtomsConfig
    get_atom_quality : YrAtomsQualityFunc
    quality_table : YrAtomQualityTableEntry*
    quality_warning_threshold : LibC::Int
    quality_table_entries : LibC::Int
    free_quality_table : LibC::Int
  end

  struct YrDictionaryItems
    used : LibC::Int
    free : LibC::Int
    objects : YrDictionaryItemsObjects[1]
  end

  struct YrDictionaryItemsObjects
    __cancel_jmp_buf : X__JmpBuf
    __mask_was_saved : LibC::Int
  end

  struct YrExternalVariable
    type : Int32T
    value : YrExternalVariableValue
  end

  struct YrMatch
    base : Int64T
    offset : Int64T
    match_length : Int32T
    data_length : Int32T
    data : Uint8T*
    chain_length : Int32T
    prev : YrMatch*
    next : YrMatch*
  end

  struct YrMatches
    count : Int32T
  end

  struct YrMemoryBlock
    size : LibC::SizeT
    base : Uint64T
    context : Void*
    fetch_data : YrMemoryBlockFetchDataFunc
  end

  struct YrMemoryBlockIterator
    context : Void*
    first : YrMemoryBlockIteratorFunc
    next : YrMemoryBlockIteratorFunc
  end

  struct YrMeta
    type : Int32T
    integer : Int64T
  end

  struct YrModifier
    flags : Int32T
    xor_min : Uint8T
    xor_max : Uint8T
  end

  struct YrModule
    name : LibC::Char*
    declarations : YrExtDeclarationsFunc
    load : YrExtLoadFunc
    unload : YrExtUnloadFunc
    initialize : YrExtInitializeFunc
    finalize : YrExtFinalizeFunc
  end

  struct YrModuleImport
    module_name : LibC::Char*
    module_data : Void*
    module_data_size : LibC::SizeT
  end

  struct YrNamespace
    t_flags : Int32T[32]
  end

  struct YrObject
    canary : LibC::Int
    type : Int8T
    identifier : LibC::Char*
    parent : YrObject*
    data : Void*
    value : YrValue
  end

  struct YrObjectArray
    canary : LibC::Int
    type : Int8T
    identifier : LibC::Char*
    parent : YrObject*
    data : Void*
    prototype_item : YrObject*
    items : YrArrayItems*
  end

  struct YrObjectDictionary
    canary : LibC::Int
    type : Int8T
    identifier : LibC::Char*
    parent : YrObject*
    data : Void*
    prototype_item : YrObject*
    items : YrDictionaryItems*
  end

  struct YrObjectFunction
    canary : LibC::Int
    type : Int8T
    identifier : LibC::Char*
    parent : YrObject*
    data : Void*
    return_obj : YrObject*
    prototypes : YrObjectFunctionPrototypes[10]
  end

  struct YrObjectFunctionPrototypes
    arguments_fmt : LibC::Char*
    code : YrModuleFunc
  end

  struct YrObjectStructure
    canary : LibC::Int
    type : Int8T
    identifier : LibC::Char*
    parent : YrObject*
    data : Void*
    members : YrStructureMember*
  end

  struct YrRule
    g_flags : Int32T
    t_flags : Int32T[32]
    num_atoms : Int32T
    time_cost : Int64T
    time_cost_per_thread : Int64T[32]
  end

  struct YrRules
    tidx_mask : UInt8[4]
    code_start : Uint8T*
    mutex : YrMutex
    arena : YrArena*
    rules_list_head : YrRule*
    externals_list_head : YrExternalVariable*
    ac_transition_table : YrAcTransitionTable
    ac_match_table : YrAcMatchTable
    ac_tables_size : Uint32T
    time_cost : Uint64T
  end

  struct YrRulesStats
    rules : Uint32T
    strings : Uint32T
    ac_matches : Uint32T
    ac_root_match_list_length : Uint32T
    ac_average_match_list_length : LibC::Float
    top_ac_match_list_lengths : Uint32T[100]
    ac_match_list_length_pctls : Uint32T[101]
    ac_tables_size : Uint32T
  end

  struct YrScanContext
    file_size : Uint64T
    entry_point : Uint64T
    flags : LibC::Int
    tidx : LibC::Int
    canary : LibC::Int
    timeout : Uint64T
    user_data : Void*
    callback : YrCallbackFunc
    rules : YrRules*
    last_error_string : YrString*
    iterator : YrMemoryBlockIterator*
    objects_table : YrHashTable*
    matches_arena : YrArena*
    matching_strings_arena : YrArena*
    stopwatch : YrStopwatch
    re_fiber_pool : ReFiberPool
  end

  struct YrString
    g_flags : Int32T
    length : Int32T
    chain_gap_min : Int32T
    chain_gap_max : Int32T
    fixed_offset : Int64T
    matches : YrMatches[32]
    private_matches : YrMatches[32]
    unconfirmed_matches : YrMatches[32]
  end

  struct YrStructureMember
    object : YrObject*
    next : YrStructureMember*
  end

  type File = X_IoFile
  type SizedString = X_SizedString
  type X__PthreadListT = X__PthreadInternalList
  type YrAcMatchTableEntry = Void*
  type YrArena = X_YrArena
  type YrArenaPage = X_YrArenaPage
  type YrConfigName = X_YrConfigName
  type YrFixup = X_YrFixup
  type YrHashTable = X_YrHashTable
  type YrHashTableEntry = X_YrHashTableEntry
  type YrMappedFile = X_YrMappedFile
  type YrReloc = X_YrReloc
  type YrStopwatch = X_YrStopwatch
  type YrStream = X_YrStream

  union PthreadMutexT
    __data : X__PthreadMutexS
    __size : LibC::Char[40]
    __align : LibC::Long
  end

  union YrExternalVariableValue
    i : Int64T
    f : LibC::Double
    s : LibC::Char*
  end

  union YrValue
    i : Int64T
    d : LibC::Double
    p : Void*
    o : YrObject*
    s : YrString*
    ss : SizedString*
    re : Re*
  end
end
