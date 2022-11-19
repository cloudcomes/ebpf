; ModuleID = 'tc_drop.c'
source_filename = "tc_drop.c"
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
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@llvm.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.__sk_buff*)* @tc_drop_udp to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readonly
define dso_local i32 @tc_drop_udp(%struct.__sk_buff* readonly %0) #0 section "tc" !dbg !61 {
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !161, metadata !DIExpression()) #3, !dbg !173
  %2 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.__sk_buffs(%struct.__sk_buff* %0, i32 15, i32 15) #3, !dbg !176, !llvm.preserve.access.index !66
  %3 = load i32, i32* %2, align 4, !dbg !176, !tbaa !177
  %4 = zext i32 %3 to i64, !dbg !183
  %5 = inttoptr i64 %4 to i8*, !dbg !184
  call void @llvm.dbg.value(metadata i8* %5, metadata !168, metadata !DIExpression()) #3, !dbg !173
  %6 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.__sk_buffs(%struct.__sk_buff* %0, i32 16, i32 16) #3, !dbg !185, !llvm.preserve.access.index !66
  %7 = load i32, i32* %6, align 8, !dbg !185, !tbaa !186
  %8 = zext i32 %7 to i64, !dbg !187
  call void @llvm.dbg.value(metadata i64 %8, metadata !169, metadata !DIExpression()) #3, !dbg !173
  call void @llvm.dbg.value(metadata i8* %5, metadata !171, metadata !DIExpression()) #3, !dbg !173
  %9 = getelementptr i8, i8* %5, i64 14, !dbg !188
  %10 = bitcast i8* %9 to %struct.iphdr*, !dbg !189
  call void @llvm.dbg.value(metadata %struct.iphdr* %10, metadata !172, metadata !DIExpression()) #3, !dbg !173
  call void @llvm.dbg.value(metadata i8* %5, metadata !170, metadata !DIExpression(DW_OP_plus_uconst, 34, DW_OP_stack_value)) #3, !dbg !173
  %11 = getelementptr i8, i8* %5, i64 42, !dbg !190
  %12 = bitcast i8* %11 to %struct.udphdr*, !dbg !190
  %13 = inttoptr i64 %8 to %struct.udphdr*, !dbg !192
  %14 = icmp ugt %struct.udphdr* %12, %13, !dbg !193
  br i1 %14, label %25, label %15, !dbg !194

15:                                               ; preds = %1
  %16 = inttoptr i64 %4 to %struct.ethhdr*, !dbg !195
  call void @llvm.dbg.value(metadata %struct.ethhdr* %16, metadata !171, metadata !DIExpression()) #3, !dbg !173
  %17 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %16, i32 2, i32 2) #3, !dbg !196, !llvm.preserve.access.index !15
  %18 = load i16, i16* %17, align 2, !dbg !196, !tbaa !198
  %19 = icmp eq i16 %18, 8, !dbg !201
  br i1 %19, label %20, label %25, !dbg !202

20:                                               ; preds = %15
  %21 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* %10, i32 6, i32 7) #3, !dbg !203, !llvm.preserve.access.index !28
  %22 = load i8, i8* %21, align 1, !dbg !203, !tbaa !205
  %23 = icmp eq i8 %22, 17, !dbg !207
  %24 = select i1 %23, i32 0, i32 2, !dbg !160
  ret i32 %24, !dbg !160

25:                                               ; preds = %15, %1
  ret i32 2, !dbg !208
}

; Function Attrs: nounwind readnone
declare i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.__sk_buffs(%struct.__sk_buff*, i32 immarg, i32 immarg) #1

; Function Attrs: nounwind readnone
declare i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr*, i32 immarg, i32 immarg) #1

; Function Attrs: nounwind readnone
declare i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr*, i32 immarg, i32 immarg) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!57, !58, !59}
!llvm.ident = !{!60}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 56, type: !53, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !52, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "tc_drop.c", directory: "/root/cloud/ebpf/network/tc_demo")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 40, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./vmlinux.h", directory: "/root/cloud/ebpf/network/tc_demo")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "false", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "true", value: 1, isUnsigned: true)
!11 = !{!12, !13, !14, !27, !45}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !6, line: 63910, size: 112, elements: !16)
!16 = !{!17, !22, !23}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !15, file: !6, line: 63911, baseType: !18, size: 48)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 48, elements: !20)
!19 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!20 = !{!21}
!21 = !DISubrange(count: 6)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !15, file: !6, line: 63912, baseType: !18, size: 48, offset: 48)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !15, file: !6, line: 63913, baseType: !24, size: 16, offset: 96)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !6, line: 7100, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !6, line: 14, baseType: !26)
!26 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !6, line: 65353, size: 160, elements: !29)
!29 = !{!30, !32, !33, !34, !35, !36, !37, !38, !39, !41, !44}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !28, file: !6, line: 65354, baseType: !31, size: 4, flags: DIFlagBitField, extraData: i64 0)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !6, line: 10, baseType: !19)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !28, file: !6, line: 65355, baseType: !31, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !28, file: !6, line: 65356, baseType: !31, size: 8, offset: 8)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !28, file: !6, line: 65357, baseType: !24, size: 16, offset: 16)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !28, file: !6, line: 65358, baseType: !24, size: 16, offset: 32)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !28, file: !6, line: 65359, baseType: !24, size: 16, offset: 48)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !28, file: !6, line: 65360, baseType: !31, size: 8, offset: 64)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !28, file: !6, line: 65361, baseType: !31, size: 8, offset: 72)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !28, file: !6, line: 65362, baseType: !40, size: 16, offset: 80)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !6, line: 64798, baseType: !25)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !28, file: !6, line: 65363, baseType: !42, size: 32, offset: 96)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !6, line: 7104, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 18, baseType: !7)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !28, file: !6, line: 65364, baseType: !42, size: 32, offset: 128)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !6, line: 65390, size: 64, elements: !47)
!47 = !{!48, !49, !50, !51}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !46, file: !6, line: 65391, baseType: !24, size: 16)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !46, file: !6, line: 65392, baseType: !24, size: 16, offset: 16)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !46, file: !6, line: 65393, baseType: !24, size: 16, offset: 32)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !46, file: !6, line: 65394, baseType: !40, size: 16, offset: 48)
!52 = !{!0}
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !54, size: 32, elements: !55)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !{!56}
!56 = !DISubrange(count: 4)
!57 = !{i32 7, !"Dwarf Version", i32 4}
!58 = !{i32 2, !"Debug Info Version", i32 3}
!59 = !{i32 1, !"wchar_size", i32 4}
!60 = !{!"clang version 10.0.0-4ubuntu1 "}
!61 = distinct !DISubprogram(name: "tc_drop_udp", scope: !3, file: !3, line: 47, type: !62, scopeLine: 48, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !158)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 46581, size: 1472, elements: !67)
!67 = !{!68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !84, !85, !86, !87, !88, !89, !90, !91, !92, !94, !95, !96, !97, !98, !130, !133, !134, !135, !157}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !66, file: !6, line: 46582, baseType: !43, size: 32)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !66, file: !6, line: 46583, baseType: !43, size: 32, offset: 32)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !66, file: !6, line: 46584, baseType: !43, size: 32, offset: 64)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !66, file: !6, line: 46585, baseType: !43, size: 32, offset: 96)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !66, file: !6, line: 46586, baseType: !43, size: 32, offset: 128)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !66, file: !6, line: 46587, baseType: !43, size: 32, offset: 160)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !66, file: !6, line: 46588, baseType: !43, size: 32, offset: 192)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !66, file: !6, line: 46589, baseType: !43, size: 32, offset: 224)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !66, file: !6, line: 46590, baseType: !43, size: 32, offset: 256)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !66, file: !6, line: 46591, baseType: !43, size: 32, offset: 288)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !66, file: !6, line: 46592, baseType: !43, size: 32, offset: 320)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !66, file: !6, line: 46593, baseType: !43, size: 32, offset: 352)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !66, file: !6, line: 46594, baseType: !81, size: 160, offset: 384)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 160, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 5)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !66, file: !6, line: 46595, baseType: !43, size: 32, offset: 544)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !66, file: !6, line: 46596, baseType: !43, size: 32, offset: 576)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !66, file: !6, line: 46597, baseType: !43, size: 32, offset: 608)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !66, file: !6, line: 46598, baseType: !43, size: 32, offset: 640)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !66, file: !6, line: 46599, baseType: !43, size: 32, offset: 672)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !66, file: !6, line: 46600, baseType: !43, size: 32, offset: 704)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !66, file: !6, line: 46601, baseType: !43, size: 32, offset: 736)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !66, file: !6, line: 46602, baseType: !43, size: 32, offset: 768)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !66, file: !6, line: 46603, baseType: !93, size: 128, offset: 800)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 128, elements: !55)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !66, file: !6, line: 46604, baseType: !93, size: 128, offset: 928)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !66, file: !6, line: 46605, baseType: !43, size: 32, offset: 1056)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !66, file: !6, line: 46606, baseType: !43, size: 32, offset: 1088)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !66, file: !6, line: 46607, baseType: !43, size: 32, offset: 1120)
!98 = !DIDerivedType(tag: DW_TAG_member, scope: !66, file: !6, line: 46608, baseType: !99, size: 64, offset: 1152)
!99 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !66, file: !6, line: 46608, size: 64, elements: !100)
!100 = !{!101}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !99, file: !6, line: 46609, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 46539, size: 448, elements: !104)
!104 = !{!105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !128, !129}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !103, file: !6, line: 46540, baseType: !25, size: 16)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !103, file: !6, line: 46541, baseType: !25, size: 16, offset: 16)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !103, file: !6, line: 46542, baseType: !25, size: 16, offset: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !103, file: !6, line: 46543, baseType: !31, size: 8, offset: 48)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !103, file: !6, line: 46544, baseType: !31, size: 8, offset: 56)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !103, file: !6, line: 46545, baseType: !31, size: 8, offset: 64)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !103, file: !6, line: 46546, baseType: !31, size: 8, offset: 72)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !103, file: !6, line: 46547, baseType: !24, size: 16, offset: 80)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !103, file: !6, line: 46548, baseType: !24, size: 16, offset: 96)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !103, file: !6, line: 46549, baseType: !24, size: 16, offset: 112)
!115 = !DIDerivedType(tag: DW_TAG_member, scope: !103, file: !6, line: 46550, baseType: !116, size: 256, offset: 128)
!116 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !103, file: !6, line: 46550, size: 256, elements: !117)
!117 = !{!118, !123}
!118 = !DIDerivedType(tag: DW_TAG_member, scope: !116, file: !6, line: 46551, baseType: !119, size: 64)
!119 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !116, file: !6, line: 46551, size: 64, elements: !120)
!120 = !{!121, !122}
!121 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !119, file: !6, line: 46552, baseType: !42, size: 32)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !119, file: !6, line: 46553, baseType: !42, size: 32, offset: 32)
!123 = !DIDerivedType(tag: DW_TAG_member, scope: !116, file: !6, line: 46555, baseType: !124, size: 256)
!124 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !116, file: !6, line: 46555, size: 256, elements: !125)
!125 = !{!126, !127}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !124, file: !6, line: 46556, baseType: !93, size: 128)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !124, file: !6, line: 46557, baseType: !93, size: 128, offset: 128)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !103, file: !6, line: 46560, baseType: !43, size: 32, offset: 384)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !103, file: !6, line: 46561, baseType: !42, size: 32, offset: 416)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !66, file: !6, line: 46611, baseType: !131, size: 64, offset: 1216)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !6, line: 22, baseType: !132)
!132 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !66, file: !6, line: 46612, baseType: !43, size: 32, offset: 1280)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !66, file: !6, line: 46613, baseType: !43, size: 32, offset: 1312)
!135 = !DIDerivedType(tag: DW_TAG_member, scope: !66, file: !6, line: 46614, baseType: !136, size: 64, offset: 1344)
!136 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !66, file: !6, line: 46614, size: 64, elements: !137)
!137 = !{!138}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !136, file: !6, line: 46615, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!140 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 46564, size: 640, elements: !141)
!141 = !{!142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155}
!142 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !140, file: !6, line: 46565, baseType: !43, size: 32)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !140, file: !6, line: 46566, baseType: !43, size: 32, offset: 32)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !140, file: !6, line: 46567, baseType: !43, size: 32, offset: 64)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !140, file: !6, line: 46568, baseType: !43, size: 32, offset: 96)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !140, file: !6, line: 46569, baseType: !43, size: 32, offset: 128)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !140, file: !6, line: 46570, baseType: !43, size: 32, offset: 160)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !140, file: !6, line: 46571, baseType: !43, size: 32, offset: 192)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !140, file: !6, line: 46572, baseType: !93, size: 128, offset: 224)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !140, file: !6, line: 46573, baseType: !43, size: 32, offset: 352)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !140, file: !6, line: 46574, baseType: !24, size: 16, offset: 384)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !140, file: !6, line: 46575, baseType: !43, size: 32, offset: 416)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !140, file: !6, line: 46576, baseType: !93, size: 128, offset: 448)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !140, file: !6, line: 46577, baseType: !43, size: 32, offset: 576)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !140, file: !6, line: 46578, baseType: !156, size: 32, offset: 608)
!156 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !6, line: 16, baseType: !64)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !66, file: !6, line: 46617, baseType: !43, size: 32, offset: 1408)
!158 = !{!159}
!159 = !DILocalVariable(name: "skb", arg: 1, scope: !61, file: !3, line: 47, type: !65)
!160 = !DILocation(line: 0, scope: !61)
!161 = !DILocalVariable(name: "skb", arg: 1, scope: !162, file: !3, line: 23, type: !65)
!162 = distinct !DISubprogram(name: "is_udp", scope: !3, file: !3, line: 23, type: !163, scopeLine: 23, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !167)
!163 = !DISubroutineType(types: !164)
!164 = !{!165, !65}
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool", file: !6, line: 81, baseType: !166)
!166 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!167 = !{!161, !168, !169, !170, !171, !172}
!168 = !DILocalVariable(name: "data", scope: !162, file: !3, line: 24, type: !12)
!169 = !DILocalVariable(name: "data_end", scope: !162, file: !3, line: 25, type: !12)
!170 = !DILocalVariable(name: "udp_hdr", scope: !162, file: !3, line: 27, type: !45)
!171 = !DILocalVariable(name: "eth_hdr", scope: !162, file: !3, line: 28, type: !14)
!172 = !DILocalVariable(name: "ip_hdr", scope: !162, file: !3, line: 29, type: !27)
!173 = !DILocation(line: 0, scope: !162, inlinedAt: !174)
!174 = distinct !DILocation(line: 50, column: 7, scope: !175)
!175 = distinct !DILexicalBlock(scope: !61, file: !3, line: 50, column: 7)
!176 = !DILocation(line: 24, column: 35, scope: !162, inlinedAt: !174)
!177 = !{!178, !179, i64 76}
!178 = !{!"__sk_buff", !179, i64 0, !179, i64 4, !179, i64 8, !179, i64 12, !179, i64 16, !179, i64 20, !179, i64 24, !179, i64 28, !179, i64 32, !179, i64 36, !179, i64 40, !179, i64 44, !180, i64 48, !179, i64 68, !179, i64 72, !179, i64 76, !179, i64 80, !179, i64 84, !179, i64 88, !179, i64 92, !179, i64 96, !180, i64 100, !180, i64 116, !179, i64 132, !179, i64 136, !179, i64 140, !180, i64 144, !182, i64 152, !179, i64 160, !179, i64 164, !180, i64 168, !179, i64 176}
!179 = !{!"int", !180, i64 0}
!180 = !{!"omnipotent char", !181, i64 0}
!181 = !{!"Simple C/C++ TBAA"}
!182 = !{!"long long", !180, i64 0}
!183 = !DILocation(line: 24, column: 24, scope: !162, inlinedAt: !174)
!184 = !DILocation(line: 24, column: 16, scope: !162, inlinedAt: !174)
!185 = !DILocation(line: 25, column: 39, scope: !162, inlinedAt: !174)
!186 = !{!178, !179, i64 80}
!187 = !DILocation(line: 25, column: 28, scope: !162, inlinedAt: !174)
!188 = !DILocation(line: 32, column: 34, scope: !162, inlinedAt: !174)
!189 = !DILocation(line: 32, column: 12, scope: !162, inlinedAt: !174)
!190 = !DILocation(line: 35, column: 15, scope: !191, inlinedAt: !174)
!191 = distinct !DILexicalBlock(scope: !162, file: !3, line: 35, column: 7)
!192 = !DILocation(line: 35, column: 21, scope: !191, inlinedAt: !174)
!193 = !DILocation(line: 35, column: 19, scope: !191, inlinedAt: !174)
!194 = !DILocation(line: 35, column: 7, scope: !162, inlinedAt: !174)
!195 = !DILocation(line: 31, column: 13, scope: !162, inlinedAt: !174)
!196 = !DILocation(line: 38, column: 16, scope: !197, inlinedAt: !174)
!197 = distinct !DILexicalBlock(scope: !162, file: !3, line: 38, column: 7)
!198 = !{!199, !200, i64 12}
!199 = !{!"ethhdr", !180, i64 0, !180, i64 6, !200, i64 12}
!200 = !{!"short", !180, i64 0}
!201 = !DILocation(line: 38, column: 24, scope: !197, inlinedAt: !174)
!202 = !DILocation(line: 38, column: 7, scope: !162, inlinedAt: !174)
!203 = !DILocation(line: 40, column: 15, scope: !204, inlinedAt: !174)
!204 = distinct !DILexicalBlock(scope: !162, file: !3, line: 40, column: 7)
!205 = !{!206, !180, i64 9}
!206 = !{!"iphdr", !180, i64 0, !180, i64 0, !180, i64 1, !200, i64 2, !200, i64 4, !200, i64 6, !180, i64 8, !180, i64 9, !200, i64 10, !179, i64 12, !179, i64 16}
!207 = !DILocation(line: 40, column: 24, scope: !204, inlinedAt: !174)
!208 = !DILocation(line: 54, column: 1, scope: !61)
