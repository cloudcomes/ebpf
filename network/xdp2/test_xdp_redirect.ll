; ModuleID = 'test_xdp_redirect.c'
source_filename = "test_xdp_redirect.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }

@_version = dso_local global i32 1, section "version", align 4, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !6
@llvm.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32* @_version to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_to_111 to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_to_222 to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_to_111(%struct.xdp_md* nocapture readnone %0) #0 section "redirect_to_111" !dbg !29 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !43, metadata !DIExpression()), !dbg !44
  %2 = tail call i64 inttoptr (i64 23 to i64 (i32, i64)*)(i32 111, i64 0) #2, !dbg !45
  %3 = trunc i64 %2 to i32, !dbg !45
  ret i32 %3, !dbg !46
}

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_to_222(%struct.xdp_md* nocapture readnone %0) #0 section "redirect_to_222" !dbg !47 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !49, metadata !DIExpression()), !dbg !50
  %2 = tail call i64 inttoptr (i64 23 to i64 (i32, i64)*)(i32 222, i64 0) #2, !dbg !51
  %3 = trunc i64 %2 to i32, !dbg !51
  ret i32 %3, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_version", scope: !2, file: !3, line: 16, type: !24, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 12.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "test_xdp_redirect.c", directory: "/home/cloudcome/bpf/xdp2")
!4 = !{}
!5 = !{!0, !6, !12}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 29, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 32, elements: !10)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{!11}
!11 = !DISubrange(count: 4)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "bpf_redirect", scope: !2, file: !14, line: 607, type: !15, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/home/cloudcome/bpf/xdp2")
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !19, !22}
!18 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !20, line: 27, baseType: !21)
!20 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!21 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !20, line: 31, baseType: !23)
!23 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{i32 7, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{!"Ubuntu clang version 12.0.0-1ubuntu1"}
!29 = distinct !DISubprogram(name: "xdp_redirect_to_111", scope: !3, file: !3, line: 19, type: !30, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !42)
!30 = !DISubroutineType(types: !31)
!31 = !{!24, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !34, line: 4374, size: 192, elements: !35)
!34 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!35 = !{!36, !37, !38, !39, !40, !41}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !33, file: !34, line: 4375, baseType: !19, size: 32)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !33, file: !34, line: 4376, baseType: !19, size: 32, offset: 32)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !33, file: !34, line: 4377, baseType: !19, size: 32, offset: 64)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !33, file: !34, line: 4379, baseType: !19, size: 32, offset: 96)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !33, file: !34, line: 4380, baseType: !19, size: 32, offset: 128)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !33, file: !34, line: 4382, baseType: !19, size: 32, offset: 160)
!42 = !{!43}
!43 = !DILocalVariable(name: "xdp", arg: 1, scope: !29, file: !3, line: 19, type: !32)
!44 = !DILocation(line: 0, scope: !29)
!45 = !DILocation(line: 21, column: 9, scope: !29)
!46 = !DILocation(line: 21, column: 2, scope: !29)
!47 = distinct !DISubprogram(name: "xdp_redirect_to_222", scope: !3, file: !3, line: 24, type: !30, scopeLine: 25, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !48)
!48 = !{!49}
!49 = !DILocalVariable(name: "xdp", arg: 1, scope: !47, file: !3, line: 24, type: !32)
!50 = !DILocation(line: 0, scope: !47)
!51 = !DILocation(line: 26, column: 9, scope: !47)
!52 = !DILocation(line: 26, column: 2, scope: !47)
