	.text
	.file	"xdpc1.c"
	.section	prog,"ax",@progbits
	.globl	xdp_drop                        # -- Begin function xdp_drop
	.p2align	3
	.type	xdp_drop,@function
xdp_drop:                               # @xdp_drop
.Lfunc_begin0:
	.file	1 "/home/cloudcome/ebpf/basic/hello" "xdpc1.c"
	.loc	1 6 0                           # xdpc1.c:6:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	*(u64 *)(r10 - 8) = r1
.Ltmp0:
	.loc	1 7 6 prologue_end              # xdpc1.c:7:6
.Ltmp1:
.Ltmp2:
	r1 = a ll
	r2 = 10
	*(u32 *)(r1 + 0) = r2
	.loc	1 8 7                           # xdpc1.c:8:7
.Ltmp3:
	r2 = *(u32 *)(r1 + 0)
	.loc	1 8 8 is_stmt 0                 # xdpc1.c:8:8
.Ltmp4:
	r2 += 10
	.loc	1 8 6                           # xdpc1.c:8:6
.Ltmp5:
	*(u32 *)(r1 + 0) = r2
	.loc	1 9 5 is_stmt 1                 # xdpc1.c:9:5
.Ltmp6:
	r0 = *(u32 *)(r1 + 0)
	exit
.Ltmp7:
.Ltmp8:
.Lfunc_end0:
	.size	xdp_drop, .Lfunc_end0-xdp_drop
	.cfi_endproc
                                        # -- End function
	.type	a,@object                       # @a
	.section	.bss,"aw",@nobits
	.globl	a
	.p2align	2
a:
	.long	0                               # 0x0
	.size	a, 4

	.type	__license,@object               # @__license
	.section	license,"aw",@progbits
	.globl	__license
__license:
	.asciz	"GPL"
	.size	__license, 4

	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	0                               # DW_CHILDREN_no
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
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                               # DWARF version number
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x1f DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	12                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 12.0.0-1ubuntu1" # string offset=0
.Linfo_string1:
	.asciz	"xdpc1.c"                       # string offset=37
.Linfo_string2:
	.asciz	"/home/cloudcome/ebpf/basic/hello" # string offset=45
	.section	.BTF,"",@progbits
	.short	60319                           # 0xeb9f
	.byte	1
	.byte	0
	.long	24
	.long	0
	.long	12
	.long	12
	.long	126
	.long	1                               # BTF_KIND_FUNC(id = 1)
	.long	201326593                       # 0xc000001
	.long	4
	.byte	0                               # string offset=0
	.ascii	"xdp_drop"                      # string offset=1
	.byte	0
	.ascii	"prog"                          # string offset=10
	.byte	0
	.ascii	"/home/cloudcome/ebpf/basic/hello/xdpc1.c" # string offset=15
	.byte	0
	.ascii	"int xdp_drop(struct xdp_md *ctx)" # string offset=56
	.byte	0
	.ascii	"    a=10; "                    # string offset=89
	.byte	0
	.ascii	"    a=a+10;"                   # string offset=100
	.byte	0
	.ascii	"    return a;"                 # string offset=112
	.byte	0
	.section	.BTF.ext,"",@progbits
	.short	60319                           # 0xeb9f
	.byte	1
	.byte	0
	.long	32
	.long	0
	.long	20
	.long	20
	.long	108
	.long	128
	.long	0
	.long	8                               # FuncInfo
	.long	10                              # FuncInfo section string offset=10
	.long	1
	.long	.Lfunc_begin0
	.long	1
	.long	16                              # LineInfo
	.long	10                              # LineInfo section string offset=10
	.long	6
	.long	.Lfunc_begin0
	.long	15
	.long	56
	.long	5120                            # Line 5 Col 0
	.long	.Ltmp2
	.long	15
	.long	89
	.long	7174                            # Line 7 Col 6
	.long	.Ltmp3
	.long	15
	.long	100
	.long	8199                            # Line 8 Col 7
	.long	.Ltmp4
	.long	15
	.long	100
	.long	8200                            # Line 8 Col 8
	.long	.Ltmp5
	.long	15
	.long	100
	.long	8198                            # Line 8 Col 6
	.long	.Ltmp6
	.long	15
	.long	112
	.long	9221                            # Line 9 Col 5
	.addrsig
	.addrsig_sym xdp_drop
	.addrsig_sym a
	.addrsig_sym __license
	.section	.debug_line,"",@progbits
.Lline_table_start0:
