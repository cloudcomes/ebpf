; ModuleID = 'test_lwt_ip_encap.c'
source_filename = "test_lwt_ip_encap.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }
%struct.encap_hdr = type { %struct.iphdr, %struct.grehdr }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.grehdr = type { i16, i16 }
%struct.encap_hdr.3 = type { %struct.ipv6hdr, %struct.grehdr }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.4 }
%union.anon.4 = type { [4 x i32] }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.__sk_buff*)* @bpf_lwt_encap_gre to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @bpf_lwt_encap_gre6 to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @bpf_lwt_encap_gre(%struct.__sk_buff* %0) #0 section "encap_gre" !dbg !139 {
  %2 = alloca %struct.encap_hdr, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !143, metadata !DIExpression()), !dbg !169
  %3 = getelementptr inbounds %struct.encap_hdr, %struct.encap_hdr* %2, i64 0, i32 0, i32 0, !dbg !170
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #4, !dbg !170
  call void @llvm.dbg.declare(metadata %struct.encap_hdr* %2, metadata !144, metadata !DIExpression()), !dbg !171
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(24) %3, i8 0, i64 24, i1 false), !dbg !172
  store i8 69, i8* %3, align 4, !dbg !173
  %4 = getelementptr inbounds %struct.encap_hdr, %struct.encap_hdr* %2, i64 0, i32 0, i32 5, !dbg !174
  store i8 64, i8* %4, align 4, !dbg !175, !tbaa !176
  %5 = getelementptr inbounds %struct.encap_hdr, %struct.encap_hdr* %2, i64 0, i32 0, i32 6, !dbg !184
  store i8 47, i8* %5, align 1, !dbg !185, !tbaa !186
  %6 = getelementptr inbounds %struct.encap_hdr, %struct.encap_hdr* %2, i64 0, i32 0, i32 8, !dbg !187
  store i32 1677791404, i32* %6, align 4, !dbg !188, !tbaa !189
  %7 = getelementptr inbounds %struct.encap_hdr, %struct.encap_hdr* %2, i64 0, i32 0, i32 9, !dbg !190
  store i32 1678774444, i32* %7, align 4, !dbg !191, !tbaa !192
  %8 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 0, !dbg !193
  %9 = load i32, i32* %8, align 8, !dbg !193, !tbaa !194
  %10 = trunc i32 %9 to i16, !dbg !193
  %11 = add i16 %10, 24, !dbg !193
  %12 = tail call i16 @llvm.bswap.i16(i16 %11), !dbg !193
  %13 = getelementptr inbounds %struct.encap_hdr, %struct.encap_hdr* %2, i64 0, i32 0, i32 2, !dbg !197
  store i16 %12, i16* %13, align 2, !dbg !198, !tbaa !199
  %14 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 4, !dbg !200
  %15 = load i32, i32* %14, align 8, !dbg !200, !tbaa !201
  %16 = trunc i32 %15 to i16, !dbg !202
  %17 = getelementptr inbounds %struct.encap_hdr, %struct.encap_hdr* %2, i64 0, i32 1, i32 1, !dbg !203
  store i16 %16, i16* %17, align 2, !dbg !204, !tbaa !205
  %18 = call i64 inttoptr (i64 73 to i64 (%struct.__sk_buff*, i32, i8*, i32)*)(%struct.__sk_buff* nonnull %0, i32 2, i8* nonnull %3, i32 24) #4, !dbg !206
  %19 = trunc i64 %18 to i32, !dbg !206
  call void @llvm.dbg.value(metadata i32 %19, metadata !168, metadata !DIExpression()), !dbg !169
  %20 = icmp eq i32 %19, 0, !dbg !207
  %21 = select i1 %20, i32 128, i32 2, !dbg !169
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #4, !dbg !209
  ret i32 %21, !dbg !209
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define dso_local i32 @bpf_lwt_encap_gre6(%struct.__sk_buff* %0) #0 section "encap_gre6" !dbg !210 {
  %2 = alloca %struct.encap_hdr.3, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !212, metadata !DIExpression()), !dbg !249
  %3 = getelementptr inbounds %struct.encap_hdr.3, %struct.encap_hdr.3* %2, i64 0, i32 0, i32 0, !dbg !250
  call void @llvm.lifetime.start.p0i8(i64 44, i8* nonnull %3) #4, !dbg !250
  call void @llvm.dbg.declare(metadata %struct.encap_hdr.3* %2, metadata !213, metadata !DIExpression()), !dbg !251
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(44) %3, i8 0, i64 44, i1 false), !dbg !252
  store i8 96, i8* %3, align 4, !dbg !253
  %4 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 0, !dbg !254
  %5 = load i32, i32* %4, align 8, !dbg !254, !tbaa !194
  %6 = trunc i32 %5 to i16, !dbg !254
  %7 = add i16 %6, 4, !dbg !254
  %8 = tail call i16 @llvm.bswap.i16(i16 %7), !dbg !254
  %9 = getelementptr inbounds %struct.encap_hdr.3, %struct.encap_hdr.3* %2, i64 0, i32 0, i32 2, !dbg !255
  store i16 %8, i16* %9, align 4, !dbg !256, !tbaa !257
  %10 = getelementptr inbounds %struct.encap_hdr.3, %struct.encap_hdr.3* %2, i64 0, i32 0, i32 3, !dbg !261
  store i8 47, i8* %10, align 2, !dbg !262, !tbaa !263
  %11 = getelementptr inbounds %struct.encap_hdr.3, %struct.encap_hdr.3* %2, i64 0, i32 0, i32 4, !dbg !264
  store i8 64, i8* %11, align 1, !dbg !265, !tbaa !266
  %12 = getelementptr inbounds %struct.encap_hdr.3, %struct.encap_hdr.3* %2, i64 0, i32 0, i32 5, i32 0, !dbg !267
  %13 = bitcast %union.anon.4* %12 to [16 x i8]*, !dbg !267
  %14 = bitcast %union.anon.4* %12 to i8*, !dbg !268
  store i8 -5, i8* %14, align 4, !dbg !269, !tbaa !270
  %15 = getelementptr inbounds [16 x i8], [16 x i8]* %13, i64 0, i64 1, !dbg !271
  store i8 1, i8* %15, align 1, !dbg !272, !tbaa !270
  %16 = getelementptr inbounds [16 x i8], [16 x i8]* %13, i64 0, i64 15, !dbg !273
  store i8 1, i8* %16, align 1, !dbg !274, !tbaa !270
  %17 = getelementptr inbounds %struct.encap_hdr.3, %struct.encap_hdr.3* %2, i64 0, i32 0, i32 6, i32 0, !dbg !275
  %18 = bitcast %union.anon.4* %17 to [16 x i8]*, !dbg !275
  %19 = bitcast %union.anon.4* %17 to i8*, !dbg !276
  store i8 -5, i8* %19, align 4, !dbg !277, !tbaa !270
  %20 = getelementptr inbounds [16 x i8], [16 x i8]* %18, i64 0, i64 1, !dbg !278
  store i8 16, i8* %20, align 1, !dbg !279, !tbaa !270
  %21 = getelementptr inbounds [16 x i8], [16 x i8]* %18, i64 0, i64 15, !dbg !280
  store i8 1, i8* %21, align 1, !dbg !281, !tbaa !270
  %22 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 4, !dbg !282
  %23 = load i32, i32* %22, align 8, !dbg !282, !tbaa !201
  %24 = trunc i32 %23 to i16, !dbg !283
  %25 = getelementptr inbounds %struct.encap_hdr.3, %struct.encap_hdr.3* %2, i64 0, i32 1, i32 1, !dbg !284
  store i16 %24, i16* %25, align 2, !dbg !285, !tbaa !286
  %26 = call i64 inttoptr (i64 73 to i64 (%struct.__sk_buff*, i32, i8*, i32)*)(%struct.__sk_buff* nonnull %0, i32 2, i8* nonnull %3, i32 44) #4, !dbg !287
  %27 = trunc i64 %26 to i32, !dbg !287
  call void @llvm.dbg.value(metadata i32 %27, metadata !248, metadata !DIExpression()), !dbg !249
  %28 = icmp eq i32 %27, 0, !dbg !288
  %29 = select i1 %28, i32 128, i32 2, !dbg !249
  call void @llvm.lifetime.end.p0i8(i64 44, i8* nonnull %3) #4, !dbg !290
  ret i32 %29, !dbg !290
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!135, !136, !137}
!llvm.ident = !{!138}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 87, type: !133, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 12.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !18, globals: !22, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "test_lwt_ip_encap.c", directory: "/home/cloudcome/bpf/lwt")
!4 = !{!5, !12}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "bpf_lwt_encap_mode", file: !6, line: 4163, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11}
!9 = !DIEnumerator(name: "BPF_LWT_ENCAP_SEG6", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "BPF_LWT_ENCAP_SEG6_INLINE", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "BPF_LWT_ENCAP_IP", value: 2, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "bpf_ret_code", file: !6, line: 4255, baseType: !7, size: 32, elements: !13)
!13 = !{!14, !15, !16, !17}
!14 = !DIEnumerator(name: "BPF_OK", value: 0, isUnsigned: true)
!15 = !DIEnumerator(name: "BPF_DROP", value: 2, isUnsigned: true)
!16 = !DIEnumerator(name: "BPF_REDIRECT", value: 7, isUnsigned: true)
!17 = !DIEnumerator(name: "BPF_LWT_REROUTE", value: 128, isUnsigned: true)
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !20, line: 24, baseType: !21)
!20 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!21 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!22 = !{!0, !23}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "bpf_lwt_push_encap", scope: !2, file: !25, line: 1910, type: !26, isLocal: true, isDefinition: true)
!25 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/home/cloudcome/bpf/lwt")
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{!29, !30, !34, !132, !34}
!29 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 4183, size: 1472, elements: !32)
!32 = !{!33, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !50, !51, !52, !53, !54, !55, !56, !57, !58, !62, !63, !64, !65, !66, !103, !106, !107, !108, !131}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !31, file: !6, line: 4184, baseType: !34, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !20, line: 27, baseType: !7)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !31, file: !6, line: 4185, baseType: !34, size: 32, offset: 32)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !31, file: !6, line: 4186, baseType: !34, size: 32, offset: 64)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !31, file: !6, line: 4187, baseType: !34, size: 32, offset: 96)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !31, file: !6, line: 4188, baseType: !34, size: 32, offset: 128)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !31, file: !6, line: 4189, baseType: !34, size: 32, offset: 160)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !31, file: !6, line: 4190, baseType: !34, size: 32, offset: 192)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !31, file: !6, line: 4191, baseType: !34, size: 32, offset: 224)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !31, file: !6, line: 4192, baseType: !34, size: 32, offset: 256)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !31, file: !6, line: 4193, baseType: !34, size: 32, offset: 288)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !31, file: !6, line: 4194, baseType: !34, size: 32, offset: 320)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !31, file: !6, line: 4195, baseType: !34, size: 32, offset: 352)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !31, file: !6, line: 4196, baseType: !47, size: 160, offset: 384)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 160, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 5)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !31, file: !6, line: 4197, baseType: !34, size: 32, offset: 544)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !31, file: !6, line: 4198, baseType: !34, size: 32, offset: 576)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !31, file: !6, line: 4199, baseType: !34, size: 32, offset: 608)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !31, file: !6, line: 4200, baseType: !34, size: 32, offset: 640)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !31, file: !6, line: 4201, baseType: !34, size: 32, offset: 672)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !31, file: !6, line: 4204, baseType: !34, size: 32, offset: 704)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !31, file: !6, line: 4205, baseType: !34, size: 32, offset: 736)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !31, file: !6, line: 4206, baseType: !34, size: 32, offset: 768)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !31, file: !6, line: 4207, baseType: !59, size: 128, offset: 800)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 128, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 4)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !31, file: !6, line: 4208, baseType: !59, size: 128, offset: 928)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !31, file: !6, line: 4209, baseType: !34, size: 32, offset: 1056)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !31, file: !6, line: 4210, baseType: !34, size: 32, offset: 1088)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !31, file: !6, line: 4213, baseType: !34, size: 32, offset: 1120)
!66 = !DIDerivedType(tag: DW_TAG_member, scope: !31, file: !6, line: 4214, baseType: !67, size: 64, align: 64, offset: 1152)
!67 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !31, file: !6, line: 4214, size: 64, align: 64, elements: !68)
!68 = !{!69}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !67, file: !6, line: 4214, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 5041, size: 448, elements: !72)
!72 = !{!73, !74, !75, !76, !79, !80, !81, !82, !85, !86, !87, !101, !102}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !71, file: !6, line: 5042, baseType: !19, size: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !71, file: !6, line: 5043, baseType: !19, size: 16, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !71, file: !6, line: 5044, baseType: !19, size: 16, offset: 32)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !71, file: !6, line: 5045, baseType: !77, size: 8, offset: 48)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !20, line: 21, baseType: !78)
!78 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !71, file: !6, line: 5046, baseType: !77, size: 8, offset: 56)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !71, file: !6, line: 5047, baseType: !77, size: 8, offset: 64)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !71, file: !6, line: 5048, baseType: !77, size: 8, offset: 72)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !71, file: !6, line: 5049, baseType: !83, size: 16, offset: 80)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !84, line: 25, baseType: !19)
!84 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !71, file: !6, line: 5050, baseType: !83, size: 16, offset: 96)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !71, file: !6, line: 5051, baseType: !83, size: 16, offset: 112)
!87 = !DIDerivedType(tag: DW_TAG_member, scope: !71, file: !6, line: 5052, baseType: !88, size: 256, offset: 128)
!88 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !71, file: !6, line: 5052, size: 256, elements: !89)
!89 = !{!90, !96}
!90 = !DIDerivedType(tag: DW_TAG_member, scope: !88, file: !6, line: 5053, baseType: !91, size: 64)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !88, file: !6, line: 5053, size: 64, elements: !92)
!92 = !{!93, !95}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !91, file: !6, line: 5054, baseType: !94, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !84, line: 27, baseType: !34)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !91, file: !6, line: 5055, baseType: !94, size: 32, offset: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, scope: !88, file: !6, line: 5057, baseType: !97, size: 256)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !88, file: !6, line: 5057, size: 256, elements: !98)
!98 = !{!99, !100}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !97, file: !6, line: 5058, baseType: !59, size: 128)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !97, file: !6, line: 5059, baseType: !59, size: 128, offset: 128)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !71, file: !6, line: 5062, baseType: !34, size: 32, offset: 384)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !71, file: !6, line: 5063, baseType: !94, size: 32, offset: 416)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !31, file: !6, line: 4215, baseType: !104, size: 64, offset: 1216)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !20, line: 31, baseType: !105)
!105 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !31, file: !6, line: 4216, baseType: !34, size: 32, offset: 1280)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !31, file: !6, line: 4217, baseType: !34, size: 32, offset: 1312)
!108 = !DIDerivedType(tag: DW_TAG_member, scope: !31, file: !6, line: 4218, baseType: !109, size: 64, align: 64, offset: 1344)
!109 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !31, file: !6, line: 4218, size: 64, align: 64, elements: !110)
!110 = !{!111}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !109, file: !6, line: 4218, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 4272, size: 640, elements: !114)
!114 = !{!115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !113, file: !6, line: 4273, baseType: !34, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !113, file: !6, line: 4274, baseType: !34, size: 32, offset: 32)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !113, file: !6, line: 4275, baseType: !34, size: 32, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !113, file: !6, line: 4276, baseType: !34, size: 32, offset: 96)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !113, file: !6, line: 4277, baseType: !34, size: 32, offset: 128)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !113, file: !6, line: 4278, baseType: !34, size: 32, offset: 160)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !113, file: !6, line: 4280, baseType: !34, size: 32, offset: 192)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !113, file: !6, line: 4281, baseType: !59, size: 128, offset: 224)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !113, file: !6, line: 4282, baseType: !34, size: 32, offset: 352)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !113, file: !6, line: 4283, baseType: !34, size: 32, offset: 384)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !113, file: !6, line: 4284, baseType: !34, size: 32, offset: 416)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !113, file: !6, line: 4285, baseType: !59, size: 128, offset: 448)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !113, file: !6, line: 4286, baseType: !34, size: 32, offset: 576)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !113, file: !6, line: 4287, baseType: !129, size: 32, offset: 608)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !20, line: 26, baseType: !130)
!130 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !31, file: !6, line: 4219, baseType: !34, size: 32, offset: 1408)
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!133 = !DICompositeType(tag: DW_TAG_array_type, baseType: !134, size: 32, elements: !60)
!134 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!135 = !{i32 7, !"Dwarf Version", i32 4}
!136 = !{i32 2, !"Debug Info Version", i32 3}
!137 = !{i32 1, !"wchar_size", i32 4}
!138 = !{!"Ubuntu clang version 12.0.0-1ubuntu1"}
!139 = distinct !DISubprogram(name: "bpf_lwt_encap_gre", scope: !3, file: !3, line: 18, type: !140, scopeLine: 19, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !142)
!140 = !DISubroutineType(types: !141)
!141 = !{!130, !30}
!142 = !{!143, !144, !168}
!143 = !DILocalVariable(name: "skb", arg: 1, scope: !139, file: !3, line: 18, type: !30)
!144 = !DILocalVariable(name: "hdr", scope: !139, file: !3, line: 23, type: !145)
!145 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "encap_hdr", scope: !139, file: !3, line: 20, size: 192, elements: !146)
!146 = !{!147, !163}
!147 = !DIDerivedType(tag: DW_TAG_member, name: "iph", scope: !145, file: !3, line: 21, baseType: !148, size: 160)
!148 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !149, line: 86, size: 160, elements: !150)
!149 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!150 = !{!151, !152, !153, !154, !155, !156, !157, !158, !159, !161, !162}
!151 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !148, file: !149, line: 88, baseType: !77, size: 4, flags: DIFlagBitField, extraData: i64 0)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !148, file: !149, line: 89, baseType: !77, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !148, file: !149, line: 96, baseType: !77, size: 8, offset: 8)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !148, file: !149, line: 97, baseType: !83, size: 16, offset: 16)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !148, file: !149, line: 98, baseType: !83, size: 16, offset: 32)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !148, file: !149, line: 99, baseType: !83, size: 16, offset: 48)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !148, file: !149, line: 100, baseType: !77, size: 8, offset: 64)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !148, file: !149, line: 101, baseType: !77, size: 8, offset: 72)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !148, file: !149, line: 102, baseType: !160, size: 16, offset: 80)
!160 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !84, line: 31, baseType: !19)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !148, file: !149, line: 103, baseType: !94, size: 32, offset: 96)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !148, file: !149, line: 104, baseType: !94, size: 32, offset: 128)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "greh", scope: !145, file: !3, line: 22, baseType: !164, size: 32, offset: 160)
!164 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "grehdr", file: !3, line: 12, size: 32, elements: !165)
!165 = !{!166, !167}
!166 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !164, file: !3, line: 13, baseType: !83, size: 16)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !164, file: !3, line: 14, baseType: !83, size: 16, offset: 16)
!168 = !DILocalVariable(name: "err", scope: !139, file: !3, line: 24, type: !130)
!169 = !DILocation(line: 0, scope: !139)
!170 = !DILocation(line: 20, column: 2, scope: !139)
!171 = !DILocation(line: 23, column: 4, scope: !139)
!172 = !DILocation(line: 26, column: 2, scope: !139)
!173 = !DILocation(line: 29, column: 18, scope: !139)
!174 = !DILocation(line: 30, column: 10, scope: !139)
!175 = !DILocation(line: 30, column: 14, scope: !139)
!176 = !{!177, !179, i64 8}
!177 = !{!"encap_hdr", !178, i64 0, !183, i64 20}
!178 = !{!"iphdr", !179, i64 0, !179, i64 0, !179, i64 1, !181, i64 2, !181, i64 4, !181, i64 6, !179, i64 8, !179, i64 9, !181, i64 10, !182, i64 12, !182, i64 16}
!179 = !{!"omnipotent char", !180, i64 0}
!180 = !{!"Simple C/C++ TBAA"}
!181 = !{!"short", !179, i64 0}
!182 = !{!"int", !179, i64 0}
!183 = !{!"grehdr", !181, i64 0, !181, i64 2}
!184 = !DILocation(line: 31, column: 10, scope: !139)
!185 = !DILocation(line: 31, column: 19, scope: !139)
!186 = !{!177, !179, i64 9}
!187 = !DILocation(line: 33, column: 10, scope: !139)
!188 = !DILocation(line: 33, column: 16, scope: !139)
!189 = !{!177, !182, i64 12}
!190 = !DILocation(line: 34, column: 10, scope: !139)
!191 = !DILocation(line: 34, column: 16, scope: !139)
!192 = !{!177, !182, i64 16}
!193 = !DILocation(line: 41, column: 20, scope: !139)
!194 = !{!195, !182, i64 0}
!195 = !{!"__sk_buff", !182, i64 0, !182, i64 4, !182, i64 8, !182, i64 12, !182, i64 16, !182, i64 20, !182, i64 24, !182, i64 28, !182, i64 32, !182, i64 36, !182, i64 40, !182, i64 44, !179, i64 48, !182, i64 68, !182, i64 72, !182, i64 76, !182, i64 80, !182, i64 84, !182, i64 88, !182, i64 92, !182, i64 96, !179, i64 100, !179, i64 116, !182, i64 132, !182, i64 136, !182, i64 140, !179, i64 144, !196, i64 152, !182, i64 160, !182, i64 164, !179, i64 168, !182, i64 176}
!196 = !{!"long long", !179, i64 0}
!197 = !DILocation(line: 41, column: 10, scope: !139)
!198 = !DILocation(line: 41, column: 18, scope: !139)
!199 = !{!177, !181, i64 2}
!200 = !DILocation(line: 43, column: 27, scope: !139)
!201 = !{!195, !182, i64 16}
!202 = !DILocation(line: 43, column: 22, scope: !139)
!203 = !DILocation(line: 43, column: 11, scope: !139)
!204 = !DILocation(line: 43, column: 20, scope: !139)
!205 = !{!177, !181, i64 22}
!206 = !DILocation(line: 45, column: 8, scope: !139)
!207 = !DILocation(line: 47, column: 6, scope: !208)
!208 = distinct !DILexicalBlock(scope: !139, file: !3, line: 47, column: 6)
!209 = !DILocation(line: 51, column: 1, scope: !139)
!210 = distinct !DISubprogram(name: "bpf_lwt_encap_gre6", scope: !3, file: !3, line: 54, type: !140, scopeLine: 55, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !211)
!211 = !{!212, !213, !248}
!212 = !DILocalVariable(name: "skb", arg: 1, scope: !210, file: !3, line: 54, type: !30)
!213 = !DILocalVariable(name: "hdr", scope: !210, file: !3, line: 59, type: !214)
!214 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "encap_hdr", scope: !210, file: !3, line: 56, size: 352, elements: !215)
!215 = !{!216, !247}
!216 = !DIDerivedType(tag: DW_TAG_member, name: "ip6hdr", scope: !214, file: !3, line: 57, baseType: !217, size: 320)
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !218, line: 117, size: 320, elements: !219)
!218 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!219 = !{!220, !221, !222, !226, !227, !228, !229, !246}
!220 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !217, file: !218, line: 119, baseType: !77, size: 4, flags: DIFlagBitField, extraData: i64 0)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !217, file: !218, line: 120, baseType: !77, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !217, file: !218, line: 127, baseType: !223, size: 24, offset: 8)
!223 = !DICompositeType(tag: DW_TAG_array_type, baseType: !77, size: 24, elements: !224)
!224 = !{!225}
!225 = !DISubrange(count: 3)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !217, file: !218, line: 129, baseType: !83, size: 16, offset: 32)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !217, file: !218, line: 130, baseType: !77, size: 8, offset: 48)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !217, file: !218, line: 131, baseType: !77, size: 8, offset: 56)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !217, file: !218, line: 133, baseType: !230, size: 128, offset: 64)
!230 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !231, line: 33, size: 128, elements: !232)
!231 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!232 = !{!233}
!233 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !230, file: !231, line: 40, baseType: !234, size: 128)
!234 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !230, file: !231, line: 34, size: 128, elements: !235)
!235 = !{!236, !240, !244}
!236 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !234, file: !231, line: 35, baseType: !237, size: 128)
!237 = !DICompositeType(tag: DW_TAG_array_type, baseType: !77, size: 128, elements: !238)
!238 = !{!239}
!239 = !DISubrange(count: 16)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !234, file: !231, line: 37, baseType: !241, size: 128)
!241 = !DICompositeType(tag: DW_TAG_array_type, baseType: !83, size: 128, elements: !242)
!242 = !{!243}
!243 = !DISubrange(count: 8)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !234, file: !231, line: 38, baseType: !245, size: 128)
!245 = !DICompositeType(tag: DW_TAG_array_type, baseType: !94, size: 128, elements: !60)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !217, file: !218, line: 134, baseType: !230, size: 128, offset: 192)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "greh", scope: !214, file: !3, line: 58, baseType: !164, size: 32, offset: 320)
!248 = !DILocalVariable(name: "err", scope: !210, file: !3, line: 60, type: !130)
!249 = !DILocation(line: 0, scope: !210)
!250 = !DILocation(line: 56, column: 2, scope: !210)
!251 = !DILocation(line: 59, column: 4, scope: !210)
!252 = !DILocation(line: 62, column: 2, scope: !210)
!253 = !DILocation(line: 64, column: 21, scope: !210)
!254 = !DILocation(line: 65, column: 27, scope: !210)
!255 = !DILocation(line: 65, column: 13, scope: !210)
!256 = !DILocation(line: 65, column: 25, scope: !210)
!257 = !{!258, !181, i64 4}
!258 = !{!"encap_hdr", !259, i64 0, !183, i64 40}
!259 = !{!"ipv6hdr", !179, i64 0, !179, i64 0, !179, i64 1, !181, i64 4, !179, i64 6, !179, i64 7, !260, i64 8, !260, i64 24}
!260 = !{!"in6_addr", !179, i64 0}
!261 = !DILocation(line: 66, column: 13, scope: !210)
!262 = !DILocation(line: 66, column: 21, scope: !210)
!263 = !{!258, !179, i64 6}
!264 = !DILocation(line: 67, column: 13, scope: !210)
!265 = !DILocation(line: 67, column: 23, scope: !210)
!266 = !{!258, !179, i64 7}
!267 = !DILocation(line: 69, column: 19, scope: !210)
!268 = !DILocation(line: 69, column: 2, scope: !210)
!269 = !DILocation(line: 69, column: 30, scope: !210)
!270 = !{!179, !179, i64 0}
!271 = !DILocation(line: 70, column: 2, scope: !210)
!272 = !DILocation(line: 70, column: 30, scope: !210)
!273 = !DILocation(line: 71, column: 2, scope: !210)
!274 = !DILocation(line: 71, column: 31, scope: !210)
!275 = !DILocation(line: 73, column: 19, scope: !210)
!276 = !DILocation(line: 73, column: 2, scope: !210)
!277 = !DILocation(line: 73, column: 30, scope: !210)
!278 = !DILocation(line: 74, column: 2, scope: !210)
!279 = !DILocation(line: 74, column: 30, scope: !210)
!280 = !DILocation(line: 75, column: 2, scope: !210)
!281 = !DILocation(line: 75, column: 31, scope: !210)
!282 = !DILocation(line: 77, column: 27, scope: !210)
!283 = !DILocation(line: 77, column: 22, scope: !210)
!284 = !DILocation(line: 77, column: 11, scope: !210)
!285 = !DILocation(line: 77, column: 20, scope: !210)
!286 = !{!258, !181, i64 42}
!287 = !DILocation(line: 79, column: 8, scope: !210)
!288 = !DILocation(line: 81, column: 6, scope: !289)
!289 = distinct !DILexicalBlock(scope: !210, file: !3, line: 81, column: 6)
!290 = !DILocation(line: 85, column: 1, scope: !210)
