; ModuleID = 'sockex1_kern.c'
source_filename = "sockex1_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i16, i32, [4 x i32], i32, i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }

@bpf_prog1.____fmt = internal constant [20 x i8] c"Hello,proto is  %d\0A\00", align 1, !dbg !0
@bpf_prog1.____fmt.1 = internal constant [28 x i8] c"Hello,proto %u size is  %d\0A\00", align 1, !dbg !146
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !151
@llvm.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.__sk_buff*)* @bpf_prog1 to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @bpf_prog1(%struct.__sk_buff* %0) #0 section "socket" !dbg !2 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !155, metadata !DIExpression()), !dbg !165
  %2 = bitcast %struct.__sk_buff* %0 to i8*, !dbg !166
  %3 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* null, i32 6, i32 7), !dbg !167, !llvm.preserve.access.index !116
  %4 = ptrtoint i8* %3 to i64, !dbg !167
  %5 = add i64 %4, 14, !dbg !168
  %6 = tail call i64 @llvm.bpf.load.byte(i8* %2, i64 %5), !dbg !169
  %7 = trunc i64 %6 to i32, !dbg !169
  call void @llvm.dbg.value(metadata i32 %7, metadata !156, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.value(metadata i32 34, metadata !157, metadata !DIExpression()), !dbg !165
  %8 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @bpf_prog1.____fmt, i64 0, i64 0), i32 20, i32 %7) #4, !dbg !170
  %9 = icmp eq i32 %7, 1, !dbg !172
  %10 = select i1 %9, i32 62, i32 0, !dbg !172
  %11 = icmp eq i32 %7, 17, !dbg !172
  %12 = select i1 %11, i32 42, i32 %10, !dbg !172
  call void @llvm.dbg.value(metadata i32 %12, metadata !157, metadata !DIExpression()), !dbg !165
  %13 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @bpf_prog1.____fmt.1, i64 0, i64 0), i32 28, i32 %7, i32 %12) #4, !dbg !173
  ret i32 %12, !dbg !175
}

; Function Attrs: nounwind readonly
declare !dbg !130 i64 @llvm.bpf.load.byte(i8*, i64) #1

; Function Attrs: nounwind readnone
declare i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr*, i32 immarg, i32 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!111}
!llvm.module.flags = !{!161, !162, !163}
!llvm.ident = !{!164}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 14, type: !158, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "bpf_prog1", scope: !3, file: !3, line: 9, type: !4, scopeLine: 10, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !111, retainedNodes: !154)
!3 = !DIFile(filename: "sockex1_kern.c", directory: "/root/cloud/2024/ebpf/network/sockfilter1")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !9, line: 46581, size: 1472, elements: !10)
!9 = !DIFile(filename: "./vmlinux.h", directory: "/root/cloud/2024/ebpf/network/sockfilter1")
!10 = !{!11, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !29, !30, !31, !32, !33, !34, !35, !36, !37, !41, !42, !43, !44, !45, !83, !86, !87, !88, !110}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !8, file: !9, line: 46582, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !9, line: 18, baseType: !13)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !8, file: !9, line: 46583, baseType: !12, size: 32, offset: 32)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !8, file: !9, line: 46584, baseType: !12, size: 32, offset: 64)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !8, file: !9, line: 46585, baseType: !12, size: 32, offset: 96)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !8, file: !9, line: 46586, baseType: !12, size: 32, offset: 128)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !8, file: !9, line: 46587, baseType: !12, size: 32, offset: 160)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !8, file: !9, line: 46588, baseType: !12, size: 32, offset: 192)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !8, file: !9, line: 46589, baseType: !12, size: 32, offset: 224)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !8, file: !9, line: 46590, baseType: !12, size: 32, offset: 256)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !8, file: !9, line: 46591, baseType: !12, size: 32, offset: 288)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !8, file: !9, line: 46592, baseType: !12, size: 32, offset: 320)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !8, file: !9, line: 46593, baseType: !12, size: 32, offset: 352)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !8, file: !9, line: 46594, baseType: !26, size: 160, offset: 384)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 160, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 5)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !8, file: !9, line: 46595, baseType: !12, size: 32, offset: 544)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !8, file: !9, line: 46596, baseType: !12, size: 32, offset: 576)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !9, line: 46597, baseType: !12, size: 32, offset: 608)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !8, file: !9, line: 46598, baseType: !12, size: 32, offset: 640)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !8, file: !9, line: 46599, baseType: !12, size: 32, offset: 672)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !8, file: !9, line: 46600, baseType: !12, size: 32, offset: 704)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !8, file: !9, line: 46601, baseType: !12, size: 32, offset: 736)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !8, file: !9, line: 46602, baseType: !12, size: 32, offset: 768)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !8, file: !9, line: 46603, baseType: !38, size: 128, offset: 800)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 4)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !8, file: !9, line: 46604, baseType: !38, size: 128, offset: 928)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !8, file: !9, line: 46605, baseType: !12, size: 32, offset: 1056)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !8, file: !9, line: 46606, baseType: !12, size: 32, offset: 1088)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !8, file: !9, line: 46607, baseType: !12, size: 32, offset: 1120)
!45 = !DIDerivedType(tag: DW_TAG_member, scope: !8, file: !9, line: 46608, baseType: !46, size: 64, offset: 1152)
!46 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !8, file: !9, line: 46608, size: 64, elements: !47)
!47 = !{!48}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !46, file: !9, line: 46609, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !9, line: 46539, size: 448, elements: !51)
!51 = !{!52, !55, !56, !57, !60, !61, !62, !63, !65, !66, !67, !81, !82}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !50, file: !9, line: 46540, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !9, line: 14, baseType: !54)
!54 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !50, file: !9, line: 46541, baseType: !53, size: 16, offset: 16)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !50, file: !9, line: 46542, baseType: !53, size: 16, offset: 32)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !50, file: !9, line: 46543, baseType: !58, size: 8, offset: 48)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !9, line: 10, baseType: !59)
!59 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !50, file: !9, line: 46544, baseType: !58, size: 8, offset: 56)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !50, file: !9, line: 46545, baseType: !58, size: 8, offset: 64)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !50, file: !9, line: 46546, baseType: !58, size: 8, offset: 72)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !50, file: !9, line: 46547, baseType: !64, size: 16, offset: 80)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !9, line: 7100, baseType: !53)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !50, file: !9, line: 46548, baseType: !64, size: 16, offset: 96)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !50, file: !9, line: 46549, baseType: !64, size: 16, offset: 112)
!67 = !DIDerivedType(tag: DW_TAG_member, scope: !50, file: !9, line: 46550, baseType: !68, size: 256, offset: 128)
!68 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !50, file: !9, line: 46550, size: 256, elements: !69)
!69 = !{!70, !76}
!70 = !DIDerivedType(tag: DW_TAG_member, scope: !68, file: !9, line: 46551, baseType: !71, size: 64)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !68, file: !9, line: 46551, size: 64, elements: !72)
!72 = !{!73, !75}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !71, file: !9, line: 46552, baseType: !74, size: 32)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !9, line: 7104, baseType: !12)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !71, file: !9, line: 46553, baseType: !74, size: 32, offset: 32)
!76 = !DIDerivedType(tag: DW_TAG_member, scope: !68, file: !9, line: 46555, baseType: !77, size: 256)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !68, file: !9, line: 46555, size: 256, elements: !78)
!78 = !{!79, !80}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !77, file: !9, line: 46556, baseType: !38, size: 128)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !77, file: !9, line: 46557, baseType: !38, size: 128, offset: 128)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !50, file: !9, line: 46560, baseType: !12, size: 32, offset: 384)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !50, file: !9, line: 46561, baseType: !74, size: 32, offset: 416)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !8, file: !9, line: 46611, baseType: !84, size: 64, offset: 1216)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !9, line: 22, baseType: !85)
!85 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !8, file: !9, line: 46612, baseType: !12, size: 32, offset: 1280)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !8, file: !9, line: 46613, baseType: !12, size: 32, offset: 1312)
!88 = !DIDerivedType(tag: DW_TAG_member, scope: !8, file: !9, line: 46614, baseType: !89, size: 64, offset: 1344)
!89 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !8, file: !9, line: 46614, size: 64, elements: !90)
!90 = !{!91}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !89, file: !9, line: 46615, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !9, line: 46564, size: 640, elements: !94)
!94 = !{!95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !93, file: !9, line: 46565, baseType: !12, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !93, file: !9, line: 46566, baseType: !12, size: 32, offset: 32)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !93, file: !9, line: 46567, baseType: !12, size: 32, offset: 64)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !93, file: !9, line: 46568, baseType: !12, size: 32, offset: 96)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !93, file: !9, line: 46569, baseType: !12, size: 32, offset: 128)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !93, file: !9, line: 46570, baseType: !12, size: 32, offset: 160)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !93, file: !9, line: 46571, baseType: !12, size: 32, offset: 192)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !93, file: !9, line: 46572, baseType: !38, size: 128, offset: 224)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !93, file: !9, line: 46573, baseType: !12, size: 32, offset: 352)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !93, file: !9, line: 46574, baseType: !64, size: 16, offset: 384)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !93, file: !9, line: 46575, baseType: !12, size: 32, offset: 416)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !93, file: !9, line: 46576, baseType: !38, size: 128, offset: 448)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !93, file: !9, line: 46577, baseType: !12, size: 32, offset: 576)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !93, file: !9, line: 46578, baseType: !109, size: 32, offset: 608)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !9, line: 16, baseType: !6)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !8, file: !9, line: 46617, baseType: !12, size: 32, offset: 1408)
!111 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !112, retainedTypes: !113, globals: !134, splitDebugInlining: false, nameTableKind: None)
!112 = !{}
!113 = !{!114, !115, !130}
!114 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !9, line: 65353, size: 160, elements: !117)
!117 = !{!118, !119, !120, !121, !122, !123, !124, !125, !126, !128, !129}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !116, file: !9, line: 65354, baseType: !58, size: 4, flags: DIFlagBitField, extraData: i64 0)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !116, file: !9, line: 65355, baseType: !58, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !116, file: !9, line: 65356, baseType: !58, size: 8, offset: 8)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !116, file: !9, line: 65357, baseType: !64, size: 16, offset: 16)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !116, file: !9, line: 65358, baseType: !64, size: 16, offset: 32)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !116, file: !9, line: 65359, baseType: !64, size: 16, offset: 48)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !116, file: !9, line: 65360, baseType: !58, size: 8, offset: 64)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !116, file: !9, line: 65361, baseType: !58, size: 8, offset: 72)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !116, file: !9, line: 65362, baseType: !127, size: 16, offset: 80)
!127 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !9, line: 64798, baseType: !53)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !116, file: !9, line: 65363, baseType: !74, size: 32, offset: 96)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !116, file: !9, line: 65364, baseType: !74, size: 32, offset: 128)
!130 = !DISubprogram(name: "load_byte", linkageName: "llvm.bpf.load.byte", scope: !3, file: !3, line: 4, type: !131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !112)
!131 = !DISubroutineType(types: !132)
!132 = !{!85, !133, !85}
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!134 = !{!0, !135, !146, !151}
!135 = !DIGlobalVariableExpression(var: !136, expr: !DIExpression())
!136 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !111, file: !137, line: 177, type: !138, isLocal: true, isDefinition: true)
!137 = !DIFile(filename: "libbpf/src/bpf_helper_defs.h", directory: "/root/cloud")
!138 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !139)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!140 = !DISubroutineType(types: !141)
!141 = !{!142, !143, !12, null}
!142 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !145)
!145 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 26, type: !148, isLocal: true, isDefinition: true)
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !144, size: 224, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 28)
!151 = !DIGlobalVariableExpression(var: !152, expr: !DIExpression())
!152 = distinct !DIGlobalVariable(name: "_license", scope: !111, file: !3, line: 29, type: !153, isLocal: false, isDefinition: true)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !145, size: 32, elements: !39)
!154 = !{!155, !156, !157}
!155 = !DILocalVariable(name: "skb", arg: 1, scope: !2, file: !3, line: 9, type: !7)
!156 = !DILocalVariable(name: "proto", scope: !2, file: !3, line: 11, type: !6)
!157 = !DILocalVariable(name: "size", scope: !2, file: !3, line: 12, type: !6)
!158 = !DICompositeType(tag: DW_TAG_array_type, baseType: !144, size: 160, elements: !159)
!159 = !{!160}
!160 = !DISubrange(count: 20)
!161 = !{i32 7, !"Dwarf Version", i32 4}
!162 = !{i32 2, !"Debug Info Version", i32 3}
!163 = !{i32 1, !"wchar_size", i32 4}
!164 = !{!"clang version 10.0.0-4ubuntu1 "}
!165 = !DILocation(line: 0, scope: !2)
!166 = !DILocation(line: 11, column: 31, scope: !2)
!167 = !DILocation(line: 11, column: 47, scope: !2)
!168 = !DILocation(line: 11, column: 45, scope: !2)
!169 = !DILocation(line: 11, column: 21, scope: !2)
!170 = !DILocation(line: 14, column: 9, scope: !171)
!171 = distinct !DILexicalBlock(scope: !2, file: !3, line: 14, column: 9)
!172 = !DILocation(line: 15, column: 9, scope: !2)
!173 = !DILocation(line: 26, column: 9, scope: !174)
!174 = distinct !DILexicalBlock(scope: !2, file: !3, line: 26, column: 9)
!175 = !DILocation(line: 27, column: 9, scope: !2)
