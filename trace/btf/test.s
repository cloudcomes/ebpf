	.text
	.file	"test.c"
	.globl	test                            # -- Begin function test
	.p2align	3
	.type	test,@function
test:                                   # @test
.Lfunc_begin0:
	.file	1 "/home/cloudcome/ebpf/trace/btf" "test.c"
	.loc	1 6 0                           # test.c:6:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	*(u64 *)(r10 - 8) = r1
.Ltmp0:
	.loc	1 7 12 prologue_end             # test.c:7:12
.Ltmp1:
.Ltmp2:
	r1 = *(u64 *)(r10 - 8)
	.loc	1 7 5 is_stmt 0                 # test.c:7:5
.Ltmp3:
	r0 = *(u32 *)(r1 + 0)
	exit
.Ltmp4:
.Ltmp5:
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	14                              # DW_FORM_strp
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	14                              # DW_FORM_strp
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                               # DWARF version number
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x7c DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	12                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2a:0x28 DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	90
	.long	.Linfo_string3                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	82                              # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x43:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string5                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.long	89                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x52:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	5                               # Abbrev [5] 0x59:0x5 DW_TAG_pointer_type
	.long	94                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0x5e:0x21 DW_TAG_structure_type
	.long	.Linfo_string9                  # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	1                               # DW_AT_decl_file
	.byte	1                               # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x66:0xc DW_TAG_member
	.long	.Linfo_string6                  # DW_AT_name
	.long	82                              # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	2                               # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	7                               # Abbrev [7] 0x72:0xc DW_TAG_member
	.long	.Linfo_string7                  # DW_AT_name
	.long	127                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.byte	4                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x7f:0x7 DW_TAG_base_type
	.long	.Linfo_string8                  # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 13.0.0-2" # string offset=0
.Linfo_string1:
	.asciz	"test.c"                        # string offset=30
.Linfo_string2:
	.asciz	"/home/cloudcome/ebpf/trace/btf" # string offset=37
.Linfo_string3:
	.asciz	"test"                          # string offset=68
.Linfo_string4:
	.asciz	"int"                           # string offset=73
.Linfo_string5:
	.asciz	"t"                             # string offset=77
.Linfo_string6:
	.asciz	"a"                             # string offset=79
.Linfo_string7:
	.asciz	"b"                             # string offset=81
.Linfo_string8:
	.asciz	"char"                          # string offset=83
.Linfo_string9:
	.asciz	"A"                             # string offset=88
	.section	.BTF,"",@progbits
	.short	60319                           # 0xeb9f
	.byte	1
	.byte	0
	.long	24
	.long	0
	.long	112
	.long	112
	.long	106
	.long	0                               # BTF_KIND_FUNC_PROTO(id = 1)
	.long	218103809                       # 0xd000001
	.long	2
	.long	0
	.long	3
	.long	1                               # BTF_KIND_INT(id = 2)
	.long	16777216                        # 0x1000000
	.long	4
	.long	16777248                        # 0x1000020
	.long	0                               # BTF_KIND_PTR(id = 3)
	.long	33554432                        # 0x2000000
	.long	4
	.long	5                               # BTF_KIND_STRUCT(id = 4)
	.long	67108866                        # 0x4000002
	.long	8
	.long	7
	.long	2
	.long	0                               # 0x0
	.long	9
	.long	5
	.long	32                              # 0x20
	.long	11                              # BTF_KIND_INT(id = 5)
	.long	16777216                        # 0x1000000
	.long	1
	.long	16777224                        # 0x1000008
	.long	16                              # BTF_KIND_FUNC(id = 6)
	.long	201326593                       # 0xc000001
	.long	1
	.byte	0                               # string offset=0
	.ascii	"int"                           # string offset=1
	.byte	0
	.byte	65                              # string offset=5
	.byte	0
	.byte	97                              # string offset=7
	.byte	0
	.byte	98                              # string offset=9
	.byte	0
	.ascii	"char"                          # string offset=11
	.byte	0
	.ascii	"test"                          # string offset=16
	.byte	0
	.ascii	".text"                         # string offset=21
	.byte	0
	.ascii	"/home/cloudcome/ebpf/trace/btf/test.c" # string offset=27
	.byte	0
	.ascii	"int test(struct A *t) {"       # string offset=65
	.byte	0
	.ascii	"    return t->a;"              # string offset=89
	.byte	0
	.section	.BTF.ext,"",@progbits
	.short	60319                           # 0xeb9f
	.byte	1
	.byte	0
	.long	32
	.long	0
	.long	20
	.long	20
	.long	60
	.long	80
	.long	0
	.long	8                               # FuncInfo
	.long	21                              # FuncInfo section string offset=21
	.long	1
	.long	.Lfunc_begin0
	.long	6
	.long	16                              # LineInfo
	.long	21                              # LineInfo section string offset=21
	.long	3
	.long	.Lfunc_begin0
	.long	27
	.long	65
	.long	6144                            # Line 6 Col 0
	.long	.Ltmp2
	.long	27
	.long	89
	.long	7180                            # Line 7 Col 12
	.long	.Ltmp3
	.long	27
	.long	89
	.long	7173                            # Line 7 Col 5
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
