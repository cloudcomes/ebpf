	.text
	.file	"udp.c"
	.file	1 "/home/cloudcome/ebpf/basic/hello" "udp.c"
	.file	2 "/usr/include/linux" "bpf.h"
	.file	3 "/usr/include/linux" "in.h"
	.section	udp,"ax",@progbits
	.globl	xdp_drop                        # -- Begin function xdp_drop
	.p2align	3
	.type	xdp_drop,@function
xdp_drop:                               # @xdp_drop
.Lfunc_begin0:
	.loc	1 10 0                          # udp.c:10:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	*(u64 *)(r10 - 16) = r1
	r1 = 0
.Ltmp0:
	.loc	1 11 7 prologue_end             # udp.c:11:7
.Ltmp1:
.Ltmp2:
	*(u32 *)(r10 - 20) = r1
	.loc	1 13 30                         # udp.c:13:30
.Ltmp3:
	r1 = *(u64 *)(r10 - 16)
	.loc	1 13 35 is_stmt 0               # udp.c:13:35
.Ltmp4:
	r1 = *(u32 *)(r1 + 0)
	.loc	1 13 9                          # udp.c:13:9
.Ltmp5:
	*(u64 *)(r10 - 32) = r1
	.loc	1 14 34 is_stmt 1               # udp.c:14:34
.Ltmp6:
	r1 = *(u64 *)(r10 - 16)
	.loc	1 14 39 is_stmt 0               # udp.c:14:39
.Ltmp7:
	r1 = *(u32 *)(r1 + 4)
	.loc	1 14 9                          # udp.c:14:9
.Ltmp8:
	*(u64 *)(r10 - 40) = r1
	.loc	1 16 24 is_stmt 1               # udp.c:16:24
.Ltmp9:
	r1 = *(u64 *)(r10 - 32)
	.loc	1 16 18 is_stmt 0               # udp.c:16:18
.Ltmp10:
	*(u64 *)(r10 - 48) = r1
	r1 = 14
	.loc	1 18 10 is_stmt 1               # udp.c:18:10
.Ltmp11:
	*(u32 *)(r10 - 20) = r1
	.loc	1 20 22                         # udp.c:20:22
.Ltmp12:
	r1 = *(u64 *)(r10 - 32)
	.loc	1 20 29 is_stmt 0               # udp.c:20:29
.Ltmp13:
	r2 = *(u32 *)(r10 - 20)
	r2 <<= 32
	r2 s>>= 32
	.loc	1 20 27                         # udp.c:20:27
.Ltmp14:
	r1 += r2
	.loc	1 20 17                         # udp.c:20:17
.Ltmp15:
	*(u64 *)(r10 - 56) = r1
	.loc	1 21 10 is_stmt 1               # udp.c:21:10
.Ltmp16:
	r1 = *(u32 *)(r10 - 20)
	r1 += 20
	*(u32 *)(r10 - 20) = r1
.Ltmp17:
	.loc	1 22 7                          # udp.c:22:7
.Ltmp18:
.Ltmp19:
	r2 = *(u64 *)(r10 - 32)
	.loc	1 22 14 is_stmt 0               # udp.c:22:14
.Ltmp20:
	r1 = *(u32 *)(r10 - 20)
	r1 <<= 32
	r1 s>>= 32
	.loc	1 22 12                         # udp.c:22:12
.Ltmp21:
	r2 += r1
	.loc	1 22 23                         # udp.c:22:23
.Ltmp22:
	r1 = *(u64 *)(r10 - 40)
.Ltmp23:
.Ltmp24:
	.loc	1 22 7                          # udp.c:22:7
.Ltmp25:
	if r1 >= r2 goto LBB0_2
	goto LBB0_1
LBB0_1:
	.loc	1 0 7                           # udp.c:0:7
	r1 = 2
.Ltmp26:
	.loc	1 23 5 is_stmt 1                # udp.c:23:5
.Ltmp27:
.Ltmp28:
	*(u32 *)(r10 - 4) = r1
	goto LBB0_5
.Ltmp29:
.Ltmp30:
LBB0_2:
	.loc	1 26 7                          # udp.c:26:7
.Ltmp31:
	r1 = *(u64 *)(r10 - 56)
	.loc	1 26 11 is_stmt 0               # udp.c:26:11
.Ltmp32:
	r1 = *(u8 *)(r1 + 9)
.Ltmp33:
.Ltmp34:
	.loc	1 26 7                          # udp.c:26:7
.Ltmp35:
	if r1 != 17 goto LBB0_4
	goto LBB0_3
LBB0_3:
	.loc	1 0 7                           # udp.c:0:7
	r1 = 1
.Ltmp36:
	.loc	1 27 5 is_stmt 1                # udp.c:27:5
.Ltmp37:
.Ltmp38:
	*(u32 *)(r10 - 4) = r1
	goto LBB0_5
.Ltmp39:
.Ltmp40:
LBB0_4:
	.loc	1 0 5 is_stmt 0                 # udp.c:0:5
	r1 = 2
	.loc	1 30 3 is_stmt 1                # udp.c:30:3
.Ltmp41:
	*(u32 *)(r10 - 4) = r1
	goto LBB0_5
LBB0_5:
	.loc	1 31 1                          # udp.c:31:1
.Ltmp42:
	r0 = *(u32 *)(r10 - 4)
	exit
.Ltmp43:
.Ltmp44:
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

	.file	4 "/usr/include/asm-generic" "int-ll64.h"
	.file	5 "/usr/include/linux" "if_ether.h"
	.file	6 "/usr/include/linux" "types.h"
	.file	7 "/usr/include/linux" "ip.h"
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
	.byte	4                               # DW_TAG_enumeration_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
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
	.byte	12                              # Abbreviation Code
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
	.byte	13                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
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
	.byte	14                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
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
	.byte	16                              # Abbreviation Code
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
	.byte	17                              # Abbreviation Code
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
	.byte	18                              # Abbreviation Code
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
	.byte	19                              # Abbreviation Code
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
	.byte	20                              # Abbreviation Code
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
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	13                              # DW_AT_bit_size
	.byte	11                              # DW_FORM_data1
	.byte	12                              # DW_AT_bit_offset
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
	.byte	1                               # Abbrev [1] 0xb:0x33a DW_TAG_compile_unit
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
	.byte	33                              # DW_AT_decl_line
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
	.byte	9                               # Abbrev [9] 0x8c:0xb8 DW_TAG_enumeration_type
	.long	133                             # DW_AT_type
	.byte	4                               # DW_AT_byte_size
	.byte	3                               # DW_AT_decl_file
	.byte	28                              # DW_AT_decl_line
	.byte	8                               # Abbrev [8] 0x94:0x6 DW_TAG_enumerator
	.long	.Linfo_string13                 # DW_AT_name
	.byte	0                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x9a:0x6 DW_TAG_enumerator
	.long	.Linfo_string14                 # DW_AT_name
	.byte	1                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xa0:0x6 DW_TAG_enumerator
	.long	.Linfo_string15                 # DW_AT_name
	.byte	2                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xa6:0x6 DW_TAG_enumerator
	.long	.Linfo_string16                 # DW_AT_name
	.byte	4                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xac:0x6 DW_TAG_enumerator
	.long	.Linfo_string17                 # DW_AT_name
	.byte	6                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xb2:0x6 DW_TAG_enumerator
	.long	.Linfo_string18                 # DW_AT_name
	.byte	8                               # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xb8:0x6 DW_TAG_enumerator
	.long	.Linfo_string19                 # DW_AT_name
	.byte	12                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xbe:0x6 DW_TAG_enumerator
	.long	.Linfo_string20                 # DW_AT_name
	.byte	17                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xc4:0x6 DW_TAG_enumerator
	.long	.Linfo_string21                 # DW_AT_name
	.byte	22                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xca:0x6 DW_TAG_enumerator
	.long	.Linfo_string22                 # DW_AT_name
	.byte	29                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xd0:0x6 DW_TAG_enumerator
	.long	.Linfo_string23                 # DW_AT_name
	.byte	33                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xd6:0x6 DW_TAG_enumerator
	.long	.Linfo_string24                 # DW_AT_name
	.byte	41                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xdc:0x6 DW_TAG_enumerator
	.long	.Linfo_string25                 # DW_AT_name
	.byte	46                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xe2:0x6 DW_TAG_enumerator
	.long	.Linfo_string26                 # DW_AT_name
	.byte	47                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xe8:0x6 DW_TAG_enumerator
	.long	.Linfo_string27                 # DW_AT_name
	.byte	50                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xee:0x6 DW_TAG_enumerator
	.long	.Linfo_string28                 # DW_AT_name
	.byte	51                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xf4:0x6 DW_TAG_enumerator
	.long	.Linfo_string29                 # DW_AT_name
	.byte	92                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0xfa:0x6 DW_TAG_enumerator
	.long	.Linfo_string30                 # DW_AT_name
	.byte	94                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x100:0x6 DW_TAG_enumerator
	.long	.Linfo_string31                 # DW_AT_name
	.byte	98                              # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x106:0x6 DW_TAG_enumerator
	.long	.Linfo_string32                 # DW_AT_name
	.byte	103                             # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x10c:0x6 DW_TAG_enumerator
	.long	.Linfo_string33                 # DW_AT_name
	.byte	108                             # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x112:0x7 DW_TAG_enumerator
	.long	.Linfo_string34                 # DW_AT_name
	.ascii	"\204\001"                      # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x119:0x7 DW_TAG_enumerator
	.long	.Linfo_string35                 # DW_AT_name
	.ascii	"\210\001"                      # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x120:0x7 DW_TAG_enumerator
	.long	.Linfo_string36                 # DW_AT_name
	.ascii	"\211\001"                      # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x127:0x7 DW_TAG_enumerator
	.long	.Linfo_string37                 # DW_AT_name
	.ascii	"\217\001"                      # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x12e:0x7 DW_TAG_enumerator
	.long	.Linfo_string38                 # DW_AT_name
	.ascii	"\377\001"                      # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x135:0x7 DW_TAG_enumerator
	.long	.Linfo_string39                 # DW_AT_name
	.ascii	"\206\002"                      # DW_AT_const_value
	.byte	8                               # Abbrev [8] 0x13c:0x7 DW_TAG_enumerator
	.long	.Linfo_string40                 # DW_AT_name
	.ascii	"\207\002"                      # DW_AT_const_value
	.byte	0                               # End Of Children Mark
	.byte	10                              # Abbrev [10] 0x144:0x1 DW_TAG_pointer_type
	.byte	5                               # Abbrev [5] 0x145:0x7 DW_TAG_base_type
	.long	.Linfo_string41                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	11                              # Abbrev [11] 0x14c:0x6e DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	90
	.long	.Linfo_string42                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	442                             # DW_AT_type
                                        # DW_AT_external
	.byte	12                              # Abbrev [12] 0x165:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	40
	.long	.Linfo_string44                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.long	449                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0x173:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	36
	.long	.Linfo_string53                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	11                              # DW_AT_decl_line
	.long	442                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0x181:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	24
	.long	.Linfo_string45                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	13                              # DW_AT_decl_line
	.long	324                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0x18f:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	16
	.long	.Linfo_string47                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.long	324                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0x19d:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string54                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.long	553                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0x1ab:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string63                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	20                              # DW_AT_decl_line
	.long	651                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x1ba:0x7 DW_TAG_base_type
	.long	.Linfo_string43                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	14                              # Abbrev [14] 0x1c1:0x5 DW_TAG_pointer_type
	.long	454                             # DW_AT_type
	.byte	15                              # Abbrev [15] 0x1c6:0x58 DW_TAG_structure_type
	.long	.Linfo_string52                 # DW_AT_name
	.byte	24                              # DW_AT_byte_size
	.byte	2                               # DW_AT_decl_file
	.short	5283                            # DW_AT_decl_line
	.byte	16                              # Abbrev [16] 0x1cf:0xd DW_TAG_member
	.long	.Linfo_string45                 # DW_AT_name
	.long	542                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5284                            # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	16                              # Abbrev [16] 0x1dc:0xd DW_TAG_member
	.long	.Linfo_string47                 # DW_AT_name
	.long	542                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5285                            # DW_AT_decl_line
	.byte	4                               # DW_AT_data_member_location
	.byte	16                              # Abbrev [16] 0x1e9:0xd DW_TAG_member
	.long	.Linfo_string48                 # DW_AT_name
	.long	542                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5286                            # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	16                              # Abbrev [16] 0x1f6:0xd DW_TAG_member
	.long	.Linfo_string49                 # DW_AT_name
	.long	542                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5288                            # DW_AT_decl_line
	.byte	12                              # DW_AT_data_member_location
	.byte	16                              # Abbrev [16] 0x203:0xd DW_TAG_member
	.long	.Linfo_string50                 # DW_AT_name
	.long	542                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5289                            # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	16                              # Abbrev [16] 0x210:0xd DW_TAG_member
	.long	.Linfo_string51                 # DW_AT_name
	.long	542                             # DW_AT_type
	.byte	2                               # DW_AT_decl_file
	.short	5291                            # DW_AT_decl_line
	.byte	20                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	17                              # Abbrev [17] 0x21e:0xb DW_TAG_typedef
	.long	133                             # DW_AT_type
	.long	.Linfo_string46                 # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.byte	14                              # Abbrev [14] 0x229:0x5 DW_TAG_pointer_type
	.long	558                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x22e:0x2d DW_TAG_structure_type
	.long	.Linfo_string62                 # DW_AT_name
	.byte	14                              # DW_AT_byte_size
	.byte	5                               # DW_AT_decl_file
	.byte	165                             # DW_AT_decl_line
	.byte	19                              # Abbrev [19] 0x236:0xc DW_TAG_member
	.long	.Linfo_string55                 # DW_AT_name
	.long	603                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	166                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x242:0xc DW_TAG_member
	.long	.Linfo_string57                 # DW_AT_name
	.long	603                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	167                             # DW_AT_decl_line
	.byte	6                               # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x24e:0xc DW_TAG_member
	.long	.Linfo_string58                 # DW_AT_name
	.long	622                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	168                             # DW_AT_decl_line
	.byte	12                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0x25b:0xc DW_TAG_array_type
	.long	615                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x260:0x6 DW_TAG_subrange_type
	.long	82                              # DW_AT_type
	.byte	6                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x267:0x7 DW_TAG_base_type
	.long	.Linfo_string56                 # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	17                              # Abbrev [17] 0x26e:0xb DW_TAG_typedef
	.long	633                             # DW_AT_type
	.long	.Linfo_string61                 # DW_AT_name
	.byte	6                               # DW_AT_decl_file
	.byte	25                              # DW_AT_decl_line
	.byte	17                              # Abbrev [17] 0x279:0xb DW_TAG_typedef
	.long	644                             # DW_AT_type
	.long	.Linfo_string60                 # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	24                              # DW_AT_decl_line
	.byte	5                               # Abbrev [5] 0x284:0x7 DW_TAG_base_type
	.long	.Linfo_string59                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	2                               # DW_AT_byte_size
	.byte	14                              # Abbrev [14] 0x28b:0x5 DW_TAG_pointer_type
	.long	656                             # DW_AT_type
	.byte	18                              # Abbrev [18] 0x290:0x93 DW_TAG_structure_type
	.long	.Linfo_string78                 # DW_AT_name
	.byte	20                              # DW_AT_byte_size
	.byte	7                               # DW_AT_decl_file
	.byte	86                              # DW_AT_decl_line
	.byte	20                              # Abbrev [20] 0x298:0xf DW_TAG_member
	.long	.Linfo_string64                 # DW_AT_name
	.long	803                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	88                              # DW_AT_decl_line
	.byte	1                               # DW_AT_byte_size
	.byte	4                               # DW_AT_bit_size
	.byte	4                               # DW_AT_bit_offset
	.byte	0                               # DW_AT_data_member_location
	.byte	20                              # Abbrev [20] 0x2a7:0xf DW_TAG_member
	.long	.Linfo_string66                 # DW_AT_name
	.long	803                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	89                              # DW_AT_decl_line
	.byte	1                               # DW_AT_byte_size
	.byte	4                               # DW_AT_bit_size
	.byte	0                               # DW_AT_bit_offset
	.byte	0                               # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x2b6:0xc DW_TAG_member
	.long	.Linfo_string67                 # DW_AT_name
	.long	803                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	96                              # DW_AT_decl_line
	.byte	1                               # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x2c2:0xc DW_TAG_member
	.long	.Linfo_string68                 # DW_AT_name
	.long	622                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	97                              # DW_AT_decl_line
	.byte	2                               # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x2ce:0xc DW_TAG_member
	.long	.Linfo_string69                 # DW_AT_name
	.long	622                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	98                              # DW_AT_decl_line
	.byte	4                               # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x2da:0xc DW_TAG_member
	.long	.Linfo_string70                 # DW_AT_name
	.long	622                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	99                              # DW_AT_decl_line
	.byte	6                               # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x2e6:0xc DW_TAG_member
	.long	.Linfo_string71                 # DW_AT_name
	.long	803                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	100                             # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x2f2:0xc DW_TAG_member
	.long	.Linfo_string72                 # DW_AT_name
	.long	803                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	101                             # DW_AT_decl_line
	.byte	9                               # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x2fe:0xc DW_TAG_member
	.long	.Linfo_string73                 # DW_AT_name
	.long	814                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	102                             # DW_AT_decl_line
	.byte	10                              # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x30a:0xc DW_TAG_member
	.long	.Linfo_string75                 # DW_AT_name
	.long	825                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	103                             # DW_AT_decl_line
	.byte	12                              # DW_AT_data_member_location
	.byte	19                              # Abbrev [19] 0x316:0xc DW_TAG_member
	.long	.Linfo_string77                 # DW_AT_name
	.long	825                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	104                             # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	17                              # Abbrev [17] 0x323:0xb DW_TAG_typedef
	.long	615                             # DW_AT_type
	.long	.Linfo_string65                 # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	21                              # DW_AT_decl_line
	.byte	17                              # Abbrev [17] 0x32e:0xb DW_TAG_typedef
	.long	633                             # DW_AT_type
	.long	.Linfo_string74                 # DW_AT_name
	.byte	6                               # DW_AT_decl_file
	.byte	31                              # DW_AT_decl_line
	.byte	17                              # Abbrev [17] 0x339:0xb DW_TAG_typedef
	.long	542                             # DW_AT_type
	.long	.Linfo_string76                 # DW_AT_name
	.byte	6                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 13.0.0-2" # string offset=0
.Linfo_string1:
	.asciz	"udp.c"                         # string offset=30
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
	.asciz	"IPPROTO_IP"                    # string offset=178
.Linfo_string14:
	.asciz	"IPPROTO_ICMP"                  # string offset=189
.Linfo_string15:
	.asciz	"IPPROTO_IGMP"                  # string offset=202
.Linfo_string16:
	.asciz	"IPPROTO_IPIP"                  # string offset=215
.Linfo_string17:
	.asciz	"IPPROTO_TCP"                   # string offset=228
.Linfo_string18:
	.asciz	"IPPROTO_EGP"                   # string offset=240
.Linfo_string19:
	.asciz	"IPPROTO_PUP"                   # string offset=252
.Linfo_string20:
	.asciz	"IPPROTO_UDP"                   # string offset=264
.Linfo_string21:
	.asciz	"IPPROTO_IDP"                   # string offset=276
.Linfo_string22:
	.asciz	"IPPROTO_TP"                    # string offset=288
.Linfo_string23:
	.asciz	"IPPROTO_DCCP"                  # string offset=299
.Linfo_string24:
	.asciz	"IPPROTO_IPV6"                  # string offset=312
.Linfo_string25:
	.asciz	"IPPROTO_RSVP"                  # string offset=325
.Linfo_string26:
	.asciz	"IPPROTO_GRE"                   # string offset=338
.Linfo_string27:
	.asciz	"IPPROTO_ESP"                   # string offset=350
.Linfo_string28:
	.asciz	"IPPROTO_AH"                    # string offset=362
.Linfo_string29:
	.asciz	"IPPROTO_MTP"                   # string offset=373
.Linfo_string30:
	.asciz	"IPPROTO_BEETPH"                # string offset=385
.Linfo_string31:
	.asciz	"IPPROTO_ENCAP"                 # string offset=400
.Linfo_string32:
	.asciz	"IPPROTO_PIM"                   # string offset=414
.Linfo_string33:
	.asciz	"IPPROTO_COMP"                  # string offset=426
.Linfo_string34:
	.asciz	"IPPROTO_SCTP"                  # string offset=439
.Linfo_string35:
	.asciz	"IPPROTO_UDPLITE"               # string offset=452
.Linfo_string36:
	.asciz	"IPPROTO_MPLS"                  # string offset=468
.Linfo_string37:
	.asciz	"IPPROTO_ETHERNET"              # string offset=481
.Linfo_string38:
	.asciz	"IPPROTO_RAW"                   # string offset=498
.Linfo_string39:
	.asciz	"IPPROTO_MPTCP"                 # string offset=510
.Linfo_string40:
	.asciz	"IPPROTO_MAX"                   # string offset=524
.Linfo_string41:
	.asciz	"long int"                      # string offset=536
.Linfo_string42:
	.asciz	"xdp_drop"                      # string offset=545
.Linfo_string43:
	.asciz	"int"                           # string offset=554
.Linfo_string44:
	.asciz	"ctx"                           # string offset=558
.Linfo_string45:
	.asciz	"data"                          # string offset=562
.Linfo_string46:
	.asciz	"__u32"                         # string offset=567
.Linfo_string47:
	.asciz	"data_end"                      # string offset=573
.Linfo_string48:
	.asciz	"data_meta"                     # string offset=582
.Linfo_string49:
	.asciz	"ingress_ifindex"               # string offset=592
.Linfo_string50:
	.asciz	"rx_queue_index"                # string offset=608
.Linfo_string51:
	.asciz	"egress_ifindex"                # string offset=623
.Linfo_string52:
	.asciz	"xdp_md"                        # string offset=638
.Linfo_string53:
	.asciz	"ipsize"                        # string offset=645
.Linfo_string54:
	.asciz	"eth"                           # string offset=652
.Linfo_string55:
	.asciz	"h_dest"                        # string offset=656
.Linfo_string56:
	.asciz	"unsigned char"                 # string offset=663
.Linfo_string57:
	.asciz	"h_source"                      # string offset=677
.Linfo_string58:
	.asciz	"h_proto"                       # string offset=686
.Linfo_string59:
	.asciz	"unsigned short"                # string offset=694
.Linfo_string60:
	.asciz	"__u16"                         # string offset=709
.Linfo_string61:
	.asciz	"__be16"                        # string offset=715
.Linfo_string62:
	.asciz	"ethhdr"                        # string offset=722
.Linfo_string63:
	.asciz	"ip"                            # string offset=729
.Linfo_string64:
	.asciz	"ihl"                           # string offset=732
.Linfo_string65:
	.asciz	"__u8"                          # string offset=736
.Linfo_string66:
	.asciz	"version"                       # string offset=741
.Linfo_string67:
	.asciz	"tos"                           # string offset=749
.Linfo_string68:
	.asciz	"tot_len"                       # string offset=753
.Linfo_string69:
	.asciz	"id"                            # string offset=761
.Linfo_string70:
	.asciz	"frag_off"                      # string offset=764
.Linfo_string71:
	.asciz	"ttl"                           # string offset=773
.Linfo_string72:
	.asciz	"protocol"                      # string offset=777
.Linfo_string73:
	.asciz	"check"                         # string offset=786
.Linfo_string74:
	.asciz	"__sum16"                       # string offset=792
.Linfo_string75:
	.asciz	"saddr"                         # string offset=800
.Linfo_string76:
	.asciz	"__be32"                        # string offset=806
.Linfo_string77:
	.asciz	"daddr"                         # string offset=813
.Linfo_string78:
	.asciz	"iphdr"                         # string offset=819
	.section	.BTF,"",@progbits
	.short	60319                           # 0xeb9f
	.byte	1
	.byte	0
	.long	24
	.long	0
	.long	268
	.long	268
	.long	593
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
	.long	67108870                        # 0x4000006
	.long	24
	.long	12
	.long	5
	.long	0                               # 0x0
	.long	17
	.long	5
	.long	32                              # 0x20
	.long	26
	.long	5
	.long	64                              # 0x40
	.long	36
	.long	5
	.long	96                              # 0x60
	.long	52
	.long	5
	.long	128                             # 0x80
	.long	67
	.long	5
	.long	160                             # 0xa0
	.long	82                              # BTF_KIND_TYPEDEF(id = 5)
	.long	134217728                       # 0x8000000
	.long	6
	.long	88                              # BTF_KIND_INT(id = 6)
	.long	16777216                        # 0x1000000
	.long	4
	.long	32                              # 0x20
	.long	101                             # BTF_KIND_FUNC(id = 7)
	.long	201326593                       # 0xc000001
	.long	1
	.long	550                             # BTF_KIND_INT(id = 8)
	.long	16777216                        # 0x1000000
	.long	1
	.long	16777224                        # 0x1000008
	.long	0                               # BTF_KIND_ARRAY(id = 9)
	.long	50331648                        # 0x3000000
	.long	0
	.long	8
	.long	10
	.long	4
	.long	555                             # BTF_KIND_INT(id = 10)
	.long	16777216                        # 0x1000000
	.long	4
	.long	32                              # 0x20
	.long	575                             # BTF_KIND_VAR(id = 11)
	.long	234881024                       # 0xe000000
	.long	9
	.long	1
	.long	585                             # BTF_KIND_DATASEC(id = 12)
	.long	251658241                       # 0xf000001
	.long	0
	.long	11
	.long	__license
	.long	4
	.byte	0                               # string offset=0
	.ascii	"int"                           # string offset=1
	.byte	0
	.ascii	"xdp_md"                        # string offset=5
	.byte	0
	.ascii	"data"                          # string offset=12
	.byte	0
	.ascii	"data_end"                      # string offset=17
	.byte	0
	.ascii	"data_meta"                     # string offset=26
	.byte	0
	.ascii	"ingress_ifindex"               # string offset=36
	.byte	0
	.ascii	"rx_queue_index"                # string offset=52
	.byte	0
	.ascii	"egress_ifindex"                # string offset=67
	.byte	0
	.ascii	"__u32"                         # string offset=82
	.byte	0
	.ascii	"unsigned int"                  # string offset=88
	.byte	0
	.ascii	"xdp_drop"                      # string offset=101
	.byte	0
	.ascii	"udp"                           # string offset=110
	.byte	0
	.ascii	"/home/cloudcome/ebpf/basic/hello/udp.c" # string offset=114
	.byte	0
	.ascii	"int xdp_drop(struct xdp_md *ctx)" # string offset=153
	.byte	0
	.ascii	"  int ipsize = 0;"             # string offset=186
	.byte	0
	.ascii	"  void *data = (void *)(long)ctx->data;" # string offset=204
	.byte	0
	.ascii	"  void *data_end = (void *)(long)ctx->data_end;" # string offset=244
	.byte	0
	.ascii	"  struct ethhdr *eth = data;"  # string offset=292
	.byte	0
	.ascii	"  ipsize = sizeof(*eth);"      # string offset=321
	.byte	0
	.ascii	"  struct iphdr *ip = data + ipsize;" # string offset=346
	.byte	0
	.ascii	"  ipsize += sizeof(struct iphdr);" # string offset=382
	.byte	0
	.ascii	"  if (data + ipsize > data_end) {" # string offset=416
	.byte	0
	.ascii	"    return XDP_PASS;"          # string offset=450
	.byte	0
	.ascii	"  if (ip->protocol == IPPROTO_UDP) {" # string offset=471
	.byte	0
	.ascii	"    return XDP_DROP;"          # string offset=508
	.byte	0
	.ascii	"  return XDP_PASS;"            # string offset=529
	.byte	0
	.byte	125                             # string offset=548
	.byte	0
	.ascii	"char"                          # string offset=550
	.byte	0
	.ascii	"__ARRAY_SIZE_TYPE__"           # string offset=555
	.byte	0
	.ascii	"__license"                     # string offset=575
	.byte	0
	.ascii	"license"                       # string offset=585
	.byte	0
	.section	.BTF.ext,"",@progbits
	.short	60319                           # 0xeb9f
	.byte	1
	.byte	0
	.long	32
	.long	0
	.long	20
	.long	20
	.long	460
	.long	480
	.long	0
	.long	8                               # FuncInfo
	.long	110                             # FuncInfo section string offset=110
	.long	1
	.long	.Lfunc_begin0
	.long	7
	.long	16                              # LineInfo
	.long	110                             # LineInfo section string offset=110
	.long	28
	.long	.Lfunc_begin0
	.long	114
	.long	153
	.long	9216                            # Line 9 Col 0
	.long	.Ltmp2
	.long	114
	.long	186
	.long	11271                           # Line 11 Col 7
	.long	.Ltmp3
	.long	114
	.long	204
	.long	13342                           # Line 13 Col 30
	.long	.Ltmp4
	.long	114
	.long	204
	.long	13347                           # Line 13 Col 35
	.long	.Ltmp5
	.long	114
	.long	204
	.long	13321                           # Line 13 Col 9
	.long	.Ltmp6
	.long	114
	.long	244
	.long	14370                           # Line 14 Col 34
	.long	.Ltmp7
	.long	114
	.long	244
	.long	14375                           # Line 14 Col 39
	.long	.Ltmp8
	.long	114
	.long	244
	.long	14345                           # Line 14 Col 9
	.long	.Ltmp9
	.long	114
	.long	292
	.long	16408                           # Line 16 Col 24
	.long	.Ltmp10
	.long	114
	.long	292
	.long	16402                           # Line 16 Col 18
	.long	.Ltmp11
	.long	114
	.long	321
	.long	18442                           # Line 18 Col 10
	.long	.Ltmp12
	.long	114
	.long	346
	.long	20502                           # Line 20 Col 22
	.long	.Ltmp13
	.long	114
	.long	346
	.long	20509                           # Line 20 Col 29
	.long	.Ltmp14
	.long	114
	.long	346
	.long	20507                           # Line 20 Col 27
	.long	.Ltmp15
	.long	114
	.long	346
	.long	20497                           # Line 20 Col 17
	.long	.Ltmp16
	.long	114
	.long	382
	.long	21514                           # Line 21 Col 10
	.long	.Ltmp19
	.long	114
	.long	416
	.long	22535                           # Line 22 Col 7
	.long	.Ltmp20
	.long	114
	.long	416
	.long	22542                           # Line 22 Col 14
	.long	.Ltmp21
	.long	114
	.long	416
	.long	22540                           # Line 22 Col 12
	.long	.Ltmp22
	.long	114
	.long	416
	.long	22551                           # Line 22 Col 23
	.long	.Ltmp25
	.long	114
	.long	416
	.long	22535                           # Line 22 Col 7
	.long	.Ltmp28
	.long	114
	.long	450
	.long	23557                           # Line 23 Col 5
	.long	.Ltmp31
	.long	114
	.long	471
	.long	26631                           # Line 26 Col 7
	.long	.Ltmp32
	.long	114
	.long	471
	.long	26635                           # Line 26 Col 11
	.long	.Ltmp35
	.long	114
	.long	471
	.long	26631                           # Line 26 Col 7
	.long	.Ltmp38
	.long	114
	.long	508
	.long	27653                           # Line 27 Col 5
	.long	.Ltmp41
	.long	114
	.long	529
	.long	30723                           # Line 30 Col 3
	.long	.Ltmp42
	.long	114
	.long	548
	.long	31745                           # Line 31 Col 1
	.addrsig
	.addrsig_sym xdp_drop
	.addrsig_sym __license
	.section	.debug_line,"",@progbits
.Lline_table_start0:
