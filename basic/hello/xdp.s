	.text
	.file	"xdp.c"
	.file	1 "/root/cloud/ebpf/basic/hello" "xdp.c"
	.file	2 "/usr/include/linux" "bpf.h"
	.section	prog,"ax",@progbits
	.globl	xdp_drop                # -- Begin function xdp_drop
	.p2align	3
	.type	xdp_drop,@function
xdp_drop:                               # @xdp_drop
.Lfunc_begin0:
	.loc	1 10 0                  # xdp.c:10:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	*(u64 *)(r10 - 8) = r1
.Ltmp0:
	.loc	1 11 12 prologue_end    # xdp.c:11:12
.Ltmp1:
.Ltmp2:
	call foo
	.loc	1 11 5 is_stmt 0        # xdp.c:11:5
.Ltmp3:
	exit
.Ltmp4:
.Ltmp5:
.Lfunc_end0:
	.size	xdp_drop, .Lfunc_end0-xdp_drop
	.cfi_endproc
                                        # -- End function
	.text
	.p2align	3               # -- Begin function foo
	.type	foo,@function
foo:                                    # @foo
.Lfunc_begin1:
	.loc	1 4 0 is_stmt 1         # xdp.c:4:0
	.cfi_startproc
# %bb.0:
	r0 = 1
.Ltmp6:
	.loc	1 5 5 prologue_end      # xdp.c:5:5
.Ltmp7:
.Ltmp8:
	exit
.Ltmp9:
.Ltmp10:
.Lfunc_end1:
	.size	foo, .Lfunc_end1-foo
	.cfi_endproc
                                        # -- End function
	.type	__license,@object       # @__license
	.section	license,"aw",@progbits
	.globl	__license
__license:
	.asciz	"GPL"
	.size	__license, 4

	.file	3 "/usr/include/asm-generic" "int-ll64.h"
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 10.0.0-4ubuntu1 " # string offset=0
.Linfo_string1:
	.asciz	"xdp.c"                 # string offset=31
.Linfo_string2:
	.asciz	"/root/cloud/ebpf/basic/hello" # string offset=37
.Linfo_string3:
	.asciz	"__license"             # string offset=66
.Linfo_string4:
	.asciz	"char"                  # string offset=76
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"   # string offset=81
.Linfo_string6:
	.asciz	"unsigned int"          # string offset=101
.Linfo_string7:
	.asciz	"XDP_ABORTED"           # string offset=114
.Linfo_string8:
	.asciz	"XDP_DROP"              # string offset=126
.Linfo_string9:
	.asciz	"XDP_PASS"              # string offset=135
.Linfo_string10:
	.asciz	"XDP_TX"                # string offset=144
.Linfo_string11:
	.asciz	"XDP_REDIRECT"          # string offset=151
.Linfo_string12:
	.asciz	"xdp_action"            # string offset=164
.Linfo_string13:
	.asciz	"xdp_drop"              # string offset=175
.Linfo_string14:
	.asciz	"int"                   # string offset=184
.Linfo_string15:
	.asciz	"foo"                   # string offset=188
.Linfo_string16:
	.asciz	"ctx"                   # string offset=192
.Linfo_string17:
	.asciz	"data"                  # string offset=196
.Linfo_string18:
	.asciz	"__u32"                 # string offset=201
.Linfo_string19:
	.asciz	"data_end"              # string offset=207
.Linfo_string20:
	.asciz	"data_meta"             # string offset=216
.Linfo_string21:
	.asciz	"ingress_ifindex"       # string offset=226
.Linfo_string22:
	.asciz	"rx_queue_index"        # string offset=242
.Linfo_string23:
	.asciz	"xdp_md"                # string offset=257
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	4                       # DW_TAG_enumeration_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	40                      # DW_TAG_enumerator
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	28                      # DW_AT_const_value
	.byte	15                      # DW_FORM_udata
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                       # DWARF version number
	.long	.debug_abbrev           # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x125 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	0                       # DW_AT_low_pc
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	2                       # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3          # DW_AT_name
	.long	63                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.byte	9                       # DW_AT_location
	.byte	3
	.quad	__license
	.byte	3                       # Abbrev [3] 0x3f:0xc DW_TAG_array_type
	.long	75                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.long	82                      # DW_AT_type
	.byte	4                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x4b:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x52:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	7                       # Abbrev [7] 0x59:0x2c DW_TAG_enumeration_type
	.long	133                     # DW_AT_type
	.long	.Linfo_string12         # DW_AT_name
	.byte	4                       # DW_AT_byte_size
	.byte	2                       # DW_AT_decl_file
	.short	3151                    # DW_AT_decl_line
	.byte	8                       # Abbrev [8] 0x66:0x6 DW_TAG_enumerator
	.long	.Linfo_string7          # DW_AT_name
	.byte	0                       # DW_AT_const_value
	.byte	8                       # Abbrev [8] 0x6c:0x6 DW_TAG_enumerator
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_const_value
	.byte	8                       # Abbrev [8] 0x72:0x6 DW_TAG_enumerator
	.long	.Linfo_string9          # DW_AT_name
	.byte	2                       # DW_AT_const_value
	.byte	8                       # Abbrev [8] 0x78:0x6 DW_TAG_enumerator
	.long	.Linfo_string10         # DW_AT_name
	.byte	3                       # DW_AT_const_value
	.byte	8                       # Abbrev [8] 0x7e:0x6 DW_TAG_enumerator
	.long	.Linfo_string11         # DW_AT_name
	.byte	4                       # DW_AT_const_value
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x85:0x7 DW_TAG_base_type
	.long	.Linfo_string6          # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x8c:0x28 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	90
	.long	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	205                     # DW_AT_type
                                        # DW_AT_external
	.byte	10                      # Abbrev [10] 0xa5:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.long	212                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0xb4:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	90
	.long	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	205                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0xcd:0x7 DW_TAG_base_type
	.long	.Linfo_string14         # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	12                      # Abbrev [12] 0xd4:0x5 DW_TAG_pointer_type
	.long	217                     # DW_AT_type
	.byte	13                      # Abbrev [13] 0xd9:0x4b DW_TAG_structure_type
	.long	.Linfo_string23         # DW_AT_name
	.byte	20                      # DW_AT_byte_size
	.byte	2                       # DW_AT_decl_file
	.short	3162                    # DW_AT_decl_line
	.byte	14                      # Abbrev [14] 0xe2:0xd DW_TAG_member
	.long	.Linfo_string17         # DW_AT_name
	.long	292                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	3163                    # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	14                      # Abbrev [14] 0xef:0xd DW_TAG_member
	.long	.Linfo_string19         # DW_AT_name
	.long	292                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	3164                    # DW_AT_decl_line
	.byte	4                       # DW_AT_data_member_location
	.byte	14                      # Abbrev [14] 0xfc:0xd DW_TAG_member
	.long	.Linfo_string20         # DW_AT_name
	.long	292                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	3165                    # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	14                      # Abbrev [14] 0x109:0xd DW_TAG_member
	.long	.Linfo_string21         # DW_AT_name
	.long	292                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	3167                    # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	14                      # Abbrev [14] 0x116:0xd DW_TAG_member
	.long	.Linfo_string22         # DW_AT_name
	.long	292                     # DW_AT_type
	.byte	2                       # DW_AT_decl_file
	.short	3168                    # DW_AT_decl_line
	.byte	16                      # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x124:0xb DW_TAG_typedef
	.long	133                     # DW_AT_type
	.long	.Linfo_string18         # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	27                      # DW_AT_decl_line
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Lfunc_begin0
	.quad	.Lfunc_end0
	.quad	.Lfunc_begin1
	.quad	.Lfunc_end1
	.quad	0
	.quad	0
	.section	.BTF,"",@progbits
	.short	60319                   # 0xeb9f
	.byte	1
	.byte	0
	.long	24
	.long	0
	.long	280
	.long	280
	.long	281
	.long	0                       # BTF_KIND_FUNC_PROTO(id = 1)
	.long	218103809               # 0xd000001
	.long	2
	.long	0
	.long	3
	.long	1                       # BTF_KIND_INT(id = 2)
	.long	16777216                # 0x1000000
	.long	4
	.long	16777248                # 0x1000020
	.long	0                       # BTF_KIND_PTR(id = 3)
	.long	33554432                # 0x2000000
	.long	4
	.long	5                       # BTF_KIND_STRUCT(id = 4)
	.long	67108869                # 0x4000005
	.long	20
	.long	12
	.long	5
	.long	0                       # 0x0
	.long	17
	.long	5
	.long	32                      # 0x20
	.long	26
	.long	5
	.long	64                      # 0x40
	.long	36
	.long	5
	.long	96                      # 0x60
	.long	52
	.long	5
	.long	128                     # 0x80
	.long	67                      # BTF_KIND_TYPEDEF(id = 5)
	.long	134217728               # 0x8000000
	.long	6
	.long	73                      # BTF_KIND_INT(id = 6)
	.long	16777216                # 0x1000000
	.long	4
	.long	32                      # 0x20
	.long	86                      # BTF_KIND_FUNC(id = 7)
	.long	201326593               # 0xc000001
	.long	1
	.long	0                       # BTF_KIND_FUNC_PROTO(id = 8)
	.long	218103808               # 0xd000000
	.long	2
	.long	186                     # BTF_KIND_FUNC(id = 9)
	.long	201326592               # 0xc000000
	.long	8
	.long	238                     # BTF_KIND_INT(id = 10)
	.long	16777216                # 0x1000000
	.long	1
	.long	16777224                # 0x1000008
	.long	0                       # BTF_KIND_ARRAY(id = 11)
	.long	50331648                # 0x3000000
	.long	0
	.long	10
	.long	12
	.long	4
	.long	243                     # BTF_KIND_INT(id = 12)
	.long	16777216                # 0x1000000
	.long	4
	.long	32                      # 0x20
	.long	263                     # BTF_KIND_VAR(id = 13)
	.long	234881024               # 0xe000000
	.long	11
	.long	1
	.long	273                     # BTF_KIND_DATASEC(id = 14)
	.long	251658241               # 0xf000001
	.long	0
	.long	13
	.long	__license
	.long	4
	.byte	0                       # string offset=0
	.ascii	"int"                   # string offset=1
	.byte	0
	.ascii	"xdp_md"                # string offset=5
	.byte	0
	.ascii	"data"                  # string offset=12
	.byte	0
	.ascii	"data_end"              # string offset=17
	.byte	0
	.ascii	"data_meta"             # string offset=26
	.byte	0
	.ascii	"ingress_ifindex"       # string offset=36
	.byte	0
	.ascii	"rx_queue_index"        # string offset=52
	.byte	0
	.ascii	"__u32"                 # string offset=67
	.byte	0
	.ascii	"unsigned int"          # string offset=73
	.byte	0
	.ascii	"xdp_drop"              # string offset=86
	.byte	0
	.ascii	"prog"                  # string offset=95
	.byte	0
	.ascii	"/root/cloud/ebpf/basic/hello/xdp.c" # string offset=100
	.byte	0
	.ascii	"int xdp_drop(struct xdp_md *ctx)" # string offset=135
	.byte	0
	.ascii	"    return foo();"     # string offset=168
	.byte	0
	.ascii	"foo"                   # string offset=186
	.byte	0
	.ascii	".text"                 # string offset=190
	.byte	0
	.ascii	"static int foo(void)"  # string offset=196
	.byte	0
	.ascii	"    return XDP_DROP;"  # string offset=217
	.byte	0
	.ascii	"char"                  # string offset=238
	.byte	0
	.ascii	"__ARRAY_SIZE_TYPE__"   # string offset=243
	.byte	0
	.ascii	"__license"             # string offset=263
	.byte	0
	.ascii	"license"               # string offset=273
	.byte	0
	.section	.BTF.ext,"",@progbits
	.short	60319                   # 0xeb9f
	.byte	1
	.byte	0
	.long	32
	.long	0
	.long	36
	.long	36
	.long	100
	.long	136
	.long	0
	.long	8                       # FuncInfo
	.long	95                      # FuncInfo section string offset=95
	.long	1
	.long	.Lfunc_begin0
	.long	7
	.long	190                     # FuncInfo section string offset=190
	.long	1
	.long	.Lfunc_begin1
	.long	9
	.long	16                      # LineInfo
	.long	95                      # LineInfo section string offset=95
	.long	3
	.long	.Lfunc_begin0
	.long	100
	.long	135
	.long	9216                    # Line 9 Col 0
	.long	.Ltmp2
	.long	100
	.long	168
	.long	11276                   # Line 11 Col 12
	.long	.Ltmp3
	.long	100
	.long	168
	.long	11269                   # Line 11 Col 5
	.long	190                     # LineInfo section string offset=190
	.long	2
	.long	.Lfunc_begin1
	.long	100
	.long	196
	.long	3072                    # Line 3 Col 0
	.long	.Ltmp8
	.long	100
	.long	217
	.long	5125                    # Line 5 Col 5
	.addrsig
	.addrsig_sym xdp_drop
	.addrsig_sym foo
	.addrsig_sym __license
	.section	.debug_line,"",@progbits
.Lline_table_start0:
