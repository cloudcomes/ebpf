; ModuleID = 'test_tc_edt.c'
source_filename = "test_tc_edt.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }

@flow_map = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 8, i32 1, i32 0 }, section "maps", align 4, !dbg !0
@__license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !99
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @flow_map to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @tc_prog to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @tc_prog(%struct.__sk_buff* %0) #0 section "cls_test" !dbg !233 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !237, metadata !DIExpression()), !dbg !238
  %5 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 4, !dbg !239
  %6 = load i32, i32* %5, align 8, !dbg !239, !tbaa !241
  %7 = icmp eq i32 %6, 8, !dbg !247
  br i1 %7, label %8, label %84, !dbg !248

8:                                                ; preds = %1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !249, metadata !DIExpression()) #3, !dbg !258
  %9 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !260
  %10 = load i32, i32* %9, align 8, !dbg !260, !tbaa !261
  %11 = zext i32 %10 to i64, !dbg !262
  %12 = inttoptr i64 %11 to i8*, !dbg !263
  call void @llvm.dbg.value(metadata i8* %12, metadata !252, metadata !DIExpression()) #3, !dbg !258
  %13 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !264
  %14 = load i32, i32* %13, align 4, !dbg !264, !tbaa !265
  %15 = zext i32 %14 to i64, !dbg !266
  %16 = inttoptr i64 %15 to i8*, !dbg !267
  call void @llvm.dbg.value(metadata i8* %16, metadata !253, metadata !DIExpression()) #3, !dbg !258
  %17 = getelementptr i8, i8* %16, i64 14, !dbg !268
  %18 = icmp ugt i8* %17, %12, !dbg !270
  %19 = getelementptr i8, i8* %16, i64 34
  %20 = icmp ugt i8* %19, %12
  %21 = or i1 %18, %20, !dbg !271
  call void @llvm.dbg.value(metadata i8* %17, metadata !254, metadata !DIExpression()) #3, !dbg !258
  br i1 %21, label %84, label %22, !dbg !271

22:                                               ; preds = %8
  %23 = load i8, i8* %17, align 4, !dbg !272
  %24 = shl i8 %23, 2, !dbg !273
  %25 = and i8 %24, 60, !dbg !273
  %26 = zext i8 %25 to i64, !dbg !274
  call void @llvm.dbg.value(metadata i64 %26, metadata !255, metadata !DIExpression()) #3, !dbg !258
  %27 = getelementptr i8, i8* %17, i64 %26, !dbg !274
  %28 = icmp ugt i8* %27, %12, !dbg !276
  br i1 %28, label %84, label %29, !dbg !277

29:                                               ; preds = %22
  %30 = getelementptr i8, i8* %16, i64 23, !dbg !278
  %31 = load i8, i8* %30, align 1, !dbg !278, !tbaa !280
  %32 = icmp eq i8 %31, 6, !dbg !283
  br i1 %32, label %33, label %84, !dbg !284

33:                                               ; preds = %29
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !285, metadata !DIExpression()) #3, !dbg !292
  call void @llvm.dbg.value(metadata i8* %27, metadata !290, metadata !DIExpression()) #3, !dbg !292
  call void @llvm.dbg.value(metadata i8* %12, metadata !291, metadata !DIExpression()) #3, !dbg !292
  %34 = getelementptr inbounds i8, i8* %27, i64 20, !dbg !294
  %35 = icmp ugt i8* %34, %12, !dbg !296
  br i1 %35, label %84, label %36, !dbg !297

36:                                               ; preds = %33
  call void @llvm.dbg.value(metadata i8* %27, metadata !290, metadata !DIExpression()) #3, !dbg !292
  %37 = getelementptr inbounds i8, i8* %27, i64 2, !dbg !298
  %38 = bitcast i8* %37 to i16*, !dbg !298
  %39 = load i16, i16* %38, align 2, !dbg !298, !tbaa !300
  %40 = icmp eq i16 %39, 10275, !dbg !302
  br i1 %40, label %41, label %84, !dbg !303

41:                                               ; preds = %36
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !304, metadata !DIExpression()) #3, !dbg !314
  %42 = bitcast i32* %2 to i8*, !dbg !316
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %42) #3, !dbg !316
  call void @llvm.dbg.value(metadata i32 0, metadata !307, metadata !DIExpression()) #3, !dbg !314
  store i32 0, i32* %2, align 4, !dbg !317, !tbaa !318
  call void @llvm.dbg.value(metadata i32* %2, metadata !307, metadata !DIExpression(DW_OP_deref)) #3, !dbg !314
  %43 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @flow_map to i8*), i8* nonnull %42) #3, !dbg !319
  call void @llvm.dbg.value(metadata i8* %43, metadata !308, metadata !DIExpression()) #3, !dbg !314
  %44 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 0, !dbg !320
  %45 = load i32, i32* %44, align 8, !dbg !320, !tbaa !321
  call void @llvm.dbg.value(metadata i64 undef, metadata !310, metadata !DIExpression()) #3, !dbg !314
  %46 = call i64 inttoptr (i64 5 to i64 ()*)() #3, !dbg !322
  call void @llvm.dbg.value(metadata i64 %46, metadata !311, metadata !DIExpression()) #3, !dbg !314
  %47 = bitcast i64* %3 to i8*, !dbg !323
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %47) #3, !dbg !323
  %48 = bitcast i64* %4 to i8*, !dbg !323
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %48) #3, !dbg !323
  call void @llvm.dbg.value(metadata i64 0, metadata !313, metadata !DIExpression()) #3, !dbg !314
  store i64 0, i64* %4, align 8, !dbg !324, !tbaa !325
  %49 = icmp eq i8* %43, null, !dbg !326
  br i1 %49, label %50, label %55, !dbg !328

50:                                               ; preds = %41
  %51 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 27, !dbg !329
  %52 = load i64, i64* %51, align 8, !dbg !329, !tbaa !330
  call void @llvm.dbg.value(metadata i64 %62, metadata !312, metadata !DIExpression()) #3, !dbg !314
  %53 = icmp ult i64 %52, %46, !dbg !331
  %54 = select i1 %53, i64 %46, i64 %52, !dbg !333
  store i64 %54, i64* %3, align 8, !dbg !314, !tbaa !325
  call void @llvm.dbg.value(metadata i64 %60, metadata !313, metadata !DIExpression()) #3, !dbg !314
  call void @llvm.dbg.value(metadata i64 %64, metadata !312, metadata !DIExpression()) #3, !dbg !314
  br label %66, !dbg !334

55:                                               ; preds = %41
  %56 = bitcast i8* %43 to i64*, !dbg !319
  call void @llvm.dbg.value(metadata i64* %56, metadata !308, metadata !DIExpression()) #3, !dbg !314
  %57 = zext i32 %45 to i64, !dbg !335
  %58 = mul nuw nsw i64 %57, 200, !dbg !336
  call void @llvm.dbg.value(metadata i64 %58, metadata !310, metadata !DIExpression()) #3, !dbg !314
  %59 = load i64, i64* %56, align 8, !dbg !337, !tbaa !325
  %60 = add i64 %59, %58, !dbg !338
  call void @llvm.dbg.value(metadata i64 %60, metadata !313, metadata !DIExpression()) #3, !dbg !314
  store i64 %60, i64* %4, align 8, !dbg !339, !tbaa !325
  %61 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 27, !dbg !329
  %62 = load i64, i64* %61, align 8, !dbg !329, !tbaa !330
  call void @llvm.dbg.value(metadata i64 %62, metadata !312, metadata !DIExpression()) #3, !dbg !314
  %63 = icmp ult i64 %62, %46, !dbg !331
  %64 = select i1 %63, i64 %46, i64 %62, !dbg !333
  store i64 %64, i64* %3, align 8, !dbg !314, !tbaa !325
  call void @llvm.dbg.value(metadata i64 %64, metadata !312, metadata !DIExpression()) #3, !dbg !314
  %65 = icmp ugt i64 %60, %64, !dbg !340
  br i1 %65, label %70, label %66, !dbg !334

66:                                               ; preds = %55, %50
  call void @llvm.dbg.value(metadata i32* %2, metadata !307, metadata !DIExpression(DW_OP_deref)) #3, !dbg !314
  call void @llvm.dbg.value(metadata i64* %3, metadata !312, metadata !DIExpression(DW_OP_deref)) #3, !dbg !314
  %67 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.bpf_map_def* @flow_map to i8*), i8* nonnull %42, i8* nonnull %47, i64 0) #3, !dbg !342
  %68 = icmp eq i64 %67, 0, !dbg !342
  %69 = select i1 %68, i32 0, i32 2, !dbg !345
  br label %82, !dbg !345

70:                                               ; preds = %55
  %71 = sub i64 %60, %46, !dbg !346
  %72 = icmp ugt i64 %71, 1999999999, !dbg !348
  br i1 %72, label %82, label %73, !dbg !349

73:                                               ; preds = %70
  %74 = icmp ugt i64 %71, 4999999, !dbg !350
  br i1 %74, label %75, label %77, !dbg !352

75:                                               ; preds = %73
  %76 = call i64 inttoptr (i64 97 to i64 (%struct.__sk_buff*)*)(%struct.__sk_buff* nonnull %0) #3, !dbg !353
  br label %77, !dbg !353

77:                                               ; preds = %75, %73
  call void @llvm.dbg.value(metadata i32* %2, metadata !307, metadata !DIExpression(DW_OP_deref)) #3, !dbg !314
  call void @llvm.dbg.value(metadata i64* %4, metadata !313, metadata !DIExpression(DW_OP_deref)) #3, !dbg !314
  %78 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.bpf_map_def* @flow_map to i8*), i8* nonnull %42, i8* nonnull %48, i64 2) #3, !dbg !354
  %79 = icmp eq i64 %78, 0, !dbg !354
  br i1 %79, label %80, label %82, !dbg !356

80:                                               ; preds = %77
  %81 = load i64, i64* %4, align 8, !dbg !357, !tbaa !325
  call void @llvm.dbg.value(metadata i64 %81, metadata !313, metadata !DIExpression()) #3, !dbg !314
  store i64 %81, i64* %61, align 8, !dbg !358, !tbaa !330
  br label %82, !dbg !359

82:                                               ; preds = %80, %77, %70, %66
  %83 = phi i32 [ 0, %80 ], [ %69, %66 ], [ 2, %70 ], [ 2, %77 ], !dbg !314
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %48) #3, !dbg !360
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %47) #3, !dbg !360
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %42) #3, !dbg !360
  br label %84, !dbg !361

84:                                               ; preds = %82, %36, %33, %29, %22, %8, %1
  %85 = phi i32 [ 0, %1 ], [ 2, %8 ], [ 2, %22 ], [ 0, %29 ], [ %83, %82 ], [ 2, %33 ], [ 0, %36 ], !dbg !238
  ret i32 %85, !dbg !362
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!229, !230, !231}
!llvm.ident = !{!232}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "flow_map", scope: !2, file: !3, line: 20, type: !221, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 12.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !44, globals: !98, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "test_tc_edt.c", directory: "/home/cloudcome/bpf/tc")
!4 = !{!5, !37}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 28, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/in.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36}
!9 = !DIEnumerator(name: "IPPROTO_IP", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4, isUnsigned: true)
!13 = !DIEnumerator(name: "IPPROTO_TCP", value: 6, isUnsigned: true)
!14 = !DIEnumerator(name: "IPPROTO_EGP", value: 8, isUnsigned: true)
!15 = !DIEnumerator(name: "IPPROTO_PUP", value: 12, isUnsigned: true)
!16 = !DIEnumerator(name: "IPPROTO_UDP", value: 17, isUnsigned: true)
!17 = !DIEnumerator(name: "IPPROTO_IDP", value: 22, isUnsigned: true)
!18 = !DIEnumerator(name: "IPPROTO_TP", value: 29, isUnsigned: true)
!19 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33, isUnsigned: true)
!20 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41, isUnsigned: true)
!21 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46, isUnsigned: true)
!22 = !DIEnumerator(name: "IPPROTO_GRE", value: 47, isUnsigned: true)
!23 = !DIEnumerator(name: "IPPROTO_ESP", value: 50, isUnsigned: true)
!24 = !DIEnumerator(name: "IPPROTO_AH", value: 51, isUnsigned: true)
!25 = !DIEnumerator(name: "IPPROTO_MTP", value: 92, isUnsigned: true)
!26 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94, isUnsigned: true)
!27 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98, isUnsigned: true)
!28 = !DIEnumerator(name: "IPPROTO_PIM", value: 103, isUnsigned: true)
!29 = !DIEnumerator(name: "IPPROTO_COMP", value: 108, isUnsigned: true)
!30 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132, isUnsigned: true)
!31 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136, isUnsigned: true)
!32 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137, isUnsigned: true)
!33 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143, isUnsigned: true)
!34 = !DIEnumerator(name: "IPPROTO_RAW", value: 255, isUnsigned: true)
!35 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262, isUnsigned: true)
!36 = !DIEnumerator(name: "IPPROTO_MAX", value: 263, isUnsigned: true)
!37 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !38, line: 397, baseType: !7, size: 32, elements: !39)
!38 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!39 = !{!40, !41, !42, !43}
!40 = !DIEnumerator(name: "BPF_ANY", value: 0, isUnsigned: true)
!41 = !DIEnumerator(name: "BPF_NOEXIST", value: 1, isUnsigned: true)
!42 = !DIEnumerator(name: "BPF_EXIST", value: 2, isUnsigned: true)
!43 = !DIEnumerator(name: "BPF_F_LOCK", value: 4, isUnsigned: true)
!44 = !{!45, !48, !49, !50, !72, !93}
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !46, line: 24, baseType: !47)
!46 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!47 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!49 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !52, line: 86, size: 160, elements: !53)
!52 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!53 = !{!54, !57, !58, !59, !62, !63, !64, !65, !66, !68, !71}
!54 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !51, file: !52, line: 88, baseType: !55, size: 4, flags: DIFlagBitField, extraData: i64 0)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !46, line: 21, baseType: !56)
!56 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !51, file: !52, line: 89, baseType: !55, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !51, file: !52, line: 96, baseType: !55, size: 8, offset: 8)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !51, file: !52, line: 97, baseType: !60, size: 16, offset: 16)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !61, line: 25, baseType: !45)
!61 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!62 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !51, file: !52, line: 98, baseType: !60, size: 16, offset: 32)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !51, file: !52, line: 99, baseType: !60, size: 16, offset: 48)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !51, file: !52, line: 100, baseType: !55, size: 8, offset: 64)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !51, file: !52, line: 101, baseType: !55, size: 8, offset: 72)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !51, file: !52, line: 102, baseType: !67, size: 16, offset: 80)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !61, line: 31, baseType: !45)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !51, file: !52, line: 103, baseType: !69, size: 32, offset: 96)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !61, line: 27, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !46, line: 27, baseType: !7)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !51, file: !52, line: 104, baseType: !69, size: 32, offset: 128)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !74, line: 25, size: 160, elements: !75)
!74 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "")
!75 = !{!76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92}
!76 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !73, file: !74, line: 26, baseType: !60, size: 16)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !73, file: !74, line: 27, baseType: !60, size: 16, offset: 16)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !73, file: !74, line: 28, baseType: !69, size: 32, offset: 32)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !73, file: !74, line: 29, baseType: !69, size: 32, offset: 64)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !73, file: !74, line: 31, baseType: !45, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !73, file: !74, line: 32, baseType: !45, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !73, file: !74, line: 33, baseType: !45, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !73, file: !74, line: 34, baseType: !45, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !73, file: !74, line: 35, baseType: !45, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !73, file: !74, line: 36, baseType: !45, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !73, file: !74, line: 37, baseType: !45, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !73, file: !74, line: 38, baseType: !45, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !73, file: !74, line: 39, baseType: !45, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !73, file: !74, line: 40, baseType: !45, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !73, file: !74, line: 55, baseType: !60, size: 16, offset: 112)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !73, file: !74, line: 56, baseType: !67, size: 16, offset: 128)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !73, file: !74, line: 57, baseType: !60, size: 16, offset: 144)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !94, line: 27, baseType: !95)
!94 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "")
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !96, line: 48, baseType: !97)
!96 = !DIFile(filename: "/usr/include/bits/types.h", directory: "")
!97 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!98 = !{!0, !99, !105, !113, !119, !124}
!99 = !DIGlobalVariableExpression(var: !100, expr: !DIExpression())
!100 = distinct !DIGlobalVariable(name: "__license", scope: !2, file: !3, line: 110, type: !101, isLocal: false, isDefinition: true)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 32, elements: !103)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !{!104}
!104 = !DISubrange(count: 4)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression())
!106 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !107, line: 49, type: !108, isLocal: true, isDefinition: true)
!107 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/home/cloudcome/bpf/tc")
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DISubroutineType(types: !110)
!110 = !{!48, !48, !111}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !107, line: 107, type: !115, isLocal: true, isDefinition: true)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DISubroutineType(types: !117)
!117 = !{!118}
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !46, line: 31, baseType: !97)
!119 = !DIGlobalVariableExpression(var: !120, expr: !DIExpression())
!120 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !107, line: 71, type: !121, isLocal: true, isDefinition: true)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DISubroutineType(types: !123)
!123 = !{!49, !48, !111, !111, !118}
!124 = !DIGlobalVariableExpression(var: !125, expr: !DIExpression())
!125 = distinct !DIGlobalVariable(name: "bpf_skb_ecn_set_ce", scope: !2, file: !107, line: 2405, type: !126, isLocal: true, isDefinition: true)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DISubroutineType(types: !128)
!128 = !{!49, !129}
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !38, line: 4183, size: 1472, elements: !131)
!131 = !{!132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !148, !149, !150, !151, !152, !153, !154, !155, !156, !158, !159, !160, !161, !162, !194, !195, !196, !197, !220}
!132 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !130, file: !38, line: 4184, baseType: !70, size: 32)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !130, file: !38, line: 4185, baseType: !70, size: 32, offset: 32)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !130, file: !38, line: 4186, baseType: !70, size: 32, offset: 64)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !130, file: !38, line: 4187, baseType: !70, size: 32, offset: 96)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !130, file: !38, line: 4188, baseType: !70, size: 32, offset: 128)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !130, file: !38, line: 4189, baseType: !70, size: 32, offset: 160)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !130, file: !38, line: 4190, baseType: !70, size: 32, offset: 192)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !130, file: !38, line: 4191, baseType: !70, size: 32, offset: 224)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !130, file: !38, line: 4192, baseType: !70, size: 32, offset: 256)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !130, file: !38, line: 4193, baseType: !70, size: 32, offset: 288)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !130, file: !38, line: 4194, baseType: !70, size: 32, offset: 320)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !130, file: !38, line: 4195, baseType: !70, size: 32, offset: 352)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !130, file: !38, line: 4196, baseType: !145, size: 160, offset: 384)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 160, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 5)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !130, file: !38, line: 4197, baseType: !70, size: 32, offset: 544)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !130, file: !38, line: 4198, baseType: !70, size: 32, offset: 576)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !130, file: !38, line: 4199, baseType: !70, size: 32, offset: 608)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !130, file: !38, line: 4200, baseType: !70, size: 32, offset: 640)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !130, file: !38, line: 4201, baseType: !70, size: 32, offset: 672)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !130, file: !38, line: 4204, baseType: !70, size: 32, offset: 704)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !130, file: !38, line: 4205, baseType: !70, size: 32, offset: 736)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !130, file: !38, line: 4206, baseType: !70, size: 32, offset: 768)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !130, file: !38, line: 4207, baseType: !157, size: 128, offset: 800)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 128, elements: !103)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !130, file: !38, line: 4208, baseType: !157, size: 128, offset: 928)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !130, file: !38, line: 4209, baseType: !70, size: 32, offset: 1056)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !130, file: !38, line: 4210, baseType: !70, size: 32, offset: 1088)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !130, file: !38, line: 4213, baseType: !70, size: 32, offset: 1120)
!162 = !DIDerivedType(tag: DW_TAG_member, scope: !130, file: !38, line: 4214, baseType: !163, size: 64, align: 64, offset: 1152)
!163 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !130, file: !38, line: 4214, size: 64, align: 64, elements: !164)
!164 = !{!165}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !163, file: !38, line: 4214, baseType: !166, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !38, line: 5041, size: 448, elements: !168)
!168 = !{!169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !192, !193}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !167, file: !38, line: 5042, baseType: !45, size: 16)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !167, file: !38, line: 5043, baseType: !45, size: 16, offset: 16)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !167, file: !38, line: 5044, baseType: !45, size: 16, offset: 32)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !167, file: !38, line: 5045, baseType: !55, size: 8, offset: 48)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !167, file: !38, line: 5046, baseType: !55, size: 8, offset: 56)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !167, file: !38, line: 5047, baseType: !55, size: 8, offset: 64)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !167, file: !38, line: 5048, baseType: !55, size: 8, offset: 72)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !167, file: !38, line: 5049, baseType: !60, size: 16, offset: 80)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !167, file: !38, line: 5050, baseType: !60, size: 16, offset: 96)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !167, file: !38, line: 5051, baseType: !60, size: 16, offset: 112)
!179 = !DIDerivedType(tag: DW_TAG_member, scope: !167, file: !38, line: 5052, baseType: !180, size: 256, offset: 128)
!180 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !167, file: !38, line: 5052, size: 256, elements: !181)
!181 = !{!182, !187}
!182 = !DIDerivedType(tag: DW_TAG_member, scope: !180, file: !38, line: 5053, baseType: !183, size: 64)
!183 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !180, file: !38, line: 5053, size: 64, elements: !184)
!184 = !{!185, !186}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !183, file: !38, line: 5054, baseType: !69, size: 32)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !183, file: !38, line: 5055, baseType: !69, size: 32, offset: 32)
!187 = !DIDerivedType(tag: DW_TAG_member, scope: !180, file: !38, line: 5057, baseType: !188, size: 256)
!188 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !180, file: !38, line: 5057, size: 256, elements: !189)
!189 = !{!190, !191}
!190 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !188, file: !38, line: 5058, baseType: !157, size: 128)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !188, file: !38, line: 5059, baseType: !157, size: 128, offset: 128)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !167, file: !38, line: 5062, baseType: !70, size: 32, offset: 384)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !167, file: !38, line: 5063, baseType: !69, size: 32, offset: 416)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !130, file: !38, line: 4215, baseType: !118, size: 64, offset: 1216)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !130, file: !38, line: 4216, baseType: !70, size: 32, offset: 1280)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !130, file: !38, line: 4217, baseType: !70, size: 32, offset: 1312)
!197 = !DIDerivedType(tag: DW_TAG_member, scope: !130, file: !38, line: 4218, baseType: !198, size: 64, align: 64, offset: 1344)
!198 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !130, file: !38, line: 4218, size: 64, align: 64, elements: !199)
!199 = !{!200}
!200 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !198, file: !38, line: 4218, baseType: !201, size: 64)
!201 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !202, size: 64)
!202 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !38, line: 4272, size: 640, elements: !203)
!203 = !{!204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217}
!204 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !202, file: !38, line: 4273, baseType: !70, size: 32)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !202, file: !38, line: 4274, baseType: !70, size: 32, offset: 32)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !202, file: !38, line: 4275, baseType: !70, size: 32, offset: 64)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !202, file: !38, line: 4276, baseType: !70, size: 32, offset: 96)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !202, file: !38, line: 4277, baseType: !70, size: 32, offset: 128)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !202, file: !38, line: 4278, baseType: !70, size: 32, offset: 160)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !202, file: !38, line: 4280, baseType: !70, size: 32, offset: 192)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !202, file: !38, line: 4281, baseType: !157, size: 128, offset: 224)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !202, file: !38, line: 4282, baseType: !70, size: 32, offset: 352)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !202, file: !38, line: 4283, baseType: !70, size: 32, offset: 384)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !202, file: !38, line: 4284, baseType: !70, size: 32, offset: 416)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !202, file: !38, line: 4285, baseType: !157, size: 128, offset: 448)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !202, file: !38, line: 4286, baseType: !70, size: 32, offset: 576)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !202, file: !38, line: 4287, baseType: !218, size: 32, offset: 608)
!218 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !46, line: 26, baseType: !219)
!219 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !130, file: !38, line: 4219, baseType: !70, size: 32, offset: 1408)
!221 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !222, line: 138, size: 160, elements: !223)
!222 = !DIFile(filename: "../libbpf/src/bpf_helpers.h", directory: "/home/cloudcome/bpf/tc")
!223 = !{!224, !225, !226, !227, !228}
!224 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !221, file: !222, line: 139, baseType: !7, size: 32)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !221, file: !222, line: 140, baseType: !7, size: 32, offset: 32)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !221, file: !222, line: 141, baseType: !7, size: 32, offset: 64)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !221, file: !222, line: 142, baseType: !7, size: 32, offset: 96)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !221, file: !222, line: 143, baseType: !7, size: 32, offset: 128)
!229 = !{i32 7, !"Dwarf Version", i32 4}
!230 = !{i32 2, !"Debug Info Version", i32 3}
!231 = !{i32 1, !"wchar_size", i32 4}
!232 = !{!"Ubuntu clang version 12.0.0-1ubuntu1"}
!233 = distinct !DISubprogram(name: "tc_prog", scope: !3, file: !3, line: 102, type: !234, scopeLine: 103, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !236)
!234 = !DISubroutineType(types: !235)
!235 = !{!219, !129}
!236 = !{!237}
!237 = !DILocalVariable(name: "skb", arg: 1, scope: !233, file: !3, line: 102, type: !129)
!238 = !DILocation(line: 0, scope: !233)
!239 = !DILocation(line: 104, column: 11, scope: !240)
!240 = distinct !DILexicalBlock(scope: !233, file: !3, line: 104, column: 6)
!241 = !{!242, !243, i64 16}
!242 = !{!"__sk_buff", !243, i64 0, !243, i64 4, !243, i64 8, !243, i64 12, !243, i64 16, !243, i64 20, !243, i64 24, !243, i64 28, !243, i64 32, !243, i64 36, !243, i64 40, !243, i64 44, !244, i64 48, !243, i64 68, !243, i64 72, !243, i64 76, !243, i64 80, !243, i64 84, !243, i64 88, !243, i64 92, !243, i64 96, !244, i64 100, !244, i64 116, !243, i64 132, !243, i64 136, !243, i64 140, !244, i64 144, !246, i64 152, !243, i64 160, !243, i64 164, !244, i64 168, !243, i64 176}
!243 = !{!"int", !244, i64 0}
!244 = !{!"omnipotent char", !245, i64 0}
!245 = !{!"Simple C/C++ TBAA"}
!246 = !{!"long long", !244, i64 0}
!247 = !DILocation(line: 104, column: 20, scope: !240)
!248 = !DILocation(line: 104, column: 6, scope: !233)
!249 = !DILocalVariable(name: "skb", arg: 1, scope: !250, file: !3, line: 79, type: !129)
!250 = distinct !DISubprogram(name: "handle_ipv4", scope: !3, file: !3, line: 79, type: !234, scopeLine: 80, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !251)
!251 = !{!249, !252, !253, !254, !255}
!252 = !DILocalVariable(name: "data_end", scope: !250, file: !3, line: 81, type: !48)
!253 = !DILocalVariable(name: "data", scope: !250, file: !3, line: 82, type: !48)
!254 = !DILocalVariable(name: "iph", scope: !250, file: !3, line: 83, type: !50)
!255 = !DILocalVariable(name: "ihl", scope: !250, file: !3, line: 84, type: !256)
!256 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !94, line: 26, baseType: !257)
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !96, line: 42, baseType: !7)
!258 = !DILocation(line: 0, scope: !250, inlinedAt: !259)
!259 = distinct !DILocation(line: 105, column: 10, scope: !240)
!260 = !DILocation(line: 81, column: 38, scope: !250, inlinedAt: !259)
!261 = !{!242, !243, i64 80}
!262 = !DILocation(line: 81, column: 27, scope: !250, inlinedAt: !259)
!263 = !DILocation(line: 81, column: 19, scope: !250, inlinedAt: !259)
!264 = !DILocation(line: 82, column: 34, scope: !250, inlinedAt: !259)
!265 = !{!242, !243, i64 76}
!266 = !DILocation(line: 82, column: 23, scope: !250, inlinedAt: !259)
!267 = !DILocation(line: 82, column: 15, scope: !250, inlinedAt: !259)
!268 = !DILocation(line: 87, column: 11, scope: !269, inlinedAt: !259)
!269 = distinct !DILexicalBlock(scope: !250, file: !3, line: 87, column: 6)
!270 = !DILocation(line: 87, column: 35, scope: !269, inlinedAt: !259)
!271 = !DILocation(line: 87, column: 6, scope: !250, inlinedAt: !259)
!272 = !DILocation(line: 92, column: 13, scope: !250, inlinedAt: !259)
!273 = !DILocation(line: 92, column: 17, scope: !250, inlinedAt: !259)
!274 = !DILocation(line: 93, column: 20, scope: !275, inlinedAt: !259)
!275 = distinct !DILexicalBlock(scope: !250, file: !3, line: 93, column: 6)
!276 = !DILocation(line: 93, column: 26, scope: !275, inlinedAt: !259)
!277 = !DILocation(line: 93, column: 6, scope: !250, inlinedAt: !259)
!278 = !DILocation(line: 96, column: 11, scope: !279, inlinedAt: !259)
!279 = distinct !DILexicalBlock(scope: !250, file: !3, line: 96, column: 6)
!280 = !{!281, !244, i64 9}
!281 = !{!"iphdr", !244, i64 0, !244, i64 0, !244, i64 1, !282, i64 2, !282, i64 4, !282, i64 6, !244, i64 8, !244, i64 9, !282, i64 10, !243, i64 12, !243, i64 16}
!282 = !{!"short", !244, i64 0}
!283 = !DILocation(line: 96, column: 20, scope: !279, inlinedAt: !259)
!284 = !DILocation(line: 96, column: 6, scope: !250, inlinedAt: !259)
!285 = !DILocalVariable(name: "skb", arg: 1, scope: !286, file: !3, line: 65, type: !129)
!286 = distinct !DISubprogram(name: "handle_tcp", scope: !3, file: !3, line: 65, type: !287, scopeLine: 66, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !289)
!287 = !DISubroutineType(types: !288)
!288 = !{!219, !129, !72}
!289 = !{!285, !290, !291}
!290 = !DILocalVariable(name: "tcp", arg: 2, scope: !286, file: !3, line: 65, type: !72)
!291 = !DILocalVariable(name: "data_end", scope: !286, file: !3, line: 67, type: !48)
!292 = !DILocation(line: 0, scope: !286, inlinedAt: !293)
!293 = distinct !DILocation(line: 97, column: 10, scope: !279, inlinedAt: !259)
!294 = !DILocation(line: 70, column: 19, scope: !295, inlinedAt: !293)
!295 = distinct !DILexicalBlock(scope: !286, file: !3, line: 70, column: 6)
!296 = !DILocation(line: 70, column: 24, scope: !295, inlinedAt: !293)
!297 = !DILocation(line: 70, column: 6, scope: !286, inlinedAt: !293)
!298 = !DILocation(line: 73, column: 11, scope: !299, inlinedAt: !293)
!299 = distinct !DILexicalBlock(scope: !286, file: !3, line: 73, column: 6)
!300 = !{!301, !282, i64 2}
!301 = !{!"tcphdr", !282, i64 0, !282, i64 2, !243, i64 4, !243, i64 8, !282, i64 12, !282, i64 12, !282, i64 13, !282, i64 13, !282, i64 13, !282, i64 13, !282, i64 13, !282, i64 13, !282, i64 13, !282, i64 13, !282, i64 14, !282, i64 16, !282, i64 18}
!302 = !DILocation(line: 73, column: 16, scope: !299, inlinedAt: !293)
!303 = !DILocation(line: 73, column: 6, scope: !286, inlinedAt: !293)
!304 = !DILocalVariable(name: "skb", arg: 1, scope: !305, file: !3, line: 27, type: !129)
!305 = distinct !DISubprogram(name: "throttle_flow", scope: !3, file: !3, line: 27, type: !234, scopeLine: 28, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !306)
!306 = !{!304, !307, !308, !310, !311, !312, !313}
!307 = !DILocalVariable(name: "key", scope: !305, file: !3, line: 29, type: !219)
!308 = !DILocalVariable(name: "last_tstamp", scope: !305, file: !3, line: 30, type: !309)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!310 = !DILocalVariable(name: "delay_ns", scope: !305, file: !3, line: 31, type: !93)
!311 = !DILocalVariable(name: "now", scope: !305, file: !3, line: 33, type: !93)
!312 = !DILocalVariable(name: "tstamp", scope: !305, file: !3, line: 34, type: !93)
!313 = !DILocalVariable(name: "next_tstamp", scope: !305, file: !3, line: 34, type: !93)
!314 = !DILocation(line: 0, scope: !305, inlinedAt: !315)
!315 = distinct !DILocation(line: 74, column: 10, scope: !299, inlinedAt: !293)
!316 = !DILocation(line: 29, column: 2, scope: !305, inlinedAt: !315)
!317 = !DILocation(line: 29, column: 6, scope: !305, inlinedAt: !315)
!318 = !{!243, !243, i64 0}
!319 = !DILocation(line: 30, column: 26, scope: !305, inlinedAt: !315)
!320 = !DILocation(line: 31, column: 38, scope: !305, inlinedAt: !315)
!321 = !{!242, !243, i64 0}
!322 = !DILocation(line: 33, column: 17, scope: !305, inlinedAt: !315)
!323 = !DILocation(line: 34, column: 2, scope: !305, inlinedAt: !315)
!324 = !DILocation(line: 34, column: 19, scope: !305, inlinedAt: !315)
!325 = !{!246, !246, i64 0}
!326 = !DILocation(line: 36, column: 6, scope: !327, inlinedAt: !315)
!327 = distinct !DILexicalBlock(scope: !305, file: !3, line: 36, column: 6)
!328 = !DILocation(line: 36, column: 6, scope: !305, inlinedAt: !315)
!329 = !DILocation(line: 39, column: 16, scope: !305, inlinedAt: !315)
!330 = !{!242, !246, i64 152}
!331 = !DILocation(line: 40, column: 13, scope: !332, inlinedAt: !315)
!332 = distinct !DILexicalBlock(scope: !305, file: !3, line: 40, column: 6)
!333 = !DILocation(line: 40, column: 6, scope: !305, inlinedAt: !315)
!334 = !DILocation(line: 44, column: 6, scope: !305, inlinedAt: !315)
!335 = !DILocation(line: 31, column: 23, scope: !305, inlinedAt: !315)
!336 = !DILocation(line: 31, column: 56, scope: !305, inlinedAt: !315)
!337 = !DILocation(line: 37, column: 17, scope: !327, inlinedAt: !315)
!338 = !DILocation(line: 37, column: 30, scope: !327, inlinedAt: !315)
!339 = !DILocation(line: 37, column: 15, scope: !327, inlinedAt: !315)
!340 = !DILocation(line: 44, column: 18, scope: !341, inlinedAt: !315)
!341 = distinct !DILexicalBlock(scope: !305, file: !3, line: 44, column: 6)
!342 = !DILocation(line: 45, column: 7, scope: !343, inlinedAt: !315)
!343 = distinct !DILexicalBlock(scope: !344, file: !3, line: 45, column: 7)
!344 = distinct !DILexicalBlock(scope: !341, file: !3, line: 44, column: 29)
!345 = !DILocation(line: 0, scope: !344, inlinedAt: !315)
!346 = !DILocation(line: 51, column: 18, scope: !347, inlinedAt: !315)
!347 = distinct !DILexicalBlock(scope: !305, file: !3, line: 51, column: 6)
!348 = !DILocation(line: 51, column: 24, scope: !347, inlinedAt: !315)
!349 = !DILocation(line: 51, column: 6, scope: !305, inlinedAt: !315)
!350 = !DILocation(line: 55, column: 24, scope: !351, inlinedAt: !315)
!351 = distinct !DILexicalBlock(scope: !305, file: !3, line: 55, column: 6)
!352 = !DILocation(line: 55, column: 6, scope: !305, inlinedAt: !315)
!353 = !DILocation(line: 56, column: 3, scope: !351, inlinedAt: !315)
!354 = !DILocation(line: 58, column: 6, scope: !355, inlinedAt: !315)
!355 = distinct !DILexicalBlock(scope: !305, file: !3, line: 58, column: 6)
!356 = !DILocation(line: 58, column: 6, scope: !305, inlinedAt: !315)
!357 = !DILocation(line: 60, column: 16, scope: !305, inlinedAt: !315)
!358 = !DILocation(line: 60, column: 14, scope: !305, inlinedAt: !315)
!359 = !DILocation(line: 62, column: 2, scope: !305, inlinedAt: !315)
!360 = !DILocation(line: 63, column: 1, scope: !305, inlinedAt: !315)
!361 = !DILocation(line: 74, column: 3, scope: !299, inlinedAt: !293)
!362 = !DILocation(line: 108, column: 1, scope: !233)
