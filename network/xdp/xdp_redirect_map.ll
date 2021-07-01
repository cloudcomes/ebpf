; ModuleID = 'xdp_redirect_map.c'
source_filename = "xdp_redirect_map.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [14 x i32]*, [8 x i32]*, [4 x i32]*, [4 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }

@tx_port = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !6
@llvm.used = appending global [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @tx_port to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_map_0 to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_map_1 to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_map_2 to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_map_0(%struct.xdp_md* nocapture readnone %0) #0 section "redirect_map_0" !dbg !46 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !60, metadata !DIExpression()), !dbg !61
  %2 = tail call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon* @tx_port to i8*), i32 0, i64 0) #2, !dbg !62
  %3 = trunc i64 %2 to i32, !dbg !62
  ret i32 %3, !dbg !63
}

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_map_1(%struct.xdp_md* nocapture readnone %0) #0 section "redirect_map_1" !dbg !64 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !66, metadata !DIExpression()), !dbg !67
  %2 = tail call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon* @tx_port to i8*), i32 1, i64 0) #2, !dbg !68
  %3 = trunc i64 %2 to i32, !dbg !68
  ret i32 %3, !dbg !69
}

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_map_2(%struct.xdp_md* nocapture readnone %0) #0 section "redirect_map_2" !dbg !70 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !72, metadata !DIExpression()), !dbg !73
  %2 = tail call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon* @tx_port to i8*), i32 2, i64 0) #2, !dbg !74
  %3 = trunc i64 %2 to i32, !dbg !74
  ret i32 %3, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!42, !43, !44}
!llvm.ident = !{!45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "tx_port", scope: !2, file: !3, line: 12, type: !25, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 12.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_redirect_map.c", directory: "/home/cloudcome/bpf/xdp")
!4 = !{}
!5 = !{!6, !0, !12}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 32, type: !8, isLocal: false, isDefinition: true)
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 32, elements: !10)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{!11}
!11 = !DISubrange(count: 4)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !14, line: 1290, type: !15, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/home/cloudcome/bpf/xdp")
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !19, !20, !23}
!18 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !21, line: 27, baseType: !22)
!21 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !21, line: 31, baseType: !24)
!24 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 7, size: 256, elements: !26)
!26 = !{!27, !33, !38, !41}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !25, file: !3, line: 8, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 448, elements: !31)
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !{!32}
!32 = !DISubrange(count: 14)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !25, file: !3, line: 9, baseType: !34, size: 64, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 256, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 8)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !25, file: !3, line: 10, baseType: !39, size: 64, offset: 128)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 128, elements: !10)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !25, file: !3, line: 11, baseType: !39, size: 64, offset: 192)
!42 = !{i32 7, !"Dwarf Version", i32 4}
!43 = !{i32 2, !"Debug Info Version", i32 3}
!44 = !{i32 1, !"wchar_size", i32 4}
!45 = !{!"Ubuntu clang version 12.0.0-1ubuntu1"}
!46 = distinct !DISubprogram(name: "xdp_redirect_map_0", scope: !3, file: !3, line: 15, type: !47, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !59)
!47 = !DISubroutineType(types: !48)
!48 = !{!30, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !51, line: 4374, size: 192, elements: !52)
!51 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!52 = !{!53, !54, !55, !56, !57, !58}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !50, file: !51, line: 4375, baseType: !20, size: 32)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !50, file: !51, line: 4376, baseType: !20, size: 32, offset: 32)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !50, file: !51, line: 4377, baseType: !20, size: 32, offset: 64)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !50, file: !51, line: 4379, baseType: !20, size: 32, offset: 96)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !50, file: !51, line: 4380, baseType: !20, size: 32, offset: 128)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !50, file: !51, line: 4382, baseType: !20, size: 32, offset: 160)
!59 = !{!60}
!60 = !DILocalVariable(name: "xdp", arg: 1, scope: !46, file: !3, line: 15, type: !49)
!61 = !DILocation(line: 0, scope: !46)
!62 = !DILocation(line: 17, column: 9, scope: !46)
!63 = !DILocation(line: 17, column: 2, scope: !46)
!64 = distinct !DISubprogram(name: "xdp_redirect_map_1", scope: !3, file: !3, line: 21, type: !47, scopeLine: 22, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !65)
!65 = !{!66}
!66 = !DILocalVariable(name: "xdp", arg: 1, scope: !64, file: !3, line: 21, type: !49)
!67 = !DILocation(line: 0, scope: !64)
!68 = !DILocation(line: 23, column: 9, scope: !64)
!69 = !DILocation(line: 23, column: 2, scope: !64)
!70 = distinct !DISubprogram(name: "xdp_redirect_map_2", scope: !3, file: !3, line: 27, type: !47, scopeLine: 28, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !71)
!71 = !{!72}
!72 = !DILocalVariable(name: "xdp", arg: 1, scope: !70, file: !3, line: 27, type: !49)
!73 = !DILocation(line: 0, scope: !70)
!74 = !DILocation(line: 29, column: 9, scope: !70)
!75 = !DILocation(line: 29, column: 2, scope: !70)
