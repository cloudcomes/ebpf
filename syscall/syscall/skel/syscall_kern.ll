; ModuleID = 'syscall_kern.c'
source_filename = "syscall_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.syscalls_enter_open_args = type { i64, i64, i64, i64, i64 }

@bpf_sys.____fmt = internal constant [30 x i8] c"Hello,this syscall NR is  %d\0A\00", align 1, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !20
@llvm.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.syscalls_enter_open_args*)* @bpf_sys to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @bpf_sys(%struct.syscalls_enter_open_args* nocapture readonly %0) #0 section "tracepoint/syscalls/sys_enter_openat" !dbg !2 {
  call void @llvm.dbg.value(metadata %struct.syscalls_enter_open_args* %0, metadata !38, metadata !DIExpression()), !dbg !46
  %2 = getelementptr inbounds %struct.syscalls_enter_open_args, %struct.syscalls_enter_open_args* %0, i64 0, i32 1, !dbg !47
  %3 = load i64, i64* %2, align 8, !dbg !47, !tbaa !49
  %4 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @bpf_sys.____fmt, i64 0, i64 0), i32 30, i64 %3) #2, !dbg !47
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!42, !43, !44}
!llvm.ident = !{!45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 15, type: !39, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "bpf_sys", scope: !3, file: !3, line: 13, type: !4, scopeLine: 14, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !17, retainedNodes: !37)
!3 = !DIFile(filename: "syscall_kern.c", directory: "/root/cloud/ebpf/trace/syscall/skel")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "syscalls_enter_open_args", file: !3, line: 4, size: 320, elements: !9)
!9 = !{!10, !12, !14, !15, !16}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "unused", scope: !8, file: !3, line: 5, baseType: !11, size: 64)
!11 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "syscall_nr", scope: !8, file: !3, line: 6, baseType: !13, size: 64, offset: 64)
!13 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "filename_ptr", scope: !8, file: !3, line: 7, baseType: !13, size: 64, offset: 128)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !8, file: !3, line: 8, baseType: !13, size: 64, offset: 192)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !8, file: !3, line: 9, baseType: !13, size: 64, offset: 256)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !18, globals: !19, splitDebugInlining: false, nameTableKind: None)
!18 = !{}
!19 = !{!0, !20, !26}
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "_license", scope: !17, file: !3, line: 18, type: !22, isLocal: false, isDefinition: true)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 32, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 4)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !17, file: !28, line: 176, type: !29, isLocal: true, isDefinition: true)
!28 = !DIFile(filename: "libbpf/src/bpf_helper_defs.h", directory: "/root/cloud")
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DISubroutineType(types: !31)
!31 = !{!13, !32, !34, null}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !35, line: 18, baseType: !36)
!35 = !DIFile(filename: "./vmlinux.h", directory: "/root/cloud/ebpf/trace/syscall/skel")
!36 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!37 = !{!38}
!38 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 13, type: !7)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 240, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 30)
!42 = !{i32 7, !"Dwarf Version", i32 4}
!43 = !{i32 2, !"Debug Info Version", i32 3}
!44 = !{i32 1, !"wchar_size", i32 4}
!45 = !{!"clang version 10.0.0-4ubuntu1 "}
!46 = !DILocation(line: 0, scope: !2)
!47 = !DILocation(line: 15, column: 2, scope: !48)
!48 = distinct !DILexicalBlock(scope: !2, file: !3, line: 15, column: 2)
!49 = !{!50, !54, i64 8}
!50 = !{!"syscalls_enter_open_args", !51, i64 0, !54, i64 8, !54, i64 16, !54, i64 24, !54, i64 32}
!51 = !{!"long long", !52, i64 0}
!52 = !{!"omnipotent char", !53, i64 0}
!53 = !{!"Simple C/C++ TBAA"}
!54 = !{!"long", !52, i64 0}
!55 = !DILocation(line: 16, column: 5, scope: !2)
