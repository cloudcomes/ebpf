; ModuleID = 'sockex1_kern.c'
source_filename = "sockex1_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.3 = type { [2 x i32]*, i32*, i64*, [256 x i32]* }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }

@my_map = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !34
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.__sk_buff*)* @bpf_prog1 to i8*), i8* bitcast (%struct.anon.3* @my_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @bpf_prog1(%struct.__sk_buff* %0) #0 section "socket1" !dbg !71 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !169, metadata !DIExpression()), !dbg !172
  %3 = bitcast i32* %2 to i8*, !dbg !173
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #4, !dbg !173
  %4 = bitcast %struct.__sk_buff* %0 to i8*, !dbg !174
  %5 = tail call i64 @llvm.bpf.load.byte(i8* %4, i64 23), !dbg !175
  %6 = trunc i64 %5 to i32, !dbg !175
  call void @llvm.dbg.value(metadata i32 %6, metadata !170, metadata !DIExpression()), !dbg !172
  store i32 %6, i32* %2, align 4, !dbg !176, !tbaa !177
  %7 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 1, !dbg !181
  %8 = load i32, i32* %7, align 4, !dbg !181, !tbaa !183
  %9 = icmp eq i32 %8, 4, !dbg !186
  br i1 %9, label %10, label %19, !dbg !187

10:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i32* %2, metadata !170, metadata !DIExpression(DW_OP_deref)), !dbg !172
  %11 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.3* @my_map to i8*), i8* nonnull %3) #4, !dbg !188
  call void @llvm.dbg.value(metadata i8* %11, metadata !171, metadata !DIExpression()), !dbg !172
  %12 = icmp eq i8* %11, null, !dbg !189
  br i1 %12, label %19, label %13, !dbg !191

13:                                               ; preds = %10
  %14 = bitcast i8* %11 to i64*, !dbg !188
  call void @llvm.dbg.value(metadata i64* %14, metadata !171, metadata !DIExpression()), !dbg !172
  %15 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 0, !dbg !192
  %16 = load i32, i32* %15, align 8, !dbg !192, !tbaa !193
  %17 = zext i32 %16 to i64, !dbg !194
  %18 = atomicrmw add i64* %14, i64 %17 seq_cst, !dbg !195
  br label %19, !dbg !195

19:                                               ; preds = %13, %10, %1
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #4, !dbg !196
  ret i32 0, !dbg !196
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind readonly
declare !dbg !197 i64 @llvm.bpf.load.byte(i8*, i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind readonly }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!67, !68, !69}
!llvm.ident = !{!70}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "my_map", scope: !2, file: !3, line: 13, type: !49, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 11.0.0-2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !33, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "sockex1_kern.c", directory: "/home/cloudcome/ebpf/socket")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !9, line: 86, size: 160, elements: !10)
!9 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!10 = !{!11, !15, !16, !17, !22, !23, !24, !25, !26, !28, !32}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !8, file: !9, line: 88, baseType: !12, size: 4, flags: DIFlagBitField, extraData: i64 0)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !14)
!13 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !8, file: !9, line: 89, baseType: !12, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !8, file: !9, line: 96, baseType: !12, size: 8, offset: 8)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !8, file: !9, line: 97, baseType: !18, size: 16, offset: 16)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !19, line: 25, baseType: !20)
!19 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !21)
!21 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !8, file: !9, line: 98, baseType: !18, size: 16, offset: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !8, file: !9, line: 99, baseType: !18, size: 16, offset: 48)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !8, file: !9, line: 100, baseType: !12, size: 8, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !8, file: !9, line: 101, baseType: !12, size: 8, offset: 72)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !8, file: !9, line: 102, baseType: !27, size: 16, offset: 80)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !19, line: 31, baseType: !20)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !8, file: !9, line: 103, baseType: !29, size: 32, offset: 96)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !19, line: 27, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !13, line: 27, baseType: !31)
!31 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !8, file: !9, line: 104, baseType: !29, size: 32, offset: 128)
!33 = !{!34, !0, !40}
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 52, type: !36, isLocal: false, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 32, elements: !38)
!37 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!38 = !{!39}
!39 = !DISubrange(count: 4)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !42, line: 49, type: !43, isLocal: true, isDefinition: true)
!42 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/home/cloudcome/ebpf/socket")
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 8, size: 256, elements: !50)
!50 = !{!51, !57, !59, !62}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !49, file: !3, line: 9, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !54, size: 64, elements: !55)
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !{!56}
!56 = !DISubrange(count: 2)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !49, file: !3, line: 10, baseType: !58, size: 64, offset: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !49, file: !3, line: 11, baseType: !60, size: 64, offset: 128)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !49, file: !3, line: 12, baseType: !63, size: 64, offset: 192)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !54, size: 8192, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 256)
!67 = !{i32 7, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 3}
!69 = !{i32 1, !"wchar_size", i32 4}
!70 = !{!"Ubuntu clang version 11.0.0-2"}
!71 = distinct !DISubprogram(name: "bpf_prog1", scope: !3, file: !3, line: 16, type: !72, scopeLine: 17, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !168)
!72 = !DISubroutineType(types: !73)
!73 = !{!54, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !76, line: 3563, size: 1472, elements: !77)
!76 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!77 = !{!78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !94, !95, !96, !97, !98, !99, !100, !101, !102, !104, !105, !106, !107, !108, !140, !143, !144, !145, !167}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !75, file: !76, line: 3564, baseType: !30, size: 32)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !75, file: !76, line: 3565, baseType: !30, size: 32, offset: 32)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !75, file: !76, line: 3566, baseType: !30, size: 32, offset: 64)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !75, file: !76, line: 3567, baseType: !30, size: 32, offset: 96)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !75, file: !76, line: 3568, baseType: !30, size: 32, offset: 128)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !75, file: !76, line: 3569, baseType: !30, size: 32, offset: 160)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !75, file: !76, line: 3570, baseType: !30, size: 32, offset: 192)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !75, file: !76, line: 3571, baseType: !30, size: 32, offset: 224)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !75, file: !76, line: 3572, baseType: !30, size: 32, offset: 256)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !75, file: !76, line: 3573, baseType: !30, size: 32, offset: 288)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !75, file: !76, line: 3574, baseType: !30, size: 32, offset: 320)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !75, file: !76, line: 3575, baseType: !30, size: 32, offset: 352)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !75, file: !76, line: 3576, baseType: !91, size: 160, offset: 384)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 160, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 5)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !75, file: !76, line: 3577, baseType: !30, size: 32, offset: 544)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !75, file: !76, line: 3578, baseType: !30, size: 32, offset: 576)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !75, file: !76, line: 3579, baseType: !30, size: 32, offset: 608)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !75, file: !76, line: 3580, baseType: !30, size: 32, offset: 640)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !75, file: !76, line: 3581, baseType: !30, size: 32, offset: 672)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !75, file: !76, line: 3584, baseType: !30, size: 32, offset: 704)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !75, file: !76, line: 3585, baseType: !30, size: 32, offset: 736)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !75, file: !76, line: 3586, baseType: !30, size: 32, offset: 768)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !75, file: !76, line: 3587, baseType: !103, size: 128, offset: 800)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 128, elements: !38)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !75, file: !76, line: 3588, baseType: !103, size: 128, offset: 928)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !75, file: !76, line: 3589, baseType: !30, size: 32, offset: 1056)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !75, file: !76, line: 3590, baseType: !30, size: 32, offset: 1088)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !75, file: !76, line: 3593, baseType: !30, size: 32, offset: 1120)
!108 = !DIDerivedType(tag: DW_TAG_member, scope: !75, file: !76, line: 3594, baseType: !109, size: 64, align: 64, offset: 1152)
!109 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !75, file: !76, line: 3594, size: 64, align: 64, elements: !110)
!110 = !{!111}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !109, file: !76, line: 3594, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !76, line: 4196, size: 448, elements: !114)
!114 = !{!115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !138, !139}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !113, file: !76, line: 4197, baseType: !20, size: 16)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !113, file: !76, line: 4198, baseType: !20, size: 16, offset: 16)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !113, file: !76, line: 4199, baseType: !20, size: 16, offset: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !113, file: !76, line: 4200, baseType: !12, size: 8, offset: 48)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !113, file: !76, line: 4201, baseType: !12, size: 8, offset: 56)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !113, file: !76, line: 4202, baseType: !12, size: 8, offset: 64)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !113, file: !76, line: 4203, baseType: !12, size: 8, offset: 72)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !113, file: !76, line: 4204, baseType: !18, size: 16, offset: 80)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !113, file: !76, line: 4205, baseType: !18, size: 16, offset: 96)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !113, file: !76, line: 4206, baseType: !18, size: 16, offset: 112)
!125 = !DIDerivedType(tag: DW_TAG_member, scope: !113, file: !76, line: 4207, baseType: !126, size: 256, offset: 128)
!126 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !113, file: !76, line: 4207, size: 256, elements: !127)
!127 = !{!128, !133}
!128 = !DIDerivedType(tag: DW_TAG_member, scope: !126, file: !76, line: 4208, baseType: !129, size: 64)
!129 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !126, file: !76, line: 4208, size: 64, elements: !130)
!130 = !{!131, !132}
!131 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !129, file: !76, line: 4209, baseType: !29, size: 32)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !129, file: !76, line: 4210, baseType: !29, size: 32, offset: 32)
!133 = !DIDerivedType(tag: DW_TAG_member, scope: !126, file: !76, line: 4212, baseType: !134, size: 256)
!134 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !126, file: !76, line: 4212, size: 256, elements: !135)
!135 = !{!136, !137}
!136 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !134, file: !76, line: 4213, baseType: !103, size: 128)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !134, file: !76, line: 4214, baseType: !103, size: 128, offset: 128)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !113, file: !76, line: 4217, baseType: !30, size: 32, offset: 384)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !113, file: !76, line: 4218, baseType: !29, size: 32, offset: 416)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !75, file: !76, line: 3595, baseType: !141, size: 64, offset: 1216)
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !13, line: 31, baseType: !142)
!142 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !75, file: !76, line: 3596, baseType: !30, size: 32, offset: 1280)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !75, file: !76, line: 3597, baseType: !30, size: 32, offset: 1312)
!145 = !DIDerivedType(tag: DW_TAG_member, scope: !75, file: !76, line: 3598, baseType: !146, size: 64, align: 64, offset: 1344)
!146 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !75, file: !76, line: 3598, size: 64, align: 64, elements: !147)
!147 = !{!148}
!148 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !146, file: !76, line: 3598, baseType: !149, size: 64)
!149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64)
!150 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !76, line: 3652, size: 640, elements: !151)
!151 = !{!152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165}
!152 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !150, file: !76, line: 3653, baseType: !30, size: 32)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !150, file: !76, line: 3654, baseType: !30, size: 32, offset: 32)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !150, file: !76, line: 3655, baseType: !30, size: 32, offset: 64)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !150, file: !76, line: 3656, baseType: !30, size: 32, offset: 96)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !150, file: !76, line: 3657, baseType: !30, size: 32, offset: 128)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !150, file: !76, line: 3658, baseType: !30, size: 32, offset: 160)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !150, file: !76, line: 3660, baseType: !30, size: 32, offset: 192)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !150, file: !76, line: 3661, baseType: !103, size: 128, offset: 224)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !150, file: !76, line: 3662, baseType: !30, size: 32, offset: 352)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !150, file: !76, line: 3663, baseType: !30, size: 32, offset: 384)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !150, file: !76, line: 3664, baseType: !30, size: 32, offset: 416)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !150, file: !76, line: 3665, baseType: !103, size: 128, offset: 448)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !150, file: !76, line: 3666, baseType: !30, size: 32, offset: 576)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !150, file: !76, line: 3667, baseType: !166, size: 32, offset: 608)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !13, line: 26, baseType: !54)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !75, file: !76, line: 3599, baseType: !30, size: 32, offset: 1408)
!168 = !{!169, !170, !171}
!169 = !DILocalVariable(name: "skb", arg: 1, scope: !71, file: !3, line: 16, type: !74)
!170 = !DILocalVariable(name: "index", scope: !71, file: !3, line: 40, type: !54)
!171 = !DILocalVariable(name: "value", scope: !71, file: !3, line: 41, type: !60)
!172 = !DILocation(line: 0, scope: !71)
!173 = !DILocation(line: 40, column: 2, scope: !71)
!174 = !DILocation(line: 40, column: 24, scope: !71)
!175 = !DILocation(line: 40, column: 14, scope: !71)
!176 = !DILocation(line: 40, column: 6, scope: !71)
!177 = !{!178, !178, i64 0}
!178 = !{!"int", !179, i64 0}
!179 = !{!"omnipotent char", !180, i64 0}
!180 = !{!"Simple C/C++ TBAA"}
!181 = !DILocation(line: 43, column: 11, scope: !182)
!182 = distinct !DILexicalBlock(scope: !71, file: !3, line: 43, column: 6)
!183 = !{!184, !178, i64 4}
!184 = !{!"__sk_buff", !178, i64 0, !178, i64 4, !178, i64 8, !178, i64 12, !178, i64 16, !178, i64 20, !178, i64 24, !178, i64 28, !178, i64 32, !178, i64 36, !178, i64 40, !178, i64 44, !179, i64 48, !178, i64 68, !178, i64 72, !178, i64 76, !178, i64 80, !178, i64 84, !178, i64 88, !178, i64 92, !178, i64 96, !179, i64 100, !179, i64 116, !178, i64 132, !178, i64 136, !178, i64 140, !179, i64 144, !185, i64 152, !178, i64 160, !178, i64 164, !179, i64 168, !178, i64 176}
!185 = !{!"long long", !179, i64 0}
!186 = !DILocation(line: 43, column: 20, scope: !182)
!187 = !DILocation(line: 43, column: 6, scope: !71)
!188 = !DILocation(line: 46, column: 10, scope: !71)
!189 = !DILocation(line: 47, column: 6, scope: !190)
!190 = distinct !DILexicalBlock(scope: !71, file: !3, line: 47, column: 6)
!191 = !DILocation(line: 47, column: 6, scope: !71)
!192 = !DILocation(line: 48, column: 36, scope: !190)
!193 = !{!184, !178, i64 0}
!194 = !DILocation(line: 48, column: 31, scope: !190)
!195 = !DILocation(line: 48, column: 3, scope: !190)
!196 = !DILocation(line: 51, column: 1, scope: !71)
!197 = !DISubprogram(name: "load_byte", linkageName: "llvm.bpf.load.byte", scope: !198, file: !198, line: 31, type: !199, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !4)
!198 = !DIFile(filename: "./bpf_legacy.h", directory: "/home/cloudcome/ebpf/socket")
!199 = !DISubroutineType(types: !200)
!200 = !{!142, !46, !142}
