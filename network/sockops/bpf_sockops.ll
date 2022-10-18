; ModuleID = 'bpf_sockops.c'
source_filename = "bpf_sockops.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [15 x i32]*, [20 x i32]*, [4 x i32]*, [4 x i32]* }
%struct.bpf_sock_ops = type { i32, %union.anon, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i64, %union.anon.0, %union.anon.1, %union.anon.2, i32, i32 }
%union.anon = type { [4 x i32] }
%union.anon.0 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i16, i32, [4 x i32], i32, i32 }
%union.anon.1 = type { i8* }
%union.anon.2 = type { i8* }

@sock_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@bpf_sockmap.____fmt = internal constant [57 x i8] c"PASSIVE_ESTABLISHED op is  %d\0A,rport is %d\0A,lport is %d\0A\00", align 1, !dbg !17
@bpf_sockmap.____fmt.1 = internal constant [56 x i8] c"ACTIVE_ESTABLISHED op is  %d\0A,rport is %d\0A,lport is %d\0A\00", align 1, !dbg !118
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !123
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.bpf_sock_ops*)* @bpf_sockmap to i8*), i8* bitcast (%struct.anon* @sock_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @bpf_sockmap(%struct.bpf_sock_ops* %0) #0 section "sockops" !dbg !19 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.bpf_sock_ops* %0, metadata !107, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.value(metadata i32 0, metadata !111, metadata !DIExpression()), !dbg !159
  %3 = bitcast i32* %2 to i8*, !dbg !160
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #4, !dbg !160
  %4 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_sock_opss(%struct.bpf_sock_ops* %0, i32 0, i32 0), !dbg !161, !llvm.preserve.access.index !23
  %5 = load i32, i32* %4, align 8, !dbg !161, !tbaa !162
  call void @llvm.dbg.value(metadata i32 %5, metadata !110, metadata !DIExpression()), !dbg !159
  switch i32 %5, label %24 [
    i32 5, label %6
    i32 4, label %15
  ], !dbg !168

6:                                                ; preds = %1
  %7 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_sock_opss(%struct.bpf_sock_ops* %0, i32 8, i32 8), !dbg !169, !llvm.preserve.access.index !23
  %8 = load i32, i32* %7, align 4, !dbg !169, !tbaa !171
  call void @llvm.dbg.value(metadata i32 %8, metadata !108, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.value(metadata i32 undef, metadata !109, metadata !DIExpression()), !dbg !159
  %9 = icmp eq i32 %8, 10000, !dbg !172
  br i1 %9, label %10, label %24, !dbg !174

10:                                               ; preds = %6
  %11 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_sock_opss(%struct.bpf_sock_ops* %0, i32 7, i32 7), !dbg !175, !llvm.preserve.access.index !23
  %12 = load i32, i32* %11, align 8, !dbg !175, !tbaa !176
  call void @llvm.dbg.value(metadata i32 %12, metadata !109, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.value(metadata i32 1, metadata !112, metadata !DIExpression()), !dbg !159
  store i32 1, i32* %2, align 4, !dbg !177, !tbaa !179
  call void @llvm.dbg.value(metadata i32* %2, metadata !112, metadata !DIExpression(DW_OP_deref)), !dbg !159
  %13 = call i64 inttoptr (i64 53 to i64 (%struct.bpf_sock_ops*, i8*, i8*, i64)*)(%struct.bpf_sock_ops* %0, i8* bitcast (%struct.anon* @sock_map to i8*), i8* nonnull %3, i64 1) #4, !dbg !180
  call void @llvm.dbg.value(metadata i64 %13, metadata !111, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !159
  %14 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @bpf_sockmap.____fmt, i64 0, i64 0), i32 57, i32 5, i32 10000, i32 %12) #4, !dbg !181
  br label %24, !dbg !183

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i32 undef, metadata !108, metadata !DIExpression()), !dbg !159
  %16 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_sock_opss(%struct.bpf_sock_ops* %0, i32 7, i32 7), !dbg !184, !llvm.preserve.access.index !23
  %17 = load i32, i32* %16, align 8, !dbg !184, !tbaa !176
  call void @llvm.dbg.value(metadata i32 %17, metadata !109, metadata !DIExpression()), !dbg !159
  %18 = icmp eq i32 %17, 287768576, !dbg !185
  br i1 %18, label %19, label %24, !dbg !187

19:                                               ; preds = %15
  %20 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_sock_opss(%struct.bpf_sock_ops* %0, i32 8, i32 8), !dbg !188, !llvm.preserve.access.index !23
  %21 = load i32, i32* %20, align 4, !dbg !188, !tbaa !171
  call void @llvm.dbg.value(metadata i32 %21, metadata !108, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.value(metadata i32 10, metadata !112, metadata !DIExpression()), !dbg !159
  store i32 10, i32* %2, align 4, !dbg !189, !tbaa !179
  call void @llvm.dbg.value(metadata i32* %2, metadata !112, metadata !DIExpression(DW_OP_deref)), !dbg !159
  %22 = call i64 inttoptr (i64 53 to i64 (%struct.bpf_sock_ops*, i8*, i8*, i64)*)(%struct.bpf_sock_ops* %0, i8* bitcast (%struct.anon* @sock_map to i8*), i8* nonnull %3, i64 1) #4, !dbg !191
  call void @llvm.dbg.value(metadata i64 %22, metadata !111, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !159
  %23 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @bpf_sockmap.____fmt.1, i64 0, i64 0), i32 56, i32 4, i32 %21, i32 287768576) #4, !dbg !192
  br label %24, !dbg !194

24:                                               ; preds = %1, %15, %19, %6, %10
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #4, !dbg !195
  ret i32 0, !dbg !196
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind readnone
declare i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_sock_opss(%struct.bpf_sock_ops*, i32 immarg, i32 immarg) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!155, !156, !157}
!llvm.ident = !{!158}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "sock_map", scope: !2, file: !3, line: 10, type: !139, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "bpf_sockops.c", directory: "/root/cloud/ebpf/network/sockops")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 43844, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./vmlinux.h", directory: "/root/cloud/ebpf/network/sockops")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "BPF_ANY", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "BPF_NOEXIST", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "BPF_EXIST", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "BPF_F_LOCK", value: 4, isUnsigned: true)
!13 = !{!14, !15}
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 18, baseType: !7)
!16 = !{!17, !118, !123, !0, !126, !133}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "____fmt", scope: !19, file: !3, line: 31, type: !113, isLocal: true, isDefinition: true)
!19 = distinct !DISubprogram(name: "bpf_sockmap", scope: !3, file: !3, line: 14, type: !20, scopeLine: 15, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !106)
!20 = !DISubroutineType(types: !21)
!21 = !{!14, !22}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock_ops", file: !6, line: 46684, size: 1728, elements: !24)
!24 = !{!25, !26, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !69, !70, !95, !100, !104, !105}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "op", scope: !23, file: !6, line: 46685, baseType: !15, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, scope: !23, file: !6, line: 46686, baseType: !27, size: 128, offset: 32)
!27 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !23, file: !6, line: 46686, size: 128, elements: !28)
!28 = !{!29, !33, !34}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "args", scope: !27, file: !6, line: 46687, baseType: !30, size: 128)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 4)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "reply", scope: !27, file: !6, line: 46688, baseType: !15, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "replylong", scope: !27, file: !6, line: 46689, baseType: !30, size: 128)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !23, file: !6, line: 46691, baseType: !15, size: 32, offset: 160)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !23, file: !6, line: 46692, baseType: !15, size: 32, offset: 192)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !23, file: !6, line: 46693, baseType: !15, size: 32, offset: 224)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !23, file: !6, line: 46694, baseType: !30, size: 128, offset: 256)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !23, file: !6, line: 46695, baseType: !30, size: 128, offset: 384)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !23, file: !6, line: 46696, baseType: !15, size: 32, offset: 512)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !23, file: !6, line: 46697, baseType: !15, size: 32, offset: 544)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "is_fullsock", scope: !23, file: !6, line: 46698, baseType: !15, size: 32, offset: 576)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "snd_cwnd", scope: !23, file: !6, line: 46699, baseType: !15, size: 32, offset: 608)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "srtt_us", scope: !23, file: !6, line: 46700, baseType: !15, size: 32, offset: 640)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "bpf_sock_ops_cb_flags", scope: !23, file: !6, line: 46701, baseType: !15, size: 32, offset: 672)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !23, file: !6, line: 46702, baseType: !15, size: 32, offset: 704)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_min", scope: !23, file: !6, line: 46703, baseType: !15, size: 32, offset: 736)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "snd_ssthresh", scope: !23, file: !6, line: 46704, baseType: !15, size: 32, offset: 768)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "rcv_nxt", scope: !23, file: !6, line: 46705, baseType: !15, size: 32, offset: 800)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "snd_nxt", scope: !23, file: !6, line: 46706, baseType: !15, size: 32, offset: 832)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "snd_una", scope: !23, file: !6, line: 46707, baseType: !15, size: 32, offset: 864)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "mss_cache", scope: !23, file: !6, line: 46708, baseType: !15, size: 32, offset: 896)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "ecn_flags", scope: !23, file: !6, line: 46709, baseType: !15, size: 32, offset: 928)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "rate_delivered", scope: !23, file: !6, line: 46710, baseType: !15, size: 32, offset: 960)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "rate_interval_us", scope: !23, file: !6, line: 46711, baseType: !15, size: 32, offset: 992)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "packets_out", scope: !23, file: !6, line: 46712, baseType: !15, size: 32, offset: 1024)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "retrans_out", scope: !23, file: !6, line: 46713, baseType: !15, size: 32, offset: 1056)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "total_retrans", scope: !23, file: !6, line: 46714, baseType: !15, size: 32, offset: 1088)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "segs_in", scope: !23, file: !6, line: 46715, baseType: !15, size: 32, offset: 1120)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "data_segs_in", scope: !23, file: !6, line: 46716, baseType: !15, size: 32, offset: 1152)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "segs_out", scope: !23, file: !6, line: 46717, baseType: !15, size: 32, offset: 1184)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "data_segs_out", scope: !23, file: !6, line: 46718, baseType: !15, size: 32, offset: 1216)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "lost_out", scope: !23, file: !6, line: 46719, baseType: !15, size: 32, offset: 1248)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "sacked_out", scope: !23, file: !6, line: 46720, baseType: !15, size: 32, offset: 1280)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "sk_txhash", scope: !23, file: !6, line: 46721, baseType: !15, size: 32, offset: 1312)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "bytes_received", scope: !23, file: !6, line: 46722, baseType: !67, size: 64, offset: 1344)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !6, line: 22, baseType: !68)
!68 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "bytes_acked", scope: !23, file: !6, line: 46723, baseType: !67, size: 64, offset: 1408)
!70 = !DIDerivedType(tag: DW_TAG_member, scope: !23, file: !6, line: 46724, baseType: !71, size: 64, offset: 1472)
!71 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !23, file: !6, line: 46724, size: 64, elements: !72)
!72 = !{!73}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !71, file: !6, line: 46725, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 46564, size: 640, elements: !76)
!76 = !{!77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !90, !91, !92, !93}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !75, file: !6, line: 46565, baseType: !15, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !75, file: !6, line: 46566, baseType: !15, size: 32, offset: 32)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !75, file: !6, line: 46567, baseType: !15, size: 32, offset: 64)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !75, file: !6, line: 46568, baseType: !15, size: 32, offset: 96)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !75, file: !6, line: 46569, baseType: !15, size: 32, offset: 128)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !75, file: !6, line: 46570, baseType: !15, size: 32, offset: 160)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !75, file: !6, line: 46571, baseType: !15, size: 32, offset: 192)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !75, file: !6, line: 46572, baseType: !30, size: 128, offset: 224)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !75, file: !6, line: 46573, baseType: !15, size: 32, offset: 352)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !75, file: !6, line: 46574, baseType: !87, size: 16, offset: 384)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !6, line: 7100, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !6, line: 14, baseType: !89)
!89 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !75, file: !6, line: 46575, baseType: !15, size: 32, offset: 416)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !75, file: !6, line: 46576, baseType: !30, size: 128, offset: 448)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !75, file: !6, line: 46577, baseType: !15, size: 32, offset: 576)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !75, file: !6, line: 46578, baseType: !94, size: 32, offset: 608)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !6, line: 16, baseType: !14)
!95 = !DIDerivedType(tag: DW_TAG_member, scope: !23, file: !6, line: 46727, baseType: !96, size: 64, offset: 1536)
!96 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !23, file: !6, line: 46727, size: 64, elements: !97)
!97 = !{!98}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "skb_data", scope: !96, file: !6, line: 46728, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_member, scope: !23, file: !6, line: 46730, baseType: !101, size: 64, offset: 1600)
!101 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !23, file: !6, line: 46730, size: 64, elements: !102)
!102 = !{!103}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "skb_data_end", scope: !101, file: !6, line: 46731, baseType: !99, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "skb_len", scope: !23, file: !6, line: 46733, baseType: !15, size: 32, offset: 1664)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "skb_tcp_flags", scope: !23, file: !6, line: 46734, baseType: !15, size: 32, offset: 1696)
!106 = !{!107, !108, !109, !110, !111, !112}
!107 = !DILocalVariable(name: "skops", arg: 1, scope: !19, file: !3, line: 14, type: !22)
!108 = !DILocalVariable(name: "lport", scope: !19, file: !3, line: 16, type: !15)
!109 = !DILocalVariable(name: "rport", scope: !19, file: !3, line: 16, type: !15)
!110 = !DILocalVariable(name: "op", scope: !19, file: !3, line: 17, type: !14)
!111 = !DILocalVariable(name: "err", scope: !19, file: !3, line: 17, type: !14)
!112 = !DILocalVariable(name: "ret", scope: !19, file: !3, line: 17, type: !14)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !114, size: 456, elements: !116)
!114 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !115)
!115 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!116 = !{!117}
!117 = !DISubrange(count: 57)
!118 = !DIGlobalVariableExpression(var: !119, expr: !DIExpression())
!119 = distinct !DIGlobalVariable(name: "____fmt", scope: !19, file: !3, line: 43, type: !120, isLocal: true, isDefinition: true)
!120 = !DICompositeType(tag: DW_TAG_array_type, baseType: !114, size: 448, elements: !121)
!121 = !{!122}
!122 = !DISubrange(count: 56)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression())
!124 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 53, type: !125, isLocal: false, isDefinition: true)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !115, size: 32, elements: !31)
!126 = !DIGlobalVariableExpression(var: !127, expr: !DIExpression())
!127 = distinct !DIGlobalVariable(name: "bpf_sock_map_update", scope: !2, file: !128, line: 1347, type: !129, isLocal: true, isDefinition: true)
!128 = !DIFile(filename: "libbpf/src/bpf_helper_defs.h", directory: "/root/cloud")
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DISubroutineType(types: !131)
!131 = !{!132, !22, !99, !99, !67}
!132 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!133 = !DIGlobalVariableExpression(var: !134, expr: !DIExpression())
!134 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !128, line: 176, type: !135, isLocal: true, isDefinition: true)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DISubroutineType(types: !137)
!137 = !{!132, !138, !15, null}
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!139 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 5, size: 256, elements: !140)
!140 = !{!141, !146, !151, !154}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !139, file: !3, line: 6, baseType: !142, size: 64)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 480, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 15)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !139, file: !3, line: 7, baseType: !147, size: 64, offset: 64)
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64)
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 640, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 20)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !139, file: !3, line: 8, baseType: !152, size: 64, offset: 128)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !31)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !139, file: !3, line: 9, baseType: !152, size: 64, offset: 192)
!155 = !{i32 7, !"Dwarf Version", i32 4}
!156 = !{i32 2, !"Debug Info Version", i32 3}
!157 = !{i32 1, !"wchar_size", i32 4}
!158 = !{!"clang version 10.0.0-4ubuntu1 "}
!159 = !DILocation(line: 0, scope: !19)
!160 = !DILocation(line: 17, column: 2, scope: !19)
!161 = !DILocation(line: 19, column: 20, scope: !19)
!162 = !{!163, !164, i64 0}
!163 = !{!"bpf_sock_ops", !164, i64 0, !165, i64 4, !164, i64 20, !164, i64 24, !164, i64 28, !165, i64 32, !165, i64 48, !164, i64 64, !164, i64 68, !164, i64 72, !164, i64 76, !164, i64 80, !164, i64 84, !164, i64 88, !164, i64 92, !164, i64 96, !164, i64 100, !164, i64 104, !164, i64 108, !164, i64 112, !164, i64 116, !164, i64 120, !164, i64 124, !164, i64 128, !164, i64 132, !164, i64 136, !164, i64 140, !164, i64 144, !164, i64 148, !164, i64 152, !164, i64 156, !164, i64 160, !164, i64 164, !167, i64 168, !167, i64 176, !165, i64 184, !165, i64 192, !165, i64 200, !164, i64 208, !164, i64 212}
!164 = !{!"int", !165, i64 0}
!165 = !{!"omnipotent char", !166, i64 0}
!166 = !{!"Simple C/C++ TBAA"}
!167 = !{!"long long", !165, i64 0}
!168 = !DILocation(line: 21, column: 2, scope: !19)
!169 = !DILocation(line: 23, column: 18, scope: !170)
!170 = distinct !DILexicalBlock(scope: !19, file: !3, line: 21, column: 14)
!171 = !{!163, !164, i64 68}
!172 = !DILocation(line: 26, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !3, line: 26, column: 7)
!174 = !DILocation(line: 26, column: 7, scope: !170)
!175 = !DILocation(line: 24, column: 18, scope: !170)
!176 = !{!163, !164, i64 64}
!177 = !DILocation(line: 27, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !173, file: !3, line: 26, column: 23)
!179 = !{!164, !164, i64 0}
!180 = !DILocation(line: 28, column: 9, scope: !178)
!181 = !DILocation(line: 31, column: 3, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !3, line: 31, column: 3)
!183 = !DILocation(line: 33, column: 3, scope: !178)
!184 = !DILocation(line: 37, column: 18, scope: !170)
!185 = !DILocation(line: 38, column: 24, scope: !186)
!186 = distinct !DILexicalBlock(scope: !170, file: !3, line: 38, column: 7)
!187 = !DILocation(line: 38, column: 7, scope: !170)
!188 = !DILocation(line: 36, column: 18, scope: !170)
!189 = !DILocation(line: 39, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !3, line: 38, column: 34)
!191 = !DILocation(line: 41, column: 9, scope: !190)
!192 = !DILocation(line: 43, column: 3, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !3, line: 43, column: 3)
!194 = !DILocation(line: 45, column: 3, scope: !190)
!195 = !DILocation(line: 52, column: 1, scope: !19)
!196 = !DILocation(line: 51, column: 2, scope: !19)
