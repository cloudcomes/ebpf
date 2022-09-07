	.text
	.file	"xdp.c"
	.file	1 "/home/cloudcome/ebpf/basic/hello" "xdp.c"
	.file	2 "/usr/include/linux" "bpf.h"
	.section	prog,"ax",@progbits
	.globl	xdp_drop                        # -- Begin function xdp_drop
	.p2align	3
	.type	xdp_drop,@function
xdp_drop:                               # @xdp_drop
.Lfunc_begin0:
	.loc	1 9 0                           # xdp.c:9:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: xdp_drop:ctx <- undef
	.loc	1 10 5 prologue_end             # xdp.c:10:5
.Ltmp0:
	r0 = 1
	exit
.Ltmp1:
.Ltmp2:
.Lfunc_end0:
	.size	xdp_drop, .Lfunc_end0-xdp_drop
	.cfi_endproc
                                        # -- End function
	.type	__license,@object               # @__license
	.section	license,"aw",@progbits
	.globl	__license
__license:
	.asciz	"GPL"
	.size	__license, 4

	.file	3 "/usr/include/asm-generic" "int-ll64.h"
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
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
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
	.byte	6                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	4                               # DW_TAG_enumeration_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	40                              # DW_TAG_enumerator
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	28                              # DW_AT_const_value
	.byte	15                              # DW_FORM_udata
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.ascii	"\227B"                         # DW_AT_GNU_all_call_sites
	.byte	25                              # DW_FORM_flag_present
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
	.byte	10                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
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
	.byte	11                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
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
	.byte	1                               # Abbrev [1] 0xb:0x116 DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	12                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3                  # DW_AT_name
	.long	63                              # DW_AT_type
                                        # DW_AT_external
	.byte	1                               # DW_AT_decl_file
	.byte	13                              # DW_AT_decl_line
	.byte	9                               # DW_AT_location
	.byte	3
	.quad	__license
	.byte	3                               # Abbrev [3] 0x3f:0xc DW_TAG_array_type
	.long	75                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.long	82                              # DW_AT_type
	.byte	4                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x4b:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x52:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	7                               # Abbrev [7] 0x59:0x2c DW_TAG_enumeration_type
	.long	133                             # DW_AT_type
	.long	.Linfo_string12                 # DW_AT_name
	.byte	4                               # DW_AT_byte_size
	.byte	2                               # DW_AT_decl_file
	.short	5272                            # DW_AT_decl_line
	.byte	8                               # Abbrev [8] 0x66:0x6 DW_TAG_enumerator
	.long	.Linfo_string7                  # DW_AT_name
	.byte	0                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x6c:0x6 DW_TAG_enumerator
	.long	.Linfo_string8                  # DW_AT_name
	.byte	1                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x72:0x6 DW_TAG_enumerator
	.long	.Linfo_string9                  # DW_AT_name
	.byte	2                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x78:0x6 DW_TAG_enumerator
	.long	.Linfo_string10                 # DW_AT_name
	.byte	3                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x7e:0x6 DW_TAG_enumerator
	.long	.Linfo_string11                 # DW_AT_name
	.byte	4                               # DW_AT_const_value
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x85:0x7 DW_TAG_base_type
	.long	.Linfo_string6                  # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	9                               # Abbrev [9] 0x8c:0x25 DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	90
                                        # DW_AT_GNU_all_call_sites
	.long	.Linfo_string13                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	8                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	177                             # DW_AT_type
                                        # DW_AT_external
	.byte	10                              # Abbrev [10] 0xa5:0xb DW_TAG_formal_parameter
	.long	.Linfo_string15                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	8                               # DW_AT_decl_line
	.long	184                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0xb1:0x7 DW_TAG_base_type
	.long	.Linfo_string14                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	11                              # Abbrev [11] 0xb8:0x5 DW_TAG_pointer_type
	.long	189                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0xbd:0x58 DW_TAG_structure_type
	.long	.Linfo_string23                 # DW_AT_name
	.byte	24                              # DW_AT_byte_size
	.byte	2                               # DW_AT_decl_file
	.short	5283                            # DW_AT_decl_line
	.byte	13                              # Abbrev [13] 0xc6:0xd DW_TAG_member
	.long	.Linfo_string16                 # DW_AT_name
	.long	277                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5284                            # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	13                              # Abbrev [13] 0xd3:0xd DW_TAG_member
	.long	.Linfo_string18                 # DW_AT_name
	.long	277                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5285                            # DW_AT_decl_line
	.byte	4                               # DW_AT_data_member_location
	.byte	13                              # Abbrev [13] 0xe0:0xd DW_TAG_member
	.long	.Linfo_string19                 # DW_AT_name
	.long	277                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5286                            # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	13                              # Abbrev [13] 0xed:0xd DW_TAG_member
	.long	.Linfo_string20                 # DW_AT_name
	.long	277                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5288                            # DW_AT_decl_line
	.byte	12                              # DW_AT_data_member_location
	.byte	13                              # Abbrev [13] 0xfa:0xd DW_TAG_member
	.long	.Linfo_string21                 # DW_AT_name
	.long	277                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5289                            # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	13                              # Abbrev [13] 0x107:0xd DW_TAG_member
	.long	.Linfo_string22                 # DW_AT_name
	.long	277                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5291                            # DW_AT_decl_line
	.byte	20                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	14                              # Abbrev [14] 0x115:0xb DW_TAG_typedef
	.long	133                             # DW_AT_type
	.long	.Linfo_string17                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 13.0.0-2" # string offset=0
.Linfo_string1:
	.asciz	"xdp.c"                         # string offset=30
.Linfo_string2:
	.asciz	"/home/cloudcome/ebpf/basic/hello" # string offset=36
.Linfo_string3:
	.asciz	"__license"                     # string offset=69
.Linfo_string4:
	.asciz	"char"                          # string offset=79
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=84
.Linfo_string6:
	.asciz	"unsigned int"                  # string offset=104
.Linfo_string7:
	.asciz	"XDP_ABORTED"                   # string offset=117
.Linfo_string8:
	.asciz	"XDP_DROP"                      # string offset=129
.Linfo_string9:
	.asciz	"XDP_PASS"                      # string offset=138
.Linfo_string10:
	.asciz	"XDP_TX"                        # string offset=147
.Linfo_string11:
	.asciz	"XDP_REDIRECT"                  # string offset=154
.Linfo_string12:
	.asciz	"xdp_action"                    # string offset=167
.Linfo_string13:
	.asciz	"xdp_drop"                      # string offset=178
.Linfo_string14:
	.asciz	"int"                           # string offset=187
.Linfo_string15:
	.asciz	"ctx"                           # string offset=191
.Linfo_string16:
	.asciz	"data"                          # string offset=195
.Linfo_string17:
	.asciz	"__u32"                         # string offset=200
.Linfo_string18:
	.asciz	"data_end"                      # string offset=206
.Linfo_string19:
	.asciz	"data_meta"                     # string offset=215
.Linfo_string20:
	.asciz	"ingress_ifindex"               # string offset=225
.Linfo_string21:
	.asciz	"rx_queue_index"                # string offset=241
.Linfo_string22:
	.asciz	"egress_ifindex"                # string offset=256
.Linfo_string23:
	.asciz	"xdp_md"                        # string offset=271
	.section	.BTF,"",@progbits
	.short	60319                           # 0xeb9f
	.byte	1
	.byte	0
	.long	24
	.long	0
	.long	268
	.long	268
	.long	219
	.long	0                               # BTF_KIND_PTR(id = 1)
	.long	33554432                        # 0x2000000
	.long	2
	.long	1                               # BTF_KIND_STRUCT(id = 2)
	.long	67108870                        # 0x4000006
	.long	24
	.long	8
	.long	3
	.long	0                               # 0x0
	.long	13
	.long	3
	.long	32                              # 0x20
	.long	22
	.long	3
	.long	64                              # 0x40
	.long	32
	.long	3
	.long	96                              # 0x60
	.long	48
	.long	3
	.long	128                             # 0x80
	.long	63
	.long	3
	.long	160                             # 0xa0
	.long	78                              # BTF_KIND_TYPEDEF(id = 3)
	.long	134217728                       # 0x8000000
	.long	4
	.long	84                              # BTF_KIND_INT(id = 4)
	.long	16777216                        # 0x1000000
	.long	4
	.long	32                              # 0x20
	.long	0                               # BTF_KIND_FUNC_PROTO(id = 5)
	.long	218103809                       # 0xd000001
	.long	6
	.long	97
	.long	1
	.long	101                             # BTF_KIND_INT(id = 6)
	.long	16777216                        # 0x1000000
	.long	4
	.long	16777248                        # 0x1000020
	.long	105                             # BTF_KIND_FUNC(id = 7)
	.long	201326593                       # 0xc000001
	.long	5
	.long	176                             # BTF_KIND_INT(id = 8)
	.long	16777216                        # 0x1000000
	.long	1
	.long	16777224                        # 0x1000008
	.long	0                               # BTF_KIND_ARRAY(id = 9)
	.long	50331648                        # 0x3000000
	.long	0
	.long	8
	.long	10
	.long	4
	.long	181                             # BTF_KIND_INT(id = 10)
	.long	16777216                        # 0x1000000
	.long	4
	.long	32                              # 0x20
	.long	201                             # BTF_KIND_VAR(id = 11)
	.long	234881024                       # 0xe000000
	.long	9
	.long	1
	.long	211                             # BTF_KIND_DATASEC(id = 12)
	.long	251658241                       # 0xf000001
	.long	0
	.long	11
	.long	__license
	.long	4
	.byte	0                               # string offset=0
	.ascii	"xdp_md"                        # string offset=1
	.byte	0
	.ascii	"data"                          # string offset=8
	.byte	0
	.ascii	"data_end"                      # string offset=13
	.byte	0
	.ascii	"data_meta"                     # string offset=22
	.byte	0
	.ascii	"ingress_ifindex"               # string offset=32
	.byte	0
	.ascii	"rx_queue_index"                # string offset=48
	.byte	0
	.ascii	"egress_ifindex"                # string offset=63
	.byte	0
	.ascii	"__u32"                         # string offset=78
	.byte	0
	.ascii	"unsigned int"                  # string offset=84
	.byte	0
	.ascii	"ctx"                           # string offset=97
	.byte	0
	.ascii	"int"                           # string offset=101
	.byte	0
	.ascii	"xdp_drop"                      # string offset=105
	.byte	0
	.ascii	"prog"                          # string offset=114
	.byte	0
	.ascii	"/home/cloudcome/ebpf/basic/hello/xdp.c" # string offset=119
	.byte	0
	.ascii	"    return foo();"             # string offset=158
	.byte	0
	.ascii	"char"                          # string offset=176
	.byte	0
	.ascii	"__ARRAY_SIZE_TYPE__"           # string offset=181
	.byte	0
	.ascii	"__license"                     # string offset=201
	.byte	0
	.ascii	"license"                       # string offset=211
	.byte	0
	.section	.BTF.ext,"",@progbits
	.short	60319                           # 0xeb9f
	.byte	1
	.byte	0
	.long	32
	.long	0
	.long	20
	.long	20
	.long	28
	.long	48
	.long	0
	.long	8                               # FuncInfo
	.long	114                             # FuncInfo section string offset=114
	.long	1
	.long	.Lfunc_begin0
	.long	7
	.long	16                              # LineInfo
	.long	114                             # LineInfo section string offset=114
	.long	1
	.long	.Ltmp0
	.long	119
	.long	158
	.long	10245                           # Line 10 Col 5
	.addrsig
	.addrsig_sym xdp_drop
	.addrsig_sym __license
	.section	.debug_line,"",@progbits
.Lline_table_start0:
