; ModuleID = 'xdp_vlan.c'
source_filename = "xdp_vlan.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.parse_pkt = type { i16, i16, i16, i16, i8, i8 }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i16, i32, [4 x i32], i32, i32 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.__sk_buff*)* @_tc_progA to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_prognum1 to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_prognum1(%struct.xdp_md* readonly %0) #0 section "xdp_vlan_change" !dbg !138 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !151, metadata !DIExpression()), !dbg !171
  %2 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 1, i32 1), !dbg !172, !llvm.preserve.access.index !142
  %3 = load i32, i32* %2, align 4, !dbg !172, !tbaa !173
  %4 = zext i32 %3 to i64, !dbg !178
  %5 = inttoptr i64 %4 to i8*, !dbg !179
  call void @llvm.dbg.value(metadata i8* %5, metadata !152, metadata !DIExpression()), !dbg !171
  %6 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 0, i32 0), !dbg !180, !llvm.preserve.access.index !142
  %7 = load i32, i32* %6, align 4, !dbg !180, !tbaa !181
  %8 = zext i32 %7 to i64, !dbg !182
  %9 = inttoptr i64 %8 to i8*, !dbg !183
  call void @llvm.dbg.value(metadata i8* %9, metadata !153, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i16 0, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 16)), !dbg !171
  call void @llvm.dbg.value(metadata i16 0, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 16)), !dbg !171
  call void @llvm.dbg.value(metadata i16 0, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 16)), !dbg !171
  call void @llvm.dbg.value(metadata i16 0, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 16)), !dbg !171
  call void @llvm.dbg.value(metadata i8 0, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !171
  call void @llvm.dbg.value(metadata i8 0, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !171
  %10 = inttoptr i64 %8 to %struct.ethhdr*, !dbg !184
  call void @llvm.dbg.value(metadata %struct.ethhdr* %10, metadata !186, metadata !DIExpression()) #3, !dbg !213
  call void @llvm.dbg.value(metadata i8* %5, metadata !203, metadata !DIExpression()) #3, !dbg !213
  call void @llvm.dbg.value(metadata %struct.parse_pkt* undef, metadata !204, metadata !DIExpression()) #3, !dbg !213
  call void @llvm.dbg.value(metadata i8 14, metadata !206, metadata !DIExpression()) #3, !dbg !213
  %11 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 14, !dbg !215
  %12 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 22, !dbg !217
  %13 = icmp ugt i8* %12, %5, !dbg !218
  br i1 %13, label %29, label %14, !dbg !219

14:                                               ; preds = %1
  %15 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %10, i32 2, i32 2) #3, !dbg !220, !llvm.preserve.access.index !193
  %16 = load i16, i16* %15, align 2, !dbg !220, !tbaa !221
  call void @llvm.dbg.value(metadata i16 %16, metadata !205, metadata !DIExpression()) #3, !dbg !213
  switch i16 %16, label %29 [
    i16 129, label %17
    i16 -22392, label %17
  ], !dbg !224

17:                                               ; preds = %14, %14
  call void @llvm.dbg.value(metadata i8* %11, metadata !207, metadata !DIExpression()) #3, !dbg !225
  call void @llvm.dbg.value(metadata i8 14, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !171
  %18 = bitcast i8* %11 to i16*, !dbg !226
  %19 = load i16, i16* %18, align 2, !dbg !226, !tbaa !227
  %20 = and i16 %19, -241, !dbg !229
  call void @llvm.dbg.value(metadata i16 undef, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 16)), !dbg !171
  call void @llvm.dbg.value(metadata i16 undef, metadata !205, metadata !DIExpression()) #3, !dbg !213
  call void @llvm.dbg.value(metadata i8 18, metadata !206, metadata !DIExpression()) #3, !dbg !213
  %21 = icmp eq i16 %20, -21745, !dbg !230
  call void @llvm.dbg.value(metadata i8 undef, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !171
  call void @llvm.dbg.value(metadata i16 undef, metadata !154, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 16)), !dbg !171
  call void @llvm.dbg.value(metadata i16 undef, metadata !205, metadata !DIExpression()) #3, !dbg !213
  call void @llvm.dbg.value(metadata i8 undef, metadata !206, metadata !DIExpression()) #3, !dbg !213
  br i1 %21, label %22, label %29, !dbg !231

22:                                               ; preds = %17
  %23 = getelementptr i8, i8* %9, i64 14, !dbg !232
  call void @llvm.dbg.value(metadata i8* %23, metadata !163, metadata !DIExpression()), !dbg !233
  %24 = bitcast i8* %23 to i16*, !dbg !234
  %25 = load i16, i16* %24, align 2, !dbg !234, !tbaa !227
  %26 = shl i16 %25, 8
  %27 = and i16 %26, -4096, !dbg !234
  %28 = tail call i16 @llvm.bswap.i16(i16 %27), !dbg !234
  store i16 %28, i16* %24, align 2, !dbg !235, !tbaa !227
  br label %29, !dbg !236

29:                                               ; preds = %14, %1, %17, %22
  %30 = phi i32 [ 2, %22 ], [ 2, %17 ], [ 0, %1 ], [ 2, %14 ], !dbg !171
  ret i32 %30, !dbg !237
}

; Function Attrs: nounwind readnone
declare i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md*, i32 immarg, i32 immarg) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: nounwind
define dso_local i32 @_tc_progA(%struct.__sk_buff* %0) #0 section "tc_vlan_push" !dbg !238 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !242, metadata !DIExpression()), !dbg !243
  %2 = tail call i64 inttoptr (i64 18 to i64 (%struct.__sk_buff*, i16, i16)*)(%struct.__sk_buff* %0, i16 zeroext 129, i16 zeroext 4011) #3, !dbg !244
  ret i32 0, !dbg !245
}

; Function Attrs: nounwind readnone
declare i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr*, i32 immarg, i32 immarg) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!134, !135, !136}
!llvm.ident = !{!137}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 73, type: !132, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !18, globals: !23, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_vlan.c", directory: "/root/cloud/2024/ebpf/network/xdp_rewriting")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 43617, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./vmlinux.h", directory: "/root/cloud/2024/ebpf/network/xdp_rewriting")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 40, baseType: !7, size: 32, elements: !15)
!15 = !{!16, !17}
!16 = !DIEnumerator(name: "false", value: 0, isUnsigned: true)
!17 = !DIEnumerator(name: "true", value: 1, isUnsigned: true)
!18 = !{!19, !20, !21}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !6, line: 14, baseType: !22)
!22 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!23 = !{!0, !24}
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "bpf_skb_vlan_push", scope: !2, file: !26, line: 446, type: !27, isLocal: true, isDefinition: true)
!26 = !DIFile(filename: "libbpf/src/bpf_helper_defs.h", directory: "/root/cloud")
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DISubroutineType(types: !30)
!30 = !{!20, !31, !84, !21}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 46581, size: 1472, elements: !33)
!33 = !{!34, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !51, !52, !53, !54, !55, !56, !57, !58, !59, !63, !64, !65, !66, !67, !103, !106, !107, !108, !131}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !32, file: !6, line: 46582, baseType: !35, size: 32)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 18, baseType: !7)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !32, file: !6, line: 46583, baseType: !35, size: 32, offset: 32)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !32, file: !6, line: 46584, baseType: !35, size: 32, offset: 64)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !32, file: !6, line: 46585, baseType: !35, size: 32, offset: 96)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !32, file: !6, line: 46586, baseType: !35, size: 32, offset: 128)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !32, file: !6, line: 46587, baseType: !35, size: 32, offset: 160)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !32, file: !6, line: 46588, baseType: !35, size: 32, offset: 192)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !32, file: !6, line: 46589, baseType: !35, size: 32, offset: 224)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !32, file: !6, line: 46590, baseType: !35, size: 32, offset: 256)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !32, file: !6, line: 46591, baseType: !35, size: 32, offset: 288)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !32, file: !6, line: 46592, baseType: !35, size: 32, offset: 320)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !32, file: !6, line: 46593, baseType: !35, size: 32, offset: 352)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !32, file: !6, line: 46594, baseType: !48, size: 160, offset: 384)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 160, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 5)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !32, file: !6, line: 46595, baseType: !35, size: 32, offset: 544)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !32, file: !6, line: 46596, baseType: !35, size: 32, offset: 576)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !32, file: !6, line: 46597, baseType: !35, size: 32, offset: 608)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !32, file: !6, line: 46598, baseType: !35, size: 32, offset: 640)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !32, file: !6, line: 46599, baseType: !35, size: 32, offset: 672)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !32, file: !6, line: 46600, baseType: !35, size: 32, offset: 704)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !32, file: !6, line: 46601, baseType: !35, size: 32, offset: 736)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !32, file: !6, line: 46602, baseType: !35, size: 32, offset: 768)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !32, file: !6, line: 46603, baseType: !60, size: 128, offset: 800)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 128, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 4)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !32, file: !6, line: 46604, baseType: !60, size: 128, offset: 928)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !32, file: !6, line: 46605, baseType: !35, size: 32, offset: 1056)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !32, file: !6, line: 46606, baseType: !35, size: 32, offset: 1088)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !32, file: !6, line: 46607, baseType: !35, size: 32, offset: 1120)
!67 = !DIDerivedType(tag: DW_TAG_member, scope: !32, file: !6, line: 46608, baseType: !68, size: 64, offset: 1152)
!68 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !32, file: !6, line: 46608, size: 64, elements: !69)
!69 = !{!70}
!70 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !68, file: !6, line: 46609, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 46539, size: 448, elements: !73)
!73 = !{!74, !75, !76, !77, !80, !81, !82, !83, !85, !86, !87, !101, !102}
!74 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !72, file: !6, line: 46540, baseType: !21, size: 16)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !72, file: !6, line: 46541, baseType: !21, size: 16, offset: 16)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !72, file: !6, line: 46542, baseType: !21, size: 16, offset: 32)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !72, file: !6, line: 46543, baseType: !78, size: 8, offset: 48)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !6, line: 10, baseType: !79)
!79 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !72, file: !6, line: 46544, baseType: !78, size: 8, offset: 56)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !72, file: !6, line: 46545, baseType: !78, size: 8, offset: 64)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !72, file: !6, line: 46546, baseType: !78, size: 8, offset: 72)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !72, file: !6, line: 46547, baseType: !84, size: 16, offset: 80)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !6, line: 7100, baseType: !21)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !72, file: !6, line: 46548, baseType: !84, size: 16, offset: 96)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !72, file: !6, line: 46549, baseType: !84, size: 16, offset: 112)
!87 = !DIDerivedType(tag: DW_TAG_member, scope: !72, file: !6, line: 46550, baseType: !88, size: 256, offset: 128)
!88 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !72, file: !6, line: 46550, size: 256, elements: !89)
!89 = !{!90, !96}
!90 = !DIDerivedType(tag: DW_TAG_member, scope: !88, file: !6, line: 46551, baseType: !91, size: 64)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !88, file: !6, line: 46551, size: 64, elements: !92)
!92 = !{!93, !95}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !91, file: !6, line: 46552, baseType: !94, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !6, line: 7104, baseType: !35)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !91, file: !6, line: 46553, baseType: !94, size: 32, offset: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, scope: !88, file: !6, line: 46555, baseType: !97, size: 256)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !88, file: !6, line: 46555, size: 256, elements: !98)
!98 = !{!99, !100}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !97, file: !6, line: 46556, baseType: !60, size: 128)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !97, file: !6, line: 46557, baseType: !60, size: 128, offset: 128)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !72, file: !6, line: 46560, baseType: !35, size: 32, offset: 384)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !72, file: !6, line: 46561, baseType: !94, size: 32, offset: 416)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !32, file: !6, line: 46611, baseType: !104, size: 64, offset: 1216)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !6, line: 22, baseType: !105)
!105 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !32, file: !6, line: 46612, baseType: !35, size: 32, offset: 1280)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !32, file: !6, line: 46613, baseType: !35, size: 32, offset: 1312)
!108 = !DIDerivedType(tag: DW_TAG_member, scope: !32, file: !6, line: 46614, baseType: !109, size: 64, offset: 1344)
!109 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !32, file: !6, line: 46614, size: 64, elements: !110)
!110 = !{!111}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !109, file: !6, line: 46615, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 46564, size: 640, elements: !114)
!114 = !{!115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !113, file: !6, line: 46565, baseType: !35, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !113, file: !6, line: 46566, baseType: !35, size: 32, offset: 32)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !113, file: !6, line: 46567, baseType: !35, size: 32, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !113, file: !6, line: 46568, baseType: !35, size: 32, offset: 96)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !113, file: !6, line: 46569, baseType: !35, size: 32, offset: 128)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !113, file: !6, line: 46570, baseType: !35, size: 32, offset: 160)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !113, file: !6, line: 46571, baseType: !35, size: 32, offset: 192)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !113, file: !6, line: 46572, baseType: !60, size: 128, offset: 224)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !113, file: !6, line: 46573, baseType: !35, size: 32, offset: 352)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !113, file: !6, line: 46574, baseType: !84, size: 16, offset: 384)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !113, file: !6, line: 46575, baseType: !35, size: 32, offset: 416)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !113, file: !6, line: 46576, baseType: !60, size: 128, offset: 448)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !113, file: !6, line: 46577, baseType: !35, size: 32, offset: 576)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !113, file: !6, line: 46578, baseType: !129, size: 32, offset: 608)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !6, line: 16, baseType: !130)
!130 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !32, file: !6, line: 46617, baseType: !35, size: 32, offset: 1408)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !133, size: 32, elements: !61)
!133 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!134 = !{i32 7, !"Dwarf Version", i32 4}
!135 = !{i32 2, !"Debug Info Version", i32 3}
!136 = !{i32 1, !"wchar_size", i32 4}
!137 = !{!"clang version 10.0.0-4ubuntu1 "}
!138 = distinct !DISubprogram(name: "xdp_prognum1", scope: !3, file: !3, line: 124, type: !139, scopeLine: 125, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !150)
!139 = !DISubroutineType(types: !140)
!140 = !{!130, !141}
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !142, size: 64)
!142 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 46620, size: 192, elements: !143)
!143 = !{!144, !145, !146, !147, !148, !149}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !142, file: !6, line: 46621, baseType: !35, size: 32)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !142, file: !6, line: 46622, baseType: !35, size: 32, offset: 32)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !142, file: !6, line: 46623, baseType: !35, size: 32, offset: 64)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !142, file: !6, line: 46624, baseType: !35, size: 32, offset: 96)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !142, file: !6, line: 46625, baseType: !35, size: 32, offset: 128)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !142, file: !6, line: 46626, baseType: !35, size: 32, offset: 160)
!150 = !{!151, !152, !153, !154, !163}
!151 = !DILocalVariable(name: "ctx", arg: 1, scope: !138, file: !3, line: 124, type: !141)
!152 = !DILocalVariable(name: "data_end", scope: !138, file: !3, line: 126, type: !19)
!153 = !DILocalVariable(name: "data", scope: !138, file: !3, line: 127, type: !19)
!154 = !DILocalVariable(name: "pkt", scope: !138, file: !3, line: 128, type: !155)
!155 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "parse_pkt", file: !3, line: 64, size: 80, elements: !156)
!156 = !{!157, !158, !159, !160, !161, !162}
!157 = !DIDerivedType(tag: DW_TAG_member, name: "l3_proto", scope: !155, file: !3, line: 65, baseType: !21, size: 16)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "l3_offset", scope: !155, file: !3, line: 66, baseType: !21, size: 16, offset: 16)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_outer", scope: !155, file: !3, line: 67, baseType: !21, size: 16, offset: 32)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_inner", scope: !155, file: !3, line: 68, baseType: !21, size: 16, offset: 48)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_outer_offset", scope: !155, file: !3, line: 69, baseType: !78, size: 8, offset: 64)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_inner_offset", scope: !155, file: !3, line: 70, baseType: !78, size: 8, offset: 72)
!163 = !DILocalVariable(name: "vlan_hdr", scope: !164, file: !3, line: 135, type: !166)
!164 = distinct !DILexicalBlock(scope: !165, file: !3, line: 134, column: 34)
!165 = distinct !DILexicalBlock(scope: !138, file: !3, line: 134, column: 6)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_vlan_hdr", file: !3, line: 59, size: 32, elements: !168)
!168 = !{!169, !170}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !167, file: !3, line: 60, baseType: !84, size: 16)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !167, file: !3, line: 61, baseType: !84, size: 16, offset: 16)
!171 = !DILocation(line: 0, scope: !138)
!172 = !DILocation(line: 126, column: 38, scope: !138)
!173 = !{!174, !175, i64 4}
!174 = !{!"xdp_md", !175, i64 0, !175, i64 4, !175, i64 8, !175, i64 12, !175, i64 16, !175, i64 20}
!175 = !{!"int", !176, i64 0}
!176 = !{!"omnipotent char", !177, i64 0}
!177 = !{!"Simple C/C++ TBAA"}
!178 = !DILocation(line: 126, column: 27, scope: !138)
!179 = !DILocation(line: 126, column: 19, scope: !138)
!180 = !DILocation(line: 127, column: 38, scope: !138)
!181 = !{!174, !175, i64 0}
!182 = !DILocation(line: 127, column: 27, scope: !138)
!183 = !DILocation(line: 127, column: 19, scope: !138)
!184 = !DILocation(line: 130, column: 23, scope: !185)
!185 = distinct !DILexicalBlock(scope: !138, file: !3, line: 130, column: 6)
!186 = !DILocalVariable(name: "eth", arg: 1, scope: !187, file: !3, line: 76, type: !192)
!187 = distinct !DISubprogram(name: "parse_eth_frame", scope: !3, file: !3, line: 76, type: !188, scopeLine: 77, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !202)
!188 = !DISubroutineType(types: !189)
!189 = !{!190, !192, !19, !201}
!190 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool", file: !6, line: 81, baseType: !191)
!191 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !6, line: 63910, size: 112, elements: !194)
!194 = !{!195, !199, !200}
!195 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !193, file: !6, line: 63911, baseType: !196, size: 48)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !79, size: 48, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 6)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !193, file: !6, line: 63912, baseType: !196, size: 48, offset: 48)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !193, file: !6, line: 63913, baseType: !84, size: 16, offset: 96)
!201 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!202 = !{!186, !203, !204, !205, !206, !207, !210}
!203 = !DILocalVariable(name: "data_end", arg: 2, scope: !187, file: !3, line: 76, type: !19)
!204 = !DILocalVariable(name: "pkt", arg: 3, scope: !187, file: !3, line: 76, type: !201)
!205 = !DILocalVariable(name: "eth_type", scope: !187, file: !3, line: 78, type: !21)
!206 = !DILocalVariable(name: "offset", scope: !187, file: !3, line: 79, type: !78)
!207 = !DILocalVariable(name: "vlan_hdr", scope: !208, file: !3, line: 91, type: !166)
!208 = distinct !DILexicalBlock(scope: !209, file: !3, line: 90, column: 46)
!209 = distinct !DILexicalBlock(scope: !187, file: !3, line: 89, column: 6)
!210 = !DILocalVariable(name: "vlan_hdr", scope: !211, file: !3, line: 104, type: !166)
!211 = distinct !DILexicalBlock(scope: !212, file: !3, line: 103, column: 46)
!212 = distinct !DILexicalBlock(scope: !187, file: !3, line: 102, column: 6)
!213 = !DILocation(line: 0, scope: !187, inlinedAt: !214)
!214 = distinct !DILocation(line: 130, column: 7, scope: !185)
!215 = !DILocation(line: 83, column: 18, scope: !216, inlinedAt: !214)
!216 = distinct !DILexicalBlock(scope: !187, file: !3, line: 83, column: 6)
!217 = !DILocation(line: 83, column: 27, scope: !216, inlinedAt: !214)
!218 = !DILocation(line: 83, column: 58, scope: !216, inlinedAt: !214)
!219 = !DILocation(line: 83, column: 6, scope: !187, inlinedAt: !214)
!220 = !DILocation(line: 86, column: 18, scope: !187, inlinedAt: !214)
!221 = !{!222, !223, i64 12}
!222 = !{!"ethhdr", !176, i64 0, !176, i64 6, !223, i64 12}
!223 = !{!"short", !176, i64 0}
!224 = !DILocation(line: 90, column: 6, scope: !209, inlinedAt: !214)
!225 = !DILocation(line: 0, scope: !208, inlinedAt: !214)
!226 = !DILocation(line: 95, column: 21, scope: !208, inlinedAt: !214)
!227 = !{!228, !223, i64 0}
!228 = !{!"_vlan_hdr", !223, i64 0, !223, i64 2}
!229 = !DILocation(line: 96, column: 5, scope: !208, inlinedAt: !214)
!230 = !DILocation(line: 99, column: 2, scope: !208, inlinedAt: !214)
!231 = !DILocation(line: 134, column: 6, scope: !138)
!232 = !DILocation(line: 135, column: 37, scope: !164)
!233 = !DILocation(line: 0, scope: !164)
!234 = !DILocation(line: 139, column: 4, scope: !164)
!235 = !DILocation(line: 138, column: 24, scope: !164)
!236 = !DILocation(line: 141, column: 2, scope: !164)
!237 = !DILocation(line: 144, column: 1, scope: !138)
!238 = distinct !DISubprogram(name: "_tc_progA", scope: !3, file: !3, line: 153, type: !239, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !241)
!239 = !DISubroutineType(types: !240)
!240 = !{!130, !31}
!241 = !{!242}
!242 = !DILocalVariable(name: "ctx", arg: 1, scope: !238, file: !3, line: 153, type: !31)
!243 = !DILocation(line: 0, scope: !238)
!244 = !DILocation(line: 155, column: 2, scope: !238)
!245 = !DILocation(line: 157, column: 2, scope: !238)
