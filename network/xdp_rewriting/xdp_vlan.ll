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
define dso_local i32 @xdp_prognum1(%struct.xdp_md* readonly %0) #0 section "xdp_vlan_change" !dbg !137 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !150, metadata !DIExpression()), !dbg !170
  %2 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 1, i32 1), !dbg !171, !llvm.preserve.access.index !141
  %3 = load i32, i32* %2, align 4, !dbg !171, !tbaa !172
  %4 = zext i32 %3 to i64, !dbg !177
  %5 = inttoptr i64 %4 to i8*, !dbg !178
  call void @llvm.dbg.value(metadata i8* %5, metadata !151, metadata !DIExpression()), !dbg !170
  %6 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 0, i32 0), !dbg !179, !llvm.preserve.access.index !141
  %7 = load i32, i32* %6, align 4, !dbg !179, !tbaa !180
  %8 = zext i32 %7 to i64, !dbg !181
  %9 = inttoptr i64 %8 to i8*, !dbg !182
  call void @llvm.dbg.value(metadata i8* %9, metadata !152, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata i16 0, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 16)), !dbg !170
  call void @llvm.dbg.value(metadata i16 0, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 16)), !dbg !170
  call void @llvm.dbg.value(metadata i16 0, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 16)), !dbg !170
  call void @llvm.dbg.value(metadata i16 0, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 48, 16)), !dbg !170
  call void @llvm.dbg.value(metadata i8 0, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !170
  call void @llvm.dbg.value(metadata i8 0, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 72, 8)), !dbg !170
  %10 = inttoptr i64 %8 to %struct.ethhdr*, !dbg !183
  call void @llvm.dbg.value(metadata %struct.ethhdr* %10, metadata !185, metadata !DIExpression()) #3, !dbg !212
  call void @llvm.dbg.value(metadata i8* %5, metadata !202, metadata !DIExpression()) #3, !dbg !212
  call void @llvm.dbg.value(metadata %struct.parse_pkt* undef, metadata !203, metadata !DIExpression()) #3, !dbg !212
  call void @llvm.dbg.value(metadata i8 14, metadata !205, metadata !DIExpression()) #3, !dbg !212
  %11 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 14, !dbg !214
  %12 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 22, !dbg !216
  %13 = icmp ugt i8* %12, %5, !dbg !217
  br i1 %13, label %29, label %14, !dbg !218

14:                                               ; preds = %1
  %15 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %10, i32 2, i32 2) #3, !dbg !219, !llvm.preserve.access.index !192
  %16 = load i16, i16* %15, align 2, !dbg !219, !tbaa !220
  call void @llvm.dbg.value(metadata i16 %16, metadata !204, metadata !DIExpression()) #3, !dbg !212
  switch i16 %16, label %29 [
    i16 129, label %17
    i16 -22392, label %17
  ], !dbg !223

17:                                               ; preds = %14, %14
  call void @llvm.dbg.value(metadata i8* %11, metadata !206, metadata !DIExpression()) #3, !dbg !224
  call void @llvm.dbg.value(metadata i8 14, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !170
  %18 = bitcast i8* %11 to i16*, !dbg !225
  %19 = load i16, i16* %18, align 2, !dbg !225, !tbaa !226
  %20 = and i16 %19, -241, !dbg !228
  call void @llvm.dbg.value(metadata i16 undef, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 16)), !dbg !170
  call void @llvm.dbg.value(metadata i16 undef, metadata !204, metadata !DIExpression()) #3, !dbg !212
  call void @llvm.dbg.value(metadata i8 18, metadata !205, metadata !DIExpression()) #3, !dbg !212
  %21 = icmp eq i16 %20, -21745, !dbg !229
  call void @llvm.dbg.value(metadata i8 undef, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 8)), !dbg !170
  call void @llvm.dbg.value(metadata i16 undef, metadata !153, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 16)), !dbg !170
  call void @llvm.dbg.value(metadata i16 undef, metadata !204, metadata !DIExpression()) #3, !dbg !212
  call void @llvm.dbg.value(metadata i8 undef, metadata !205, metadata !DIExpression()) #3, !dbg !212
  br i1 %21, label %22, label %29, !dbg !230

22:                                               ; preds = %17
  %23 = getelementptr i8, i8* %9, i64 14, !dbg !231
  call void @llvm.dbg.value(metadata i8* %23, metadata !162, metadata !DIExpression()), !dbg !232
  %24 = bitcast i8* %23 to i16*, !dbg !233
  %25 = load i16, i16* %24, align 2, !dbg !233, !tbaa !226
  %26 = shl i16 %25, 8
  %27 = and i16 %26, -4096, !dbg !233
  %28 = tail call i16 @llvm.bswap.i16(i16 %27), !dbg !233
  store i16 %28, i16* %24, align 2, !dbg !234, !tbaa !226
  br label %29, !dbg !235

29:                                               ; preds = %14, %1, %17, %22
  %30 = phi i32 [ 2, %22 ], [ 2, %17 ], [ 0, %1 ], [ 2, %14 ], !dbg !170
  ret i32 %30, !dbg !236
}

; Function Attrs: nounwind readnone
declare i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md*, i32 immarg, i32 immarg) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: nounwind
define dso_local i32 @_tc_progA(%struct.__sk_buff* %0) #0 section "tc_vlan_push" !dbg !237 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !241, metadata !DIExpression()), !dbg !242
  %2 = tail call i64 inttoptr (i64 18 to i64 (%struct.__sk_buff*, i16, i16)*)(%struct.__sk_buff* %0, i16 zeroext 129, i16 zeroext 4011) #3, !dbg !243
  ret i32 0, !dbg !244
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
!llvm.module.flags = !{!133, !134, !135}
!llvm.ident = !{!136}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 73, type: !131, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !18, globals: !23, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_vlan.c", directory: "/root/cloud/ebpf/network/xdp4")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 43617, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./vmlinux.h", directory: "/root/cloud/ebpf/network/xdp4")
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
!25 = distinct !DIGlobalVariable(name: "bpf_skb_vlan_push", scope: !2, file: !26, line: 443, type: !27, isLocal: true, isDefinition: true)
!26 = !DIFile(filename: "libbpf/src/bpf_helper_defs.h", directory: "/root/cloud")
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DISubroutineType(types: !29)
!29 = !{!20, !30, !83, !21}
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 46581, size: 1472, elements: !32)
!32 = !{!33, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !50, !51, !52, !53, !54, !55, !56, !57, !58, !62, !63, !64, !65, !66, !102, !105, !106, !107, !130}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !31, file: !6, line: 46582, baseType: !34, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 18, baseType: !7)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !31, file: !6, line: 46583, baseType: !34, size: 32, offset: 32)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !31, file: !6, line: 46584, baseType: !34, size: 32, offset: 64)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !31, file: !6, line: 46585, baseType: !34, size: 32, offset: 96)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !31, file: !6, line: 46586, baseType: !34, size: 32, offset: 128)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !31, file: !6, line: 46587, baseType: !34, size: 32, offset: 160)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !31, file: !6, line: 46588, baseType: !34, size: 32, offset: 192)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !31, file: !6, line: 46589, baseType: !34, size: 32, offset: 224)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !31, file: !6, line: 46590, baseType: !34, size: 32, offset: 256)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !31, file: !6, line: 46591, baseType: !34, size: 32, offset: 288)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !31, file: !6, line: 46592, baseType: !34, size: 32, offset: 320)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !31, file: !6, line: 46593, baseType: !34, size: 32, offset: 352)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !31, file: !6, line: 46594, baseType: !47, size: 160, offset: 384)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 160, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 5)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !31, file: !6, line: 46595, baseType: !34, size: 32, offset: 544)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !31, file: !6, line: 46596, baseType: !34, size: 32, offset: 576)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !31, file: !6, line: 46597, baseType: !34, size: 32, offset: 608)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !31, file: !6, line: 46598, baseType: !34, size: 32, offset: 640)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !31, file: !6, line: 46599, baseType: !34, size: 32, offset: 672)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !31, file: !6, line: 46600, baseType: !34, size: 32, offset: 704)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !31, file: !6, line: 46601, baseType: !34, size: 32, offset: 736)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !31, file: !6, line: 46602, baseType: !34, size: 32, offset: 768)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !31, file: !6, line: 46603, baseType: !59, size: 128, offset: 800)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 128, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 4)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !31, file: !6, line: 46604, baseType: !59, size: 128, offset: 928)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !31, file: !6, line: 46605, baseType: !34, size: 32, offset: 1056)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !31, file: !6, line: 46606, baseType: !34, size: 32, offset: 1088)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !31, file: !6, line: 46607, baseType: !34, size: 32, offset: 1120)
!66 = !DIDerivedType(tag: DW_TAG_member, scope: !31, file: !6, line: 46608, baseType: !67, size: 64, offset: 1152)
!67 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !31, file: !6, line: 46608, size: 64, elements: !68)
!68 = !{!69}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !67, file: !6, line: 46609, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 46539, size: 448, elements: !72)
!72 = !{!73, !74, !75, !76, !79, !80, !81, !82, !84, !85, !86, !100, !101}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !71, file: !6, line: 46540, baseType: !21, size: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !71, file: !6, line: 46541, baseType: !21, size: 16, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !71, file: !6, line: 46542, baseType: !21, size: 16, offset: 32)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !71, file: !6, line: 46543, baseType: !77, size: 8, offset: 48)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !6, line: 10, baseType: !78)
!78 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !71, file: !6, line: 46544, baseType: !77, size: 8, offset: 56)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !71, file: !6, line: 46545, baseType: !77, size: 8, offset: 64)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !71, file: !6, line: 46546, baseType: !77, size: 8, offset: 72)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !71, file: !6, line: 46547, baseType: !83, size: 16, offset: 80)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !6, line: 7100, baseType: !21)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !71, file: !6, line: 46548, baseType: !83, size: 16, offset: 96)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !71, file: !6, line: 46549, baseType: !83, size: 16, offset: 112)
!86 = !DIDerivedType(tag: DW_TAG_member, scope: !71, file: !6, line: 46550, baseType: !87, size: 256, offset: 128)
!87 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !71, file: !6, line: 46550, size: 256, elements: !88)
!88 = !{!89, !95}
!89 = !DIDerivedType(tag: DW_TAG_member, scope: !87, file: !6, line: 46551, baseType: !90, size: 64)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !87, file: !6, line: 46551, size: 64, elements: !91)
!91 = !{!92, !94}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !90, file: !6, line: 46552, baseType: !93, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !6, line: 7104, baseType: !34)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !90, file: !6, line: 46553, baseType: !93, size: 32, offset: 32)
!95 = !DIDerivedType(tag: DW_TAG_member, scope: !87, file: !6, line: 46555, baseType: !96, size: 256)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !87, file: !6, line: 46555, size: 256, elements: !97)
!97 = !{!98, !99}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !96, file: !6, line: 46556, baseType: !59, size: 128)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !96, file: !6, line: 46557, baseType: !59, size: 128, offset: 128)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !71, file: !6, line: 46560, baseType: !34, size: 32, offset: 384)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !71, file: !6, line: 46561, baseType: !93, size: 32, offset: 416)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !31, file: !6, line: 46611, baseType: !103, size: 64, offset: 1216)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !6, line: 22, baseType: !104)
!104 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !31, file: !6, line: 46612, baseType: !34, size: 32, offset: 1280)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !31, file: !6, line: 46613, baseType: !34, size: 32, offset: 1312)
!107 = !DIDerivedType(tag: DW_TAG_member, scope: !31, file: !6, line: 46614, baseType: !108, size: 64, offset: 1344)
!108 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !31, file: !6, line: 46614, size: 64, elements: !109)
!109 = !{!110}
!110 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !108, file: !6, line: 46615, baseType: !111, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 46564, size: 640, elements: !113)
!113 = !{!114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !112, file: !6, line: 46565, baseType: !34, size: 32)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !112, file: !6, line: 46566, baseType: !34, size: 32, offset: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !112, file: !6, line: 46567, baseType: !34, size: 32, offset: 64)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !112, file: !6, line: 46568, baseType: !34, size: 32, offset: 96)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !112, file: !6, line: 46569, baseType: !34, size: 32, offset: 128)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !112, file: !6, line: 46570, baseType: !34, size: 32, offset: 160)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !112, file: !6, line: 46571, baseType: !34, size: 32, offset: 192)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !112, file: !6, line: 46572, baseType: !59, size: 128, offset: 224)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !112, file: !6, line: 46573, baseType: !34, size: 32, offset: 352)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !112, file: !6, line: 46574, baseType: !83, size: 16, offset: 384)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !112, file: !6, line: 46575, baseType: !34, size: 32, offset: 416)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !112, file: !6, line: 46576, baseType: !59, size: 128, offset: 448)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !112, file: !6, line: 46577, baseType: !34, size: 32, offset: 576)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !112, file: !6, line: 46578, baseType: !128, size: 32, offset: 608)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !6, line: 16, baseType: !129)
!129 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !31, file: !6, line: 46617, baseType: !34, size: 32, offset: 1408)
!131 = !DICompositeType(tag: DW_TAG_array_type, baseType: !132, size: 32, elements: !60)
!132 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!133 = !{i32 7, !"Dwarf Version", i32 4}
!134 = !{i32 2, !"Debug Info Version", i32 3}
!135 = !{i32 1, !"wchar_size", i32 4}
!136 = !{!"clang version 10.0.0-4ubuntu1 "}
!137 = distinct !DISubprogram(name: "xdp_prognum1", scope: !3, file: !3, line: 124, type: !138, scopeLine: 125, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !149)
!138 = !DISubroutineType(types: !139)
!139 = !{!129, !140}
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 46620, size: 192, elements: !142)
!142 = !{!143, !144, !145, !146, !147, !148}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !141, file: !6, line: 46621, baseType: !34, size: 32)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !141, file: !6, line: 46622, baseType: !34, size: 32, offset: 32)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !141, file: !6, line: 46623, baseType: !34, size: 32, offset: 64)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !141, file: !6, line: 46624, baseType: !34, size: 32, offset: 96)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !141, file: !6, line: 46625, baseType: !34, size: 32, offset: 128)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !141, file: !6, line: 46626, baseType: !34, size: 32, offset: 160)
!149 = !{!150, !151, !152, !153, !162}
!150 = !DILocalVariable(name: "ctx", arg: 1, scope: !137, file: !3, line: 124, type: !140)
!151 = !DILocalVariable(name: "data_end", scope: !137, file: !3, line: 126, type: !19)
!152 = !DILocalVariable(name: "data", scope: !137, file: !3, line: 127, type: !19)
!153 = !DILocalVariable(name: "pkt", scope: !137, file: !3, line: 128, type: !154)
!154 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "parse_pkt", file: !3, line: 64, size: 80, elements: !155)
!155 = !{!156, !157, !158, !159, !160, !161}
!156 = !DIDerivedType(tag: DW_TAG_member, name: "l3_proto", scope: !154, file: !3, line: 65, baseType: !21, size: 16)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "l3_offset", scope: !154, file: !3, line: 66, baseType: !21, size: 16, offset: 16)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_outer", scope: !154, file: !3, line: 67, baseType: !21, size: 16, offset: 32)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_inner", scope: !154, file: !3, line: 68, baseType: !21, size: 16, offset: 48)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_outer_offset", scope: !154, file: !3, line: 69, baseType: !77, size: 8, offset: 64)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_inner_offset", scope: !154, file: !3, line: 70, baseType: !77, size: 8, offset: 72)
!162 = !DILocalVariable(name: "vlan_hdr", scope: !163, file: !3, line: 135, type: !165)
!163 = distinct !DILexicalBlock(scope: !164, file: !3, line: 134, column: 34)
!164 = distinct !DILexicalBlock(scope: !137, file: !3, line: 134, column: 6)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_vlan_hdr", file: !3, line: 59, size: 32, elements: !167)
!167 = !{!168, !169}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !166, file: !3, line: 60, baseType: !83, size: 16)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !166, file: !3, line: 61, baseType: !83, size: 16, offset: 16)
!170 = !DILocation(line: 0, scope: !137)
!171 = !DILocation(line: 126, column: 38, scope: !137)
!172 = !{!173, !174, i64 4}
!173 = !{!"xdp_md", !174, i64 0, !174, i64 4, !174, i64 8, !174, i64 12, !174, i64 16, !174, i64 20}
!174 = !{!"int", !175, i64 0}
!175 = !{!"omnipotent char", !176, i64 0}
!176 = !{!"Simple C/C++ TBAA"}
!177 = !DILocation(line: 126, column: 27, scope: !137)
!178 = !DILocation(line: 126, column: 19, scope: !137)
!179 = !DILocation(line: 127, column: 38, scope: !137)
!180 = !{!173, !174, i64 0}
!181 = !DILocation(line: 127, column: 27, scope: !137)
!182 = !DILocation(line: 127, column: 19, scope: !137)
!183 = !DILocation(line: 130, column: 23, scope: !184)
!184 = distinct !DILexicalBlock(scope: !137, file: !3, line: 130, column: 6)
!185 = !DILocalVariable(name: "eth", arg: 1, scope: !186, file: !3, line: 76, type: !191)
!186 = distinct !DISubprogram(name: "parse_eth_frame", scope: !3, file: !3, line: 76, type: !187, scopeLine: 77, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !201)
!187 = !DISubroutineType(types: !188)
!188 = !{!189, !191, !19, !200}
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool", file: !6, line: 81, baseType: !190)
!190 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!192 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !6, line: 63910, size: 112, elements: !193)
!193 = !{!194, !198, !199}
!194 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !192, file: !6, line: 63911, baseType: !195, size: 48)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !78, size: 48, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 6)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !192, file: !6, line: 63912, baseType: !195, size: 48, offset: 48)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !192, file: !6, line: 63913, baseType: !83, size: 16, offset: 96)
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!201 = !{!185, !202, !203, !204, !205, !206, !209}
!202 = !DILocalVariable(name: "data_end", arg: 2, scope: !186, file: !3, line: 76, type: !19)
!203 = !DILocalVariable(name: "pkt", arg: 3, scope: !186, file: !3, line: 76, type: !200)
!204 = !DILocalVariable(name: "eth_type", scope: !186, file: !3, line: 78, type: !21)
!205 = !DILocalVariable(name: "offset", scope: !186, file: !3, line: 79, type: !77)
!206 = !DILocalVariable(name: "vlan_hdr", scope: !207, file: !3, line: 91, type: !165)
!207 = distinct !DILexicalBlock(scope: !208, file: !3, line: 90, column: 46)
!208 = distinct !DILexicalBlock(scope: !186, file: !3, line: 89, column: 6)
!209 = !DILocalVariable(name: "vlan_hdr", scope: !210, file: !3, line: 104, type: !165)
!210 = distinct !DILexicalBlock(scope: !211, file: !3, line: 103, column: 46)
!211 = distinct !DILexicalBlock(scope: !186, file: !3, line: 102, column: 6)
!212 = !DILocation(line: 0, scope: !186, inlinedAt: !213)
!213 = distinct !DILocation(line: 130, column: 7, scope: !184)
!214 = !DILocation(line: 83, column: 18, scope: !215, inlinedAt: !213)
!215 = distinct !DILexicalBlock(scope: !186, file: !3, line: 83, column: 6)
!216 = !DILocation(line: 83, column: 27, scope: !215, inlinedAt: !213)
!217 = !DILocation(line: 83, column: 58, scope: !215, inlinedAt: !213)
!218 = !DILocation(line: 83, column: 6, scope: !186, inlinedAt: !213)
!219 = !DILocation(line: 86, column: 18, scope: !186, inlinedAt: !213)
!220 = !{!221, !222, i64 12}
!221 = !{!"ethhdr", !175, i64 0, !175, i64 6, !222, i64 12}
!222 = !{!"short", !175, i64 0}
!223 = !DILocation(line: 90, column: 6, scope: !208, inlinedAt: !213)
!224 = !DILocation(line: 0, scope: !207, inlinedAt: !213)
!225 = !DILocation(line: 95, column: 21, scope: !207, inlinedAt: !213)
!226 = !{!227, !222, i64 0}
!227 = !{!"_vlan_hdr", !222, i64 0, !222, i64 2}
!228 = !DILocation(line: 96, column: 5, scope: !207, inlinedAt: !213)
!229 = !DILocation(line: 99, column: 2, scope: !207, inlinedAt: !213)
!230 = !DILocation(line: 134, column: 6, scope: !137)
!231 = !DILocation(line: 135, column: 37, scope: !163)
!232 = !DILocation(line: 0, scope: !163)
!233 = !DILocation(line: 139, column: 4, scope: !163)
!234 = !DILocation(line: 138, column: 24, scope: !163)
!235 = !DILocation(line: 141, column: 2, scope: !163)
!236 = !DILocation(line: 144, column: 1, scope: !137)
!237 = distinct !DISubprogram(name: "_tc_progA", scope: !3, file: !3, line: 153, type: !238, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !240)
!238 = !DISubroutineType(types: !239)
!239 = !{!129, !30}
!240 = !{!241}
!241 = !DILocalVariable(name: "ctx", arg: 1, scope: !237, file: !3, line: 153, type: !30)
!242 = !DILocation(line: 0, scope: !237)
!243 = !DILocation(line: 155, column: 2, scope: !237)
!244 = !DILocation(line: 157, column: 2, scope: !237)
