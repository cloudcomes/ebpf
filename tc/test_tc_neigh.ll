; ModuleID = 'test_tc_neigh.c'
source_filename = "test_tc_neigh.c"
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
%struct.bpf_redir_neigh = type { i32, %union.anon.4 }
%union.anon.4 = type { [4 x i32] }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.3 }
%union.anon.3 = type { [4 x i32] }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }

@ifindex_map = dso_local global %struct.bpf_map_def { i32 2, i32 4, i32 4, i32 2, i32 0 }, section "maps", align 4, !dbg !0
@bpf_skb_store_bytes = internal global i64 (%struct.__sk_buff*, i32, i8*, i32, i64)* inttoptr (i64 9 to i64 (%struct.__sk_buff*, i32, i8*, i32, i64)*), align 8, !dbg !76
@bpf_redirect_neigh = internal global i64 (i32, %struct.bpf_redir_neigh*, i32, i64)* inttoptr (i64 152 to i64 (i32, %struct.bpf_redir_neigh*, i32, i64)*), align 8, !dbg !179
@__license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !72
@bpf_map_lookup_elem = internal global i8* (i8*, i8*)* inttoptr (i64 1 to i8* (i8*, i8*)*), align 8, !dbg !193
@llvm.used = appending global [5 x i8*] [i8* bitcast (%struct.bpf_map_def* @ifindex_map to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @tc_chk to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @tc_dst to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @tc_src to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__license, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @tc_chk(%struct.__sk_buff* %0) #0 section "chk_egress" !dbg !210 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.__sk_buff*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32*, align 8
  store %struct.__sk_buff* %0, %struct.__sk_buff** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.__sk_buff** %3, metadata !214, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata i8** %4, metadata !216, metadata !DIExpression()), !dbg !217
  %7 = load %struct.__sk_buff*, %struct.__sk_buff** %3, align 8, !dbg !218
  %8 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %7, i32 0, i32 16, !dbg !218
  %9 = load i32, i32* %8, align 8, !dbg !218
  %10 = zext i32 %9 to i64, !dbg !218
  %11 = inttoptr i64 %10 to i8*, !dbg !218
  store i8* %11, i8** %4, align 8, !dbg !217
  call void @llvm.dbg.declare(metadata i8** %5, metadata !219, metadata !DIExpression()), !dbg !220
  %12 = load %struct.__sk_buff*, %struct.__sk_buff** %3, align 8, !dbg !221
  %13 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %12, i32 0, i32 15, !dbg !221
  %14 = load i32, i32* %13, align 4, !dbg !221
  %15 = zext i32 %14 to i64, !dbg !221
  %16 = inttoptr i64 %15 to i8*, !dbg !221
  store i8* %16, i8** %5, align 8, !dbg !220
  call void @llvm.dbg.declare(metadata i32** %6, metadata !222, metadata !DIExpression()), !dbg !224
  %17 = load i8*, i8** %5, align 8, !dbg !225
  %18 = bitcast i8* %17 to i32*, !dbg !225
  store i32* %18, i32** %6, align 8, !dbg !224
  %19 = load i8*, i8** %5, align 8, !dbg !226
  %20 = getelementptr i8, i8* %19, i64 14, !dbg !228
  %21 = load i8*, i8** %4, align 8, !dbg !229
  %22 = icmp ugt i8* %20, %21, !dbg !230
  br i1 %22, label %23, label %24, !dbg !231

23:                                               ; preds = %1
  store i32 2, i32* %2, align 4, !dbg !232
  br label %44, !dbg !232

24:                                               ; preds = %1
  %25 = load i32*, i32** %6, align 8, !dbg !233
  %26 = getelementptr inbounds i32, i32* %25, i64 0, !dbg !233
  %27 = load i32, i32* %26, align 4, !dbg !233
  %28 = icmp ne i32 %27, 0, !dbg !233
  br i1 %28, label %40, label %29, !dbg !234

29:                                               ; preds = %24
  %30 = load i32*, i32** %6, align 8, !dbg !235
  %31 = getelementptr inbounds i32, i32* %30, i64 1, !dbg !235
  %32 = load i32, i32* %31, align 4, !dbg !235
  %33 = icmp ne i32 %32, 0, !dbg !235
  br i1 %33, label %40, label %34, !dbg !236

34:                                               ; preds = %29
  %35 = load i32*, i32** %6, align 8, !dbg !237
  %36 = getelementptr inbounds i32, i32* %35, i64 2, !dbg !237
  %37 = load i32, i32* %36, align 4, !dbg !237
  %38 = icmp ne i32 %37, 0, !dbg !238
  %39 = xor i1 %38, true, !dbg !238
  br label %40

40:                                               ; preds = %34, %29, %24
  %41 = phi i1 [ false, %29 ], [ false, %24 ], [ %39, %34 ], !dbg !239
  %42 = zext i1 %41 to i64, !dbg !240
  %43 = select i1 %41, i32 2, i32 0, !dbg !240
  store i32 %43, i32* %2, align 4, !dbg !241
  br label %44, !dbg !241

44:                                               ; preds = %40, %23
  %45 = load i32, i32* %2, align 4, !dbg !242
  ret i32 %45, !dbg !242
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @tc_dst(%struct.__sk_buff* %0) #0 section "dst_ingress" !dbg !243 {
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i1, align 1
  %5 = alloca %struct.__sk_buff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.ipv6hdr*, align 8
  %9 = alloca %struct.in6_addr, align 8
  %10 = alloca i1, align 1
  %11 = alloca %struct.__sk_buff*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca %struct.iphdr*, align 8
  %16 = alloca i32, align 4
  %17 = alloca %struct.__sk_buff*, align 8
  %18 = alloca [12 x i8], align 1
  %19 = alloca i8, align 1
  %20 = alloca %struct.in6_addr, align 4
  store %struct.__sk_buff* %0, %struct.__sk_buff** %17, align 8
  call void @llvm.dbg.declare(metadata %struct.__sk_buff** %17, metadata !244, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.declare(metadata [12 x i8]* %18, metadata !246, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata i8* %19, metadata !251, metadata !DIExpression()), !dbg !253
  store i8 0, i8* %19, align 1, !dbg !253
  %21 = load %struct.__sk_buff*, %struct.__sk_buff** %17, align 8, !dbg !254
  %22 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %21, i32 0, i32 4, !dbg !255
  %23 = load i32, i32* %22, align 8, !dbg !255
  switch i32 %23, label %160 [
    i32 8, label %24
    i32 56710, label %60
  ], !dbg !256

24:                                               ; preds = %1
  %25 = load %struct.__sk_buff*, %struct.__sk_buff** %17, align 8, !dbg !257
  store %struct.__sk_buff* %25, %struct.__sk_buff** %11, align 8
  call void @llvm.dbg.declare(metadata %struct.__sk_buff** %11, metadata !259, metadata !DIExpression()), !dbg !263
  store i32 1677791404, i32* %12, align 4
  call void @llvm.dbg.declare(metadata i32* %12, metadata !265, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata i8** %13, metadata !267, metadata !DIExpression()), !dbg !268
  %26 = load %struct.__sk_buff*, %struct.__sk_buff** %11, align 8, !dbg !269
  %27 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %26, i32 0, i32 16, !dbg !269
  %28 = load i32, i32* %27, align 8, !dbg !269
  %29 = zext i32 %28 to i64, !dbg !269
  %30 = inttoptr i64 %29 to i8*, !dbg !269
  store i8* %30, i8** %13, align 8, !dbg !268
  call void @llvm.dbg.declare(metadata i8** %14, metadata !270, metadata !DIExpression()), !dbg !271
  %31 = load %struct.__sk_buff*, %struct.__sk_buff** %11, align 8, !dbg !272
  %32 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %31, i32 0, i32 15, !dbg !272
  %33 = load i32, i32* %32, align 4, !dbg !272
  %34 = zext i32 %33 to i64, !dbg !272
  %35 = inttoptr i64 %34 to i8*, !dbg !272
  store i8* %35, i8** %14, align 8, !dbg !271
  call void @llvm.dbg.declare(metadata %struct.iphdr** %15, metadata !273, metadata !DIExpression()), !dbg !274
  %36 = load i8*, i8** %14, align 8, !dbg !275
  %37 = getelementptr i8, i8* %36, i64 14, !dbg !277
  %38 = load i8*, i8** %13, align 8, !dbg !278
  %39 = icmp ugt i8* %37, %38, !dbg !279
  br i1 %39, label %40, label %41, !dbg !280

40:                                               ; preds = %24
  store i1 false, i1* %10, align 1, !dbg !281
  br label %57, !dbg !281

41:                                               ; preds = %24
  %42 = load i8*, i8** %14, align 8, !dbg !282
  %43 = getelementptr i8, i8* %42, i64 14, !dbg !283
  %44 = bitcast i8* %43 to %struct.iphdr*, !dbg !284
  store %struct.iphdr* %44, %struct.iphdr** %15, align 8, !dbg !285
  %45 = load %struct.iphdr*, %struct.iphdr** %15, align 8, !dbg !286
  %46 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %45, i64 1, !dbg !288
  %47 = bitcast %struct.iphdr* %46 to i8*, !dbg !289
  %48 = load i8*, i8** %13, align 8, !dbg !290
  %49 = icmp ugt i8* %47, %48, !dbg !291
  br i1 %49, label %50, label %51, !dbg !292

50:                                               ; preds = %41
  store i1 false, i1* %10, align 1, !dbg !293
  br label %57, !dbg !293

51:                                               ; preds = %41
  %52 = load %struct.iphdr*, %struct.iphdr** %15, align 8, !dbg !294
  %53 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %52, i32 0, i32 9, !dbg !295
  %54 = load i32, i32* %53, align 4, !dbg !295
  %55 = load i32, i32* %12, align 4, !dbg !296
  %56 = icmp eq i32 %54, %55, !dbg !297
  store i1 %56, i1* %10, align 1, !dbg !298
  br label %57, !dbg !298

57:                                               ; preds = %40, %50, %51
  %58 = load i1, i1* %10, align 1, !dbg !299
  %59 = zext i1 %58 to i8, !dbg !300
  store i8 %59, i8* %19, align 1, !dbg !300
  br label %160, !dbg !301

60:                                               ; preds = %1
  %61 = load %struct.__sk_buff*, %struct.__sk_buff** %17, align 8, !dbg !302
  %62 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %20, i32 0, i32 0, !dbg !303
  %63 = bitcast %union.anon.3* %62 to [16 x i8]*, !dbg !303
  %64 = getelementptr inbounds [16 x i8], [16 x i8]* %63, i64 0, i64 0, !dbg !303
  store i8 0, i8* %64, align 1, !dbg !303
  %65 = getelementptr inbounds i8, i8* %64, i64 1, !dbg !303
  store i8 0, i8* %65, align 1, !dbg !303
  %66 = getelementptr inbounds i8, i8* %65, i64 1, !dbg !303
  store i8 0, i8* %66, align 1, !dbg !303
  %67 = getelementptr inbounds i8, i8* %66, i64 1, !dbg !303
  store i8 0, i8* %67, align 1, !dbg !303
  %68 = getelementptr inbounds i8, i8* %67, i64 1, !dbg !303
  store i8 0, i8* %68, align 1, !dbg !303
  %69 = getelementptr inbounds i8, i8* %68, i64 1, !dbg !303
  store i8 0, i8* %69, align 1, !dbg !303
  %70 = getelementptr inbounds i8, i8* %69, i64 1, !dbg !303
  store i8 0, i8* %70, align 1, !dbg !303
  %71 = getelementptr inbounds i8, i8* %70, i64 1, !dbg !303
  store i8 0, i8* %71, align 1, !dbg !303
  %72 = getelementptr inbounds i8, i8* %71, i64 1, !dbg !303
  store i8 0, i8* %72, align 1, !dbg !303
  %73 = getelementptr inbounds i8, i8* %72, i64 1, !dbg !303
  store i8 1, i8* %73, align 1, !dbg !303
  %74 = getelementptr inbounds i8, i8* %73, i64 1, !dbg !303
  store i8 -34, i8* %74, align 1, !dbg !303
  %75 = getelementptr inbounds i8, i8* %74, i64 1, !dbg !303
  store i8 -83, i8* %75, align 1, !dbg !303
  %76 = getelementptr inbounds i8, i8* %75, i64 1, !dbg !303
  store i8 -66, i8* %76, align 1, !dbg !303
  %77 = getelementptr inbounds i8, i8* %76, i64 1, !dbg !303
  store i8 -17, i8* %77, align 1, !dbg !303
  %78 = getelementptr inbounds i8, i8* %77, i64 1, !dbg !303
  store i8 -54, i8* %78, align 1, !dbg !303
  %79 = getelementptr inbounds i8, i8* %78, i64 1, !dbg !303
  store i8 -2, i8* %79, align 1, !dbg !303
  %80 = bitcast %struct.in6_addr* %9 to i8*
  %81 = bitcast %struct.in6_addr* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %80, i8* align 1 %81, i64 16, i1 false)
  store %struct.__sk_buff* %61, %struct.__sk_buff** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.__sk_buff** %5, metadata !304, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata %struct.in6_addr* %9, metadata !310, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.declare(metadata i8** %6, metadata !312, metadata !DIExpression()), !dbg !313
  %82 = load %struct.__sk_buff*, %struct.__sk_buff** %5, align 8, !dbg !314
  %83 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %82, i32 0, i32 16, !dbg !314
  %84 = load i32, i32* %83, align 8, !dbg !314
  %85 = zext i32 %84 to i64, !dbg !314
  %86 = inttoptr i64 %85 to i8*, !dbg !314
  store i8* %86, i8** %6, align 8, !dbg !313
  call void @llvm.dbg.declare(metadata i8** %7, metadata !315, metadata !DIExpression()), !dbg !316
  %87 = load %struct.__sk_buff*, %struct.__sk_buff** %5, align 8, !dbg !317
  %88 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %87, i32 0, i32 15, !dbg !317
  %89 = load i32, i32* %88, align 4, !dbg !317
  %90 = zext i32 %89 to i64, !dbg !317
  %91 = inttoptr i64 %90 to i8*, !dbg !317
  store i8* %91, i8** %7, align 8, !dbg !316
  call void @llvm.dbg.declare(metadata %struct.ipv6hdr** %8, metadata !318, metadata !DIExpression()), !dbg !319
  %92 = load i8*, i8** %7, align 8, !dbg !320
  %93 = getelementptr i8, i8* %92, i64 14, !dbg !322
  %94 = load i8*, i8** %6, align 8, !dbg !323
  %95 = icmp ugt i8* %93, %94, !dbg !324
  br i1 %95, label %96, label %97, !dbg !325

96:                                               ; preds = %60
  store i1 false, i1* %4, align 1, !dbg !326
  br label %157, !dbg !326

97:                                               ; preds = %60
  %98 = load i8*, i8** %7, align 8, !dbg !327
  %99 = getelementptr i8, i8* %98, i64 14, !dbg !328
  %100 = bitcast i8* %99 to %struct.ipv6hdr*, !dbg !329
  store %struct.ipv6hdr* %100, %struct.ipv6hdr** %8, align 8, !dbg !330
  %101 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !331
  %102 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %101, i64 1, !dbg !333
  %103 = bitcast %struct.ipv6hdr* %102 to i8*, !dbg !334
  %104 = load i8*, i8** %6, align 8, !dbg !335
  %105 = icmp ugt i8* %103, %104, !dbg !336
  br i1 %105, label %106, label %107, !dbg !337

106:                                              ; preds = %97
  store i1 false, i1* %4, align 1, !dbg !338
  br label %157, !dbg !338

107:                                              ; preds = %97
  %108 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !339
  %109 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %108, i32 0, i32 6, !dbg !339
  %110 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %109, i32 0, i32 0, !dbg !339
  %111 = bitcast %union.anon.3* %110 to [4 x i32]*, !dbg !339
  %112 = getelementptr inbounds [4 x i32], [4 x i32]* %111, i64 0, i64 0, !dbg !339
  %113 = load i32, i32* %112, align 4, !dbg !339
  %114 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %9, i32 0, i32 0, !dbg !339
  %115 = bitcast %union.anon.3* %114 to [4 x i32]*, !dbg !339
  %116 = getelementptr inbounds [4 x i32], [4 x i32]* %115, i64 0, i64 0, !dbg !339
  %117 = load i32, i32* %116, align 4, !dbg !339
  %118 = icmp eq i32 %113, %117, !dbg !339
  br i1 %118, label %119, label %155, !dbg !339

119:                                              ; preds = %107
  %120 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !339
  %121 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %120, i32 0, i32 6, !dbg !339
  %122 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %121, i32 0, i32 0, !dbg !339
  %123 = bitcast %union.anon.3* %122 to [4 x i32]*, !dbg !339
  %124 = getelementptr inbounds [4 x i32], [4 x i32]* %123, i64 0, i64 1, !dbg !339
  %125 = load i32, i32* %124, align 4, !dbg !339
  %126 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %9, i32 0, i32 0, !dbg !339
  %127 = bitcast %union.anon.3* %126 to [4 x i32]*, !dbg !339
  %128 = getelementptr inbounds [4 x i32], [4 x i32]* %127, i64 0, i64 1, !dbg !339
  %129 = load i32, i32* %128, align 4, !dbg !339
  %130 = icmp eq i32 %125, %129, !dbg !339
  br i1 %130, label %131, label %155, !dbg !339

131:                                              ; preds = %119
  %132 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !339
  %133 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %132, i32 0, i32 6, !dbg !339
  %134 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %133, i32 0, i32 0, !dbg !339
  %135 = bitcast %union.anon.3* %134 to [4 x i32]*, !dbg !339
  %136 = getelementptr inbounds [4 x i32], [4 x i32]* %135, i64 0, i64 2, !dbg !339
  %137 = load i32, i32* %136, align 4, !dbg !339
  %138 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %9, i32 0, i32 0, !dbg !339
  %139 = bitcast %union.anon.3* %138 to [4 x i32]*, !dbg !339
  %140 = getelementptr inbounds [4 x i32], [4 x i32]* %139, i64 0, i64 2, !dbg !339
  %141 = load i32, i32* %140, align 4, !dbg !339
  %142 = icmp eq i32 %137, %141, !dbg !339
  br i1 %142, label %143, label %155, !dbg !339

143:                                              ; preds = %131
  %144 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !339
  %145 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %144, i32 0, i32 6, !dbg !339
  %146 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %145, i32 0, i32 0, !dbg !339
  %147 = bitcast %union.anon.3* %146 to [4 x i32]*, !dbg !339
  %148 = getelementptr inbounds [4 x i32], [4 x i32]* %147, i64 0, i64 3, !dbg !339
  %149 = load i32, i32* %148, align 4, !dbg !339
  %150 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %9, i32 0, i32 0, !dbg !339
  %151 = bitcast %union.anon.3* %150 to [4 x i32]*, !dbg !339
  %152 = getelementptr inbounds [4 x i32], [4 x i32]* %151, i64 0, i64 3, !dbg !339
  %153 = load i32, i32* %152, align 4, !dbg !339
  %154 = icmp eq i32 %149, %153, !dbg !339
  br label %155

155:                                              ; preds = %143, %131, %119, %107
  %156 = phi i1 [ false, %131 ], [ false, %119 ], [ false, %107 ], [ %154, %143 ], !dbg !340
  store i1 %156, i1* %4, align 1, !dbg !341
  br label %157, !dbg !341

157:                                              ; preds = %96, %106, %155
  %158 = load i1, i1* %4, align 1, !dbg !342
  %159 = zext i1 %158 to i8, !dbg !343
  store i8 %159, i8* %19, align 1, !dbg !343
  br label %160, !dbg !344

160:                                              ; preds = %1, %157, %57
  %161 = load i8, i8* %19, align 1, !dbg !345
  %162 = trunc i8 %161 to i1, !dbg !345
  br i1 %162, label %164, label %163, !dbg !347

163:                                              ; preds = %160
  store i32 0, i32* %16, align 4, !dbg !348
  br label %188, !dbg !348

164:                                              ; preds = %160
  %165 = bitcast [12 x i8]* %18 to i8*, !dbg !349
  call void @llvm.memset.p0i8.i64(i8* align 1 %165, i8 0, i64 12, i1 false), !dbg !349
  %166 = load i64 (%struct.__sk_buff*, i32, i8*, i32, i64)*, i64 (%struct.__sk_buff*, i32, i8*, i32, i64)** @bpf_skb_store_bytes, align 8, !dbg !350
  %167 = load %struct.__sk_buff*, %struct.__sk_buff** %17, align 8, !dbg !352
  %168 = bitcast [12 x i8]* %18 to i8*, !dbg !353
  %169 = call i64 %166(%struct.__sk_buff* %167, i32 0, i8* %168, i32 12, i64 0), !dbg !350
  %170 = icmp slt i64 %169, 0, !dbg !354
  br i1 %170, label %171, label %172, !dbg !355

171:                                              ; preds = %164
  store i32 2, i32* %16, align 4, !dbg !356
  br label %188, !dbg !356

172:                                              ; preds = %164
  %173 = load i64 (i32, %struct.bpf_redir_neigh*, i32, i64)*, i64 (i32, %struct.bpf_redir_neigh*, i32, i64)** @bpf_redirect_neigh, align 8, !dbg !357
  store i32 0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !358, metadata !DIExpression()) #4, !dbg !362
  call void @llvm.dbg.declare(metadata i32** %3, metadata !364, metadata !DIExpression()) #4, !dbg !366
  %174 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8, !dbg !367
  %175 = bitcast i32* %2 to i8*, !dbg !368
  %176 = call i8* %174(i8* bitcast (%struct.bpf_map_def* @ifindex_map to i8*), i8* %175) #4, !dbg !367
  %177 = bitcast i8* %176 to i32*, !dbg !367
  store i32* %177, i32** %3, align 8, !dbg !366
  %178 = load i32*, i32** %3, align 8, !dbg !369
  %179 = icmp ne i32* %178, null, !dbg !369
  br i1 %179, label %180, label %183, !dbg !369

180:                                              ; preds = %172
  %181 = load i32*, i32** %3, align 8, !dbg !370
  %182 = load i32, i32* %181, align 4, !dbg !371
  br label %184, !dbg !369

183:                                              ; preds = %172
  br label %184, !dbg !369

184:                                              ; preds = %180, %183
  %185 = phi i32 [ %182, %180 ], [ 0, %183 ], !dbg !369
  %186 = call i64 %173(i32 %185, %struct.bpf_redir_neigh* null, i32 0, i64 0), !dbg !357
  %187 = trunc i64 %186 to i32, !dbg !357
  store i32 %187, i32* %16, align 4, !dbg !372
  br label %188, !dbg !372

188:                                              ; preds = %184, %171, %163
  %189 = load i32, i32* %16, align 4, !dbg !373
  ret i32 %189, !dbg !373
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone
define dso_local i32 @tc_src(%struct.__sk_buff* %0) #0 section "src_ingress" !dbg !374 {
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i1, align 1
  %5 = alloca %struct.__sk_buff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.ipv6hdr*, align 8
  %9 = alloca %struct.in6_addr, align 8
  %10 = alloca i1, align 1
  %11 = alloca %struct.__sk_buff*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca %struct.iphdr*, align 8
  %16 = alloca i32, align 4
  %17 = alloca %struct.__sk_buff*, align 8
  %18 = alloca [12 x i8], align 1
  %19 = alloca i8, align 1
  %20 = alloca %struct.in6_addr, align 4
  store %struct.__sk_buff* %0, %struct.__sk_buff** %17, align 8
  call void @llvm.dbg.declare(metadata %struct.__sk_buff** %17, metadata !375, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata [12 x i8]* %18, metadata !377, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata i8* %19, metadata !379, metadata !DIExpression()), !dbg !380
  store i8 0, i8* %19, align 1, !dbg !380
  %21 = load %struct.__sk_buff*, %struct.__sk_buff** %17, align 8, !dbg !381
  %22 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %21, i32 0, i32 4, !dbg !382
  %23 = load i32, i32* %22, align 8, !dbg !382
  switch i32 %23, label %160 [
    i32 8, label %24
    i32 56710, label %60
  ], !dbg !383

24:                                               ; preds = %1
  %25 = load %struct.__sk_buff*, %struct.__sk_buff** %17, align 8, !dbg !384
  store %struct.__sk_buff* %25, %struct.__sk_buff** %11, align 8
  call void @llvm.dbg.declare(metadata %struct.__sk_buff** %11, metadata !259, metadata !DIExpression()), !dbg !386
  store i32 1677856940, i32* %12, align 4
  call void @llvm.dbg.declare(metadata i32* %12, metadata !265, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.declare(metadata i8** %13, metadata !267, metadata !DIExpression()), !dbg !389
  %26 = load %struct.__sk_buff*, %struct.__sk_buff** %11, align 8, !dbg !390
  %27 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %26, i32 0, i32 16, !dbg !390
  %28 = load i32, i32* %27, align 8, !dbg !390
  %29 = zext i32 %28 to i64, !dbg !390
  %30 = inttoptr i64 %29 to i8*, !dbg !390
  store i8* %30, i8** %13, align 8, !dbg !389
  call void @llvm.dbg.declare(metadata i8** %14, metadata !270, metadata !DIExpression()), !dbg !391
  %31 = load %struct.__sk_buff*, %struct.__sk_buff** %11, align 8, !dbg !392
  %32 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %31, i32 0, i32 15, !dbg !392
  %33 = load i32, i32* %32, align 4, !dbg !392
  %34 = zext i32 %33 to i64, !dbg !392
  %35 = inttoptr i64 %34 to i8*, !dbg !392
  store i8* %35, i8** %14, align 8, !dbg !391
  call void @llvm.dbg.declare(metadata %struct.iphdr** %15, metadata !273, metadata !DIExpression()), !dbg !393
  %36 = load i8*, i8** %14, align 8, !dbg !394
  %37 = getelementptr i8, i8* %36, i64 14, !dbg !395
  %38 = load i8*, i8** %13, align 8, !dbg !396
  %39 = icmp ugt i8* %37, %38, !dbg !397
  br i1 %39, label %40, label %41, !dbg !398

40:                                               ; preds = %24
  store i1 false, i1* %10, align 1, !dbg !399
  br label %57, !dbg !399

41:                                               ; preds = %24
  %42 = load i8*, i8** %14, align 8, !dbg !400
  %43 = getelementptr i8, i8* %42, i64 14, !dbg !401
  %44 = bitcast i8* %43 to %struct.iphdr*, !dbg !402
  store %struct.iphdr* %44, %struct.iphdr** %15, align 8, !dbg !403
  %45 = load %struct.iphdr*, %struct.iphdr** %15, align 8, !dbg !404
  %46 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %45, i64 1, !dbg !405
  %47 = bitcast %struct.iphdr* %46 to i8*, !dbg !406
  %48 = load i8*, i8** %13, align 8, !dbg !407
  %49 = icmp ugt i8* %47, %48, !dbg !408
  br i1 %49, label %50, label %51, !dbg !409

50:                                               ; preds = %41
  store i1 false, i1* %10, align 1, !dbg !410
  br label %57, !dbg !410

51:                                               ; preds = %41
  %52 = load %struct.iphdr*, %struct.iphdr** %15, align 8, !dbg !411
  %53 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %52, i32 0, i32 9, !dbg !412
  %54 = load i32, i32* %53, align 4, !dbg !412
  %55 = load i32, i32* %12, align 4, !dbg !413
  %56 = icmp eq i32 %54, %55, !dbg !414
  store i1 %56, i1* %10, align 1, !dbg !415
  br label %57, !dbg !415

57:                                               ; preds = %40, %50, %51
  %58 = load i1, i1* %10, align 1, !dbg !416
  %59 = zext i1 %58 to i8, !dbg !417
  store i8 %59, i8* %19, align 1, !dbg !417
  br label %160, !dbg !418

60:                                               ; preds = %1
  %61 = load %struct.__sk_buff*, %struct.__sk_buff** %17, align 8, !dbg !419
  %62 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %20, i32 0, i32 0, !dbg !420
  %63 = bitcast %union.anon.3* %62 to [16 x i8]*, !dbg !420
  %64 = getelementptr inbounds [16 x i8], [16 x i8]* %63, i64 0, i64 0, !dbg !420
  store i8 0, i8* %64, align 1, !dbg !420
  %65 = getelementptr inbounds i8, i8* %64, i64 1, !dbg !420
  store i8 0, i8* %65, align 1, !dbg !420
  %66 = getelementptr inbounds i8, i8* %65, i64 1, !dbg !420
  store i8 0, i8* %66, align 1, !dbg !420
  %67 = getelementptr inbounds i8, i8* %66, i64 1, !dbg !420
  store i8 0, i8* %67, align 1, !dbg !420
  %68 = getelementptr inbounds i8, i8* %67, i64 1, !dbg !420
  store i8 0, i8* %68, align 1, !dbg !420
  %69 = getelementptr inbounds i8, i8* %68, i64 1, !dbg !420
  store i8 0, i8* %69, align 1, !dbg !420
  %70 = getelementptr inbounds i8, i8* %69, i64 1, !dbg !420
  store i8 0, i8* %70, align 1, !dbg !420
  %71 = getelementptr inbounds i8, i8* %70, i64 1, !dbg !420
  store i8 0, i8* %71, align 1, !dbg !420
  %72 = getelementptr inbounds i8, i8* %71, i64 1, !dbg !420
  store i8 0, i8* %72, align 1, !dbg !420
  %73 = getelementptr inbounds i8, i8* %72, i64 1, !dbg !420
  store i8 2, i8* %73, align 1, !dbg !420
  %74 = getelementptr inbounds i8, i8* %73, i64 1, !dbg !420
  store i8 -34, i8* %74, align 1, !dbg !420
  %75 = getelementptr inbounds i8, i8* %74, i64 1, !dbg !420
  store i8 -83, i8* %75, align 1, !dbg !420
  %76 = getelementptr inbounds i8, i8* %75, i64 1, !dbg !420
  store i8 -66, i8* %76, align 1, !dbg !420
  %77 = getelementptr inbounds i8, i8* %76, i64 1, !dbg !420
  store i8 -17, i8* %77, align 1, !dbg !420
  %78 = getelementptr inbounds i8, i8* %77, i64 1, !dbg !420
  store i8 -54, i8* %78, align 1, !dbg !420
  %79 = getelementptr inbounds i8, i8* %78, i64 1, !dbg !420
  store i8 -2, i8* %79, align 1, !dbg !420
  %80 = bitcast %struct.in6_addr* %9 to i8*
  %81 = bitcast %struct.in6_addr* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %80, i8* align 1 %81, i64 16, i1 false)
  store %struct.__sk_buff* %61, %struct.__sk_buff** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.__sk_buff** %5, metadata !304, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.declare(metadata %struct.in6_addr* %9, metadata !310, metadata !DIExpression()), !dbg !423
  call void @llvm.dbg.declare(metadata i8** %6, metadata !312, metadata !DIExpression()), !dbg !424
  %82 = load %struct.__sk_buff*, %struct.__sk_buff** %5, align 8, !dbg !425
  %83 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %82, i32 0, i32 16, !dbg !425
  %84 = load i32, i32* %83, align 8, !dbg !425
  %85 = zext i32 %84 to i64, !dbg !425
  %86 = inttoptr i64 %85 to i8*, !dbg !425
  store i8* %86, i8** %6, align 8, !dbg !424
  call void @llvm.dbg.declare(metadata i8** %7, metadata !315, metadata !DIExpression()), !dbg !426
  %87 = load %struct.__sk_buff*, %struct.__sk_buff** %5, align 8, !dbg !427
  %88 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %87, i32 0, i32 15, !dbg !427
  %89 = load i32, i32* %88, align 4, !dbg !427
  %90 = zext i32 %89 to i64, !dbg !427
  %91 = inttoptr i64 %90 to i8*, !dbg !427
  store i8* %91, i8** %7, align 8, !dbg !426
  call void @llvm.dbg.declare(metadata %struct.ipv6hdr** %8, metadata !318, metadata !DIExpression()), !dbg !428
  %92 = load i8*, i8** %7, align 8, !dbg !429
  %93 = getelementptr i8, i8* %92, i64 14, !dbg !430
  %94 = load i8*, i8** %6, align 8, !dbg !431
  %95 = icmp ugt i8* %93, %94, !dbg !432
  br i1 %95, label %96, label %97, !dbg !433

96:                                               ; preds = %60
  store i1 false, i1* %4, align 1, !dbg !434
  br label %157, !dbg !434

97:                                               ; preds = %60
  %98 = load i8*, i8** %7, align 8, !dbg !435
  %99 = getelementptr i8, i8* %98, i64 14, !dbg !436
  %100 = bitcast i8* %99 to %struct.ipv6hdr*, !dbg !437
  store %struct.ipv6hdr* %100, %struct.ipv6hdr** %8, align 8, !dbg !438
  %101 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !439
  %102 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %101, i64 1, !dbg !440
  %103 = bitcast %struct.ipv6hdr* %102 to i8*, !dbg !441
  %104 = load i8*, i8** %6, align 8, !dbg !442
  %105 = icmp ugt i8* %103, %104, !dbg !443
  br i1 %105, label %106, label %107, !dbg !444

106:                                              ; preds = %97
  store i1 false, i1* %4, align 1, !dbg !445
  br label %157, !dbg !445

107:                                              ; preds = %97
  %108 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !446
  %109 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %108, i32 0, i32 6, !dbg !446
  %110 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %109, i32 0, i32 0, !dbg !446
  %111 = bitcast %union.anon.3* %110 to [4 x i32]*, !dbg !446
  %112 = getelementptr inbounds [4 x i32], [4 x i32]* %111, i64 0, i64 0, !dbg !446
  %113 = load i32, i32* %112, align 4, !dbg !446
  %114 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %9, i32 0, i32 0, !dbg !446
  %115 = bitcast %union.anon.3* %114 to [4 x i32]*, !dbg !446
  %116 = getelementptr inbounds [4 x i32], [4 x i32]* %115, i64 0, i64 0, !dbg !446
  %117 = load i32, i32* %116, align 4, !dbg !446
  %118 = icmp eq i32 %113, %117, !dbg !446
  br i1 %118, label %119, label %155, !dbg !446

119:                                              ; preds = %107
  %120 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !446
  %121 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %120, i32 0, i32 6, !dbg !446
  %122 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %121, i32 0, i32 0, !dbg !446
  %123 = bitcast %union.anon.3* %122 to [4 x i32]*, !dbg !446
  %124 = getelementptr inbounds [4 x i32], [4 x i32]* %123, i64 0, i64 1, !dbg !446
  %125 = load i32, i32* %124, align 4, !dbg !446
  %126 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %9, i32 0, i32 0, !dbg !446
  %127 = bitcast %union.anon.3* %126 to [4 x i32]*, !dbg !446
  %128 = getelementptr inbounds [4 x i32], [4 x i32]* %127, i64 0, i64 1, !dbg !446
  %129 = load i32, i32* %128, align 4, !dbg !446
  %130 = icmp eq i32 %125, %129, !dbg !446
  br i1 %130, label %131, label %155, !dbg !446

131:                                              ; preds = %119
  %132 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !446
  %133 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %132, i32 0, i32 6, !dbg !446
  %134 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %133, i32 0, i32 0, !dbg !446
  %135 = bitcast %union.anon.3* %134 to [4 x i32]*, !dbg !446
  %136 = getelementptr inbounds [4 x i32], [4 x i32]* %135, i64 0, i64 2, !dbg !446
  %137 = load i32, i32* %136, align 4, !dbg !446
  %138 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %9, i32 0, i32 0, !dbg !446
  %139 = bitcast %union.anon.3* %138 to [4 x i32]*, !dbg !446
  %140 = getelementptr inbounds [4 x i32], [4 x i32]* %139, i64 0, i64 2, !dbg !446
  %141 = load i32, i32* %140, align 4, !dbg !446
  %142 = icmp eq i32 %137, %141, !dbg !446
  br i1 %142, label %143, label %155, !dbg !446

143:                                              ; preds = %131
  %144 = load %struct.ipv6hdr*, %struct.ipv6hdr** %8, align 8, !dbg !446
  %145 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %144, i32 0, i32 6, !dbg !446
  %146 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %145, i32 0, i32 0, !dbg !446
  %147 = bitcast %union.anon.3* %146 to [4 x i32]*, !dbg !446
  %148 = getelementptr inbounds [4 x i32], [4 x i32]* %147, i64 0, i64 3, !dbg !446
  %149 = load i32, i32* %148, align 4, !dbg !446
  %150 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %9, i32 0, i32 0, !dbg !446
  %151 = bitcast %union.anon.3* %150 to [4 x i32]*, !dbg !446
  %152 = getelementptr inbounds [4 x i32], [4 x i32]* %151, i64 0, i64 3, !dbg !446
  %153 = load i32, i32* %152, align 4, !dbg !446
  %154 = icmp eq i32 %149, %153, !dbg !446
  br label %155

155:                                              ; preds = %143, %131, %119, %107
  %156 = phi i1 [ false, %131 ], [ false, %119 ], [ false, %107 ], [ %154, %143 ], !dbg !447
  store i1 %156, i1* %4, align 1, !dbg !448
  br label %157, !dbg !448

157:                                              ; preds = %96, %106, %155
  %158 = load i1, i1* %4, align 1, !dbg !449
  %159 = zext i1 %158 to i8, !dbg !450
  store i8 %159, i8* %19, align 1, !dbg !450
  br label %160, !dbg !451

160:                                              ; preds = %1, %157, %57
  %161 = load i8, i8* %19, align 1, !dbg !452
  %162 = trunc i8 %161 to i1, !dbg !452
  br i1 %162, label %164, label %163, !dbg !454

163:                                              ; preds = %160
  store i32 0, i32* %16, align 4, !dbg !455
  br label %188, !dbg !455

164:                                              ; preds = %160
  %165 = bitcast [12 x i8]* %18 to i8*, !dbg !456
  call void @llvm.memset.p0i8.i64(i8* align 1 %165, i8 0, i64 12, i1 false), !dbg !456
  %166 = load i64 (%struct.__sk_buff*, i32, i8*, i32, i64)*, i64 (%struct.__sk_buff*, i32, i8*, i32, i64)** @bpf_skb_store_bytes, align 8, !dbg !457
  %167 = load %struct.__sk_buff*, %struct.__sk_buff** %17, align 8, !dbg !459
  %168 = bitcast [12 x i8]* %18 to i8*, !dbg !460
  %169 = call i64 %166(%struct.__sk_buff* %167, i32 0, i8* %168, i32 12, i64 0), !dbg !457
  %170 = icmp slt i64 %169, 0, !dbg !461
  br i1 %170, label %171, label %172, !dbg !462

171:                                              ; preds = %164
  store i32 2, i32* %16, align 4, !dbg !463
  br label %188, !dbg !463

172:                                              ; preds = %164
  %173 = load i64 (i32, %struct.bpf_redir_neigh*, i32, i64)*, i64 (i32, %struct.bpf_redir_neigh*, i32, i64)** @bpf_redirect_neigh, align 8, !dbg !464
  store i32 1, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !358, metadata !DIExpression()) #4, !dbg !465
  call void @llvm.dbg.declare(metadata i32** %3, metadata !364, metadata !DIExpression()) #4, !dbg !467
  %174 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8, !dbg !468
  %175 = bitcast i32* %2 to i8*, !dbg !469
  %176 = call i8* %174(i8* bitcast (%struct.bpf_map_def* @ifindex_map to i8*), i8* %175) #4, !dbg !468
  %177 = bitcast i8* %176 to i32*, !dbg !468
  store i32* %177, i32** %3, align 8, !dbg !467
  %178 = load i32*, i32** %3, align 8, !dbg !470
  %179 = icmp ne i32* %178, null, !dbg !470
  br i1 %179, label %180, label %183, !dbg !470

180:                                              ; preds = %172
  %181 = load i32*, i32** %3, align 8, !dbg !471
  %182 = load i32, i32* %181, align 4, !dbg !472
  br label %184, !dbg !470

183:                                              ; preds = %172
  br label %184, !dbg !470

184:                                              ; preds = %180, %183
  %185 = phi i32 [ %182, %180 ], [ 0, %183 ], !dbg !470
  %186 = call i64 %173(i32 %185, %struct.bpf_redir_neigh* null, i32 0, i64 0), !dbg !464
  %187 = trunc i64 %186 to i32, !dbg !464
  store i32 %187, i32* %16, align 4, !dbg !473
  br label %188, !dbg !473

188:                                              ; preds = %184, %171, %163
  %189 = load i32, i32* %16, align 4, !dbg !474
  ret i32 %189, !dbg !474
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!206, !207, !208}
!llvm.ident = !{!209}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "ifindex_map", scope: !2, file: !3, line: 41, type: !198, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 12.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !10, globals: !71, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "test_tc_neigh.c", directory: "/home/cloudcome/bpf/tc")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 36, baseType: !6, size: 32, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9}
!8 = !DIEnumerator(name: "dev_src", value: 0, isUnsigned: true)
!9 = !DIEnumerator(name: "dev_dst", value: 1, isUnsigned: true)
!10 = !{!11, !12, !13, !15, !38}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !14, line: 27, baseType: !6)
!14 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !17, line: 86, size: 160, elements: !18)
!17 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!18 = !{!19, !22, !23, !24, !29, !30, !31, !32, !33, !35, !37}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !16, file: !17, line: 88, baseType: !20, size: 4, flags: DIFlagBitField, extraData: i64 0)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !14, line: 21, baseType: !21)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !16, file: !17, line: 89, baseType: !20, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !16, file: !17, line: 96, baseType: !20, size: 8, offset: 8)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !16, file: !17, line: 97, baseType: !25, size: 16, offset: 16)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !26, line: 25, baseType: !27)
!26 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !14, line: 24, baseType: !28)
!28 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !16, file: !17, line: 98, baseType: !25, size: 16, offset: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !16, file: !17, line: 99, baseType: !25, size: 16, offset: 48)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !16, file: !17, line: 100, baseType: !20, size: 8, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !16, file: !17, line: 101, baseType: !20, size: 8, offset: 72)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !16, file: !17, line: 102, baseType: !34, size: 16, offset: 80)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !26, line: 31, baseType: !27)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !16, file: !17, line: 103, baseType: !36, size: 32, offset: 96)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !26, line: 27, baseType: !13)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !16, file: !17, line: 104, baseType: !36, size: 32, offset: 128)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !40, line: 117, size: 320, elements: !41)
!40 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!41 = !{!42, !43, !44, !48, !49, !50, !51, !70}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !39, file: !40, line: 119, baseType: !20, size: 4, flags: DIFlagBitField, extraData: i64 0)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !39, file: !40, line: 120, baseType: !20, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !39, file: !40, line: 127, baseType: !45, size: 24, offset: 8)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 24, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 3)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !39, file: !40, line: 129, baseType: !25, size: 16, offset: 32)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !39, file: !40, line: 130, baseType: !20, size: 8, offset: 48)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !39, file: !40, line: 131, baseType: !20, size: 8, offset: 56)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !39, file: !40, line: 133, baseType: !52, size: 128, offset: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !53, line: 33, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!54 = !{!55}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !52, file: !53, line: 40, baseType: !56, size: 128)
!56 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !52, file: !53, line: 34, size: 128, elements: !57)
!57 = !{!58, !62, !66}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !56, file: !53, line: 35, baseType: !59, size: 128)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 128, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 16)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !56, file: !53, line: 37, baseType: !63, size: 128)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 128, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 8)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !56, file: !53, line: 38, baseType: !67, size: 128)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 128, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 4)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !39, file: !40, line: 134, baseType: !52, size: 128, offset: 192)
!71 = !{!0, !72, !76, !179, !193}
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "__license", scope: !2, file: !3, line: 149, type: !74, isLocal: false, isDefinition: true)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !75, size: 32, elements: !68)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(name: "bpf_skb_store_bytes", scope: !2, file: !78, line: 220, type: !79, isLocal: true, isDefinition: true)
!78 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/home/cloudcome/bpf/tc")
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DISubroutineType(types: !81)
!81 = !{!12, !82, !13, !177, !13, !149}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !84, line: 4183, size: 1472, elements: !85)
!84 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!85 = !{!86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !102, !103, !104, !105, !106, !107, !108, !109, !110, !112, !113, !114, !115, !116, !148, !151, !152, !153, !176}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !83, file: !84, line: 4184, baseType: !13, size: 32)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !83, file: !84, line: 4185, baseType: !13, size: 32, offset: 32)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !83, file: !84, line: 4186, baseType: !13, size: 32, offset: 64)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !83, file: !84, line: 4187, baseType: !13, size: 32, offset: 96)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !83, file: !84, line: 4188, baseType: !13, size: 32, offset: 128)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !83, file: !84, line: 4189, baseType: !13, size: 32, offset: 160)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !83, file: !84, line: 4190, baseType: !13, size: 32, offset: 192)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !83, file: !84, line: 4191, baseType: !13, size: 32, offset: 224)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !83, file: !84, line: 4192, baseType: !13, size: 32, offset: 256)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !83, file: !84, line: 4193, baseType: !13, size: 32, offset: 288)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !83, file: !84, line: 4194, baseType: !13, size: 32, offset: 320)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !83, file: !84, line: 4195, baseType: !13, size: 32, offset: 352)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !83, file: !84, line: 4196, baseType: !99, size: 160, offset: 384)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !100)
!100 = !{!101}
!101 = !DISubrange(count: 5)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !83, file: !84, line: 4197, baseType: !13, size: 32, offset: 544)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !83, file: !84, line: 4198, baseType: !13, size: 32, offset: 576)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !83, file: !84, line: 4199, baseType: !13, size: 32, offset: 608)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !83, file: !84, line: 4200, baseType: !13, size: 32, offset: 640)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !83, file: !84, line: 4201, baseType: !13, size: 32, offset: 672)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !83, file: !84, line: 4204, baseType: !13, size: 32, offset: 704)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !83, file: !84, line: 4205, baseType: !13, size: 32, offset: 736)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !83, file: !84, line: 4206, baseType: !13, size: 32, offset: 768)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !83, file: !84, line: 4207, baseType: !111, size: 128, offset: 800)
!111 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !68)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !83, file: !84, line: 4208, baseType: !111, size: 128, offset: 928)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !83, file: !84, line: 4209, baseType: !13, size: 32, offset: 1056)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !83, file: !84, line: 4210, baseType: !13, size: 32, offset: 1088)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !83, file: !84, line: 4213, baseType: !13, size: 32, offset: 1120)
!116 = !DIDerivedType(tag: DW_TAG_member, scope: !83, file: !84, line: 4214, baseType: !117, size: 64, align: 64, offset: 1152)
!117 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !83, file: !84, line: 4214, size: 64, align: 64, elements: !118)
!118 = !{!119}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !117, file: !84, line: 4214, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !84, line: 5041, size: 448, elements: !122)
!122 = !{!123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !146, !147}
!123 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !121, file: !84, line: 5042, baseType: !27, size: 16)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !121, file: !84, line: 5043, baseType: !27, size: 16, offset: 16)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !121, file: !84, line: 5044, baseType: !27, size: 16, offset: 32)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !121, file: !84, line: 5045, baseType: !20, size: 8, offset: 48)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !121, file: !84, line: 5046, baseType: !20, size: 8, offset: 56)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !121, file: !84, line: 5047, baseType: !20, size: 8, offset: 64)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !121, file: !84, line: 5048, baseType: !20, size: 8, offset: 72)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !121, file: !84, line: 5049, baseType: !25, size: 16, offset: 80)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !121, file: !84, line: 5050, baseType: !25, size: 16, offset: 96)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !121, file: !84, line: 5051, baseType: !25, size: 16, offset: 112)
!133 = !DIDerivedType(tag: DW_TAG_member, scope: !121, file: !84, line: 5052, baseType: !134, size: 256, offset: 128)
!134 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !121, file: !84, line: 5052, size: 256, elements: !135)
!135 = !{!136, !141}
!136 = !DIDerivedType(tag: DW_TAG_member, scope: !134, file: !84, line: 5053, baseType: !137, size: 64)
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !134, file: !84, line: 5053, size: 64, elements: !138)
!138 = !{!139, !140}
!139 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !137, file: !84, line: 5054, baseType: !36, size: 32)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !137, file: !84, line: 5055, baseType: !36, size: 32, offset: 32)
!141 = !DIDerivedType(tag: DW_TAG_member, scope: !134, file: !84, line: 5057, baseType: !142, size: 256)
!142 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !134, file: !84, line: 5057, size: 256, elements: !143)
!143 = !{!144, !145}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !142, file: !84, line: 5058, baseType: !111, size: 128)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !142, file: !84, line: 5059, baseType: !111, size: 128, offset: 128)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !121, file: !84, line: 5062, baseType: !13, size: 32, offset: 384)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !121, file: !84, line: 5063, baseType: !36, size: 32, offset: 416)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !83, file: !84, line: 4215, baseType: !149, size: 64, offset: 1216)
!149 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !14, line: 31, baseType: !150)
!150 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !83, file: !84, line: 4216, baseType: !13, size: 32, offset: 1280)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !83, file: !84, line: 4217, baseType: !13, size: 32, offset: 1312)
!153 = !DIDerivedType(tag: DW_TAG_member, scope: !83, file: !84, line: 4218, baseType: !154, size: 64, align: 64, offset: 1344)
!154 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !83, file: !84, line: 4218, size: 64, align: 64, elements: !155)
!155 = !{!156}
!156 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !154, file: !84, line: 4218, baseType: !157, size: 64)
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !84, line: 4272, size: 640, elements: !159)
!159 = !{!160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !158, file: !84, line: 4273, baseType: !13, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !158, file: !84, line: 4274, baseType: !13, size: 32, offset: 32)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !158, file: !84, line: 4275, baseType: !13, size: 32, offset: 64)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !158, file: !84, line: 4276, baseType: !13, size: 32, offset: 96)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !158, file: !84, line: 4277, baseType: !13, size: 32, offset: 128)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !158, file: !84, line: 4278, baseType: !13, size: 32, offset: 160)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !158, file: !84, line: 4280, baseType: !13, size: 32, offset: 192)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !158, file: !84, line: 4281, baseType: !111, size: 128, offset: 224)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !158, file: !84, line: 4282, baseType: !13, size: 32, offset: 352)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !158, file: !84, line: 4283, baseType: !13, size: 32, offset: 384)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !158, file: !84, line: 4284, baseType: !13, size: 32, offset: 416)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !158, file: !84, line: 4285, baseType: !111, size: 128, offset: 448)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !158, file: !84, line: 4286, baseType: !13, size: 32, offset: 576)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !158, file: !84, line: 4287, baseType: !174, size: 32, offset: 608)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !14, line: 26, baseType: !175)
!175 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !83, file: !84, line: 4219, baseType: !13, size: 32, offset: 1408)
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!179 = !DIGlobalVariableExpression(var: !180, expr: !DIExpression())
!180 = distinct !DIGlobalVariable(name: "bpf_redirect_neigh", scope: !2, file: !78, line: 3588, type: !181, isLocal: true, isDefinition: true)
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !182, size: 64)
!182 = !DISubroutineType(types: !183)
!183 = !{!12, !13, !184, !175, !149}
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !185, size: 64)
!185 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_redir_neigh", file: !84, line: 5016, size: 160, elements: !186)
!186 = !{!187, !188}
!187 = !DIDerivedType(tag: DW_TAG_member, name: "nh_family", scope: !185, file: !84, line: 5018, baseType: !13, size: 32)
!188 = !DIDerivedType(tag: DW_TAG_member, scope: !185, file: !84, line: 5020, baseType: !189, size: 128, offset: 32)
!189 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !185, file: !84, line: 5020, size: 128, elements: !190)
!190 = !{!191, !192}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_nh", scope: !189, file: !84, line: 5021, baseType: !36, size: 32)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_nh", scope: !189, file: !84, line: 5022, baseType: !111, size: 128)
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !78, line: 49, type: !195, isLocal: true, isDefinition: true)
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!196 = !DISubroutineType(types: !197)
!197 = !{!11, !11, !177}
!198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !199, line: 138, size: 160, elements: !200)
!199 = !DIFile(filename: "../libbpf/src/bpf_helpers.h", directory: "/home/cloudcome/bpf/tc")
!200 = !{!201, !202, !203, !204, !205}
!201 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !198, file: !199, line: 139, baseType: !6, size: 32)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !198, file: !199, line: 140, baseType: !6, size: 32, offset: 32)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !198, file: !199, line: 141, baseType: !6, size: 32, offset: 64)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !198, file: !199, line: 142, baseType: !6, size: 32, offset: 96)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !198, file: !199, line: 143, baseType: !6, size: 32, offset: 128)
!206 = !{i32 7, !"Dwarf Version", i32 4}
!207 = !{i32 2, !"Debug Info Version", i32 3}
!208 = !{i32 1, !"wchar_size", i32 4}
!209 = !{!"Ubuntu clang version 12.0.0-1ubuntu1"}
!210 = distinct !DISubprogram(name: "tc_chk", scope: !3, file: !3, line: 89, type: !211, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!211 = !DISubroutineType(types: !212)
!212 = !{!175, !82}
!213 = !{}
!214 = !DILocalVariable(name: "skb", arg: 1, scope: !210, file: !3, line: 89, type: !82)
!215 = !DILocation(line: 89, column: 48, scope: !210)
!216 = !DILocalVariable(name: "data_end", scope: !210, file: !3, line: 91, type: !11)
!217 = !DILocation(line: 91, column: 8, scope: !210)
!218 = !DILocation(line: 91, column: 19, scope: !210)
!219 = !DILocalVariable(name: "data", scope: !210, file: !3, line: 92, type: !11)
!220 = !DILocation(line: 92, column: 8, scope: !210)
!221 = !DILocation(line: 92, column: 15, scope: !210)
!222 = !DILocalVariable(name: "raw", scope: !210, file: !3, line: 93, type: !223)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!224 = !DILocation(line: 93, column: 9, scope: !210)
!225 = !DILocation(line: 93, column: 15, scope: !210)
!226 = !DILocation(line: 95, column: 6, scope: !227)
!227 = distinct !DILexicalBlock(scope: !210, file: !3, line: 95, column: 6)
!228 = !DILocation(line: 95, column: 11, scope: !227)
!229 = !DILocation(line: 95, column: 37, scope: !227)
!230 = !DILocation(line: 95, column: 35, scope: !227)
!231 = !DILocation(line: 95, column: 6, scope: !210)
!232 = !DILocation(line: 96, column: 3, scope: !227)
!233 = !DILocation(line: 98, column: 10, scope: !210)
!234 = !DILocation(line: 98, column: 17, scope: !210)
!235 = !DILocation(line: 98, column: 21, scope: !210)
!236 = !DILocation(line: 98, column: 28, scope: !210)
!237 = !DILocation(line: 98, column: 32, scope: !210)
!238 = !DILocation(line: 98, column: 31, scope: !210)
!239 = !DILocation(line: 0, scope: !210)
!240 = !DILocation(line: 98, column: 9, scope: !210)
!241 = !DILocation(line: 98, column: 2, scope: !210)
!242 = !DILocation(line: 99, column: 1, scope: !210)
!243 = distinct !DISubprogram(name: "tc_dst", scope: !3, file: !3, line: 101, type: !211, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!244 = !DILocalVariable(name: "skb", arg: 1, scope: !243, file: !3, line: 101, type: !82)
!245 = !DILocation(line: 101, column: 49, scope: !243)
!246 = !DILocalVariable(name: "zero", scope: !243, file: !3, line: 103, type: !247)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 96, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 12)
!250 = !DILocation(line: 103, column: 7, scope: !243)
!251 = !DILocalVariable(name: "redirect", scope: !243, file: !3, line: 104, type: !252)
!252 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!253 = !DILocation(line: 104, column: 7, scope: !243)
!254 = !DILocation(line: 106, column: 10, scope: !243)
!255 = !DILocation(line: 106, column: 15, scope: !243)
!256 = !DILocation(line: 106, column: 2, scope: !243)
!257 = !DILocation(line: 108, column: 30, scope: !258)
!258 = distinct !DILexicalBlock(scope: !243, file: !3, line: 106, column: 25)
!259 = !DILocalVariable(name: "skb", arg: 1, scope: !260, file: !3, line: 48, type: !82)
!260 = distinct !DISubprogram(name: "is_remote_ep_v4", scope: !3, file: !3, line: 48, type: !261, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !213)
!261 = !DISubroutineType(types: !262)
!262 = !{!252, !82, !36}
!263 = !DILocation(line: 48, column: 63, scope: !260, inlinedAt: !264)
!264 = distinct !DILocation(line: 108, column: 14, scope: !258)
!265 = !DILocalVariable(name: "addr", arg: 2, scope: !260, file: !3, line: 49, type: !36)
!266 = !DILocation(line: 49, column: 17, scope: !260, inlinedAt: !264)
!267 = !DILocalVariable(name: "data_end", scope: !260, file: !3, line: 51, type: !11)
!268 = !DILocation(line: 51, column: 8, scope: !260, inlinedAt: !264)
!269 = !DILocation(line: 51, column: 19, scope: !260, inlinedAt: !264)
!270 = !DILocalVariable(name: "data", scope: !260, file: !3, line: 52, type: !11)
!271 = !DILocation(line: 52, column: 8, scope: !260, inlinedAt: !264)
!272 = !DILocation(line: 52, column: 15, scope: !260, inlinedAt: !264)
!273 = !DILocalVariable(name: "ip4h", scope: !260, file: !3, line: 53, type: !15)
!274 = !DILocation(line: 53, column: 16, scope: !260, inlinedAt: !264)
!275 = !DILocation(line: 55, column: 6, scope: !276, inlinedAt: !264)
!276 = distinct !DILexicalBlock(scope: !260, file: !3, line: 55, column: 6)
!277 = !DILocation(line: 55, column: 11, scope: !276, inlinedAt: !264)
!278 = !DILocation(line: 55, column: 37, scope: !276, inlinedAt: !264)
!279 = !DILocation(line: 55, column: 35, scope: !276, inlinedAt: !264)
!280 = !DILocation(line: 55, column: 6, scope: !260, inlinedAt: !264)
!281 = !DILocation(line: 56, column: 3, scope: !276, inlinedAt: !264)
!282 = !DILocation(line: 58, column: 26, scope: !260, inlinedAt: !264)
!283 = !DILocation(line: 58, column: 31, scope: !260, inlinedAt: !264)
!284 = !DILocation(line: 58, column: 9, scope: !260, inlinedAt: !264)
!285 = !DILocation(line: 58, column: 7, scope: !260, inlinedAt: !264)
!286 = !DILocation(line: 59, column: 15, scope: !287, inlinedAt: !264)
!287 = distinct !DILexicalBlock(scope: !260, file: !3, line: 59, column: 6)
!288 = !DILocation(line: 59, column: 20, scope: !287, inlinedAt: !264)
!289 = !DILocation(line: 59, column: 6, scope: !287, inlinedAt: !264)
!290 = !DILocation(line: 59, column: 27, scope: !287, inlinedAt: !264)
!291 = !DILocation(line: 59, column: 25, scope: !287, inlinedAt: !264)
!292 = !DILocation(line: 59, column: 6, scope: !260, inlinedAt: !264)
!293 = !DILocation(line: 60, column: 3, scope: !287, inlinedAt: !264)
!294 = !DILocation(line: 62, column: 9, scope: !260, inlinedAt: !264)
!295 = !DILocation(line: 62, column: 15, scope: !260, inlinedAt: !264)
!296 = !DILocation(line: 62, column: 24, scope: !260, inlinedAt: !264)
!297 = !DILocation(line: 62, column: 21, scope: !260, inlinedAt: !264)
!298 = !DILocation(line: 62, column: 2, scope: !260, inlinedAt: !264)
!299 = !DILocation(line: 63, column: 1, scope: !260, inlinedAt: !264)
!300 = !DILocation(line: 108, column: 12, scope: !258)
!301 = !DILocation(line: 109, column: 3, scope: !258)
!302 = !DILocation(line: 111, column: 30, scope: !258)
!303 = !DILocation(line: 111, column: 52, scope: !258)
!304 = !DILocalVariable(name: "skb", arg: 1, scope: !305, file: !3, line: 65, type: !82)
!305 = distinct !DISubprogram(name: "is_remote_ep_v6", scope: !3, file: !3, line: 65, type: !306, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !213)
!306 = !DISubroutineType(types: !307)
!307 = !{!252, !82, !52}
!308 = !DILocation(line: 65, column: 63, scope: !305, inlinedAt: !309)
!309 = distinct !DILocation(line: 111, column: 14, scope: !258)
!310 = !DILocalVariable(name: "addr", arg: 2, scope: !305, file: !3, line: 66, type: !52)
!311 = !DILocation(line: 66, column: 26, scope: !305, inlinedAt: !309)
!312 = !DILocalVariable(name: "data_end", scope: !305, file: !3, line: 68, type: !11)
!313 = !DILocation(line: 68, column: 8, scope: !305, inlinedAt: !309)
!314 = !DILocation(line: 68, column: 19, scope: !305, inlinedAt: !309)
!315 = !DILocalVariable(name: "data", scope: !305, file: !3, line: 69, type: !11)
!316 = !DILocation(line: 69, column: 8, scope: !305, inlinedAt: !309)
!317 = !DILocation(line: 69, column: 15, scope: !305, inlinedAt: !309)
!318 = !DILocalVariable(name: "ip6h", scope: !305, file: !3, line: 70, type: !38)
!319 = !DILocation(line: 70, column: 18, scope: !305, inlinedAt: !309)
!320 = !DILocation(line: 72, column: 6, scope: !321, inlinedAt: !309)
!321 = distinct !DILexicalBlock(scope: !305, file: !3, line: 72, column: 6)
!322 = !DILocation(line: 72, column: 11, scope: !321, inlinedAt: !309)
!323 = !DILocation(line: 72, column: 37, scope: !321, inlinedAt: !309)
!324 = !DILocation(line: 72, column: 35, scope: !321, inlinedAt: !309)
!325 = !DILocation(line: 72, column: 6, scope: !305, inlinedAt: !309)
!326 = !DILocation(line: 73, column: 3, scope: !321, inlinedAt: !309)
!327 = !DILocation(line: 75, column: 28, scope: !305, inlinedAt: !309)
!328 = !DILocation(line: 75, column: 33, scope: !305, inlinedAt: !309)
!329 = !DILocation(line: 75, column: 9, scope: !305, inlinedAt: !309)
!330 = !DILocation(line: 75, column: 7, scope: !305, inlinedAt: !309)
!331 = !DILocation(line: 76, column: 15, scope: !332, inlinedAt: !309)
!332 = distinct !DILexicalBlock(scope: !305, file: !3, line: 76, column: 6)
!333 = !DILocation(line: 76, column: 20, scope: !332, inlinedAt: !309)
!334 = !DILocation(line: 76, column: 6, scope: !332, inlinedAt: !309)
!335 = !DILocation(line: 76, column: 27, scope: !332, inlinedAt: !309)
!336 = !DILocation(line: 76, column: 25, scope: !332, inlinedAt: !309)
!337 = !DILocation(line: 76, column: 6, scope: !305, inlinedAt: !309)
!338 = !DILocation(line: 77, column: 3, scope: !332, inlinedAt: !309)
!339 = !DILocation(line: 79, column: 9, scope: !305, inlinedAt: !309)
!340 = !DILocation(line: 0, scope: !305, inlinedAt: !309)
!341 = !DILocation(line: 79, column: 2, scope: !305, inlinedAt: !309)
!342 = !DILocation(line: 80, column: 1, scope: !305, inlinedAt: !309)
!343 = !DILocation(line: 111, column: 12, scope: !258)
!344 = !DILocation(line: 112, column: 3, scope: !258)
!345 = !DILocation(line: 115, column: 7, scope: !346)
!346 = distinct !DILexicalBlock(scope: !243, file: !3, line: 115, column: 6)
!347 = !DILocation(line: 115, column: 6, scope: !243)
!348 = !DILocation(line: 116, column: 3, scope: !346)
!349 = !DILocation(line: 118, column: 2, scope: !243)
!350 = !DILocation(line: 119, column: 6, scope: !351)
!351 = distinct !DILexicalBlock(scope: !243, file: !3, line: 119, column: 6)
!352 = !DILocation(line: 119, column: 26, scope: !351)
!353 = !DILocation(line: 119, column: 34, scope: !351)
!354 = !DILocation(line: 119, column: 58, scope: !351)
!355 = !DILocation(line: 119, column: 6, scope: !243)
!356 = !DILocation(line: 120, column: 3, scope: !351)
!357 = !DILocation(line: 122, column: 9, scope: !243)
!358 = !DILocalVariable(name: "which", arg: 1, scope: !359, file: !3, line: 82, type: !175)
!359 = distinct !DISubprogram(name: "get_dev_ifindex", scope: !3, file: !3, line: 82, type: !360, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !213)
!360 = !DISubroutineType(types: !361)
!361 = !{!175, !175}
!362 = !DILocation(line: 82, column: 48, scope: !359, inlinedAt: !363)
!363 = distinct !DILocation(line: 122, column: 28, scope: !243)
!364 = !DILocalVariable(name: "ifindex", scope: !359, file: !3, line: 84, type: !365)
!365 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!366 = !DILocation(line: 84, column: 7, scope: !359, inlinedAt: !363)
!367 = !DILocation(line: 84, column: 17, scope: !359, inlinedAt: !363)
!368 = !DILocation(line: 84, column: 51, scope: !359, inlinedAt: !363)
!369 = !DILocation(line: 86, column: 9, scope: !359, inlinedAt: !363)
!370 = !DILocation(line: 86, column: 20, scope: !359, inlinedAt: !363)
!371 = !DILocation(line: 86, column: 19, scope: !359, inlinedAt: !363)
!372 = !DILocation(line: 122, column: 2, scope: !243)
!373 = !DILocation(line: 123, column: 1, scope: !243)
!374 = distinct !DISubprogram(name: "tc_src", scope: !3, file: !3, line: 125, type: !211, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!375 = !DILocalVariable(name: "skb", arg: 1, scope: !374, file: !3, line: 125, type: !82)
!376 = !DILocation(line: 125, column: 49, scope: !374)
!377 = !DILocalVariable(name: "zero", scope: !374, file: !3, line: 127, type: !247)
!378 = !DILocation(line: 127, column: 7, scope: !374)
!379 = !DILocalVariable(name: "redirect", scope: !374, file: !3, line: 128, type: !252)
!380 = !DILocation(line: 128, column: 7, scope: !374)
!381 = !DILocation(line: 130, column: 10, scope: !374)
!382 = !DILocation(line: 130, column: 15, scope: !374)
!383 = !DILocation(line: 130, column: 2, scope: !374)
!384 = !DILocation(line: 132, column: 30, scope: !385)
!385 = distinct !DILexicalBlock(scope: !374, file: !3, line: 130, column: 25)
!386 = !DILocation(line: 48, column: 63, scope: !260, inlinedAt: !387)
!387 = distinct !DILocation(line: 132, column: 14, scope: !385)
!388 = !DILocation(line: 49, column: 17, scope: !260, inlinedAt: !387)
!389 = !DILocation(line: 51, column: 8, scope: !260, inlinedAt: !387)
!390 = !DILocation(line: 51, column: 19, scope: !260, inlinedAt: !387)
!391 = !DILocation(line: 52, column: 8, scope: !260, inlinedAt: !387)
!392 = !DILocation(line: 52, column: 15, scope: !260, inlinedAt: !387)
!393 = !DILocation(line: 53, column: 16, scope: !260, inlinedAt: !387)
!394 = !DILocation(line: 55, column: 6, scope: !276, inlinedAt: !387)
!395 = !DILocation(line: 55, column: 11, scope: !276, inlinedAt: !387)
!396 = !DILocation(line: 55, column: 37, scope: !276, inlinedAt: !387)
!397 = !DILocation(line: 55, column: 35, scope: !276, inlinedAt: !387)
!398 = !DILocation(line: 55, column: 6, scope: !260, inlinedAt: !387)
!399 = !DILocation(line: 56, column: 3, scope: !276, inlinedAt: !387)
!400 = !DILocation(line: 58, column: 26, scope: !260, inlinedAt: !387)
!401 = !DILocation(line: 58, column: 31, scope: !260, inlinedAt: !387)
!402 = !DILocation(line: 58, column: 9, scope: !260, inlinedAt: !387)
!403 = !DILocation(line: 58, column: 7, scope: !260, inlinedAt: !387)
!404 = !DILocation(line: 59, column: 15, scope: !287, inlinedAt: !387)
!405 = !DILocation(line: 59, column: 20, scope: !287, inlinedAt: !387)
!406 = !DILocation(line: 59, column: 6, scope: !287, inlinedAt: !387)
!407 = !DILocation(line: 59, column: 27, scope: !287, inlinedAt: !387)
!408 = !DILocation(line: 59, column: 25, scope: !287, inlinedAt: !387)
!409 = !DILocation(line: 59, column: 6, scope: !260, inlinedAt: !387)
!410 = !DILocation(line: 60, column: 3, scope: !287, inlinedAt: !387)
!411 = !DILocation(line: 62, column: 9, scope: !260, inlinedAt: !387)
!412 = !DILocation(line: 62, column: 15, scope: !260, inlinedAt: !387)
!413 = !DILocation(line: 62, column: 24, scope: !260, inlinedAt: !387)
!414 = !DILocation(line: 62, column: 21, scope: !260, inlinedAt: !387)
!415 = !DILocation(line: 62, column: 2, scope: !260, inlinedAt: !387)
!416 = !DILocation(line: 63, column: 1, scope: !260, inlinedAt: !387)
!417 = !DILocation(line: 132, column: 12, scope: !385)
!418 = !DILocation(line: 133, column: 3, scope: !385)
!419 = !DILocation(line: 135, column: 30, scope: !385)
!420 = !DILocation(line: 135, column: 52, scope: !385)
!421 = !DILocation(line: 65, column: 63, scope: !305, inlinedAt: !422)
!422 = distinct !DILocation(line: 135, column: 14, scope: !385)
!423 = !DILocation(line: 66, column: 26, scope: !305, inlinedAt: !422)
!424 = !DILocation(line: 68, column: 8, scope: !305, inlinedAt: !422)
!425 = !DILocation(line: 68, column: 19, scope: !305, inlinedAt: !422)
!426 = !DILocation(line: 69, column: 8, scope: !305, inlinedAt: !422)
!427 = !DILocation(line: 69, column: 15, scope: !305, inlinedAt: !422)
!428 = !DILocation(line: 70, column: 18, scope: !305, inlinedAt: !422)
!429 = !DILocation(line: 72, column: 6, scope: !321, inlinedAt: !422)
!430 = !DILocation(line: 72, column: 11, scope: !321, inlinedAt: !422)
!431 = !DILocation(line: 72, column: 37, scope: !321, inlinedAt: !422)
!432 = !DILocation(line: 72, column: 35, scope: !321, inlinedAt: !422)
!433 = !DILocation(line: 72, column: 6, scope: !305, inlinedAt: !422)
!434 = !DILocation(line: 73, column: 3, scope: !321, inlinedAt: !422)
!435 = !DILocation(line: 75, column: 28, scope: !305, inlinedAt: !422)
!436 = !DILocation(line: 75, column: 33, scope: !305, inlinedAt: !422)
!437 = !DILocation(line: 75, column: 9, scope: !305, inlinedAt: !422)
!438 = !DILocation(line: 75, column: 7, scope: !305, inlinedAt: !422)
!439 = !DILocation(line: 76, column: 15, scope: !332, inlinedAt: !422)
!440 = !DILocation(line: 76, column: 20, scope: !332, inlinedAt: !422)
!441 = !DILocation(line: 76, column: 6, scope: !332, inlinedAt: !422)
!442 = !DILocation(line: 76, column: 27, scope: !332, inlinedAt: !422)
!443 = !DILocation(line: 76, column: 25, scope: !332, inlinedAt: !422)
!444 = !DILocation(line: 76, column: 6, scope: !305, inlinedAt: !422)
!445 = !DILocation(line: 77, column: 3, scope: !332, inlinedAt: !422)
!446 = !DILocation(line: 79, column: 9, scope: !305, inlinedAt: !422)
!447 = !DILocation(line: 0, scope: !305, inlinedAt: !422)
!448 = !DILocation(line: 79, column: 2, scope: !305, inlinedAt: !422)
!449 = !DILocation(line: 80, column: 1, scope: !305, inlinedAt: !422)
!450 = !DILocation(line: 135, column: 12, scope: !385)
!451 = !DILocation(line: 136, column: 3, scope: !385)
!452 = !DILocation(line: 139, column: 7, scope: !453)
!453 = distinct !DILexicalBlock(scope: !374, file: !3, line: 139, column: 6)
!454 = !DILocation(line: 139, column: 6, scope: !374)
!455 = !DILocation(line: 140, column: 3, scope: !453)
!456 = !DILocation(line: 142, column: 2, scope: !374)
!457 = !DILocation(line: 143, column: 6, scope: !458)
!458 = distinct !DILexicalBlock(scope: !374, file: !3, line: 143, column: 6)
!459 = !DILocation(line: 143, column: 26, scope: !458)
!460 = !DILocation(line: 143, column: 34, scope: !458)
!461 = !DILocation(line: 143, column: 58, scope: !458)
!462 = !DILocation(line: 143, column: 6, scope: !374)
!463 = !DILocation(line: 144, column: 3, scope: !458)
!464 = !DILocation(line: 146, column: 9, scope: !374)
!465 = !DILocation(line: 82, column: 48, scope: !359, inlinedAt: !466)
!466 = distinct !DILocation(line: 146, column: 28, scope: !374)
!467 = !DILocation(line: 84, column: 7, scope: !359, inlinedAt: !466)
!468 = !DILocation(line: 84, column: 17, scope: !359, inlinedAt: !466)
!469 = !DILocation(line: 84, column: 51, scope: !359, inlinedAt: !466)
!470 = !DILocation(line: 86, column: 9, scope: !359, inlinedAt: !466)
!471 = !DILocation(line: 86, column: 20, scope: !359, inlinedAt: !466)
!472 = !DILocation(line: 86, column: 19, scope: !359, inlinedAt: !466)
!473 = !DILocation(line: 146, column: 2, scope: !374)
!474 = !DILocation(line: 147, column: 1, scope: !374)
