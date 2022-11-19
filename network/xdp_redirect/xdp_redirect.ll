; ModuleID = 'xdp_redirect.c'
source_filename = "xdp_redirect.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_to_111 to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_to_222 to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_to_111(%struct.xdp_md* nocapture readnone %0) #0 section "redirect_to_111" !dbg !26 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !40, metadata !DIExpression()), !dbg !41
  %2 = tail call i64 inttoptr (i64 23 to i64 (i32, i64)*)(i32 111, i64 0) #2, !dbg !42
  %3 = trunc i64 %2 to i32, !dbg !42
  ret i32 %3, !dbg !43
}

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_to_222(%struct.xdp_md* nocapture readnone %0) #0 section "redirect_to_222" !dbg !44 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !46, metadata !DIExpression()), !dbg !47
  %2 = tail call i64 inttoptr (i64 23 to i64 (i32, i64)*)(i32 222, i64 0) #2, !dbg !48
  %3 = trunc i64 %2 to i32, !dbg !48
  ret i32 %3, !dbg !49
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 27, type: !18, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_redirect.c", directory: "/root/cloud/ebpf/network/xdp_redirect")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "bpf_redirect", scope: !2, file: !8, line: 615, type: !9, isLocal: true, isDefinition: true)
!8 = !DIFile(filename: "libbpf/src/bpf_helper_defs.h", directory: "/root/cloud")
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13, !16}
!12 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !14, line: 18, baseType: !15)
!14 = !DIFile(filename: "./vmlinux.h", directory: "/root/cloud/ebpf/network/xdp_redirect")
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !14, line: 22, baseType: !17)
!17 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 32, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 4)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{!"clang version 10.0.0-4ubuntu1 "}
!26 = distinct !DISubprogram(name: "xdp_redirect_to_111", scope: !3, file: !3, line: 17, type: !27, scopeLine: 18, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !39)
!27 = !DISubroutineType(types: !28)
!28 = !{!29, !30}
!29 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !14, line: 46620, size: 192, elements: !32)
!32 = !{!33, !34, !35, !36, !37, !38}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !31, file: !14, line: 46621, baseType: !13, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !31, file: !14, line: 46622, baseType: !13, size: 32, offset: 32)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !31, file: !14, line: 46623, baseType: !13, size: 32, offset: 64)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !31, file: !14, line: 46624, baseType: !13, size: 32, offset: 96)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !31, file: !14, line: 46625, baseType: !13, size: 32, offset: 128)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !31, file: !14, line: 46626, baseType: !13, size: 32, offset: 160)
!39 = !{!40}
!40 = !DILocalVariable(name: "xdp", arg: 1, scope: !26, file: !3, line: 17, type: !30)
!41 = !DILocation(line: 0, scope: !26)
!42 = !DILocation(line: 19, column: 9, scope: !26)
!43 = !DILocation(line: 19, column: 2, scope: !26)
!44 = distinct !DISubprogram(name: "xdp_redirect_to_222", scope: !3, file: !3, line: 22, type: !27, scopeLine: 23, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !45)
!45 = !{!46}
!46 = !DILocalVariable(name: "xdp", arg: 1, scope: !44, file: !3, line: 22, type: !30)
!47 = !DILocation(line: 0, scope: !44)
!48 = !DILocation(line: 24, column: 9, scope: !44)
!49 = !DILocation(line: 24, column: 2, scope: !44)
