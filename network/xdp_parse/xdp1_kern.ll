; ModuleID = 'xdp1_kern.c'
source_filename = "xdp1_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }

@__const.xdp_prog1.fmt = private unnamed_addr constant [34 x i8] c"IP protocol is:%u -> len is  %u:\0A\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@llvm.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_prog1 to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_prog1(%struct.xdp_md* readonly %0) #0 section "xdp1" !dbg !35 {
  %2 = alloca [34 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !49, metadata !DIExpression()), !dbg !79
  %3 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 1, i32 1), !dbg !80, !llvm.preserve.access.index !40
  %4 = load i32, i32* %3, align 4, !dbg !80, !tbaa !81
  %5 = zext i32 %4 to i64, !dbg !86
  %6 = inttoptr i64 %5 to i8*, !dbg !87
  call void @llvm.dbg.value(metadata i8* %6, metadata !50, metadata !DIExpression()), !dbg !79
  %7 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 0, i32 0), !dbg !88, !llvm.preserve.access.index !40
  %8 = load i32, i32* %7, align 4, !dbg !88, !tbaa !89
  %9 = zext i32 %8 to i64, !dbg !90
  %10 = inttoptr i64 %9 to i8*, !dbg !91
  call void @llvm.dbg.value(metadata i8* %10, metadata !51, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i8* %10, metadata !52, metadata !DIExpression()), !dbg !79
  %11 = getelementptr inbounds [34 x i8], [34 x i8]* %2, i64 0, i64 0, !dbg !92
  call void @llvm.lifetime.start.p0i8(i64 34, i8* nonnull %11) #4, !dbg !92
  call void @llvm.dbg.declare(metadata [34 x i8]* %2, metadata !74, metadata !DIExpression()), !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(34) %11, i8* nonnull align 1 dereferenceable(34) getelementptr inbounds ([34 x i8], [34 x i8]* @__const.xdp_prog1.fmt, i64 0, i64 0), i64 34, i1 false), !dbg !93
  %12 = sub i32 %4, %8, !dbg !94
  call void @llvm.dbg.value(metadata i32 %12, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata i64 14, metadata !68, metadata !DIExpression()), !dbg !79
  %13 = getelementptr i8, i8* %10, i64 14, !dbg !95
  %14 = icmp ugt i8* %13, %6, !dbg !97
  br i1 %14, label %31, label %15, !dbg !98

15:                                               ; preds = %1
  %16 = inttoptr i64 %9 to %struct.ethhdr*, !dbg !99
  call void @llvm.dbg.value(metadata %struct.ethhdr* %16, metadata !52, metadata !DIExpression()), !dbg !79
  %17 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %16, i32 2, i32 2), !dbg !100, !llvm.preserve.access.index !54
  %18 = load i16, i16* %17, align 2, !dbg !100, !tbaa !101
  call void @llvm.dbg.value(metadata i16 %18, metadata !66, metadata !DIExpression()), !dbg !79
  %19 = icmp ne i16 %18, 8, !dbg !104
  %20 = getelementptr i8, i8* %10, i64 34, !dbg !106
  %21 = icmp ugt i8* %20, %6, !dbg !134
  %22 = or i1 %21, %19, !dbg !135
  call void @llvm.dbg.value(metadata i8* %10, metadata !112, metadata !DIExpression()) #4, !dbg !136
  call void @llvm.dbg.value(metadata i64 14, metadata !113, metadata !DIExpression()) #4, !dbg !136
  call void @llvm.dbg.value(metadata i8* %6, metadata !114, metadata !DIExpression()) #4, !dbg !136
  call void @llvm.dbg.value(metadata i8* %10, metadata !115, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #4, !dbg !136
  br i1 %22, label %28, label %23, !dbg !135

23:                                               ; preds = %15
  call void @llvm.dbg.value(metadata i8* %13, metadata !115, metadata !DIExpression()) #4, !dbg !136
  %24 = bitcast i8* %13 to %struct.iphdr*, !dbg !137
  call void @llvm.dbg.value(metadata %struct.iphdr* %24, metadata !115, metadata !DIExpression()) #4, !dbg !136
  %25 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* %24, i32 6, i32 7) #4, !dbg !138, !llvm.preserve.access.index !117
  %26 = load i8, i8* %25, align 1, !dbg !138, !tbaa !139
  %27 = zext i8 %26 to i32, !dbg !141
  br label %28, !dbg !142

28:                                               ; preds = %15, %23
  %29 = phi i32 [ 0, %15 ], [ %27, %23 ], !dbg !143
  call void @llvm.dbg.value(metadata i32 %29, metadata !72, metadata !DIExpression()), !dbg !79
  %30 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %11, i32 34, i32 %29, i32 %12) #4, !dbg !144
  br label %31, !dbg !145

31:                                               ; preds = %1, %28
  call void @llvm.lifetime.end.p0i8(i64 34, i8* nonnull %11) #4, !dbg !146
  ret i32 2, !dbg !146
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone
declare i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md*, i32 immarg, i32 immarg) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readnone
declare i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr*, i32 immarg, i32 immarg) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone
declare i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!31, !32, !33}
!llvm.ident = !{!34}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 55, type: !28, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !17, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp1_kern.c", directory: "/root/cloud/ebpf/network/xdp1")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 43617, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./vmlinux.h", directory: "/root/cloud/ebpf/network/xdp1")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!14 = !{!15, !16}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!17 = !{!0, !18}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !20, line: 176, type: !21, isLocal: true, isDefinition: true)
!20 = !DIFile(filename: "libbpf/src/bpf_helper_defs.h", directory: "/root/cloud")
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{!16, !24, !27, null}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !26)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 18, baseType: !7)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 32, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 4)
!31 = !{i32 7, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{!"clang version 10.0.0-4ubuntu1 "}
!35 = distinct !DISubprogram(name: "xdp_prog1", scope: !3, file: !3, line: 26, type: !36, scopeLine: 27, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !48)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !39}
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 46620, size: 192, elements: !41)
!41 = !{!42, !43, !44, !45, !46, !47}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !40, file: !6, line: 46621, baseType: !27, size: 32)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !40, file: !6, line: 46622, baseType: !27, size: 32, offset: 32)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !40, file: !6, line: 46623, baseType: !27, size: 32, offset: 64)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !40, file: !6, line: 46624, baseType: !27, size: 32, offset: 96)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !40, file: !6, line: 46625, baseType: !27, size: 32, offset: 128)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !40, file: !6, line: 46626, baseType: !27, size: 32, offset: 160)
!48 = !{!49, !50, !51, !52, !66, !68, !72, !74, !78}
!49 = !DILocalVariable(name: "ctx", arg: 1, scope: !35, file: !3, line: 26, type: !39)
!50 = !DILocalVariable(name: "data_end", scope: !35, file: !3, line: 28, type: !15)
!51 = !DILocalVariable(name: "data", scope: !35, file: !3, line: 29, type: !15)
!52 = !DILocalVariable(name: "eth", scope: !35, file: !3, line: 30, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !6, line: 63910, size: 112, elements: !55)
!55 = !{!56, !61, !62}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !54, file: !6, line: 63911, baseType: !57, size: 48)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 48, elements: !59)
!58 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!59 = !{!60}
!60 = !DISubrange(count: 6)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !54, file: !6, line: 63912, baseType: !57, size: 48, offset: 48)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !54, file: !6, line: 63913, baseType: !63, size: 16, offset: 96)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !6, line: 7100, baseType: !64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !6, line: 14, baseType: !65)
!65 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!66 = !DILocalVariable(name: "h_proto", scope: !35, file: !3, line: 32, type: !67)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !6, line: 30, baseType: !64)
!68 = !DILocalVariable(name: "nh_off", scope: !35, file: !3, line: 33, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "u64", file: !6, line: 38, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !6, line: 22, baseType: !71)
!71 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!72 = !DILocalVariable(name: "ipproto", scope: !35, file: !3, line: 34, type: !73)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !6, line: 34, baseType: !27)
!74 = !DILocalVariable(name: "fmt", scope: !35, file: !3, line: 36, type: !75)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 272, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 34)
!78 = !DILocalVariable(name: "len", scope: !35, file: !3, line: 37, type: !7)
!79 = !DILocation(line: 0, scope: !35)
!80 = !DILocation(line: 28, column: 38, scope: !35)
!81 = !{!82, !83, i64 4}
!82 = !{!"xdp_md", !83, i64 0, !83, i64 4, !83, i64 8, !83, i64 12, !83, i64 16, !83, i64 20}
!83 = !{!"int", !84, i64 0}
!84 = !{!"omnipotent char", !85, i64 0}
!85 = !{!"Simple C/C++ TBAA"}
!86 = !DILocation(line: 28, column: 27, scope: !35)
!87 = !DILocation(line: 28, column: 19, scope: !35)
!88 = !DILocation(line: 29, column: 34, scope: !35)
!89 = !{!82, !83, i64 0}
!90 = !DILocation(line: 29, column: 23, scope: !35)
!91 = !DILocation(line: 29, column: 15, scope: !35)
!92 = !DILocation(line: 36, column: 2, scope: !35)
!93 = !DILocation(line: 36, column: 7, scope: !35)
!94 = !DILocation(line: 37, column: 30, scope: !35)
!95 = !DILocation(line: 40, column: 11, scope: !96)
!96 = distinct !DILexicalBlock(scope: !35, file: !3, line: 40, column: 6)
!97 = !DILocation(line: 40, column: 20, scope: !96)
!98 = !DILocation(line: 40, column: 6, scope: !35)
!99 = !DILocation(line: 30, column: 23, scope: !35)
!100 = !DILocation(line: 43, column: 17, scope: !35)
!101 = !{!102, !103, i64 12}
!102 = !{!"ethhdr", !84, i64 0, !84, i64 6, !103, i64 12}
!103 = !{!"short", !84, i64 0}
!104 = !DILocation(line: 45, column: 14, scope: !105)
!105 = distinct !DILexicalBlock(scope: !35, file: !3, line: 45, column: 6)
!106 = !DILocation(line: 19, column: 10, scope: !107, inlinedAt: !133)
!107 = distinct !DILexicalBlock(scope: !108, file: !3, line: 19, column: 6)
!108 = distinct !DISubprogram(name: "parse_ipv4", scope: !3, file: !3, line: 15, type: !109, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !111)
!109 = !DISubroutineType(types: !110)
!110 = !{!38, !15, !69, !15}
!111 = !{!112, !113, !114, !115}
!112 = !DILocalVariable(name: "data", arg: 1, scope: !108, file: !3, line: 15, type: !15)
!113 = !DILocalVariable(name: "nh_off", arg: 2, scope: !108, file: !3, line: 15, type: !69)
!114 = !DILocalVariable(name: "data_end", arg: 3, scope: !108, file: !3, line: 15, type: !15)
!115 = !DILocalVariable(name: "iph", scope: !108, file: !3, line: 17, type: !116)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !6, line: 65353, size: 160, elements: !118)
!118 = !{!119, !121, !122, !123, !124, !125, !126, !127, !128, !130, !132}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !117, file: !6, line: 65354, baseType: !120, size: 4, flags: DIFlagBitField, extraData: i64 0)
!120 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !6, line: 10, baseType: !58)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !117, file: !6, line: 65355, baseType: !120, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !117, file: !6, line: 65356, baseType: !120, size: 8, offset: 8)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !117, file: !6, line: 65357, baseType: !63, size: 16, offset: 16)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !117, file: !6, line: 65358, baseType: !63, size: 16, offset: 32)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !117, file: !6, line: 65359, baseType: !63, size: 16, offset: 48)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !117, file: !6, line: 65360, baseType: !120, size: 8, offset: 64)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !117, file: !6, line: 65361, baseType: !120, size: 8, offset: 72)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !117, file: !6, line: 65362, baseType: !129, size: 16, offset: 80)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !6, line: 64798, baseType: !64)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !117, file: !6, line: 65363, baseType: !131, size: 32, offset: 96)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !6, line: 7104, baseType: !27)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !117, file: !6, line: 65364, baseType: !131, size: 32, offset: 128)
!133 = distinct !DILocation(line: 46, column: 13, scope: !105)
!134 = !DILocation(line: 19, column: 14, scope: !107, inlinedAt: !133)
!135 = !DILocation(line: 45, column: 6, scope: !35)
!136 = !DILocation(line: 0, scope: !108, inlinedAt: !133)
!137 = !DILocation(line: 17, column: 22, scope: !108, inlinedAt: !133)
!138 = !DILocation(line: 21, column: 14, scope: !108, inlinedAt: !133)
!139 = !{!140, !84, i64 9}
!140 = !{!"iphdr", !84, i64 0, !84, i64 0, !84, i64 1, !103, i64 2, !103, i64 4, !103, i64 6, !84, i64 8, !84, i64 9, !103, i64 10, !83, i64 12, !83, i64 16}
!141 = !DILocation(line: 21, column: 9, scope: !108, inlinedAt: !133)
!142 = !DILocation(line: 21, column: 2, scope: !108, inlinedAt: !133)
!143 = !DILocation(line: 0, scope: !105)
!144 = !DILocation(line: 50, column: 5, scope: !35)
!145 = !DILocation(line: 52, column: 2, scope: !35)
!146 = !DILocation(line: 53, column: 1, scope: !35)
