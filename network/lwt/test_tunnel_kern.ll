; ModuleID = 'test_tunnel_kern.c'
source_filename = "test_tunnel_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0, i32, i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32, i32 }
%struct.bpf_tunnel_key = type { i32, %union.anon.3, i8, i8, i16, i32 }
%union.anon.3 = type { [4 x i32] }
%struct.erspan_metadata = type { i32, %union.anon.4 }
%union.anon.4 = type { %struct.erspan_md2 }
%struct.erspan_md2 = type { i32, i16, i16 }
%struct.vxlan_metadata = type { i32 }
%struct.geneve_opt = type { i16, i8, i8, [8 x i8] }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.5 }
%union.anon.5 = type { [4 x i32] }
%struct.bpf_xfrm_state = type { i32, i32, i16, i16, %union.anon.6 }
%union.anon.6 = type { [4 x i32] }

@_version = dso_local global i32 1, section "version", align 4, !dbg !0
@__const._gre_get_tunnel.fmt = private unnamed_addr constant [23 x i8] c"key %d remote ip 0x%x\0A\00", align 1
@__const._erspan_get_tunnel.fmt = private unnamed_addr constant [41 x i8] c"key %d remote ip 0x%x erspan version %d\0A\00", align 1
@__const._ip4ip6erspan_get_tunnel.fmt = private unnamed_addr constant [56 x i8] c"ip6erspan get key %d remote ip6 ::%x erspan version %d\0A\00", align 1
@__const._ip4ip6erspan_get_tunnel.fmt2 = private unnamed_addr constant [36 x i8] c"\09direction %d hwid %x timestamp %u\0A\00", align 1
@__const._vxlan_get_tunnel.fmt = private unnamed_addr constant [38 x i8] c"key %d remote ip 0x%x vxlan gbp 0x%x\0A\00", align 1
@__const._ip6vxlan_get_tunnel.fmt = private unnamed_addr constant [33 x i8] c"key %d remote ip6 ::%x label %x\0A\00", align 1
@__const._ip6geneve_get_tunnel.fmt = private unnamed_addr constant [41 x i8] c"key %d remote ip 0x%x geneve class 0x%x\0A\00", align 1
@__const._ipip_get_tunnel.fmt = private unnamed_addr constant [16 x i8] c"remote ip 0x%x\0A\00", align 1
@__const._ip6ip6_get_tunnel.fmt = private unnamed_addr constant [19 x i8] c"remote ip6 %x::%x\0A\00", align 1
@__const._ip6ip6_get_tunnel.fmt.22 = private unnamed_addr constant [22 x i8] c"ERROR line:%d ret:%d\0A\00", align 1
@__const._xfrm_get_state.fmt = private unnamed_addr constant [34 x i8] c"reqid %d spi 0x%x remote ip 0x%x\0A\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !56
@llvm.used = appending global [25 x i8*] [i8* bitcast (i32 (%struct.__sk_buff*)* @_erspan_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_erspan_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_geneve_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_geneve_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_gre_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_gre_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip4ip6erspan_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip4ip6erspan_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip6geneve_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip6geneve_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip6gretap_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip6gretap_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip6ip6_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip6ip6_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip6vxlan_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ip6vxlan_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ipip6_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ipip6_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ipip_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_ipip_set_tunnel to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32* @_version to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_vxlan_get_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_vxlan_set_tunnel to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @_xfrm_get_state to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @_gre_set_tunnel(%struct.__sk_buff* %0) #0 section "gre_set_tunnel" !dbg !216 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !220, metadata !DIExpression()), !dbg !230
  %4 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !231
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %4) #4, !dbg !231
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !222, metadata !DIExpression()), !dbg !232
  %5 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 1, !dbg !233
  %6 = bitcast i32* %5 to i8*, !dbg !233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %6, i8 0, i64 20, i1 false), !dbg !233
  %7 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !234
  store i32 -1408237212, i32* %7, align 4, !dbg !235, !tbaa !236
  %8 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !239
  store i32 2, i32* %8, align 4, !dbg !240, !tbaa !241
  %9 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 2, !dbg !245
  store i8 0, i8* %9, align 4, !dbg !246, !tbaa !247
  %10 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !248
  store i8 64, i8* %10, align 1, !dbg !249, !tbaa !250
  %11 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 10) #4, !dbg !251
  %12 = trunc i64 %11 to i32, !dbg !251
  call void @llvm.dbg.value(metadata i32 %12, metadata !221, metadata !DIExpression()), !dbg !230
  %13 = icmp slt i32 %12, 0, !dbg !252
  br i1 %13, label %14, label %17, !dbg !253

14:                                               ; preds = %1
  %15 = getelementptr inbounds [22 x i8], [22 x i8]* %3, i64 0, i64 0, !dbg !254
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %15) #4, !dbg !254
  call void @llvm.dbg.declare(metadata [22 x i8]* %3, metadata !223, metadata !DIExpression()), !dbg !254
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %15, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !254
  %16 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %15, i32 22, i32 60, i32 %12) #4, !dbg !254
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %15) #4, !dbg !255
  br label %17, !dbg !256

17:                                               ; preds = %1, %14
  %18 = phi i32 [ 2, %14 ], [ 0, %1 ], !dbg !230
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %4) #4, !dbg !257
  ret i32 %18, !dbg !257
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define dso_local i32 @_gre_get_tunnel(%struct.__sk_buff* %0) #0 section "gre_get_tunnel" !dbg !258 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [23 x i8], align 1
  %4 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !260, metadata !DIExpression()), !dbg !271
  %5 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !272
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %5) #4, !dbg !272
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !262, metadata !DIExpression()), !dbg !273
  %6 = getelementptr inbounds [23 x i8], [23 x i8]* %3, i64 0, i64 0, !dbg !274
  call void @llvm.lifetime.start.p0i8(i64 23, i8* nonnull %6) #4, !dbg !274
  call void @llvm.dbg.declare(metadata [23 x i8]* %3, metadata !263, metadata !DIExpression()), !dbg !275
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(23) %6, i8* nonnull align 1 dereferenceable(23) getelementptr inbounds ([23 x i8], [23 x i8]* @__const._gre_get_tunnel.fmt, i64 0, i64 0), i64 23, i1 false), !dbg !275
  %7 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 0) #4, !dbg !276
  %8 = trunc i64 %7 to i32, !dbg !276
  call void @llvm.dbg.value(metadata i32 %8, metadata !261, metadata !DIExpression()), !dbg !271
  %9 = icmp slt i32 %8, 0, !dbg !277
  br i1 %9, label %10, label %13, !dbg !278

10:                                               ; preds = %1
  %11 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !279
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %11) #4, !dbg !279
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !267, metadata !DIExpression()), !dbg !279
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %11, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !279
  %12 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %11, i32 22, i32 76, i32 %8) #4, !dbg !279
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %11) #4, !dbg !280
  br label %19, !dbg !281

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !282
  %15 = load i32, i32* %14, align 4, !dbg !282, !tbaa !241
  %16 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !283
  %17 = load i32, i32* %16, align 4, !dbg !283, !tbaa !236
  %18 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %6, i32 23, i32 %15, i32 %17) #4, !dbg !284
  br label %19, !dbg !285

19:                                               ; preds = %13, %10
  %20 = phi i32 [ 2, %10 ], [ 0, %13 ], !dbg !271
  call void @llvm.lifetime.end.p0i8(i64 23, i8* nonnull %6) #4, !dbg !286
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %5) #4, !dbg !286
  ret i32 %20, !dbg !286
}

; Function Attrs: nounwind
define dso_local i32 @_ip6gretap_set_tunnel(%struct.__sk_buff* %0) #0 section "ip6gretap_set_tunnel" !dbg !287 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !289, metadata !DIExpression()), !dbg !296
  %4 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !297
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %4) #4, !dbg !297
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !290, metadata !DIExpression()), !dbg !298
  %5 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, !dbg !299
  %6 = bitcast %union.anon.3* %5 to i8*, !dbg !299
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %6, i8 0, i64 20, i1 false), !dbg !299
  %7 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 3, !dbg !300
  store i32 285212672, i32* %7, align 4, !dbg !301, !tbaa !236
  %8 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !302
  store i32 2, i32* %8, align 4, !dbg !303, !tbaa !241
  %9 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 2, !dbg !304
  store i8 0, i8* %9, align 4, !dbg !305, !tbaa !247
  %10 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !306
  store i8 64, i8* %10, align 1, !dbg !307, !tbaa !250
  %11 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 5, !dbg !308
  store i32 703710, i32* %11, align 4, !dbg !309, !tbaa !310
  %12 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 11) #4, !dbg !311
  %13 = trunc i64 %12 to i32, !dbg !311
  call void @llvm.dbg.value(metadata i32 %13, metadata !291, metadata !DIExpression()), !dbg !296
  %14 = icmp slt i32 %13, 0, !dbg !312
  br i1 %14, label %15, label %18, !dbg !313

15:                                               ; preds = %1
  %16 = getelementptr inbounds [22 x i8], [22 x i8]* %3, i64 0, i64 0, !dbg !314
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %16) #4, !dbg !314
  call void @llvm.dbg.declare(metadata [22 x i8]* %3, metadata !292, metadata !DIExpression()), !dbg !314
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %16, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !314
  %17 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %16, i32 22, i32 101, i32 %13) #4, !dbg !314
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %16) #4, !dbg !315
  br label %18, !dbg !316

18:                                               ; preds = %1, %15
  %19 = phi i32 [ 2, %15 ], [ 0, %1 ], !dbg !296
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %4) #4, !dbg !317
  ret i32 %19, !dbg !317
}

; Function Attrs: nounwind
define dso_local i32 @_ip6gretap_get_tunnel(%struct.__sk_buff* %0) #0 section "ip6gretap_get_tunnel" !dbg !318 {
  %2 = alloca [33 x i8], align 1
  %3 = alloca %struct.bpf_tunnel_key, align 4
  %4 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !320, metadata !DIExpression()), !dbg !331
  %5 = getelementptr inbounds [33 x i8], [33 x i8]* %2, i64 0, i64 0, !dbg !332
  call void @llvm.lifetime.start.p0i8(i64 33, i8* nonnull %5) #4, !dbg !332
  call void @llvm.dbg.declare(metadata [33 x i8]* %2, metadata !321, metadata !DIExpression()), !dbg !333
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(33) %5, i8* nonnull align 1 dereferenceable(33) getelementptr inbounds ([33 x i8], [33 x i8]* @__const._ip6vxlan_get_tunnel.fmt, i64 0, i64 0), i64 33, i1 false), !dbg !333
  %6 = bitcast %struct.bpf_tunnel_key* %3 to i8*, !dbg !334
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %6) #4, !dbg !334
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %3, metadata !325, metadata !DIExpression()), !dbg !335
  %7 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %3, i32 28, i64 1) #4, !dbg !336
  %8 = trunc i64 %7 to i32, !dbg !336
  call void @llvm.dbg.value(metadata i32 %8, metadata !326, metadata !DIExpression()), !dbg !331
  %9 = icmp slt i32 %8, 0, !dbg !337
  br i1 %9, label %10, label %13, !dbg !338

10:                                               ; preds = %1
  %11 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !339
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %11) #4, !dbg !339
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !327, metadata !DIExpression()), !dbg !339
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %11, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !339
  %12 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %11, i32 22, i32 118, i32 %8) #4, !dbg !339
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %11) #4, !dbg !340
  br label %21, !dbg !341

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 0, !dbg !342
  %15 = load i32, i32* %14, align 4, !dbg !342, !tbaa !241
  %16 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 1, i32 0, i64 3, !dbg !343
  %17 = load i32, i32* %16, align 4, !dbg !343, !tbaa !236
  %18 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 5, !dbg !344
  %19 = load i32, i32* %18, align 4, !dbg !344, !tbaa !310
  %20 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %5, i32 33, i32 %15, i32 %17, i32 %19) #4, !dbg !345
  br label %21, !dbg !346

21:                                               ; preds = %13, %10
  %22 = phi i32 [ 2, %10 ], [ 0, %13 ], !dbg !331
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %6) #4, !dbg !347
  call void @llvm.lifetime.end.p0i8(i64 33, i8* nonnull %5) #4, !dbg !347
  ret i32 %22, !dbg !347
}

; Function Attrs: nounwind
define dso_local i32 @_erspan_set_tunnel(%struct.__sk_buff* %0) #0 section "erspan_set_tunnel" !dbg !348 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca %struct.erspan_metadata, align 4
  %4 = alloca [22 x i8], align 1
  %5 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !350, metadata !DIExpression()), !dbg !384
  %6 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !385
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %6) #4, !dbg !385
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !351, metadata !DIExpression()), !dbg !386
  %7 = bitcast %struct.erspan_metadata* %3 to i8*, !dbg !387
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %7) #4, !dbg !387
  call void @llvm.dbg.declare(metadata %struct.erspan_metadata* %3, metadata !352, metadata !DIExpression()), !dbg !388
  %8 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 1, !dbg !389
  %9 = bitcast i32* %8 to i8*, !dbg !389
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %9, i8 0, i64 20, i1 false), !dbg !389
  %10 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !390
  store i32 -1408237212, i32* %10, align 4, !dbg !391, !tbaa !236
  %11 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !392
  store i32 2, i32* %11, align 4, !dbg !393, !tbaa !241
  %12 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 2, !dbg !394
  store i8 0, i8* %12, align 4, !dbg !395, !tbaa !247
  %13 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !396
  store i8 64, i8* %13, align 1, !dbg !397, !tbaa !250
  %14 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 2) #4, !dbg !398
  %15 = trunc i64 %14 to i32, !dbg !398
  call void @llvm.dbg.value(metadata i32 %15, metadata !373, metadata !DIExpression()), !dbg !384
  %16 = icmp slt i32 %15, 0, !dbg !399
  br i1 %16, label %17, label %20, !dbg !400

17:                                               ; preds = %1
  %18 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !401
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %18) #4, !dbg !401
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !374, metadata !DIExpression()), !dbg !401
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %18, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !401
  %19 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %18, i32 22, i32 144, i32 %15) #4, !dbg !401
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %18) #4, !dbg !402
  br label %31, !dbg !403

20:                                               ; preds = %1
  %21 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %3, i64 0, i32 1, !dbg !404
  %22 = bitcast %union.anon.4* %21 to i64*, !dbg !404
  store i64 0, i64* %22, align 4, !dbg !404
  call void @llvm.dbg.value(metadata i8 1, metadata !378, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.value(metadata i8 7, metadata !379, metadata !DIExpression()), !dbg !384
  %23 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %3, i64 0, i32 0, !dbg !405
  store i32 2, i32* %23, align 4, !dbg !406, !tbaa !407
  %24 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %3, i64 0, i32 1, i32 0, i32 2, !dbg !409
  store i16 30720, i16* %24, align 2, !dbg !410
  %25 = call i64 inttoptr (i64 30 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %7, i32 12) #4, !dbg !411
  %26 = trunc i64 %25 to i32, !dbg !411
  call void @llvm.dbg.value(metadata i32 %26, metadata !373, metadata !DIExpression()), !dbg !384
  %27 = icmp slt i32 %26, 0, !dbg !412
  br i1 %27, label %28, label %31, !dbg !413

28:                                               ; preds = %20
  %29 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !414
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %29) #4, !dbg !414
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !380, metadata !DIExpression()), !dbg !414
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %29, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !414
  %30 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %29, i32 22, i32 164, i32 %26) #4, !dbg !414
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %29) #4, !dbg !415
  br label %31, !dbg !416

31:                                               ; preds = %28, %20, %17
  %32 = phi i32 [ 2, %17 ], [ 2, %28 ], [ 0, %20 ], !dbg !384
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %7) #4, !dbg !417
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %6) #4, !dbg !417
  ret i32 %32, !dbg !417
}

; Function Attrs: nounwind
define dso_local i32 @_erspan_get_tunnel(%struct.__sk_buff* %0) #0 section "erspan_get_tunnel" !dbg !418 {
  %2 = alloca [41 x i8], align 1
  %3 = alloca %struct.bpf_tunnel_key, align 4
  %4 = alloca %struct.erspan_metadata, align 4
  %5 = alloca [22 x i8], align 1
  %6 = alloca [22 x i8], align 1
  %7 = alloca [36 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !420, metadata !DIExpression()), !dbg !440
  %8 = getelementptr inbounds [41 x i8], [41 x i8]* %2, i64 0, i64 0, !dbg !441
  call void @llvm.lifetime.start.p0i8(i64 41, i8* nonnull %8) #4, !dbg !441
  call void @llvm.dbg.declare(metadata [41 x i8]* %2, metadata !421, metadata !DIExpression()), !dbg !442
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(41) %8, i8* nonnull align 1 dereferenceable(41) getelementptr inbounds ([41 x i8], [41 x i8]* @__const._erspan_get_tunnel.fmt, i64 0, i64 0), i64 41, i1 false), !dbg !442
  %9 = bitcast %struct.bpf_tunnel_key* %3 to i8*, !dbg !443
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %9) #4, !dbg !443
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %3, metadata !425, metadata !DIExpression()), !dbg !444
  %10 = bitcast %struct.erspan_metadata* %4 to i8*, !dbg !445
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %10) #4, !dbg !445
  call void @llvm.dbg.declare(metadata %struct.erspan_metadata* %4, metadata !426, metadata !DIExpression()), !dbg !446
  %11 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %3, i32 28, i64 0) #4, !dbg !447
  %12 = trunc i64 %11 to i32, !dbg !447
  call void @llvm.dbg.value(metadata i32 %12, metadata !427, metadata !DIExpression()), !dbg !440
  %13 = icmp slt i32 %12, 0, !dbg !448
  br i1 %13, label %14, label %17, !dbg !449

14:                                               ; preds = %1
  %15 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !450
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %15) #4, !dbg !450
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !428, metadata !DIExpression()), !dbg !450
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %15, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !450
  %16 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %15, i32 22, i32 182, i32 %12) #4, !dbg !450
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %15) #4, !dbg !451
  br label %47, !dbg !452

17:                                               ; preds = %1
  %18 = call i64 inttoptr (i64 29 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %10, i32 12) #4, !dbg !453
  %19 = trunc i64 %18 to i32, !dbg !453
  call void @llvm.dbg.value(metadata i32 %19, metadata !427, metadata !DIExpression()), !dbg !440
  %20 = icmp slt i32 %19, 0, !dbg !454
  br i1 %20, label %21, label %24, !dbg !455

21:                                               ; preds = %17
  %22 = getelementptr inbounds [22 x i8], [22 x i8]* %6, i64 0, i64 0, !dbg !456
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %22) #4, !dbg !456
  call void @llvm.dbg.declare(metadata [22 x i8]* %6, metadata !432, metadata !DIExpression()), !dbg !456
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %22, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !456
  %23 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %22, i32 22, i32 188, i32 %19) #4, !dbg !456
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %22) #4, !dbg !457
  br label %47, !dbg !458

24:                                               ; preds = %17
  %25 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 0, !dbg !459
  %26 = load i32, i32* %25, align 4, !dbg !459, !tbaa !241
  %27 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 1, i32 0, i64 0, !dbg !460
  %28 = load i32, i32* %27, align 4, !dbg !460, !tbaa !236
  %29 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %4, i64 0, i32 0, !dbg !461
  %30 = load i32, i32* %29, align 4, !dbg !461, !tbaa !407
  %31 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %8, i32 41, i32 %26, i32 %28, i32 %30) #4, !dbg !462
  %32 = getelementptr inbounds [36 x i8], [36 x i8]* %7, i64 0, i64 0, !dbg !463
  call void @llvm.lifetime.start.p0i8(i64 36, i8* nonnull %32) #4, !dbg !463
  call void @llvm.dbg.declare(metadata [36 x i8]* %7, metadata !436, metadata !DIExpression()), !dbg !464
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(36) %32, i8* nonnull align 1 dereferenceable(36) getelementptr inbounds ([36 x i8], [36 x i8]* @__const._ip4ip6erspan_get_tunnel.fmt2, i64 0, i64 0), i64 36, i1 false), !dbg !464
  %33 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %4, i64 0, i32 1, i32 0, i32 2, !dbg !465
  %34 = load i16, i16* %33, align 2, !dbg !465
  %35 = lshr i16 %34, 11, !dbg !465
  %36 = and i16 %35, 1, !dbg !465
  %37 = zext i16 %36 to i32, !dbg !465
  %38 = shl i16 %34, 4, !dbg !466
  %39 = and i16 %38, 48, !dbg !466
  %40 = lshr i16 %34, 12, !dbg !467
  %41 = or i16 %39, %40, !dbg !468
  %42 = zext i16 %41 to i32, !dbg !468
  %43 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %4, i64 0, i32 1, i32 0, i32 0, !dbg !469
  %44 = load i32, i32* %43, align 4, !dbg !469, !tbaa !236
  %45 = call i32 @llvm.bswap.i32(i32 %44), !dbg !469
  %46 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %32, i32 36, i32 %37, i32 %42, i32 %45) #4, !dbg !470
  call void @llvm.lifetime.end.p0i8(i64 36, i8* nonnull %32) #4, !dbg !471
  br label %47

47:                                               ; preds = %24, %21, %14
  %48 = phi i32 [ 2, %14 ], [ 2, %21 ], [ 0, %24 ], !dbg !440
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %10) #4, !dbg !471
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %9) #4, !dbg !471
  call void @llvm.lifetime.end.p0i8(i64 41, i8* nonnull %8) #4, !dbg !471
  ret i32 %48, !dbg !471
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #1

; Function Attrs: nounwind
define dso_local i32 @_ip4ip6erspan_set_tunnel(%struct.__sk_buff* %0) #0 section "ip4ip6erspan_set_tunnel" !dbg !472 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca %struct.erspan_metadata, align 4
  %4 = alloca [22 x i8], align 1
  %5 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !474, metadata !DIExpression()), !dbg !488
  %6 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !489
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %6) #4, !dbg !489
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !475, metadata !DIExpression()), !dbg !490
  %7 = bitcast %struct.erspan_metadata* %3 to i8*, !dbg !491
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %7) #4, !dbg !491
  call void @llvm.dbg.declare(metadata %struct.erspan_metadata* %3, metadata !476, metadata !DIExpression()), !dbg !492
  %8 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, !dbg !493
  %9 = bitcast %union.anon.3* %8 to i8*, !dbg !493
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %9, i8 0, i64 24, i1 false), !dbg !493
  %10 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 3, !dbg !494
  store i32 285212672, i32* %10, align 4, !dbg !495, !tbaa !236
  %11 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !496
  store i32 2, i32* %11, align 4, !dbg !497, !tbaa !241
  %12 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 2, !dbg !498
  store i8 0, i8* %12, align 4, !dbg !499, !tbaa !247
  %13 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !500
  store i8 64, i8* %13, align 1, !dbg !501, !tbaa !250
  %14 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 1) #4, !dbg !502
  %15 = trunc i64 %14 to i32, !dbg !502
  call void @llvm.dbg.value(metadata i32 %15, metadata !477, metadata !DIExpression()), !dbg !488
  %16 = icmp slt i32 %15, 0, !dbg !503
  br i1 %16, label %17, label %20, !dbg !504

17:                                               ; preds = %1
  %18 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !505
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %18) #4, !dbg !505
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !478, metadata !DIExpression()), !dbg !505
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %18, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !505
  %19 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %18, i32 22, i32 228, i32 %15) #4, !dbg !505
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %18) #4, !dbg !506
  br label %31, !dbg !507

20:                                               ; preds = %1
  %21 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %3, i64 0, i32 1, !dbg !508
  %22 = bitcast %union.anon.4* %21 to i64*, !dbg !508
  store i64 0, i64* %22, align 4, !dbg !508
  call void @llvm.dbg.value(metadata i8 0, metadata !482, metadata !DIExpression()), !dbg !488
  call void @llvm.dbg.value(metadata i8 17, metadata !483, metadata !DIExpression()), !dbg !488
  %23 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %3, i64 0, i32 0, !dbg !509
  store i32 2, i32* %23, align 4, !dbg !510, !tbaa !407
  %24 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %3, i64 0, i32 1, i32 0, i32 2, !dbg !511
  store i16 4097, i16* %24, align 2, !dbg !512
  %25 = call i64 inttoptr (i64 30 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %7, i32 12) #4, !dbg !513
  %26 = trunc i64 %25 to i32, !dbg !513
  call void @llvm.dbg.value(metadata i32 %26, metadata !477, metadata !DIExpression()), !dbg !488
  %27 = icmp slt i32 %26, 0, !dbg !514
  br i1 %27, label %28, label %31, !dbg !515

28:                                               ; preds = %20
  %29 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !516
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %29) #4, !dbg !516
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !484, metadata !DIExpression()), !dbg !516
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %29, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !516
  %30 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %29, i32 22, i32 249, i32 %26) #4, !dbg !516
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %29) #4, !dbg !517
  br label %31, !dbg !518

31:                                               ; preds = %28, %20, %17
  %32 = phi i32 [ 2, %17 ], [ 2, %28 ], [ 0, %20 ], !dbg !488
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %7) #4, !dbg !519
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %6) #4, !dbg !519
  ret i32 %32, !dbg !519
}

; Function Attrs: nounwind
define dso_local i32 @_ip4ip6erspan_get_tunnel(%struct.__sk_buff* %0) #0 section "ip4ip6erspan_get_tunnel" !dbg !520 {
  %2 = alloca [56 x i8], align 1
  %3 = alloca %struct.bpf_tunnel_key, align 4
  %4 = alloca %struct.erspan_metadata, align 4
  %5 = alloca [22 x i8], align 1
  %6 = alloca [22 x i8], align 1
  %7 = alloca [36 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !522, metadata !DIExpression()), !dbg !539
  %8 = getelementptr inbounds [56 x i8], [56 x i8]* %2, i64 0, i64 0, !dbg !540
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %8) #4, !dbg !540
  call void @llvm.dbg.declare(metadata [56 x i8]* %2, metadata !523, metadata !DIExpression()), !dbg !541
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(56) %8, i8* nonnull align 1 dereferenceable(56) getelementptr inbounds ([56 x i8], [56 x i8]* @__const._ip4ip6erspan_get_tunnel.fmt, i64 0, i64 0), i64 56, i1 false), !dbg !541
  %9 = bitcast %struct.bpf_tunnel_key* %3 to i8*, !dbg !542
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %9) #4, !dbg !542
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %3, metadata !527, metadata !DIExpression()), !dbg !543
  %10 = bitcast %struct.erspan_metadata* %4 to i8*, !dbg !544
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %10) #4, !dbg !544
  call void @llvm.dbg.declare(metadata %struct.erspan_metadata* %4, metadata !528, metadata !DIExpression()), !dbg !545
  %11 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %3, i32 28, i64 1) #4, !dbg !546
  %12 = trunc i64 %11 to i32, !dbg !546
  call void @llvm.dbg.value(metadata i32 %12, metadata !529, metadata !DIExpression()), !dbg !539
  %13 = icmp slt i32 %12, 0, !dbg !547
  br i1 %13, label %14, label %17, !dbg !548

14:                                               ; preds = %1
  %15 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !549
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %15) #4, !dbg !549
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !530, metadata !DIExpression()), !dbg !549
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %15, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !549
  %16 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %15, i32 22, i32 268, i32 %12) #4, !dbg !549
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %15) #4, !dbg !550
  br label %47, !dbg !551

17:                                               ; preds = %1
  %18 = call i64 inttoptr (i64 29 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %10, i32 12) #4, !dbg !552
  %19 = trunc i64 %18 to i32, !dbg !552
  call void @llvm.dbg.value(metadata i32 %19, metadata !529, metadata !DIExpression()), !dbg !539
  %20 = icmp slt i32 %19, 0, !dbg !553
  br i1 %20, label %21, label %24, !dbg !554

21:                                               ; preds = %17
  %22 = getelementptr inbounds [22 x i8], [22 x i8]* %6, i64 0, i64 0, !dbg !555
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %22) #4, !dbg !555
  call void @llvm.dbg.declare(metadata [22 x i8]* %6, metadata !534, metadata !DIExpression()), !dbg !555
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %22, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !555
  %23 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %22, i32 22, i32 274, i32 %19) #4, !dbg !555
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %22) #4, !dbg !556
  br label %47, !dbg !557

24:                                               ; preds = %17
  %25 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 0, !dbg !558
  %26 = load i32, i32* %25, align 4, !dbg !558, !tbaa !241
  %27 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 1, i32 0, i64 0, !dbg !559
  %28 = load i32, i32* %27, align 4, !dbg !559, !tbaa !236
  %29 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %4, i64 0, i32 0, !dbg !560
  %30 = load i32, i32* %29, align 4, !dbg !560, !tbaa !407
  %31 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %8, i32 56, i32 %26, i32 %28, i32 %30) #4, !dbg !561
  %32 = getelementptr inbounds [36 x i8], [36 x i8]* %7, i64 0, i64 0, !dbg !562
  call void @llvm.lifetime.start.p0i8(i64 36, i8* nonnull %32) #4, !dbg !562
  call void @llvm.dbg.declare(metadata [36 x i8]* %7, metadata !538, metadata !DIExpression()), !dbg !563
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(36) %32, i8* nonnull align 1 dereferenceable(36) getelementptr inbounds ([36 x i8], [36 x i8]* @__const._ip4ip6erspan_get_tunnel.fmt2, i64 0, i64 0), i64 36, i1 false), !dbg !563
  %33 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %4, i64 0, i32 1, i32 0, i32 2, !dbg !564
  %34 = load i16, i16* %33, align 2, !dbg !564
  %35 = lshr i16 %34, 11, !dbg !564
  %36 = and i16 %35, 1, !dbg !564
  %37 = zext i16 %36 to i32, !dbg !564
  %38 = shl i16 %34, 4, !dbg !565
  %39 = and i16 %38, 48, !dbg !565
  %40 = lshr i16 %34, 12, !dbg !566
  %41 = or i16 %39, %40, !dbg !567
  %42 = zext i16 %41 to i32, !dbg !567
  %43 = getelementptr inbounds %struct.erspan_metadata, %struct.erspan_metadata* %4, i64 0, i32 1, i32 0, i32 0, !dbg !568
  %44 = load i32, i32* %43, align 4, !dbg !568, !tbaa !236
  %45 = call i32 @llvm.bswap.i32(i32 %44), !dbg !568
  %46 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %32, i32 36, i32 %37, i32 %42, i32 %45) #4, !dbg !569
  call void @llvm.lifetime.end.p0i8(i64 36, i8* nonnull %32) #4, !dbg !570
  br label %47

47:                                               ; preds = %24, %21, %14
  %48 = phi i32 [ 2, %14 ], [ 2, %21 ], [ 0, %24 ], !dbg !539
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %10) #4, !dbg !570
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %9) #4, !dbg !570
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %8) #4, !dbg !570
  ret i32 %48, !dbg !570
}

; Function Attrs: nounwind
define dso_local i32 @_vxlan_set_tunnel(%struct.__sk_buff* %0) #0 section "vxlan_set_tunnel" !dbg !571 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca %struct.vxlan_metadata, align 4
  %4 = alloca [22 x i8], align 1
  %5 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !573, metadata !DIExpression()), !dbg !588
  %6 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !589
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %6) #4, !dbg !589
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !575, metadata !DIExpression()), !dbg !590
  %7 = bitcast %struct.vxlan_metadata* %3 to i8*, !dbg !591
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #4, !dbg !591
  call void @llvm.dbg.declare(metadata %struct.vxlan_metadata* %3, metadata !576, metadata !DIExpression()), !dbg !592
  %8 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 1, !dbg !593
  %9 = bitcast i32* %8 to i8*, !dbg !593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %9, i8 0, i64 20, i1 false), !dbg !593
  %10 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !594
  store i32 -1408237212, i32* %10, align 4, !dbg !595, !tbaa !236
  %11 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !596
  store i32 2, i32* %11, align 4, !dbg !597, !tbaa !241
  %12 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 2, !dbg !598
  store i8 0, i8* %12, align 4, !dbg !599, !tbaa !247
  %13 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !600
  store i8 64, i8* %13, align 1, !dbg !601, !tbaa !250
  %14 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 2) #4, !dbg !602
  %15 = trunc i64 %14 to i32, !dbg !602
  call void @llvm.dbg.value(metadata i32 %15, metadata !574, metadata !DIExpression()), !dbg !588
  %16 = icmp slt i32 %15, 0, !dbg !603
  br i1 %16, label %17, label %20, !dbg !604

17:                                               ; preds = %1
  %18 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !605
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %18) #4, !dbg !605
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !580, metadata !DIExpression()), !dbg !605
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %18, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !605
  %19 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %18, i32 22, i32 314, i32 %15) #4, !dbg !605
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %18) #4, !dbg !606
  br label %28, !dbg !607

20:                                               ; preds = %1
  %21 = getelementptr inbounds %struct.vxlan_metadata, %struct.vxlan_metadata* %3, i64 0, i32 0, !dbg !608
  store i32 524543, i32* %21, align 4, !dbg !609, !tbaa !610
  %22 = call i64 inttoptr (i64 30 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %7, i32 4) #4, !dbg !612
  %23 = trunc i64 %22 to i32, !dbg !612
  call void @llvm.dbg.value(metadata i32 %23, metadata !574, metadata !DIExpression()), !dbg !588
  %24 = icmp slt i32 %23, 0, !dbg !613
  br i1 %24, label %25, label %28, !dbg !614

25:                                               ; preds = %20
  %26 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !615
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %26) #4, !dbg !615
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !584, metadata !DIExpression()), !dbg !615
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %26, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !615
  %27 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %26, i32 22, i32 321, i32 %23) #4, !dbg !615
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %26) #4, !dbg !616
  br label %28, !dbg !617

28:                                               ; preds = %20, %25, %17
  %29 = phi i32 [ 2, %17 ], [ 2, %25 ], [ 0, %20 ], !dbg !588
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #4, !dbg !618
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %6) #4, !dbg !618
  ret i32 %29, !dbg !618
}

; Function Attrs: nounwind
define dso_local i32 @_vxlan_get_tunnel(%struct.__sk_buff* %0) #0 section "vxlan_get_tunnel" !dbg !619 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca %struct.vxlan_metadata, align 4
  %4 = alloca [38 x i8], align 1
  %5 = alloca [22 x i8], align 1
  %6 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !621, metadata !DIExpression()), !dbg !637
  %7 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !638
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %7) #4, !dbg !638
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !623, metadata !DIExpression()), !dbg !639
  %8 = bitcast %struct.vxlan_metadata* %3 to i8*, !dbg !640
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #4, !dbg !640
  call void @llvm.dbg.declare(metadata %struct.vxlan_metadata* %3, metadata !624, metadata !DIExpression()), !dbg !641
  %9 = getelementptr inbounds [38 x i8], [38 x i8]* %4, i64 0, i64 0, !dbg !642
  call void @llvm.lifetime.start.p0i8(i64 38, i8* nonnull %9) #4, !dbg !642
  call void @llvm.dbg.declare(metadata [38 x i8]* %4, metadata !625, metadata !DIExpression()), !dbg !643
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(38) %9, i8* nonnull align 1 dereferenceable(38) getelementptr inbounds ([38 x i8], [38 x i8]* @__const._vxlan_get_tunnel.fmt, i64 0, i64 0), i64 38, i1 false), !dbg !643
  %10 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 0) #4, !dbg !644
  %11 = trunc i64 %10 to i32, !dbg !644
  call void @llvm.dbg.value(metadata i32 %11, metadata !622, metadata !DIExpression()), !dbg !637
  %12 = icmp slt i32 %11, 0, !dbg !645
  br i1 %12, label %13, label %16, !dbg !646

13:                                               ; preds = %1
  %14 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !647
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %14) #4, !dbg !647
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !629, metadata !DIExpression()), !dbg !647
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %14, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !647
  %15 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %14, i32 22, i32 338, i32 %11) #4, !dbg !647
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %14) #4, !dbg !648
  br label %31, !dbg !649

16:                                               ; preds = %1
  %17 = call i64 inttoptr (i64 29 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %8, i32 4) #4, !dbg !650
  %18 = trunc i64 %17 to i32, !dbg !650
  call void @llvm.dbg.value(metadata i32 %18, metadata !622, metadata !DIExpression()), !dbg !637
  %19 = icmp slt i32 %18, 0, !dbg !651
  br i1 %19, label %20, label %23, !dbg !652

20:                                               ; preds = %16
  %21 = getelementptr inbounds [22 x i8], [22 x i8]* %6, i64 0, i64 0, !dbg !653
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %21) #4, !dbg !653
  call void @llvm.dbg.declare(metadata [22 x i8]* %6, metadata !633, metadata !DIExpression()), !dbg !653
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %21, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !653
  %22 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %21, i32 22, i32 344, i32 %18) #4, !dbg !653
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %21) #4, !dbg !654
  br label %31, !dbg !655

23:                                               ; preds = %16
  %24 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !656
  %25 = load i32, i32* %24, align 4, !dbg !656, !tbaa !241
  %26 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !657
  %27 = load i32, i32* %26, align 4, !dbg !657, !tbaa !236
  %28 = getelementptr inbounds %struct.vxlan_metadata, %struct.vxlan_metadata* %3, i64 0, i32 0, !dbg !658
  %29 = load i32, i32* %28, align 4, !dbg !658, !tbaa !610
  %30 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %9, i32 38, i32 %25, i32 %27, i32 %29) #4, !dbg !659
  br label %31, !dbg !660

31:                                               ; preds = %23, %20, %13
  %32 = phi i32 [ 2, %13 ], [ 2, %20 ], [ 0, %23 ], !dbg !637
  call void @llvm.lifetime.end.p0i8(i64 38, i8* nonnull %9) #4, !dbg !661
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #4, !dbg !661
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %7) #4, !dbg !661
  ret i32 %32, !dbg !661
}

; Function Attrs: nounwind
define dso_local i32 @_ip6vxlan_set_tunnel(%struct.__sk_buff* %0) #0 section "ip6vxlan_set_tunnel" !dbg !662 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !664, metadata !DIExpression()), !dbg !671
  %4 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !672
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %4) #4, !dbg !672
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !665, metadata !DIExpression()), !dbg !673
  %5 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, !dbg !674
  %6 = bitcast %union.anon.3* %5 to i8*, !dbg !674
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %6, i8 0, i64 24, i1 false), !dbg !674
  %7 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 3, !dbg !675
  store i32 285212672, i32* %7, align 4, !dbg !676, !tbaa !236
  %8 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !677
  store i32 22, i32* %8, align 4, !dbg !678, !tbaa !241
  %9 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 2, !dbg !679
  store i8 0, i8* %9, align 4, !dbg !680, !tbaa !247
  %10 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !681
  store i8 64, i8* %10, align 1, !dbg !682, !tbaa !250
  %11 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 1) #4, !dbg !683
  %12 = trunc i64 %11 to i32, !dbg !683
  call void @llvm.dbg.value(metadata i32 %12, metadata !666, metadata !DIExpression()), !dbg !671
  %13 = icmp slt i32 %12, 0, !dbg !684
  br i1 %13, label %14, label %17, !dbg !685

14:                                               ; preds = %1
  %15 = getelementptr inbounds [22 x i8], [22 x i8]* %3, i64 0, i64 0, !dbg !686
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %15) #4, !dbg !686
  call void @llvm.dbg.declare(metadata [22 x i8]* %3, metadata !667, metadata !DIExpression()), !dbg !686
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %15, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !686
  %16 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %15, i32 22, i32 369, i32 %12) #4, !dbg !686
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %15) #4, !dbg !687
  br label %17, !dbg !688

17:                                               ; preds = %1, %14
  %18 = phi i32 [ 2, %14 ], [ 0, %1 ], !dbg !671
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %4) #4, !dbg !689
  ret i32 %18, !dbg !689
}

; Function Attrs: nounwind
define dso_local i32 @_ip6vxlan_get_tunnel(%struct.__sk_buff* %0) #0 section "ip6vxlan_get_tunnel" !dbg !690 {
  %2 = alloca [33 x i8], align 1
  %3 = alloca %struct.bpf_tunnel_key, align 4
  %4 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !692, metadata !DIExpression()), !dbg !700
  %5 = getelementptr inbounds [33 x i8], [33 x i8]* %2, i64 0, i64 0, !dbg !701
  call void @llvm.lifetime.start.p0i8(i64 33, i8* nonnull %5) #4, !dbg !701
  call void @llvm.dbg.declare(metadata [33 x i8]* %2, metadata !693, metadata !DIExpression()), !dbg !702
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(33) %5, i8* nonnull align 1 dereferenceable(33) getelementptr inbounds ([33 x i8], [33 x i8]* @__const._ip6vxlan_get_tunnel.fmt, i64 0, i64 0), i64 33, i1 false), !dbg !702
  %6 = bitcast %struct.bpf_tunnel_key* %3 to i8*, !dbg !703
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %6) #4, !dbg !703
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %3, metadata !694, metadata !DIExpression()), !dbg !704
  %7 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %3, i32 28, i64 1) #4, !dbg !705
  %8 = trunc i64 %7 to i32, !dbg !705
  call void @llvm.dbg.value(metadata i32 %8, metadata !695, metadata !DIExpression()), !dbg !700
  %9 = icmp slt i32 %8, 0, !dbg !706
  br i1 %9, label %10, label %13, !dbg !707

10:                                               ; preds = %1
  %11 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !708
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %11) #4, !dbg !708
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !696, metadata !DIExpression()), !dbg !708
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %11, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !708
  %12 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %11, i32 22, i32 386, i32 %8) #4, !dbg !708
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %11) #4, !dbg !709
  br label %21, !dbg !710

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 0, !dbg !711
  %15 = load i32, i32* %14, align 4, !dbg !711, !tbaa !241
  %16 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 1, i32 0, i64 3, !dbg !712
  %17 = load i32, i32* %16, align 4, !dbg !712, !tbaa !236
  %18 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 5, !dbg !713
  %19 = load i32, i32* %18, align 4, !dbg !713, !tbaa !310
  %20 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %5, i32 33, i32 %15, i32 %17, i32 %19) #4, !dbg !714
  br label %21, !dbg !715

21:                                               ; preds = %13, %10
  %22 = phi i32 [ 2, %10 ], [ 0, %13 ], !dbg !700
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %6) #4, !dbg !716
  call void @llvm.lifetime.end.p0i8(i64 33, i8* nonnull %5) #4, !dbg !716
  ret i32 %22, !dbg !716
}

; Function Attrs: nounwind
define dso_local i32 @_geneve_set_tunnel(%struct.__sk_buff* %0) #0 section "geneve_set_tunnel" !dbg !717 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca %struct.geneve_opt, align 2
  %4 = alloca [22 x i8], align 1
  %5 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !719, metadata !DIExpression()), !dbg !743
  %6 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !744
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %6) #4, !dbg !744
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !721, metadata !DIExpression()), !dbg !745
  %7 = bitcast %struct.geneve_opt* %3 to i8*, !dbg !746
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %7) #4, !dbg !746
  call void @llvm.dbg.declare(metadata %struct.geneve_opt* %3, metadata !722, metadata !DIExpression()), !dbg !747
  %8 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 1, !dbg !748
  %9 = bitcast i32* %8 to i8*, !dbg !748
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %9, i8 0, i64 20, i1 false), !dbg !748
  %10 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !749
  store i32 -1408237212, i32* %10, align 4, !dbg !750, !tbaa !236
  %11 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !751
  store i32 2, i32* %11, align 4, !dbg !752, !tbaa !241
  %12 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 2, !dbg !753
  store i8 0, i8* %12, align 4, !dbg !754, !tbaa !247
  %13 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !755
  store i8 64, i8* %13, align 1, !dbg !756, !tbaa !250
  %14 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 3, i64 4, !dbg !757
  %15 = bitcast i8* %14 to i32*, !dbg !757
  store i32 0, i32* %15, align 2, !dbg !757
  %16 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 0, !dbg !758
  store i16 513, i16* %16, align 2, !dbg !759, !tbaa !760
  %17 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 1, !dbg !762
  store i8 8, i8* %17, align 2, !dbg !763, !tbaa !764
  %18 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 2, !dbg !765
  store i8 2, i8* %18, align 1, !dbg !766
  %19 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 3, !dbg !767
  %20 = bitcast [8 x i8]* %19 to i32*, !dbg !768
  store i32 -272716322, i32* %20, align 2, !dbg !769, !tbaa !770
  %21 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 2) #4, !dbg !771
  %22 = trunc i64 %21 to i32, !dbg !771
  call void @llvm.dbg.value(metadata i32 %22, metadata !720, metadata !DIExpression()), !dbg !743
  %23 = icmp slt i32 %22, 0, !dbg !772
  br i1 %23, label %24, label %27, !dbg !773

24:                                               ; preds = %1
  %25 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !774
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %25) #4, !dbg !774
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !735, metadata !DIExpression()), !dbg !774
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %25, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !774
  %26 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %25, i32 22, i32 422, i32 %22) #4, !dbg !774
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %25) #4, !dbg !775
  br label %34, !dbg !776

27:                                               ; preds = %1
  %28 = call i64 inttoptr (i64 30 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %7, i32 12) #4, !dbg !777
  %29 = trunc i64 %28 to i32, !dbg !777
  call void @llvm.dbg.value(metadata i32 %29, metadata !720, metadata !DIExpression()), !dbg !743
  %30 = icmp slt i32 %29, 0, !dbg !778
  br i1 %30, label %31, label %34, !dbg !779

31:                                               ; preds = %27
  %32 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !780
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %32) #4, !dbg !780
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !739, metadata !DIExpression()), !dbg !780
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %32, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !780
  %33 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %32, i32 22, i32 428, i32 %29) #4, !dbg !780
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %32) #4, !dbg !781
  br label %34, !dbg !782

34:                                               ; preds = %27, %31, %24
  %35 = phi i32 [ 2, %24 ], [ 2, %31 ], [ 0, %27 ], !dbg !743
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %7) #4, !dbg !783
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %6) #4, !dbg !783
  ret i32 %35, !dbg !783
}

; Function Attrs: nounwind
define dso_local i32 @_geneve_get_tunnel(%struct.__sk_buff* %0) #0 section "geneve_get_tunnel" !dbg !784 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca %struct.geneve_opt, align 2
  %4 = alloca [41 x i8], align 1
  %5 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !786, metadata !DIExpression()), !dbg !795
  %6 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !796
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %6) #4, !dbg !796
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !788, metadata !DIExpression()), !dbg !797
  %7 = bitcast %struct.geneve_opt* %3 to i8*, !dbg !798
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %7) #4, !dbg !798
  call void @llvm.dbg.declare(metadata %struct.geneve_opt* %3, metadata !789, metadata !DIExpression()), !dbg !799
  %8 = getelementptr inbounds [41 x i8], [41 x i8]* %4, i64 0, i64 0, !dbg !800
  call void @llvm.lifetime.start.p0i8(i64 41, i8* nonnull %8) #4, !dbg !800
  call void @llvm.dbg.declare(metadata [41 x i8]* %4, metadata !790, metadata !DIExpression()), !dbg !801
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(41) %8, i8* nonnull align 1 dereferenceable(41) getelementptr inbounds ([41 x i8], [41 x i8]* @__const._ip6geneve_get_tunnel.fmt, i64 0, i64 0), i64 41, i1 false), !dbg !801
  %9 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 0) #4, !dbg !802
  %10 = trunc i64 %9 to i32, !dbg !802
  call void @llvm.dbg.value(metadata i32 %10, metadata !787, metadata !DIExpression()), !dbg !795
  %11 = icmp slt i32 %10, 0, !dbg !803
  br i1 %11, label %12, label %15, !dbg !804

12:                                               ; preds = %1
  %13 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !805
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %13) #4, !dbg !805
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !791, metadata !DIExpression()), !dbg !805
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %13, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !805
  %14 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %13, i32 22, i32 445, i32 %10) #4, !dbg !805
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %13) #4, !dbg !806
  br label %31, !dbg !807

15:                                               ; preds = %1
  %16 = call i64 inttoptr (i64 29 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %7, i32 12) #4, !dbg !808
  %17 = trunc i64 %16 to i32, !dbg !808
  call void @llvm.dbg.value(metadata i32 %17, metadata !787, metadata !DIExpression()), !dbg !795
  %18 = icmp slt i32 %17, 0, !dbg !809
  %19 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 0
  br i1 %18, label %23, label %20, !dbg !811

20:                                               ; preds = %15
  %21 = load i16, i16* %19, align 2, !dbg !812, !tbaa !760
  %22 = zext i16 %21 to i32, !dbg !811
  br label %24, !dbg !811

23:                                               ; preds = %15
  store i16 0, i16* %19, align 2, !dbg !813, !tbaa !760
  br label %24, !dbg !814

24:                                               ; preds = %20, %23
  %25 = phi i32 [ %22, %20 ], [ 0, %23 ]
  %26 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !815
  %27 = load i32, i32* %26, align 4, !dbg !815, !tbaa !241
  %28 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !816
  %29 = load i32, i32* %28, align 4, !dbg !816, !tbaa !236
  %30 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %8, i32 41, i32 %27, i32 %29, i32 %25) #4, !dbg !817
  br label %31, !dbg !818

31:                                               ; preds = %24, %12
  %32 = phi i32 [ 2, %12 ], [ 0, %24 ], !dbg !795
  call void @llvm.lifetime.end.p0i8(i64 41, i8* nonnull %8) #4, !dbg !819
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %7) #4, !dbg !819
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %6) #4, !dbg !819
  ret i32 %32, !dbg !819
}

; Function Attrs: nounwind
define dso_local i32 @_ip6geneve_set_tunnel(%struct.__sk_buff* %0) #0 section "ip6geneve_set_tunnel" !dbg !820 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca %struct.geneve_opt, align 2
  %4 = alloca [22 x i8], align 1
  %5 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !822, metadata !DIExpression()), !dbg !834
  %6 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !835
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %6) #4, !dbg !835
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !823, metadata !DIExpression()), !dbg !836
  %7 = bitcast %struct.geneve_opt* %3 to i8*, !dbg !837
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %7) #4, !dbg !837
  call void @llvm.dbg.declare(metadata %struct.geneve_opt* %3, metadata !824, metadata !DIExpression()), !dbg !838
  %8 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, !dbg !839
  %9 = bitcast %union.anon.3* %8 to i8*, !dbg !839
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %9, i8 0, i64 24, i1 false), !dbg !839
  %10 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 3, !dbg !840
  store i32 285212672, i32* %10, align 4, !dbg !841, !tbaa !236
  %11 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 0, !dbg !842
  store i32 22, i32* %11, align 4, !dbg !843, !tbaa !241
  %12 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 2, !dbg !844
  store i8 0, i8* %12, align 4, !dbg !845, !tbaa !247
  %13 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !846
  store i8 64, i8* %13, align 1, !dbg !847, !tbaa !250
  %14 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 1) #4, !dbg !848
  %15 = trunc i64 %14 to i32, !dbg !848
  call void @llvm.dbg.value(metadata i32 %15, metadata !825, metadata !DIExpression()), !dbg !834
  %16 = icmp slt i32 %15, 0, !dbg !849
  br i1 %16, label %17, label %20, !dbg !850

17:                                               ; preds = %1
  %18 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !851
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %18) #4, !dbg !851
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !826, metadata !DIExpression()), !dbg !851
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %18, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !851
  %19 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %18, i32 22, i32 474, i32 %15) #4, !dbg !851
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %18) #4, !dbg !852
  br label %34, !dbg !853

20:                                               ; preds = %1
  %21 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 3, i64 4, !dbg !854
  %22 = bitcast i8* %21 to i32*, !dbg !854
  store i32 0, i32* %22, align 2, !dbg !854
  %23 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 0, !dbg !855
  store i16 513, i16* %23, align 2, !dbg !856, !tbaa !760
  %24 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 1, !dbg !857
  store i8 8, i8* %24, align 2, !dbg !858, !tbaa !764
  %25 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 2, !dbg !859
  store i8 2, i8* %25, align 1, !dbg !860
  %26 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %3, i64 0, i32 3, !dbg !861
  %27 = bitcast [8 x i8]* %26 to i32*, !dbg !862
  store i32 -272699906, i32* %27, align 2, !dbg !863, !tbaa !770
  %28 = call i64 inttoptr (i64 30 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %7, i32 12) #4, !dbg !864
  %29 = trunc i64 %28 to i32, !dbg !864
  call void @llvm.dbg.value(metadata i32 %29, metadata !825, metadata !DIExpression()), !dbg !834
  %30 = icmp slt i32 %29, 0, !dbg !865
  br i1 %30, label %31, label %34, !dbg !866

31:                                               ; preds = %20
  %32 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !867
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %32) #4, !dbg !867
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !830, metadata !DIExpression()), !dbg !867
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %32, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !867
  %33 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %32, i32 22, i32 489, i32 %29) #4, !dbg !867
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %32) #4, !dbg !868
  br label %34, !dbg !869

34:                                               ; preds = %20, %31, %17
  %35 = phi i32 [ 2, %17 ], [ 2, %31 ], [ 0, %20 ], !dbg !834
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %7) #4, !dbg !870
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %6) #4, !dbg !870
  ret i32 %35, !dbg !870
}

; Function Attrs: nounwind
define dso_local i32 @_ip6geneve_get_tunnel(%struct.__sk_buff* %0) #0 section "ip6geneve_get_tunnel" !dbg !871 {
  %2 = alloca [41 x i8], align 1
  %3 = alloca %struct.bpf_tunnel_key, align 4
  %4 = alloca %struct.geneve_opt, align 2
  %5 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !873, metadata !DIExpression()), !dbg !882
  %6 = getelementptr inbounds [41 x i8], [41 x i8]* %2, i64 0, i64 0, !dbg !883
  call void @llvm.lifetime.start.p0i8(i64 41, i8* nonnull %6) #4, !dbg !883
  call void @llvm.dbg.declare(metadata [41 x i8]* %2, metadata !874, metadata !DIExpression()), !dbg !884
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(41) %6, i8* nonnull align 1 dereferenceable(41) getelementptr inbounds ([41 x i8], [41 x i8]* @__const._ip6geneve_get_tunnel.fmt, i64 0, i64 0), i64 41, i1 false), !dbg !884
  %7 = bitcast %struct.bpf_tunnel_key* %3 to i8*, !dbg !885
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %7) #4, !dbg !885
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %3, metadata !875, metadata !DIExpression()), !dbg !886
  %8 = bitcast %struct.geneve_opt* %4 to i8*, !dbg !887
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %8) #4, !dbg !887
  call void @llvm.dbg.declare(metadata %struct.geneve_opt* %4, metadata !876, metadata !DIExpression()), !dbg !888
  %9 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %3, i32 28, i64 1) #4, !dbg !889
  %10 = trunc i64 %9 to i32, !dbg !889
  call void @llvm.dbg.value(metadata i32 %10, metadata !877, metadata !DIExpression()), !dbg !882
  %11 = icmp slt i32 %10, 0, !dbg !890
  br i1 %11, label %12, label %15, !dbg !891

12:                                               ; preds = %1
  %13 = getelementptr inbounds [22 x i8], [22 x i8]* %5, i64 0, i64 0, !dbg !892
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %13) #4, !dbg !892
  call void @llvm.dbg.declare(metadata [22 x i8]* %5, metadata !878, metadata !DIExpression()), !dbg !892
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %13, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !892
  %14 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %13, i32 22, i32 507, i32 %10) #4, !dbg !892
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %13) #4, !dbg !893
  br label %31, !dbg !894

15:                                               ; preds = %1
  %16 = call i64 inttoptr (i64 29 to i64 (%struct.__sk_buff*, i8*, i32)*)(%struct.__sk_buff* %0, i8* nonnull %8, i32 12) #4, !dbg !895
  %17 = trunc i64 %16 to i32, !dbg !895
  call void @llvm.dbg.value(metadata i32 %17, metadata !877, metadata !DIExpression()), !dbg !882
  %18 = icmp slt i32 %17, 0, !dbg !896
  %19 = getelementptr inbounds %struct.geneve_opt, %struct.geneve_opt* %4, i64 0, i32 0
  br i1 %18, label %23, label %20, !dbg !898

20:                                               ; preds = %15
  %21 = load i16, i16* %19, align 2, !dbg !899, !tbaa !760
  %22 = zext i16 %21 to i32, !dbg !898
  br label %24, !dbg !898

23:                                               ; preds = %15
  store i16 0, i16* %19, align 2, !dbg !900, !tbaa !760
  br label %24, !dbg !901

24:                                               ; preds = %20, %23
  %25 = phi i32 [ %22, %20 ], [ 0, %23 ]
  %26 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 0, !dbg !902
  %27 = load i32, i32* %26, align 4, !dbg !902, !tbaa !241
  %28 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %3, i64 0, i32 1, i32 0, i64 0, !dbg !903
  %29 = load i32, i32* %28, align 4, !dbg !903, !tbaa !236
  %30 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %6, i32 41, i32 %27, i32 %29, i32 %25) #4, !dbg !904
  br label %31, !dbg !905

31:                                               ; preds = %24, %12
  %32 = phi i32 [ 2, %12 ], [ 0, %24 ], !dbg !882
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %8) #4, !dbg !906
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %7) #4, !dbg !906
  call void @llvm.lifetime.end.p0i8(i64 41, i8* nonnull %6) #4, !dbg !906
  ret i32 %32, !dbg !906
}

; Function Attrs: nounwind
define dso_local i32 @_ipip_set_tunnel(%struct.__sk_buff* %0) #0 section "ipip_set_tunnel" !dbg !907 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [22 x i8], align 1
  %4 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !909, metadata !DIExpression()), !dbg !939
  %5 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !940
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %5) #4, !dbg !940
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !910, metadata !DIExpression()), !dbg !941
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %5, i8 0, i64 28, i1 false), !dbg !941
  %6 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !942
  %7 = load i32, i32* %6, align 4, !dbg !942, !tbaa !943
  %8 = zext i32 %7 to i64, !dbg !946
  %9 = inttoptr i64 %8 to i8*, !dbg !947
  call void @llvm.dbg.value(metadata i8* %9, metadata !911, metadata !DIExpression()), !dbg !939
  call void @llvm.dbg.value(metadata i8* %9, metadata !912, metadata !DIExpression()), !dbg !939
  %10 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !948
  %11 = load i32, i32* %10, align 8, !dbg !948, !tbaa !949
  %12 = zext i32 %11 to i64, !dbg !950
  %13 = inttoptr i64 %12 to i8*, !dbg !951
  call void @llvm.dbg.value(metadata i8* %13, metadata !929, metadata !DIExpression()), !dbg !939
  %14 = getelementptr i8, i8* %9, i64 20, !dbg !952
  %15 = icmp ugt i8* %14, %13, !dbg !953
  br i1 %15, label %16, label %19, !dbg !954

16:                                               ; preds = %1
  %17 = getelementptr inbounds [22 x i8], [22 x i8]* %3, i64 0, i64 0, !dbg !955
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %17) #4, !dbg !955
  call void @llvm.dbg.declare(metadata [22 x i8]* %3, metadata !931, metadata !DIExpression()), !dbg !955
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %17, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !955
  %18 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %17, i32 22, i32 532, i32 1) #4, !dbg !955
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %17) #4, !dbg !956
  br label %34, !dbg !957

19:                                               ; preds = %1
  %20 = inttoptr i64 %8 to %struct.iphdr*, !dbg !958
  call void @llvm.dbg.value(metadata %struct.iphdr* %20, metadata !912, metadata !DIExpression()), !dbg !939
  %21 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !959
  store i8 64, i8* %21, align 1, !dbg !960, !tbaa !250
  %22 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %20, i64 0, i32 6, !dbg !961
  %23 = load i8, i8* %22, align 1, !dbg !961, !tbaa !963
  %24 = icmp eq i8 %23, 1, !dbg !965
  br i1 %24, label %25, label %27, !dbg !966

25:                                               ; preds = %19
  %26 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !967
  store i32 -1408237212, i32* %26, align 4, !dbg !969, !tbaa !236
  br label %27, !dbg !970

27:                                               ; preds = %25, %19
  %28 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* nonnull %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 0) #4, !dbg !971
  %29 = trunc i64 %28 to i32, !dbg !971
  call void @llvm.dbg.value(metadata i32 %29, metadata !930, metadata !DIExpression()), !dbg !939
  %30 = icmp slt i32 %29, 0, !dbg !972
  br i1 %30, label %31, label %34, !dbg !973

31:                                               ; preds = %27
  %32 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !974
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %32) #4, !dbg !974
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !935, metadata !DIExpression()), !dbg !974
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %32, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !974
  %33 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %32, i32 22, i32 543, i32 %29) #4, !dbg !974
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %32) #4, !dbg !975
  br label %34, !dbg !976

34:                                               ; preds = %27, %31, %16
  %35 = phi i32 [ 2, %16 ], [ 2, %31 ], [ 0, %27 ], !dbg !939
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %5) #4, !dbg !977
  ret i32 %35, !dbg !977
}

; Function Attrs: nounwind
define dso_local i32 @_ipip_get_tunnel(%struct.__sk_buff* %0) #0 section "ipip_get_tunnel" !dbg !978 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [16 x i8], align 1
  %4 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !980, metadata !DIExpression()), !dbg !991
  %5 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !992
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %5) #4, !dbg !992
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !982, metadata !DIExpression()), !dbg !993
  %6 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 0, !dbg !994
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #4, !dbg !994
  call void @llvm.dbg.declare(metadata [16 x i8]* %3, metadata !983, metadata !DIExpression()), !dbg !995
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6, i8* nonnull align 1 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @__const._ipip_get_tunnel.fmt, i64 0, i64 0), i64 16, i1 false), !dbg !995
  %7 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 0) #4, !dbg !996
  %8 = trunc i64 %7 to i32, !dbg !996
  call void @llvm.dbg.value(metadata i32 %8, metadata !981, metadata !DIExpression()), !dbg !991
  %9 = icmp slt i32 %8, 0, !dbg !997
  br i1 %9, label %10, label %13, !dbg !998

10:                                               ; preds = %1
  %11 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !999
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %11) #4, !dbg !999
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !987, metadata !DIExpression()), !dbg !999
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %11, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !999
  %12 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %11, i32 22, i32 559, i32 %8) #4, !dbg !999
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %11) #4, !dbg !1000
  br label %17, !dbg !1001

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !1002
  %15 = load i32, i32* %14, align 4, !dbg !1002, !tbaa !236
  %16 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %6, i32 16, i32 %15) #4, !dbg !1003
  br label %17, !dbg !1004

17:                                               ; preds = %13, %10
  %18 = phi i32 [ 2, %10 ], [ 0, %13 ], !dbg !991
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #4, !dbg !1005
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %5) #4, !dbg !1005
  ret i32 %18, !dbg !1005
}

; Function Attrs: nounwind
define dso_local i32 @_ipip6_set_tunnel(%struct.__sk_buff* %0) #0 section "ipip6_set_tunnel" !dbg !1006 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [22 x i8], align 1
  %4 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1008, metadata !DIExpression()), !dbg !1022
  %5 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !1023
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %5) #4, !dbg !1023
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !1009, metadata !DIExpression()), !dbg !1024
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %5, i8 0, i64 28, i1 false), !dbg !1024
  %6 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !1025
  %7 = load i32, i32* %6, align 4, !dbg !1025, !tbaa !943
  %8 = zext i32 %7 to i64, !dbg !1026
  %9 = inttoptr i64 %8 to i8*, !dbg !1027
  call void @llvm.dbg.value(metadata i8* %9, metadata !1010, metadata !DIExpression()), !dbg !1022
  call void @llvm.dbg.value(metadata i8* %9, metadata !1011, metadata !DIExpression()), !dbg !1022
  %10 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !1028
  %11 = load i32, i32* %10, align 8, !dbg !1028, !tbaa !949
  %12 = zext i32 %11 to i64, !dbg !1029
  %13 = inttoptr i64 %12 to i8*, !dbg !1030
  call void @llvm.dbg.value(metadata i8* %13, metadata !1012, metadata !DIExpression()), !dbg !1022
  %14 = getelementptr i8, i8* %9, i64 20, !dbg !1031
  %15 = icmp ugt i8* %14, %13, !dbg !1032
  br i1 %15, label %16, label %19, !dbg !1033

16:                                               ; preds = %1
  %17 = getelementptr inbounds [22 x i8], [22 x i8]* %3, i64 0, i64 0, !dbg !1034
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %17) #4, !dbg !1034
  call void @llvm.dbg.declare(metadata [22 x i8]* %3, metadata !1014, metadata !DIExpression()), !dbg !1034
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %17, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !1034
  %18 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %17, i32 22, i32 578, i32 1) #4, !dbg !1034
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %17) #4, !dbg !1035
  br label %34, !dbg !1036

19:                                               ; preds = %1
  %20 = inttoptr i64 %8 to %struct.iphdr*, !dbg !1037
  call void @llvm.dbg.value(metadata %struct.iphdr* %20, metadata !1011, metadata !DIExpression()), !dbg !1022
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %5, i8 0, i64 28, i1 false), !dbg !1038
  %21 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !1039
  store i8 64, i8* %21, align 1, !dbg !1040, !tbaa !250
  %22 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %20, i64 0, i32 6, !dbg !1041
  %23 = load i8, i8* %22, align 1, !dbg !1041, !tbaa !963
  %24 = icmp eq i8 %23, 1, !dbg !1043
  br i1 %24, label %25, label %27, !dbg !1044

25:                                               ; preds = %19
  %26 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 3, !dbg !1045
  store i32 285212672, i32* %26, align 4, !dbg !1047, !tbaa !236
  br label %27, !dbg !1048

27:                                               ; preds = %25, %19
  %28 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* nonnull %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 1) #4, !dbg !1049
  %29 = trunc i64 %28 to i32, !dbg !1049
  call void @llvm.dbg.value(metadata i32 %29, metadata !1013, metadata !DIExpression()), !dbg !1022
  %30 = icmp slt i32 %29, 0, !dbg !1050
  br i1 %30, label %31, label %34, !dbg !1051

31:                                               ; preds = %27
  %32 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !1052
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %32) #4, !dbg !1052
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !1018, metadata !DIExpression()), !dbg !1052
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %32, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !1052
  %33 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %32, i32 22, i32 591, i32 %29) #4, !dbg !1052
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %32) #4, !dbg !1053
  br label %34, !dbg !1054

34:                                               ; preds = %27, %31, %16
  %35 = phi i32 [ 2, %16 ], [ 2, %31 ], [ 0, %27 ], !dbg !1022
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %5) #4, !dbg !1055
  ret i32 %35, !dbg !1055
}

; Function Attrs: nounwind
define dso_local i32 @_ipip6_get_tunnel(%struct.__sk_buff* %0) #0 section "ipip6_get_tunnel" !dbg !1056 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [19 x i8], align 1
  %4 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1058, metadata !DIExpression()), !dbg !1069
  %5 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !1070
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %5) #4, !dbg !1070
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !1060, metadata !DIExpression()), !dbg !1071
  %6 = getelementptr inbounds [19 x i8], [19 x i8]* %3, i64 0, i64 0, !dbg !1072
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %6) #4, !dbg !1072
  call void @llvm.dbg.declare(metadata [19 x i8]* %3, metadata !1061, metadata !DIExpression()), !dbg !1073
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(19) %6, i8* nonnull align 1 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @__const._ip6ip6_get_tunnel.fmt, i64 0, i64 0), i64 19, i1 false), !dbg !1073
  %7 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 1) #4, !dbg !1074
  %8 = trunc i64 %7 to i32, !dbg !1074
  call void @llvm.dbg.value(metadata i32 %8, metadata !1059, metadata !DIExpression()), !dbg !1069
  %9 = icmp slt i32 %8, 0, !dbg !1075
  br i1 %9, label %10, label %13, !dbg !1076

10:                                               ; preds = %1
  %11 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !1077
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %11) #4, !dbg !1077
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !1065, metadata !DIExpression()), !dbg !1077
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %11, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !1077
  %12 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %11, i32 22, i32 608, i32 %8) #4, !dbg !1077
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %11) #4, !dbg !1078
  br label %21, !dbg !1079

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !1080
  %15 = load i32, i32* %14, align 4, !dbg !1080, !tbaa !236
  %16 = call i32 @llvm.bswap.i32(i32 %15), !dbg !1080
  %17 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 3, !dbg !1081
  %18 = load i32, i32* %17, align 4, !dbg !1081, !tbaa !236
  %19 = call i32 @llvm.bswap.i32(i32 %18), !dbg !1081
  %20 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %6, i32 19, i32 %16, i32 %19) #4, !dbg !1082
  br label %21, !dbg !1083

21:                                               ; preds = %13, %10
  %22 = phi i32 [ 2, %10 ], [ 0, %13 ], !dbg !1069
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %6) #4, !dbg !1084
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %5) #4, !dbg !1084
  ret i32 %22, !dbg !1084
}

; Function Attrs: nounwind
define dso_local i32 @_ip6ip6_set_tunnel(%struct.__sk_buff* %0) #0 section "ip6ip6_set_tunnel" !dbg !1085 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [22 x i8], align 1
  %4 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1087, metadata !DIExpression()), !dbg !1135
  %5 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !1136
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %5) #4, !dbg !1136
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !1088, metadata !DIExpression()), !dbg !1137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(28) %5, i8 0, i64 28, i1 false), !dbg !1137
  %6 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !1138
  %7 = load i32, i32* %6, align 4, !dbg !1138, !tbaa !943
  %8 = zext i32 %7 to i64, !dbg !1139
  %9 = inttoptr i64 %8 to i8*, !dbg !1140
  call void @llvm.dbg.value(metadata i8* %9, metadata !1089, metadata !DIExpression()), !dbg !1135
  call void @llvm.dbg.value(metadata i8* %9, metadata !1090, metadata !DIExpression()), !dbg !1135
  %10 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !1141
  %11 = load i32, i32* %10, align 8, !dbg !1141, !tbaa !949
  %12 = zext i32 %11 to i64, !dbg !1142
  %13 = inttoptr i64 %12 to i8*, !dbg !1143
  call void @llvm.dbg.value(metadata i8* %13, metadata !1125, metadata !DIExpression()), !dbg !1135
  %14 = getelementptr i8, i8* %9, i64 40, !dbg !1144
  %15 = icmp ugt i8* %14, %13, !dbg !1145
  br i1 %15, label %16, label %19, !dbg !1146

16:                                               ; preds = %1
  %17 = getelementptr inbounds [22 x i8], [22 x i8]* %3, i64 0, i64 0, !dbg !1147
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %17) #4, !dbg !1147
  call void @llvm.dbg.declare(metadata [22 x i8]* %3, metadata !1127, metadata !DIExpression()), !dbg !1147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %17, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !1147
  %18 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %17, i32 22, i32 628, i32 1) #4, !dbg !1147
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %17) #4, !dbg !1148
  br label %34, !dbg !1149

19:                                               ; preds = %1
  %20 = inttoptr i64 %8 to %struct.ipv6hdr*, !dbg !1150
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %20, metadata !1090, metadata !DIExpression()), !dbg !1135
  %21 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 3, !dbg !1151
  store i8 64, i8* %21, align 1, !dbg !1152, !tbaa !250
  %22 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %20, i64 0, i32 3, !dbg !1153
  %23 = load i8, i8* %22, align 2, !dbg !1153, !tbaa !1155
  %24 = icmp eq i8 %23, 58, !dbg !1158
  br i1 %24, label %25, label %27, !dbg !1159

25:                                               ; preds = %19
  %26 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 3, !dbg !1160
  store i32 285212672, i32* %26, align 4, !dbg !1162, !tbaa !236
  br label %27, !dbg !1163

27:                                               ; preds = %25, %19
  %28 = call i64 inttoptr (i64 21 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* nonnull %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 1) #4, !dbg !1164
  %29 = trunc i64 %28 to i32, !dbg !1164
  call void @llvm.dbg.value(metadata i32 %29, metadata !1126, metadata !DIExpression()), !dbg !1135
  %30 = icmp slt i32 %29, 0, !dbg !1165
  br i1 %30, label %31, label %34, !dbg !1166

31:                                               ; preds = %27
  %32 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !1167
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %32) #4, !dbg !1167
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !1131, metadata !DIExpression()), !dbg !1167
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %32, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !1167
  %33 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %32, i32 22, i32 640, i32 %29) #4, !dbg !1167
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %32) #4, !dbg !1168
  br label %34, !dbg !1169

34:                                               ; preds = %27, %31, %16
  %35 = phi i32 [ 2, %16 ], [ 2, %31 ], [ 0, %27 ], !dbg !1135
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %5) #4, !dbg !1170
  ret i32 %35, !dbg !1170
}

; Function Attrs: nounwind
define dso_local i32 @_ip6ip6_get_tunnel(%struct.__sk_buff* %0) #0 section "ip6ip6_get_tunnel" !dbg !1171 {
  %2 = alloca %struct.bpf_tunnel_key, align 4
  %3 = alloca [19 x i8], align 1
  %4 = alloca [22 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1173, metadata !DIExpression()), !dbg !1181
  %5 = bitcast %struct.bpf_tunnel_key* %2 to i8*, !dbg !1182
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %5) #4, !dbg !1182
  call void @llvm.dbg.declare(metadata %struct.bpf_tunnel_key* %2, metadata !1175, metadata !DIExpression()), !dbg !1183
  %6 = getelementptr inbounds [19 x i8], [19 x i8]* %3, i64 0, i64 0, !dbg !1184
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %6) #4, !dbg !1184
  call void @llvm.dbg.declare(metadata [19 x i8]* %3, metadata !1176, metadata !DIExpression()), !dbg !1185
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(19) %6, i8* nonnull align 1 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @__const._ip6ip6_get_tunnel.fmt, i64 0, i64 0), i64 19, i1 false), !dbg !1185
  %7 = call i64 inttoptr (i64 20 to i64 (%struct.__sk_buff*, %struct.bpf_tunnel_key*, i32, i64)*)(%struct.__sk_buff* %0, %struct.bpf_tunnel_key* nonnull %2, i32 28, i64 1) #4, !dbg !1186
  %8 = trunc i64 %7 to i32, !dbg !1186
  call void @llvm.dbg.value(metadata i32 %8, metadata !1174, metadata !DIExpression()), !dbg !1181
  %9 = icmp slt i32 %8, 0, !dbg !1187
  br i1 %9, label %10, label %13, !dbg !1188

10:                                               ; preds = %1
  %11 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0, !dbg !1189
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %11) #4, !dbg !1189
  call void @llvm.dbg.declare(metadata [22 x i8]* %4, metadata !1177, metadata !DIExpression()), !dbg !1189
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(22) %11, i8* nonnull align 1 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const._ip6ip6_get_tunnel.fmt.22, i64 0, i64 0), i64 22, i1 false), !dbg !1189
  %12 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %11, i32 22, i32 657, i32 %8) #4, !dbg !1189
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %11) #4, !dbg !1190
  br label %21, !dbg !1191

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 0, !dbg !1192
  %15 = load i32, i32* %14, align 4, !dbg !1192, !tbaa !236
  %16 = call i32 @llvm.bswap.i32(i32 %15), !dbg !1192
  %17 = getelementptr inbounds %struct.bpf_tunnel_key, %struct.bpf_tunnel_key* %2, i64 0, i32 1, i32 0, i64 3, !dbg !1193
  %18 = load i32, i32* %17, align 4, !dbg !1193, !tbaa !236
  %19 = call i32 @llvm.bswap.i32(i32 %18), !dbg !1193
  %20 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %6, i32 19, i32 %16, i32 %19) #4, !dbg !1194
  br label %21, !dbg !1195

21:                                               ; preds = %13, %10
  %22 = phi i32 [ 2, %10 ], [ 0, %13 ], !dbg !1181
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %6) #4, !dbg !1196
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %5) #4, !dbg !1196
  ret i32 %22, !dbg !1196
}

; Function Attrs: nounwind
define dso_local i32 @_xfrm_get_state(%struct.__sk_buff* %0) #0 section "xfrm_get_state" !dbg !1197 {
  %2 = alloca %struct.bpf_xfrm_state, align 4
  %3 = alloca [34 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !1199, metadata !DIExpression()), !dbg !1206
  %4 = bitcast %struct.bpf_xfrm_state* %2 to i8*, !dbg !1207
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %4) #4, !dbg !1207
  call void @llvm.dbg.declare(metadata %struct.bpf_xfrm_state* %2, metadata !1200, metadata !DIExpression()), !dbg !1208
  %5 = getelementptr inbounds [34 x i8], [34 x i8]* %3, i64 0, i64 0, !dbg !1209
  call void @llvm.lifetime.start.p0i8(i64 34, i8* nonnull %5) #4, !dbg !1209
  call void @llvm.dbg.declare(metadata [34 x i8]* %3, metadata !1201, metadata !DIExpression()), !dbg !1210
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(34) %5, i8* nonnull align 1 dereferenceable(34) getelementptr inbounds ([34 x i8], [34 x i8]* @__const._xfrm_get_state.fmt, i64 0, i64 0), i64 34, i1 false), !dbg !1210
  %6 = call i64 inttoptr (i64 66 to i64 (%struct.__sk_buff*, i32, %struct.bpf_xfrm_state*, i32, i64)*)(%struct.__sk_buff* %0, i32 0, %struct.bpf_xfrm_state* nonnull %2, i32 28, i64 0) #4, !dbg !1211
  %7 = trunc i64 %6 to i32, !dbg !1211
  call void @llvm.dbg.value(metadata i32 %7, metadata !1205, metadata !DIExpression()), !dbg !1206
  %8 = icmp slt i32 %7, 0, !dbg !1212
  br i1 %8, label %19, label %9, !dbg !1214

9:                                                ; preds = %1
  %10 = getelementptr inbounds %struct.bpf_xfrm_state, %struct.bpf_xfrm_state* %2, i64 0, i32 0, !dbg !1215
  %11 = load i32, i32* %10, align 4, !dbg !1215, !tbaa !1216
  %12 = getelementptr inbounds %struct.bpf_xfrm_state, %struct.bpf_xfrm_state* %2, i64 0, i32 1, !dbg !1218
  %13 = load i32, i32* %12, align 4, !dbg !1218, !tbaa !1219
  %14 = call i32 @llvm.bswap.i32(i32 %13), !dbg !1218
  %15 = getelementptr inbounds %struct.bpf_xfrm_state, %struct.bpf_xfrm_state* %2, i64 0, i32 4, i32 0, i64 0, !dbg !1220
  %16 = load i32, i32* %15, align 4, !dbg !1220, !tbaa !236
  %17 = call i32 @llvm.bswap.i32(i32 %16), !dbg !1220
  %18 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %5, i32 34, i32 %11, i32 %14, i32 %17) #4, !dbg !1221
  br label %19, !dbg !1222

19:                                               ; preds = %1, %9
  call void @llvm.lifetime.end.p0i8(i64 34, i8* nonnull %5) #4, !dbg !1223
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %4) #4, !dbg !1223
  ret i32 0, !dbg !1223
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!212, !213, !214}
!llvm.ident = !{!215}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_version", scope: !2, file: !3, line: 29, type: !52, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 12.0.0-1ubuntu1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !46, globals: !55, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "test_tunnel_kern.c", directory: "/home/cloudcome/bpf/lwt")
!4 = !{!5, !12, !15}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 4054, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11}
!9 = !DIEnumerator(name: "BPF_F_ZERO_CSUM_TX", value: 2, isUnsigned: true)
!10 = !DIEnumerator(name: "BPF_F_DONT_FRAGMENT", value: 4, isUnsigned: true)
!11 = !DIEnumerator(name: "BPF_F_SEQ_NUMBER", value: 8, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 4038, baseType: !7, size: 32, elements: !13)
!13 = !{!14}
!14 = !DIEnumerator(name: "BPF_F_TUNINFO_IPV6", value: 1, isUnsigned: true)
!15 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !16, line: 40, baseType: !7, size: 32, elements: !17)
!16 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45}
!18 = !DIEnumerator(name: "IPPROTO_IP", value: 0, isUnsigned: true)
!19 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1, isUnsigned: true)
!20 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2, isUnsigned: true)
!21 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4, isUnsigned: true)
!22 = !DIEnumerator(name: "IPPROTO_TCP", value: 6, isUnsigned: true)
!23 = !DIEnumerator(name: "IPPROTO_EGP", value: 8, isUnsigned: true)
!24 = !DIEnumerator(name: "IPPROTO_PUP", value: 12, isUnsigned: true)
!25 = !DIEnumerator(name: "IPPROTO_UDP", value: 17, isUnsigned: true)
!26 = !DIEnumerator(name: "IPPROTO_IDP", value: 22, isUnsigned: true)
!27 = !DIEnumerator(name: "IPPROTO_TP", value: 29, isUnsigned: true)
!28 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33, isUnsigned: true)
!29 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41, isUnsigned: true)
!30 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46, isUnsigned: true)
!31 = !DIEnumerator(name: "IPPROTO_GRE", value: 47, isUnsigned: true)
!32 = !DIEnumerator(name: "IPPROTO_ESP", value: 50, isUnsigned: true)
!33 = !DIEnumerator(name: "IPPROTO_AH", value: 51, isUnsigned: true)
!34 = !DIEnumerator(name: "IPPROTO_MTP", value: 92, isUnsigned: true)
!35 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94, isUnsigned: true)
!36 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98, isUnsigned: true)
!37 = !DIEnumerator(name: "IPPROTO_PIM", value: 103, isUnsigned: true)
!38 = !DIEnumerator(name: "IPPROTO_COMP", value: 108, isUnsigned: true)
!39 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132, isUnsigned: true)
!40 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136, isUnsigned: true)
!41 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137, isUnsigned: true)
!42 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143, isUnsigned: true)
!43 = !DIEnumerator(name: "IPPROTO_RAW", value: 255, isUnsigned: true)
!44 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262, isUnsigned: true)
!45 = !DIEnumerator(name: "IPPROTO_MAX", value: 263, isUnsigned: true)
!46 = !{!47, !49, !51, !53, !54}
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !48, line: 27, baseType: !7)
!48 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !48, line: 24, baseType: !50)
!50 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!55 = !{!0, !56, !62, !179, !186, !188, !193, !195}
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 682, type: !58, isLocal: false, isDefinition: true)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 32, elements: !60)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !{!61}
!61 = !DISubrange(count: 4)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "bpf_skb_set_tunnel_key", scope: !2, file: !64, line: 547, type: !65, isLocal: true, isDefinition: true)
!64 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/home/cloudcome/bpf/lwt")
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DISubroutineType(types: !67)
!67 = !{!54, !68, !166, !47, !139}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 4183, size: 1472, elements: !70)
!70 = !{!71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !87, !88, !89, !90, !91, !92, !93, !94, !95, !97, !98, !99, !100, !101, !138, !141, !142, !143, !165}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !69, file: !6, line: 4184, baseType: !47, size: 32)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !69, file: !6, line: 4185, baseType: !47, size: 32, offset: 32)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !69, file: !6, line: 4186, baseType: !47, size: 32, offset: 64)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !69, file: !6, line: 4187, baseType: !47, size: 32, offset: 96)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !69, file: !6, line: 4188, baseType: !47, size: 32, offset: 128)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !69, file: !6, line: 4189, baseType: !47, size: 32, offset: 160)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !69, file: !6, line: 4190, baseType: !47, size: 32, offset: 192)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !69, file: !6, line: 4191, baseType: !47, size: 32, offset: 224)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !69, file: !6, line: 4192, baseType: !47, size: 32, offset: 256)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !69, file: !6, line: 4193, baseType: !47, size: 32, offset: 288)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !69, file: !6, line: 4194, baseType: !47, size: 32, offset: 320)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !69, file: !6, line: 4195, baseType: !47, size: 32, offset: 352)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !69, file: !6, line: 4196, baseType: !84, size: 160, offset: 384)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 160, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 5)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !69, file: !6, line: 4197, baseType: !47, size: 32, offset: 544)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !69, file: !6, line: 4198, baseType: !47, size: 32, offset: 576)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !69, file: !6, line: 4199, baseType: !47, size: 32, offset: 608)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !69, file: !6, line: 4200, baseType: !47, size: 32, offset: 640)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !69, file: !6, line: 4201, baseType: !47, size: 32, offset: 672)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !69, file: !6, line: 4204, baseType: !47, size: 32, offset: 704)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !69, file: !6, line: 4205, baseType: !47, size: 32, offset: 736)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !69, file: !6, line: 4206, baseType: !47, size: 32, offset: 768)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !69, file: !6, line: 4207, baseType: !96, size: 128, offset: 800)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 128, elements: !60)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !69, file: !6, line: 4208, baseType: !96, size: 128, offset: 928)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !69, file: !6, line: 4209, baseType: !47, size: 32, offset: 1056)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !69, file: !6, line: 4210, baseType: !47, size: 32, offset: 1088)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !69, file: !6, line: 4213, baseType: !47, size: 32, offset: 1120)
!101 = !DIDerivedType(tag: DW_TAG_member, scope: !69, file: !6, line: 4214, baseType: !102, size: 64, align: 64, offset: 1152)
!102 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !69, file: !6, line: 4214, size: 64, align: 64, elements: !103)
!103 = !{!104}
!104 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !102, file: !6, line: 4214, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 5041, size: 448, elements: !107)
!107 = !{!108, !109, !110, !111, !114, !115, !116, !117, !120, !121, !122, !136, !137}
!108 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !106, file: !6, line: 5042, baseType: !49, size: 16)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !106, file: !6, line: 5043, baseType: !49, size: 16, offset: 16)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !106, file: !6, line: 5044, baseType: !49, size: 16, offset: 32)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !106, file: !6, line: 5045, baseType: !112, size: 8, offset: 48)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !48, line: 21, baseType: !113)
!113 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !106, file: !6, line: 5046, baseType: !112, size: 8, offset: 56)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !106, file: !6, line: 5047, baseType: !112, size: 8, offset: 64)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !106, file: !6, line: 5048, baseType: !112, size: 8, offset: 72)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !106, file: !6, line: 5049, baseType: !118, size: 16, offset: 80)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !119, line: 25, baseType: !49)
!119 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!120 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !106, file: !6, line: 5050, baseType: !118, size: 16, offset: 96)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !106, file: !6, line: 5051, baseType: !118, size: 16, offset: 112)
!122 = !DIDerivedType(tag: DW_TAG_member, scope: !106, file: !6, line: 5052, baseType: !123, size: 256, offset: 128)
!123 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !106, file: !6, line: 5052, size: 256, elements: !124)
!124 = !{!125, !131}
!125 = !DIDerivedType(tag: DW_TAG_member, scope: !123, file: !6, line: 5053, baseType: !126, size: 64)
!126 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !123, file: !6, line: 5053, size: 64, elements: !127)
!127 = !{!128, !130}
!128 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !126, file: !6, line: 5054, baseType: !129, size: 32)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !119, line: 27, baseType: !47)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !126, file: !6, line: 5055, baseType: !129, size: 32, offset: 32)
!131 = !DIDerivedType(tag: DW_TAG_member, scope: !123, file: !6, line: 5057, baseType: !132, size: 256)
!132 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !123, file: !6, line: 5057, size: 256, elements: !133)
!133 = !{!134, !135}
!134 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !132, file: !6, line: 5058, baseType: !96, size: 128)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !132, file: !6, line: 5059, baseType: !96, size: 128, offset: 128)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !106, file: !6, line: 5062, baseType: !47, size: 32, offset: 384)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !106, file: !6, line: 5063, baseType: !129, size: 32, offset: 416)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !69, file: !6, line: 4215, baseType: !139, size: 64, offset: 1216)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !48, line: 31, baseType: !140)
!140 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !69, file: !6, line: 4216, baseType: !47, size: 32, offset: 1280)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !69, file: !6, line: 4217, baseType: !47, size: 32, offset: 1312)
!143 = !DIDerivedType(tag: DW_TAG_member, scope: !69, file: !6, line: 4218, baseType: !144, size: 64, align: 64, offset: 1344)
!144 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !69, file: !6, line: 4218, size: 64, align: 64, elements: !145)
!145 = !{!146}
!146 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !144, file: !6, line: 4218, baseType: !147, size: 64)
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64)
!148 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 4272, size: 640, elements: !149)
!149 = !{!150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163}
!150 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !148, file: !6, line: 4273, baseType: !47, size: 32)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !148, file: !6, line: 4274, baseType: !47, size: 32, offset: 32)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !148, file: !6, line: 4275, baseType: !47, size: 32, offset: 64)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !148, file: !6, line: 4276, baseType: !47, size: 32, offset: 96)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !148, file: !6, line: 4277, baseType: !47, size: 32, offset: 128)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !148, file: !6, line: 4278, baseType: !47, size: 32, offset: 160)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !148, file: !6, line: 4280, baseType: !47, size: 32, offset: 192)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !148, file: !6, line: 4281, baseType: !96, size: 128, offset: 224)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !148, file: !6, line: 4282, baseType: !47, size: 32, offset: 352)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !148, file: !6, line: 4283, baseType: !47, size: 32, offset: 384)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !148, file: !6, line: 4284, baseType: !47, size: 32, offset: 416)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !148, file: !6, line: 4285, baseType: !96, size: 128, offset: 448)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !148, file: !6, line: 4286, baseType: !47, size: 32, offset: 576)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !148, file: !6, line: 4287, baseType: !164, size: 32, offset: 608)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !48, line: 26, baseType: !52)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !69, file: !6, line: 4219, baseType: !47, size: 32, offset: 1408)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_tunnel_key", file: !6, line: 4222, size: 224, elements: !168)
!168 = !{!169, !170, !175, !176, !177, !178}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "tunnel_id", scope: !167, file: !6, line: 4223, baseType: !47, size: 32)
!170 = !DIDerivedType(tag: DW_TAG_member, scope: !167, file: !6, line: 4224, baseType: !171, size: 128, offset: 32)
!171 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !167, file: !6, line: 4224, size: 128, elements: !172)
!172 = !{!173, !174}
!173 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ipv4", scope: !171, file: !6, line: 4225, baseType: !47, size: 32)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ipv6", scope: !171, file: !6, line: 4226, baseType: !96, size: 128)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "tunnel_tos", scope: !167, file: !6, line: 4228, baseType: !112, size: 8, offset: 160)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "tunnel_ttl", scope: !167, file: !6, line: 4229, baseType: !112, size: 8, offset: 168)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "tunnel_ext", scope: !167, file: !6, line: 4230, baseType: !49, size: 16, offset: 176)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "tunnel_label", scope: !167, file: !6, line: 4231, baseType: !47, size: 32, offset: 192)
!179 = !DIGlobalVariableExpression(var: !180, expr: !DIExpression())
!180 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !64, line: 170, type: !181, isLocal: true, isDefinition: true)
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !182, size: 64)
!182 = !DISubroutineType(types: !183)
!183 = !{!54, !184, !47, null}
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !185, size: 64)
!185 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !59)
!186 = !DIGlobalVariableExpression(var: !187, expr: !DIExpression())
!187 = distinct !DIGlobalVariable(name: "bpf_skb_get_tunnel_key", scope: !2, file: !64, line: 506, type: !65, isLocal: true, isDefinition: true)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(name: "bpf_skb_set_tunnel_opt", scope: !2, file: !64, line: 818, type: !190, isLocal: true, isDefinition: true)
!190 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !191, size: 64)
!191 = !DISubroutineType(types: !192)
!192 = !{!54, !68, !53, !47}
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(name: "bpf_skb_get_tunnel_opt", scope: !2, file: !64, line: 804, type: !190, isLocal: true, isDefinition: true)
!195 = !DIGlobalVariableExpression(var: !196, expr: !DIExpression())
!196 = distinct !DIGlobalVariable(name: "bpf_skb_get_xfrm_state", scope: !2, file: !64, line: 1709, type: !197, isLocal: true, isDefinition: true)
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!198 = !DISubroutineType(types: !199)
!199 = !{!54, !68, !47, !200, !47, !139}
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !201, size: 64)
!201 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_xfrm_state", file: !6, line: 4237, size: 224, elements: !202)
!202 = !{!203, !204, !205, !206, !207}
!203 = !DIDerivedType(tag: DW_TAG_member, name: "reqid", scope: !201, file: !6, line: 4238, baseType: !47, size: 32)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "spi", scope: !201, file: !6, line: 4239, baseType: !47, size: 32, offset: 32)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !201, file: !6, line: 4240, baseType: !49, size: 16, offset: 64)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "ext", scope: !201, file: !6, line: 4241, baseType: !49, size: 16, offset: 80)
!207 = !DIDerivedType(tag: DW_TAG_member, scope: !201, file: !6, line: 4242, baseType: !208, size: 128, offset: 96)
!208 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !201, file: !6, line: 4242, size: 128, elements: !209)
!209 = !{!210, !211}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ipv4", scope: !208, file: !6, line: 4243, baseType: !47, size: 32)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ipv6", scope: !208, file: !6, line: 4244, baseType: !96, size: 128)
!212 = !{i32 7, !"Dwarf Version", i32 4}
!213 = !{i32 2, !"Debug Info Version", i32 3}
!214 = !{i32 1, !"wchar_size", i32 4}
!215 = !{!"Ubuntu clang version 12.0.0-1ubuntu1"}
!216 = distinct !DISubprogram(name: "_gre_set_tunnel", scope: !3, file: !3, line: 46, type: !217, scopeLine: 47, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !219)
!217 = !DISubroutineType(types: !218)
!218 = !{!52, !68}
!219 = !{!220, !221, !222, !223}
!220 = !DILocalVariable(name: "skb", arg: 1, scope: !216, file: !3, line: 46, type: !68)
!221 = !DILocalVariable(name: "ret", scope: !216, file: !3, line: 48, type: !52)
!222 = !DILocalVariable(name: "key", scope: !216, file: !3, line: 49, type: !167)
!223 = !DILocalVariable(name: "fmt", scope: !224, file: !3, line: 60, type: !227)
!224 = distinct !DILexicalBlock(scope: !225, file: !3, line: 60, column: 3)
!225 = distinct !DILexicalBlock(scope: !226, file: !3, line: 59, column: 15)
!226 = distinct !DILexicalBlock(scope: !216, file: !3, line: 59, column: 6)
!227 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 176, elements: !228)
!228 = !{!229}
!229 = !DISubrange(count: 22)
!230 = !DILocation(line: 0, scope: !216)
!231 = !DILocation(line: 49, column: 2, scope: !216)
!232 = !DILocation(line: 49, column: 24, scope: !216)
!233 = !DILocation(line: 51, column: 2, scope: !216)
!234 = !DILocation(line: 52, column: 6, scope: !216)
!235 = !DILocation(line: 52, column: 18, scope: !216)
!236 = !{!237, !237, i64 0}
!237 = !{!"omnipotent char", !238, i64 0}
!238 = !{!"Simple C/C++ TBAA"}
!239 = !DILocation(line: 53, column: 6, scope: !216)
!240 = !DILocation(line: 53, column: 16, scope: !216)
!241 = !{!242, !243, i64 0}
!242 = !{!"bpf_tunnel_key", !243, i64 0, !237, i64 4, !237, i64 20, !237, i64 21, !244, i64 22, !243, i64 24}
!243 = !{!"int", !237, i64 0}
!244 = !{!"short", !237, i64 0}
!245 = !DILocation(line: 54, column: 6, scope: !216)
!246 = !DILocation(line: 54, column: 17, scope: !216)
!247 = !{!242, !237, i64 20}
!248 = !DILocation(line: 55, column: 6, scope: !216)
!249 = !DILocation(line: 55, column: 17, scope: !216)
!250 = !{!242, !237, i64 21}
!251 = !DILocation(line: 57, column: 8, scope: !216)
!252 = !DILocation(line: 59, column: 10, scope: !226)
!253 = !DILocation(line: 59, column: 6, scope: !216)
!254 = !DILocation(line: 60, column: 3, scope: !224)
!255 = !DILocation(line: 60, column: 3, scope: !225)
!256 = !DILocation(line: 61, column: 3, scope: !225)
!257 = !DILocation(line: 65, column: 1, scope: !216)
!258 = distinct !DISubprogram(name: "_gre_get_tunnel", scope: !3, file: !3, line: 68, type: !217, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !259)
!259 = !{!260, !261, !262, !263, !267}
!260 = !DILocalVariable(name: "skb", arg: 1, scope: !258, file: !3, line: 68, type: !68)
!261 = !DILocalVariable(name: "ret", scope: !258, file: !3, line: 70, type: !52)
!262 = !DILocalVariable(name: "key", scope: !258, file: !3, line: 71, type: !167)
!263 = !DILocalVariable(name: "fmt", scope: !258, file: !3, line: 72, type: !264)
!264 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 184, elements: !265)
!265 = !{!266}
!266 = !DISubrange(count: 23)
!267 = !DILocalVariable(name: "fmt", scope: !268, file: !3, line: 76, type: !227)
!268 = distinct !DILexicalBlock(scope: !269, file: !3, line: 76, column: 3)
!269 = distinct !DILexicalBlock(scope: !270, file: !3, line: 75, column: 15)
!270 = distinct !DILexicalBlock(scope: !258, file: !3, line: 75, column: 6)
!271 = !DILocation(line: 0, scope: !258)
!272 = !DILocation(line: 71, column: 2, scope: !258)
!273 = !DILocation(line: 71, column: 24, scope: !258)
!274 = !DILocation(line: 72, column: 2, scope: !258)
!275 = !DILocation(line: 72, column: 7, scope: !258)
!276 = !DILocation(line: 74, column: 8, scope: !258)
!277 = !DILocation(line: 75, column: 10, scope: !270)
!278 = !DILocation(line: 75, column: 6, scope: !258)
!279 = !DILocation(line: 76, column: 3, scope: !268)
!280 = !DILocation(line: 76, column: 3, scope: !269)
!281 = !DILocation(line: 77, column: 3, scope: !269)
!282 = !DILocation(line: 80, column: 41, scope: !258)
!283 = !DILocation(line: 80, column: 56, scope: !258)
!284 = !DILocation(line: 80, column: 2, scope: !258)
!285 = !DILocation(line: 81, column: 2, scope: !258)
!286 = !DILocation(line: 82, column: 1, scope: !258)
!287 = distinct !DISubprogram(name: "_ip6gretap_set_tunnel", scope: !3, file: !3, line: 85, type: !217, scopeLine: 86, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !288)
!288 = !{!289, !290, !291, !292}
!289 = !DILocalVariable(name: "skb", arg: 1, scope: !287, file: !3, line: 85, type: !68)
!290 = !DILocalVariable(name: "key", scope: !287, file: !3, line: 87, type: !167)
!291 = !DILocalVariable(name: "ret", scope: !287, file: !3, line: 88, type: !52)
!292 = !DILocalVariable(name: "fmt", scope: !293, file: !3, line: 101, type: !227)
!293 = distinct !DILexicalBlock(scope: !294, file: !3, line: 101, column: 3)
!294 = distinct !DILexicalBlock(scope: !295, file: !3, line: 100, column: 15)
!295 = distinct !DILexicalBlock(scope: !287, file: !3, line: 100, column: 6)
!296 = !DILocation(line: 0, scope: !287)
!297 = !DILocation(line: 87, column: 2, scope: !287)
!298 = !DILocation(line: 87, column: 24, scope: !287)
!299 = !DILocation(line: 90, column: 2, scope: !287)
!300 = !DILocation(line: 91, column: 2, scope: !287)
!301 = !DILocation(line: 91, column: 21, scope: !287)
!302 = !DILocation(line: 92, column: 6, scope: !287)
!303 = !DILocation(line: 92, column: 16, scope: !287)
!304 = !DILocation(line: 93, column: 6, scope: !287)
!305 = !DILocation(line: 93, column: 17, scope: !287)
!306 = !DILocation(line: 94, column: 6, scope: !287)
!307 = !DILocation(line: 94, column: 17, scope: !287)
!308 = !DILocation(line: 95, column: 6, scope: !287)
!309 = !DILocation(line: 95, column: 19, scope: !287)
!310 = !{!242, !243, i64 24}
!311 = !DILocation(line: 97, column: 8, scope: !287)
!312 = !DILocation(line: 100, column: 10, scope: !295)
!313 = !DILocation(line: 100, column: 6, scope: !287)
!314 = !DILocation(line: 101, column: 3, scope: !293)
!315 = !DILocation(line: 101, column: 3, scope: !294)
!316 = !DILocation(line: 102, column: 3, scope: !294)
!317 = !DILocation(line: 106, column: 1, scope: !287)
!318 = distinct !DISubprogram(name: "_ip6gretap_get_tunnel", scope: !3, file: !3, line: 109, type: !217, scopeLine: 110, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !319)
!319 = !{!320, !321, !325, !326, !327}
!320 = !DILocalVariable(name: "skb", arg: 1, scope: !318, file: !3, line: 109, type: !68)
!321 = !DILocalVariable(name: "fmt", scope: !318, file: !3, line: 111, type: !322)
!322 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 264, elements: !323)
!323 = !{!324}
!324 = !DISubrange(count: 33)
!325 = !DILocalVariable(name: "key", scope: !318, file: !3, line: 112, type: !167)
!326 = !DILocalVariable(name: "ret", scope: !318, file: !3, line: 113, type: !52)
!327 = !DILocalVariable(name: "fmt", scope: !328, file: !3, line: 118, type: !227)
!328 = distinct !DILexicalBlock(scope: !329, file: !3, line: 118, column: 3)
!329 = distinct !DILexicalBlock(scope: !330, file: !3, line: 117, column: 15)
!330 = distinct !DILexicalBlock(scope: !318, file: !3, line: 117, column: 6)
!331 = !DILocation(line: 0, scope: !318)
!332 = !DILocation(line: 111, column: 2, scope: !318)
!333 = !DILocation(line: 111, column: 7, scope: !318)
!334 = !DILocation(line: 112, column: 2, scope: !318)
!335 = !DILocation(line: 112, column: 24, scope: !318)
!336 = !DILocation(line: 115, column: 8, scope: !318)
!337 = !DILocation(line: 117, column: 10, scope: !330)
!338 = !DILocation(line: 117, column: 6, scope: !318)
!339 = !DILocation(line: 118, column: 3, scope: !328)
!340 = !DILocation(line: 118, column: 3, scope: !329)
!341 = !DILocation(line: 119, column: 3, scope: !329)
!342 = !DILocation(line: 123, column: 9, scope: !318)
!343 = !DILocation(line: 123, column: 20, scope: !318)
!344 = !DILocation(line: 123, column: 44, scope: !318)
!345 = !DILocation(line: 122, column: 2, scope: !318)
!346 = !DILocation(line: 125, column: 2, scope: !318)
!347 = !DILocation(line: 126, column: 1, scope: !318)
!348 = distinct !DISubprogram(name: "_erspan_set_tunnel", scope: !3, file: !3, line: 129, type: !217, scopeLine: 130, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !349)
!349 = !{!350, !351, !352, !373, !374, !378, !379, !380}
!350 = !DILocalVariable(name: "skb", arg: 1, scope: !348, file: !3, line: 129, type: !68)
!351 = !DILocalVariable(name: "key", scope: !348, file: !3, line: 131, type: !167)
!352 = !DILocalVariable(name: "md", scope: !348, file: !3, line: 132, type: !353)
!353 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "erspan_metadata", file: !354, line: 44, size: 96, elements: !355)
!354 = !DIFile(filename: "/usr/include/linux/erspan.h", directory: "")
!355 = !{!356, !357}
!356 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !353, file: !354, line: 45, baseType: !52, size: 32)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !353, file: !354, line: 49, baseType: !358, size: 64, offset: 32)
!358 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !353, file: !354, line: 46, size: 64, elements: !359)
!359 = !{!360, !361}
!360 = !DIDerivedType(tag: DW_TAG_member, name: "index", scope: !358, file: !354, line: 47, baseType: !129, size: 32)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "md2", scope: !358, file: !354, line: 48, baseType: !362, size: 64)
!362 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "erspan_md2", file: !354, line: 20, size: 64, elements: !363)
!363 = !{!364, !365, !366, !367, !368, !369, !370, !371, !372}
!364 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !362, file: !354, line: 21, baseType: !129, size: 32)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "sgt", scope: !362, file: !354, line: 22, baseType: !118, size: 16, offset: 32)
!366 = !DIDerivedType(tag: DW_TAG_member, name: "hwid_upper", scope: !362, file: !354, line: 24, baseType: !112, size: 2, offset: 48, flags: DIFlagBitField, extraData: i64 48)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "ft", scope: !362, file: !354, line: 25, baseType: !112, size: 5, offset: 50, flags: DIFlagBitField, extraData: i64 48)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !362, file: !354, line: 26, baseType: !112, size: 1, offset: 55, flags: DIFlagBitField, extraData: i64 48)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !362, file: !354, line: 27, baseType: !112, size: 1, offset: 56, flags: DIFlagBitField, extraData: i64 48)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "gra", scope: !362, file: !354, line: 28, baseType: !112, size: 2, offset: 57, flags: DIFlagBitField, extraData: i64 48)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "dir", scope: !362, file: !354, line: 29, baseType: !112, size: 1, offset: 59, flags: DIFlagBitField, extraData: i64 48)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "hwid", scope: !362, file: !354, line: 30, baseType: !112, size: 4, offset: 60, flags: DIFlagBitField, extraData: i64 48)
!373 = !DILocalVariable(name: "ret", scope: !348, file: !3, line: 133, type: !52)
!374 = !DILocalVariable(name: "fmt", scope: !375, file: !3, line: 144, type: !227)
!375 = distinct !DILexicalBlock(scope: !376, file: !3, line: 144, column: 3)
!376 = distinct !DILexicalBlock(scope: !377, file: !3, line: 143, column: 15)
!377 = distinct !DILexicalBlock(scope: !348, file: !3, line: 143, column: 6)
!378 = !DILocalVariable(name: "direction", scope: !348, file: !3, line: 153, type: !112)
!379 = !DILocalVariable(name: "hwid", scope: !348, file: !3, line: 154, type: !112)
!380 = !DILocalVariable(name: "fmt", scope: !381, file: !3, line: 164, type: !227)
!381 = distinct !DILexicalBlock(scope: !382, file: !3, line: 164, column: 3)
!382 = distinct !DILexicalBlock(scope: !383, file: !3, line: 163, column: 15)
!383 = distinct !DILexicalBlock(scope: !348, file: !3, line: 163, column: 6)
!384 = !DILocation(line: 0, scope: !348)
!385 = !DILocation(line: 131, column: 2, scope: !348)
!386 = !DILocation(line: 131, column: 24, scope: !348)
!387 = !DILocation(line: 132, column: 2, scope: !348)
!388 = !DILocation(line: 132, column: 25, scope: !348)
!389 = !DILocation(line: 135, column: 2, scope: !348)
!390 = !DILocation(line: 136, column: 6, scope: !348)
!391 = !DILocation(line: 136, column: 18, scope: !348)
!392 = !DILocation(line: 137, column: 6, scope: !348)
!393 = !DILocation(line: 137, column: 16, scope: !348)
!394 = !DILocation(line: 138, column: 6, scope: !348)
!395 = !DILocation(line: 138, column: 17, scope: !348)
!396 = !DILocation(line: 139, column: 6, scope: !348)
!397 = !DILocation(line: 139, column: 17, scope: !348)
!398 = !DILocation(line: 141, column: 8, scope: !348)
!399 = !DILocation(line: 143, column: 10, scope: !377)
!400 = !DILocation(line: 143, column: 6, scope: !348)
!401 = !DILocation(line: 144, column: 3, scope: !375)
!402 = !DILocation(line: 144, column: 3, scope: !376)
!403 = !DILocation(line: 145, column: 3, scope: !376)
!404 = !DILocation(line: 148, column: 2, scope: !348)
!405 = !DILocation(line: 156, column: 5, scope: !348)
!406 = !DILocation(line: 156, column: 13, scope: !348)
!407 = !{!408, !243, i64 0}
!408 = !{!"erspan_metadata", !243, i64 0, !237, i64 4}
!409 = !DILocation(line: 157, column: 11, scope: !348)
!410 = !DILocation(line: 159, column: 22, scope: !348)
!411 = !DILocation(line: 162, column: 8, scope: !348)
!412 = !DILocation(line: 163, column: 10, scope: !383)
!413 = !DILocation(line: 163, column: 6, scope: !348)
!414 = !DILocation(line: 164, column: 3, scope: !381)
!415 = !DILocation(line: 164, column: 3, scope: !382)
!416 = !DILocation(line: 165, column: 3, scope: !382)
!417 = !DILocation(line: 169, column: 1, scope: !348)
!418 = distinct !DISubprogram(name: "_erspan_get_tunnel", scope: !3, file: !3, line: 172, type: !217, scopeLine: 173, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !419)
!419 = !{!420, !421, !425, !426, !427, !428, !432, !436}
!420 = !DILocalVariable(name: "skb", arg: 1, scope: !418, file: !3, line: 172, type: !68)
!421 = !DILocalVariable(name: "fmt", scope: !418, file: !3, line: 174, type: !422)
!422 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 328, elements: !423)
!423 = !{!424}
!424 = !DISubrange(count: 41)
!425 = !DILocalVariable(name: "key", scope: !418, file: !3, line: 175, type: !167)
!426 = !DILocalVariable(name: "md", scope: !418, file: !3, line: 176, type: !353)
!427 = !DILocalVariable(name: "ret", scope: !418, file: !3, line: 178, type: !52)
!428 = !DILocalVariable(name: "fmt", scope: !429, file: !3, line: 182, type: !227)
!429 = distinct !DILexicalBlock(scope: !430, file: !3, line: 182, column: 3)
!430 = distinct !DILexicalBlock(scope: !431, file: !3, line: 181, column: 15)
!431 = distinct !DILexicalBlock(scope: !418, file: !3, line: 181, column: 6)
!432 = !DILocalVariable(name: "fmt", scope: !433, file: !3, line: 188, type: !227)
!433 = distinct !DILexicalBlock(scope: !434, file: !3, line: 188, column: 3)
!434 = distinct !DILexicalBlock(scope: !435, file: !3, line: 187, column: 15)
!435 = distinct !DILexicalBlock(scope: !418, file: !3, line: 187, column: 6)
!436 = !DILocalVariable(name: "fmt2", scope: !418, file: !3, line: 201, type: !437)
!437 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 288, elements: !438)
!438 = !{!439}
!439 = !DISubrange(count: 36)
!440 = !DILocation(line: 0, scope: !418)
!441 = !DILocation(line: 174, column: 2, scope: !418)
!442 = !DILocation(line: 174, column: 7, scope: !418)
!443 = !DILocation(line: 175, column: 2, scope: !418)
!444 = !DILocation(line: 175, column: 24, scope: !418)
!445 = !DILocation(line: 176, column: 2, scope: !418)
!446 = !DILocation(line: 176, column: 25, scope: !418)
!447 = !DILocation(line: 180, column: 8, scope: !418)
!448 = !DILocation(line: 181, column: 10, scope: !431)
!449 = !DILocation(line: 181, column: 6, scope: !418)
!450 = !DILocation(line: 182, column: 3, scope: !429)
!451 = !DILocation(line: 182, column: 3, scope: !430)
!452 = !DILocation(line: 183, column: 3, scope: !430)
!453 = !DILocation(line: 186, column: 8, scope: !418)
!454 = !DILocation(line: 187, column: 10, scope: !435)
!455 = !DILocation(line: 187, column: 6, scope: !418)
!456 = !DILocation(line: 188, column: 3, scope: !433)
!457 = !DILocation(line: 188, column: 3, scope: !434)
!458 = !DILocation(line: 189, column: 3, scope: !434)
!459 = !DILocation(line: 193, column: 8, scope: !418)
!460 = !DILocation(line: 193, column: 23, scope: !418)
!461 = !DILocation(line: 193, column: 39, scope: !418)
!462 = !DILocation(line: 192, column: 2, scope: !418)
!463 = !DILocation(line: 201, column: 2, scope: !418)
!464 = !DILocation(line: 201, column: 7, scope: !418)
!465 = !DILocation(line: 204, column: 14, scope: !418)
!466 = !DILocation(line: 205, column: 26, scope: !418)
!467 = !DILocation(line: 205, column: 43, scope: !418)
!468 = !DILocation(line: 205, column: 32, scope: !418)
!469 = !DILocation(line: 206, column: 5, scope: !418)
!470 = !DILocation(line: 203, column: 2, scope: !418)
!471 = !DILocation(line: 210, column: 1, scope: !418)
!472 = distinct !DISubprogram(name: "_ip4ip6erspan_set_tunnel", scope: !3, file: !3, line: 213, type: !217, scopeLine: 214, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !473)
!473 = !{!474, !475, !476, !477, !478, !482, !483, !484}
!474 = !DILocalVariable(name: "skb", arg: 1, scope: !472, file: !3, line: 213, type: !68)
!475 = !DILocalVariable(name: "key", scope: !472, file: !3, line: 215, type: !167)
!476 = !DILocalVariable(name: "md", scope: !472, file: !3, line: 216, type: !353)
!477 = !DILocalVariable(name: "ret", scope: !472, file: !3, line: 217, type: !52)
!478 = !DILocalVariable(name: "fmt", scope: !479, file: !3, line: 228, type: !227)
!479 = distinct !DILexicalBlock(scope: !480, file: !3, line: 228, column: 3)
!480 = distinct !DILexicalBlock(scope: !481, file: !3, line: 227, column: 15)
!481 = distinct !DILexicalBlock(scope: !472, file: !3, line: 227, column: 6)
!482 = !DILocalVariable(name: "direction", scope: !472, file: !3, line: 238, type: !112)
!483 = !DILocalVariable(name: "hwid", scope: !472, file: !3, line: 239, type: !112)
!484 = !DILocalVariable(name: "fmt", scope: !485, file: !3, line: 249, type: !227)
!485 = distinct !DILexicalBlock(scope: !486, file: !3, line: 249, column: 3)
!486 = distinct !DILexicalBlock(scope: !487, file: !3, line: 248, column: 15)
!487 = distinct !DILexicalBlock(scope: !472, file: !3, line: 248, column: 6)
!488 = !DILocation(line: 0, scope: !472)
!489 = !DILocation(line: 215, column: 2, scope: !472)
!490 = !DILocation(line: 215, column: 24, scope: !472)
!491 = !DILocation(line: 216, column: 2, scope: !472)
!492 = !DILocation(line: 216, column: 25, scope: !472)
!493 = !DILocation(line: 219, column: 2, scope: !472)
!494 = !DILocation(line: 220, column: 2, scope: !472)
!495 = !DILocation(line: 220, column: 21, scope: !472)
!496 = !DILocation(line: 221, column: 6, scope: !472)
!497 = !DILocation(line: 221, column: 16, scope: !472)
!498 = !DILocation(line: 222, column: 6, scope: !472)
!499 = !DILocation(line: 222, column: 17, scope: !472)
!500 = !DILocation(line: 223, column: 6, scope: !472)
!501 = !DILocation(line: 223, column: 17, scope: !472)
!502 = !DILocation(line: 225, column: 8, scope: !472)
!503 = !DILocation(line: 227, column: 10, scope: !481)
!504 = !DILocation(line: 227, column: 6, scope: !472)
!505 = !DILocation(line: 228, column: 3, scope: !479)
!506 = !DILocation(line: 228, column: 3, scope: !480)
!507 = !DILocation(line: 229, column: 3, scope: !480)
!508 = !DILocation(line: 232, column: 2, scope: !472)
!509 = !DILocation(line: 241, column: 5, scope: !472)
!510 = !DILocation(line: 241, column: 13, scope: !472)
!511 = !DILocation(line: 242, column: 11, scope: !472)
!512 = !DILocation(line: 244, column: 22, scope: !472)
!513 = !DILocation(line: 247, column: 8, scope: !472)
!514 = !DILocation(line: 248, column: 10, scope: !487)
!515 = !DILocation(line: 248, column: 6, scope: !472)
!516 = !DILocation(line: 249, column: 3, scope: !485)
!517 = !DILocation(line: 249, column: 3, scope: !486)
!518 = !DILocation(line: 250, column: 3, scope: !486)
!519 = !DILocation(line: 254, column: 1, scope: !472)
!520 = distinct !DISubprogram(name: "_ip4ip6erspan_get_tunnel", scope: !3, file: !3, line: 257, type: !217, scopeLine: 258, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !521)
!521 = !{!522, !523, !527, !528, !529, !530, !534, !538}
!522 = !DILocalVariable(name: "skb", arg: 1, scope: !520, file: !3, line: 257, type: !68)
!523 = !DILocalVariable(name: "fmt", scope: !520, file: !3, line: 259, type: !524)
!524 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 448, elements: !525)
!525 = !{!526}
!526 = !DISubrange(count: 56)
!527 = !DILocalVariable(name: "key", scope: !520, file: !3, line: 260, type: !167)
!528 = !DILocalVariable(name: "md", scope: !520, file: !3, line: 261, type: !353)
!529 = !DILocalVariable(name: "ret", scope: !520, file: !3, line: 263, type: !52)
!530 = !DILocalVariable(name: "fmt", scope: !531, file: !3, line: 268, type: !227)
!531 = distinct !DILexicalBlock(scope: !532, file: !3, line: 268, column: 3)
!532 = distinct !DILexicalBlock(scope: !533, file: !3, line: 267, column: 15)
!533 = distinct !DILexicalBlock(scope: !520, file: !3, line: 267, column: 6)
!534 = !DILocalVariable(name: "fmt", scope: !535, file: !3, line: 274, type: !227)
!535 = distinct !DILexicalBlock(scope: !536, file: !3, line: 274, column: 3)
!536 = distinct !DILexicalBlock(scope: !537, file: !3, line: 273, column: 15)
!537 = distinct !DILexicalBlock(scope: !520, file: !3, line: 273, column: 6)
!538 = !DILocalVariable(name: "fmt2", scope: !520, file: !3, line: 287, type: !437)
!539 = !DILocation(line: 0, scope: !520)
!540 = !DILocation(line: 259, column: 2, scope: !520)
!541 = !DILocation(line: 259, column: 7, scope: !520)
!542 = !DILocation(line: 260, column: 2, scope: !520)
!543 = !DILocation(line: 260, column: 24, scope: !520)
!544 = !DILocation(line: 261, column: 2, scope: !520)
!545 = !DILocation(line: 261, column: 25, scope: !520)
!546 = !DILocation(line: 265, column: 8, scope: !520)
!547 = !DILocation(line: 267, column: 10, scope: !533)
!548 = !DILocation(line: 267, column: 6, scope: !520)
!549 = !DILocation(line: 268, column: 3, scope: !531)
!550 = !DILocation(line: 268, column: 3, scope: !532)
!551 = !DILocation(line: 269, column: 3, scope: !532)
!552 = !DILocation(line: 272, column: 8, scope: !520)
!553 = !DILocation(line: 273, column: 10, scope: !537)
!554 = !DILocation(line: 273, column: 6, scope: !520)
!555 = !DILocation(line: 274, column: 3, scope: !535)
!556 = !DILocation(line: 274, column: 3, scope: !536)
!557 = !DILocation(line: 275, column: 3, scope: !536)
!558 = !DILocation(line: 279, column: 8, scope: !520)
!559 = !DILocation(line: 279, column: 23, scope: !520)
!560 = !DILocation(line: 279, column: 39, scope: !520)
!561 = !DILocation(line: 278, column: 2, scope: !520)
!562 = !DILocation(line: 287, column: 2, scope: !520)
!563 = !DILocation(line: 287, column: 7, scope: !520)
!564 = !DILocation(line: 290, column: 14, scope: !520)
!565 = !DILocation(line: 291, column: 26, scope: !520)
!566 = !DILocation(line: 291, column: 43, scope: !520)
!567 = !DILocation(line: 291, column: 32, scope: !520)
!568 = !DILocation(line: 292, column: 5, scope: !520)
!569 = !DILocation(line: 289, column: 2, scope: !520)
!570 = !DILocation(line: 296, column: 1, scope: !520)
!571 = distinct !DISubprogram(name: "_vxlan_set_tunnel", scope: !3, file: !3, line: 299, type: !217, scopeLine: 300, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !572)
!572 = !{!573, !574, !575, !576, !580, !584}
!573 = !DILocalVariable(name: "skb", arg: 1, scope: !571, file: !3, line: 299, type: !68)
!574 = !DILocalVariable(name: "ret", scope: !571, file: !3, line: 301, type: !52)
!575 = !DILocalVariable(name: "key", scope: !571, file: !3, line: 302, type: !167)
!576 = !DILocalVariable(name: "md", scope: !571, file: !3, line: 303, type: !577)
!577 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vxlan_metadata", file: !3, line: 41, size: 32, elements: !578)
!578 = !{!579}
!579 = !DIDerivedType(tag: DW_TAG_member, name: "gbp", scope: !577, file: !3, line: 42, baseType: !47, size: 32)
!580 = !DILocalVariable(name: "fmt", scope: !581, file: !3, line: 314, type: !227)
!581 = distinct !DILexicalBlock(scope: !582, file: !3, line: 314, column: 3)
!582 = distinct !DILexicalBlock(scope: !583, file: !3, line: 313, column: 15)
!583 = distinct !DILexicalBlock(scope: !571, file: !3, line: 313, column: 6)
!584 = !DILocalVariable(name: "fmt", scope: !585, file: !3, line: 321, type: !227)
!585 = distinct !DILexicalBlock(scope: !586, file: !3, line: 321, column: 3)
!586 = distinct !DILexicalBlock(scope: !587, file: !3, line: 320, column: 15)
!587 = distinct !DILexicalBlock(scope: !571, file: !3, line: 320, column: 6)
!588 = !DILocation(line: 0, scope: !571)
!589 = !DILocation(line: 302, column: 2, scope: !571)
!590 = !DILocation(line: 302, column: 24, scope: !571)
!591 = !DILocation(line: 303, column: 2, scope: !571)
!592 = !DILocation(line: 303, column: 24, scope: !571)
!593 = !DILocation(line: 305, column: 2, scope: !571)
!594 = !DILocation(line: 306, column: 6, scope: !571)
!595 = !DILocation(line: 306, column: 18, scope: !571)
!596 = !DILocation(line: 307, column: 6, scope: !571)
!597 = !DILocation(line: 307, column: 16, scope: !571)
!598 = !DILocation(line: 308, column: 6, scope: !571)
!599 = !DILocation(line: 308, column: 17, scope: !571)
!600 = !DILocation(line: 309, column: 6, scope: !571)
!601 = !DILocation(line: 309, column: 17, scope: !571)
!602 = !DILocation(line: 311, column: 8, scope: !571)
!603 = !DILocation(line: 313, column: 10, scope: !583)
!604 = !DILocation(line: 313, column: 6, scope: !571)
!605 = !DILocation(line: 314, column: 3, scope: !581)
!606 = !DILocation(line: 314, column: 3, scope: !582)
!607 = !DILocation(line: 315, column: 3, scope: !582)
!608 = !DILocation(line: 318, column: 5, scope: !571)
!609 = !DILocation(line: 318, column: 9, scope: !571)
!610 = !{!611, !243, i64 0}
!611 = !{!"vxlan_metadata", !243, i64 0}
!612 = !DILocation(line: 319, column: 8, scope: !571)
!613 = !DILocation(line: 320, column: 10, scope: !587)
!614 = !DILocation(line: 320, column: 6, scope: !571)
!615 = !DILocation(line: 321, column: 3, scope: !585)
!616 = !DILocation(line: 321, column: 3, scope: !586)
!617 = !DILocation(line: 322, column: 3, scope: !586)
!618 = !DILocation(line: 326, column: 1, scope: !571)
!619 = distinct !DISubprogram(name: "_vxlan_get_tunnel", scope: !3, file: !3, line: 329, type: !217, scopeLine: 330, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !620)
!620 = !{!621, !622, !623, !624, !625, !629, !633}
!621 = !DILocalVariable(name: "skb", arg: 1, scope: !619, file: !3, line: 329, type: !68)
!622 = !DILocalVariable(name: "ret", scope: !619, file: !3, line: 331, type: !52)
!623 = !DILocalVariable(name: "key", scope: !619, file: !3, line: 332, type: !167)
!624 = !DILocalVariable(name: "md", scope: !619, file: !3, line: 333, type: !577)
!625 = !DILocalVariable(name: "fmt", scope: !619, file: !3, line: 334, type: !626)
!626 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 304, elements: !627)
!627 = !{!628}
!628 = !DISubrange(count: 38)
!629 = !DILocalVariable(name: "fmt", scope: !630, file: !3, line: 338, type: !227)
!630 = distinct !DILexicalBlock(scope: !631, file: !3, line: 338, column: 3)
!631 = distinct !DILexicalBlock(scope: !632, file: !3, line: 337, column: 15)
!632 = distinct !DILexicalBlock(scope: !619, file: !3, line: 337, column: 6)
!633 = !DILocalVariable(name: "fmt", scope: !634, file: !3, line: 344, type: !227)
!634 = distinct !DILexicalBlock(scope: !635, file: !3, line: 344, column: 3)
!635 = distinct !DILexicalBlock(scope: !636, file: !3, line: 343, column: 15)
!636 = distinct !DILexicalBlock(scope: !619, file: !3, line: 343, column: 6)
!637 = !DILocation(line: 0, scope: !619)
!638 = !DILocation(line: 332, column: 2, scope: !619)
!639 = !DILocation(line: 332, column: 24, scope: !619)
!640 = !DILocation(line: 333, column: 2, scope: !619)
!641 = !DILocation(line: 333, column: 24, scope: !619)
!642 = !DILocation(line: 334, column: 2, scope: !619)
!643 = !DILocation(line: 334, column: 7, scope: !619)
!644 = !DILocation(line: 336, column: 8, scope: !619)
!645 = !DILocation(line: 337, column: 10, scope: !632)
!646 = !DILocation(line: 337, column: 6, scope: !619)
!647 = !DILocation(line: 338, column: 3, scope: !630)
!648 = !DILocation(line: 338, column: 3, scope: !631)
!649 = !DILocation(line: 339, column: 3, scope: !631)
!650 = !DILocation(line: 342, column: 8, scope: !619)
!651 = !DILocation(line: 343, column: 10, scope: !636)
!652 = !DILocation(line: 343, column: 6, scope: !619)
!653 = !DILocation(line: 344, column: 3, scope: !634)
!654 = !DILocation(line: 344, column: 3, scope: !635)
!655 = !DILocation(line: 345, column: 3, scope: !635)
!656 = !DILocation(line: 349, column: 8, scope: !619)
!657 = !DILocation(line: 349, column: 23, scope: !619)
!658 = !DILocation(line: 349, column: 39, scope: !619)
!659 = !DILocation(line: 348, column: 2, scope: !619)
!660 = !DILocation(line: 351, column: 2, scope: !619)
!661 = !DILocation(line: 352, column: 1, scope: !619)
!662 = distinct !DISubprogram(name: "_ip6vxlan_set_tunnel", scope: !3, file: !3, line: 355, type: !217, scopeLine: 356, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !663)
!663 = !{!664, !665, !666, !667}
!664 = !DILocalVariable(name: "skb", arg: 1, scope: !662, file: !3, line: 355, type: !68)
!665 = !DILocalVariable(name: "key", scope: !662, file: !3, line: 357, type: !167)
!666 = !DILocalVariable(name: "ret", scope: !662, file: !3, line: 358, type: !52)
!667 = !DILocalVariable(name: "fmt", scope: !668, file: !3, line: 369, type: !227)
!668 = distinct !DILexicalBlock(scope: !669, file: !3, line: 369, column: 3)
!669 = distinct !DILexicalBlock(scope: !670, file: !3, line: 368, column: 15)
!670 = distinct !DILexicalBlock(scope: !662, file: !3, line: 368, column: 6)
!671 = !DILocation(line: 0, scope: !662)
!672 = !DILocation(line: 357, column: 2, scope: !662)
!673 = !DILocation(line: 357, column: 24, scope: !662)
!674 = !DILocation(line: 360, column: 2, scope: !662)
!675 = !DILocation(line: 361, column: 2, scope: !662)
!676 = !DILocation(line: 361, column: 21, scope: !662)
!677 = !DILocation(line: 362, column: 6, scope: !662)
!678 = !DILocation(line: 362, column: 16, scope: !662)
!679 = !DILocation(line: 363, column: 6, scope: !662)
!680 = !DILocation(line: 363, column: 17, scope: !662)
!681 = !DILocation(line: 364, column: 6, scope: !662)
!682 = !DILocation(line: 364, column: 17, scope: !662)
!683 = !DILocation(line: 366, column: 8, scope: !662)
!684 = !DILocation(line: 368, column: 10, scope: !670)
!685 = !DILocation(line: 368, column: 6, scope: !662)
!686 = !DILocation(line: 369, column: 3, scope: !668)
!687 = !DILocation(line: 369, column: 3, scope: !669)
!688 = !DILocation(line: 370, column: 3, scope: !669)
!689 = !DILocation(line: 374, column: 1, scope: !662)
!690 = distinct !DISubprogram(name: "_ip6vxlan_get_tunnel", scope: !3, file: !3, line: 377, type: !217, scopeLine: 378, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !691)
!691 = !{!692, !693, !694, !695, !696}
!692 = !DILocalVariable(name: "skb", arg: 1, scope: !690, file: !3, line: 377, type: !68)
!693 = !DILocalVariable(name: "fmt", scope: !690, file: !3, line: 379, type: !322)
!694 = !DILocalVariable(name: "key", scope: !690, file: !3, line: 380, type: !167)
!695 = !DILocalVariable(name: "ret", scope: !690, file: !3, line: 381, type: !52)
!696 = !DILocalVariable(name: "fmt", scope: !697, file: !3, line: 386, type: !227)
!697 = distinct !DILexicalBlock(scope: !698, file: !3, line: 386, column: 3)
!698 = distinct !DILexicalBlock(scope: !699, file: !3, line: 385, column: 15)
!699 = distinct !DILexicalBlock(scope: !690, file: !3, line: 385, column: 6)
!700 = !DILocation(line: 0, scope: !690)
!701 = !DILocation(line: 379, column: 2, scope: !690)
!702 = !DILocation(line: 379, column: 7, scope: !690)
!703 = !DILocation(line: 380, column: 2, scope: !690)
!704 = !DILocation(line: 380, column: 24, scope: !690)
!705 = !DILocation(line: 383, column: 8, scope: !690)
!706 = !DILocation(line: 385, column: 10, scope: !699)
!707 = !DILocation(line: 385, column: 6, scope: !690)
!708 = !DILocation(line: 386, column: 3, scope: !697)
!709 = !DILocation(line: 386, column: 3, scope: !698)
!710 = !DILocation(line: 387, column: 3, scope: !698)
!711 = !DILocation(line: 391, column: 9, scope: !690)
!712 = !DILocation(line: 391, column: 20, scope: !690)
!713 = !DILocation(line: 391, column: 44, scope: !690)
!714 = !DILocation(line: 390, column: 2, scope: !690)
!715 = !DILocation(line: 393, column: 2, scope: !690)
!716 = !DILocation(line: 394, column: 1, scope: !690)
!717 = distinct !DISubprogram(name: "_geneve_set_tunnel", scope: !3, file: !3, line: 397, type: !217, scopeLine: 398, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !718)
!718 = !{!719, !720, !721, !722, !735, !739}
!719 = !DILocalVariable(name: "skb", arg: 1, scope: !717, file: !3, line: 397, type: !68)
!720 = !DILocalVariable(name: "ret", scope: !717, file: !3, line: 400, type: !52)
!721 = !DILocalVariable(name: "key", scope: !717, file: !3, line: 401, type: !167)
!722 = !DILocalVariable(name: "gopt", scope: !717, file: !3, line: 402, type: !723)
!723 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "geneve_opt", file: !3, line: 31, size: 96, elements: !724)
!724 = !{!725, !726, !727, !728, !729, !730, !731}
!725 = !DIDerivedType(tag: DW_TAG_member, name: "opt_class", scope: !723, file: !3, line: 32, baseType: !118, size: 16)
!726 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !723, file: !3, line: 33, baseType: !112, size: 8, offset: 16)
!727 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !723, file: !3, line: 34, baseType: !112, size: 5, offset: 24, flags: DIFlagBitField, extraData: i64 24)
!728 = !DIDerivedType(tag: DW_TAG_member, name: "r3", scope: !723, file: !3, line: 35, baseType: !112, size: 1, offset: 29, flags: DIFlagBitField, extraData: i64 24)
!729 = !DIDerivedType(tag: DW_TAG_member, name: "r2", scope: !723, file: !3, line: 36, baseType: !112, size: 1, offset: 30, flags: DIFlagBitField, extraData: i64 24)
!730 = !DIDerivedType(tag: DW_TAG_member, name: "r1", scope: !723, file: !3, line: 37, baseType: !112, size: 1, offset: 31, flags: DIFlagBitField, extraData: i64 24)
!731 = !DIDerivedType(tag: DW_TAG_member, name: "opt_data", scope: !723, file: !3, line: 38, baseType: !732, size: 64, offset: 32)
!732 = !DICompositeType(tag: DW_TAG_array_type, baseType: !112, size: 64, elements: !733)
!733 = !{!734}
!734 = !DISubrange(count: 8)
!735 = !DILocalVariable(name: "fmt", scope: !736, file: !3, line: 422, type: !227)
!736 = distinct !DILexicalBlock(scope: !737, file: !3, line: 422, column: 3)
!737 = distinct !DILexicalBlock(scope: !738, file: !3, line: 421, column: 15)
!738 = distinct !DILexicalBlock(scope: !717, file: !3, line: 421, column: 6)
!739 = !DILocalVariable(name: "fmt", scope: !740, file: !3, line: 428, type: !227)
!740 = distinct !DILexicalBlock(scope: !741, file: !3, line: 428, column: 3)
!741 = distinct !DILexicalBlock(scope: !742, file: !3, line: 427, column: 15)
!742 = distinct !DILexicalBlock(scope: !717, file: !3, line: 427, column: 6)
!743 = !DILocation(line: 0, scope: !717)
!744 = !DILocation(line: 401, column: 2, scope: !717)
!745 = !DILocation(line: 401, column: 24, scope: !717)
!746 = !DILocation(line: 402, column: 2, scope: !717)
!747 = !DILocation(line: 402, column: 20, scope: !717)
!748 = !DILocation(line: 404, column: 2, scope: !717)
!749 = !DILocation(line: 405, column: 6, scope: !717)
!750 = !DILocation(line: 405, column: 18, scope: !717)
!751 = !DILocation(line: 406, column: 6, scope: !717)
!752 = !DILocation(line: 406, column: 16, scope: !717)
!753 = !DILocation(line: 407, column: 6, scope: !717)
!754 = !DILocation(line: 407, column: 17, scope: !717)
!755 = !DILocation(line: 408, column: 6, scope: !717)
!756 = !DILocation(line: 408, column: 17, scope: !717)
!757 = !DILocation(line: 410, column: 2, scope: !717)
!758 = !DILocation(line: 411, column: 7, scope: !717)
!759 = !DILocation(line: 411, column: 17, scope: !717)
!760 = !{!761, !244, i64 0}
!761 = !{!"geneve_opt", !244, i64 0, !237, i64 2, !237, i64 3, !237, i64 3, !237, i64 3, !237, i64 3, !237, i64 4}
!762 = !DILocation(line: 412, column: 7, scope: !717)
!763 = !DILocation(line: 412, column: 12, scope: !717)
!764 = !{!761, !237, i64 2}
!765 = !DILocation(line: 413, column: 7, scope: !717)
!766 = !DILocation(line: 416, column: 14, scope: !717)
!767 = !DILocation(line: 417, column: 17, scope: !717)
!768 = !DILocation(line: 417, column: 2, scope: !717)
!769 = !DILocation(line: 417, column: 26, scope: !717)
!770 = !{!243, !243, i64 0}
!771 = !DILocation(line: 419, column: 8, scope: !717)
!772 = !DILocation(line: 421, column: 10, scope: !738)
!773 = !DILocation(line: 421, column: 6, scope: !717)
!774 = !DILocation(line: 422, column: 3, scope: !736)
!775 = !DILocation(line: 422, column: 3, scope: !737)
!776 = !DILocation(line: 423, column: 3, scope: !737)
!777 = !DILocation(line: 426, column: 8, scope: !717)
!778 = !DILocation(line: 427, column: 10, scope: !742)
!779 = !DILocation(line: 427, column: 6, scope: !717)
!780 = !DILocation(line: 428, column: 3, scope: !740)
!781 = !DILocation(line: 428, column: 3, scope: !741)
!782 = !DILocation(line: 429, column: 3, scope: !741)
!783 = !DILocation(line: 433, column: 1, scope: !717)
!784 = distinct !DISubprogram(name: "_geneve_get_tunnel", scope: !3, file: !3, line: 436, type: !217, scopeLine: 437, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !785)
!785 = !{!786, !787, !788, !789, !790, !791}
!786 = !DILocalVariable(name: "skb", arg: 1, scope: !784, file: !3, line: 436, type: !68)
!787 = !DILocalVariable(name: "ret", scope: !784, file: !3, line: 438, type: !52)
!788 = !DILocalVariable(name: "key", scope: !784, file: !3, line: 439, type: !167)
!789 = !DILocalVariable(name: "gopt", scope: !784, file: !3, line: 440, type: !723)
!790 = !DILocalVariable(name: "fmt", scope: !784, file: !3, line: 441, type: !422)
!791 = !DILocalVariable(name: "fmt", scope: !792, file: !3, line: 445, type: !227)
!792 = distinct !DILexicalBlock(scope: !793, file: !3, line: 445, column: 3)
!793 = distinct !DILexicalBlock(scope: !794, file: !3, line: 444, column: 15)
!794 = distinct !DILexicalBlock(scope: !784, file: !3, line: 444, column: 6)
!795 = !DILocation(line: 0, scope: !784)
!796 = !DILocation(line: 439, column: 2, scope: !784)
!797 = !DILocation(line: 439, column: 24, scope: !784)
!798 = !DILocation(line: 440, column: 2, scope: !784)
!799 = !DILocation(line: 440, column: 20, scope: !784)
!800 = !DILocation(line: 441, column: 2, scope: !784)
!801 = !DILocation(line: 441, column: 7, scope: !784)
!802 = !DILocation(line: 443, column: 8, scope: !784)
!803 = !DILocation(line: 444, column: 10, scope: !794)
!804 = !DILocation(line: 444, column: 6, scope: !784)
!805 = !DILocation(line: 445, column: 3, scope: !792)
!806 = !DILocation(line: 445, column: 3, scope: !793)
!807 = !DILocation(line: 446, column: 3, scope: !793)
!808 = !DILocation(line: 449, column: 8, scope: !784)
!809 = !DILocation(line: 450, column: 10, scope: !810)
!810 = distinct !DILexicalBlock(scope: !784, file: !3, line: 450, column: 6)
!811 = !DILocation(line: 450, column: 6, scope: !784)
!812 = !DILocation(line: 454, column: 41, scope: !784)
!813 = !DILocation(line: 451, column: 18, scope: !810)
!814 = !DILocation(line: 451, column: 3, scope: !810)
!815 = !DILocation(line: 454, column: 8, scope: !784)
!816 = !DILocation(line: 454, column: 23, scope: !784)
!817 = !DILocation(line: 453, column: 2, scope: !784)
!818 = !DILocation(line: 455, column: 2, scope: !784)
!819 = !DILocation(line: 456, column: 1, scope: !784)
!820 = distinct !DISubprogram(name: "_ip6geneve_set_tunnel", scope: !3, file: !3, line: 459, type: !217, scopeLine: 460, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !821)
!821 = !{!822, !823, !824, !825, !826, !830}
!822 = !DILocalVariable(name: "skb", arg: 1, scope: !820, file: !3, line: 459, type: !68)
!823 = !DILocalVariable(name: "key", scope: !820, file: !3, line: 461, type: !167)
!824 = !DILocalVariable(name: "gopt", scope: !820, file: !3, line: 462, type: !723)
!825 = !DILocalVariable(name: "ret", scope: !820, file: !3, line: 463, type: !52)
!826 = !DILocalVariable(name: "fmt", scope: !827, file: !3, line: 474, type: !227)
!827 = distinct !DILexicalBlock(scope: !828, file: !3, line: 474, column: 3)
!828 = distinct !DILexicalBlock(scope: !829, file: !3, line: 473, column: 15)
!829 = distinct !DILexicalBlock(scope: !820, file: !3, line: 473, column: 6)
!830 = !DILocalVariable(name: "fmt", scope: !831, file: !3, line: 489, type: !227)
!831 = distinct !DILexicalBlock(scope: !832, file: !3, line: 489, column: 3)
!832 = distinct !DILexicalBlock(scope: !833, file: !3, line: 488, column: 15)
!833 = distinct !DILexicalBlock(scope: !820, file: !3, line: 488, column: 6)
!834 = !DILocation(line: 0, scope: !820)
!835 = !DILocation(line: 461, column: 2, scope: !820)
!836 = !DILocation(line: 461, column: 24, scope: !820)
!837 = !DILocation(line: 462, column: 2, scope: !820)
!838 = !DILocation(line: 462, column: 20, scope: !820)
!839 = !DILocation(line: 465, column: 2, scope: !820)
!840 = !DILocation(line: 466, column: 2, scope: !820)
!841 = !DILocation(line: 466, column: 21, scope: !820)
!842 = !DILocation(line: 467, column: 6, scope: !820)
!843 = !DILocation(line: 467, column: 16, scope: !820)
!844 = !DILocation(line: 468, column: 6, scope: !820)
!845 = !DILocation(line: 468, column: 17, scope: !820)
!846 = !DILocation(line: 469, column: 6, scope: !820)
!847 = !DILocation(line: 469, column: 17, scope: !820)
!848 = !DILocation(line: 471, column: 8, scope: !820)
!849 = !DILocation(line: 473, column: 10, scope: !829)
!850 = !DILocation(line: 473, column: 6, scope: !820)
!851 = !DILocation(line: 474, column: 3, scope: !827)
!852 = !DILocation(line: 474, column: 3, scope: !828)
!853 = !DILocation(line: 475, column: 3, scope: !828)
!854 = !DILocation(line: 478, column: 2, scope: !820)
!855 = !DILocation(line: 479, column: 7, scope: !820)
!856 = !DILocation(line: 479, column: 17, scope: !820)
!857 = !DILocation(line: 480, column: 7, scope: !820)
!858 = !DILocation(line: 480, column: 12, scope: !820)
!859 = !DILocation(line: 481, column: 7, scope: !820)
!860 = !DILocation(line: 484, column: 14, scope: !820)
!861 = !DILocation(line: 485, column: 17, scope: !820)
!862 = !DILocation(line: 485, column: 2, scope: !820)
!863 = !DILocation(line: 485, column: 26, scope: !820)
!864 = !DILocation(line: 487, column: 8, scope: !820)
!865 = !DILocation(line: 488, column: 10, scope: !833)
!866 = !DILocation(line: 488, column: 6, scope: !820)
!867 = !DILocation(line: 489, column: 3, scope: !831)
!868 = !DILocation(line: 489, column: 3, scope: !832)
!869 = !DILocation(line: 490, column: 3, scope: !832)
!870 = !DILocation(line: 494, column: 1, scope: !820)
!871 = distinct !DISubprogram(name: "_ip6geneve_get_tunnel", scope: !3, file: !3, line: 497, type: !217, scopeLine: 498, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !872)
!872 = !{!873, !874, !875, !876, !877, !878}
!873 = !DILocalVariable(name: "skb", arg: 1, scope: !871, file: !3, line: 497, type: !68)
!874 = !DILocalVariable(name: "fmt", scope: !871, file: !3, line: 499, type: !422)
!875 = !DILocalVariable(name: "key", scope: !871, file: !3, line: 500, type: !167)
!876 = !DILocalVariable(name: "gopt", scope: !871, file: !3, line: 501, type: !723)
!877 = !DILocalVariable(name: "ret", scope: !871, file: !3, line: 502, type: !52)
!878 = !DILocalVariable(name: "fmt", scope: !879, file: !3, line: 507, type: !227)
!879 = distinct !DILexicalBlock(scope: !880, file: !3, line: 507, column: 3)
!880 = distinct !DILexicalBlock(scope: !881, file: !3, line: 506, column: 15)
!881 = distinct !DILexicalBlock(scope: !871, file: !3, line: 506, column: 6)
!882 = !DILocation(line: 0, scope: !871)
!883 = !DILocation(line: 499, column: 2, scope: !871)
!884 = !DILocation(line: 499, column: 7, scope: !871)
!885 = !DILocation(line: 500, column: 2, scope: !871)
!886 = !DILocation(line: 500, column: 24, scope: !871)
!887 = !DILocation(line: 501, column: 2, scope: !871)
!888 = !DILocation(line: 501, column: 20, scope: !871)
!889 = !DILocation(line: 504, column: 8, scope: !871)
!890 = !DILocation(line: 506, column: 10, scope: !881)
!891 = !DILocation(line: 506, column: 6, scope: !871)
!892 = !DILocation(line: 507, column: 3, scope: !879)
!893 = !DILocation(line: 507, column: 3, scope: !880)
!894 = !DILocation(line: 508, column: 3, scope: !880)
!895 = !DILocation(line: 511, column: 8, scope: !871)
!896 = !DILocation(line: 512, column: 10, scope: !897)
!897 = distinct !DILexicalBlock(scope: !871, file: !3, line: 512, column: 6)
!898 = !DILocation(line: 512, column: 6, scope: !871)
!899 = !DILocation(line: 516, column: 41, scope: !871)
!900 = !DILocation(line: 513, column: 18, scope: !897)
!901 = !DILocation(line: 513, column: 3, scope: !897)
!902 = !DILocation(line: 516, column: 8, scope: !871)
!903 = !DILocation(line: 516, column: 23, scope: !871)
!904 = !DILocation(line: 515, column: 2, scope: !871)
!905 = !DILocation(line: 518, column: 2, scope: !871)
!906 = !DILocation(line: 519, column: 1, scope: !871)
!907 = distinct !DISubprogram(name: "_ipip_set_tunnel", scope: !3, file: !3, line: 522, type: !217, scopeLine: 523, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !908)
!908 = !{!909, !910, !911, !912, !929, !930, !931, !935}
!909 = !DILocalVariable(name: "skb", arg: 1, scope: !907, file: !3, line: 522, type: !68)
!910 = !DILocalVariable(name: "key", scope: !907, file: !3, line: 524, type: !167)
!911 = !DILocalVariable(name: "data", scope: !907, file: !3, line: 525, type: !53)
!912 = !DILocalVariable(name: "iph", scope: !907, file: !3, line: 526, type: !913)
!913 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !914, size: 64)
!914 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !915, line: 86, size: 160, elements: !916)
!915 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!916 = !{!917, !918, !919, !920, !921, !922, !923, !924, !925, !927, !928}
!917 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !914, file: !915, line: 88, baseType: !112, size: 4, flags: DIFlagBitField, extraData: i64 0)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !914, file: !915, line: 89, baseType: !112, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !914, file: !915, line: 96, baseType: !112, size: 8, offset: 8)
!920 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !914, file: !915, line: 97, baseType: !118, size: 16, offset: 16)
!921 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !914, file: !915, line: 98, baseType: !118, size: 16, offset: 32)
!922 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !914, file: !915, line: 99, baseType: !118, size: 16, offset: 48)
!923 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !914, file: !915, line: 100, baseType: !112, size: 8, offset: 64)
!924 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !914, file: !915, line: 101, baseType: !112, size: 8, offset: 72)
!925 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !914, file: !915, line: 102, baseType: !926, size: 16, offset: 80)
!926 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !119, line: 31, baseType: !49)
!927 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !914, file: !915, line: 103, baseType: !129, size: 32, offset: 96)
!928 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !914, file: !915, line: 104, baseType: !129, size: 32, offset: 128)
!929 = !DILocalVariable(name: "data_end", scope: !907, file: !3, line: 527, type: !53)
!930 = !DILocalVariable(name: "ret", scope: !907, file: !3, line: 528, type: !52)
!931 = !DILocalVariable(name: "fmt", scope: !932, file: !3, line: 532, type: !227)
!932 = distinct !DILexicalBlock(scope: !933, file: !3, line: 532, column: 3)
!933 = distinct !DILexicalBlock(scope: !934, file: !3, line: 531, column: 38)
!934 = distinct !DILexicalBlock(scope: !907, file: !3, line: 531, column: 6)
!935 = !DILocalVariable(name: "fmt", scope: !936, file: !3, line: 543, type: !227)
!936 = distinct !DILexicalBlock(scope: !937, file: !3, line: 543, column: 3)
!937 = distinct !DILexicalBlock(scope: !938, file: !3, line: 542, column: 15)
!938 = distinct !DILexicalBlock(scope: !907, file: !3, line: 542, column: 6)
!939 = !DILocation(line: 0, scope: !907)
!940 = !DILocation(line: 524, column: 2, scope: !907)
!941 = !DILocation(line: 524, column: 24, scope: !907)
!942 = !DILocation(line: 525, column: 34, scope: !907)
!943 = !{!944, !243, i64 76}
!944 = !{!"__sk_buff", !243, i64 0, !243, i64 4, !243, i64 8, !243, i64 12, !243, i64 16, !243, i64 20, !243, i64 24, !243, i64 28, !243, i64 32, !243, i64 36, !243, i64 40, !243, i64 44, !237, i64 48, !243, i64 68, !243, i64 72, !243, i64 76, !243, i64 80, !243, i64 84, !243, i64 88, !243, i64 92, !243, i64 96, !237, i64 100, !237, i64 116, !243, i64 132, !243, i64 136, !243, i64 140, !237, i64 144, !945, i64 152, !243, i64 160, !243, i64 164, !237, i64 168, !243, i64 176}
!945 = !{!"long long", !237, i64 0}
!946 = !DILocation(line: 525, column: 23, scope: !907)
!947 = !DILocation(line: 525, column: 15, scope: !907)
!948 = !DILocation(line: 527, column: 38, scope: !907)
!949 = !{!944, !243, i64 80}
!950 = !DILocation(line: 527, column: 27, scope: !907)
!951 = !DILocation(line: 527, column: 19, scope: !907)
!952 = !DILocation(line: 531, column: 11, scope: !934)
!953 = !DILocation(line: 531, column: 26, scope: !934)
!954 = !DILocation(line: 531, column: 6, scope: !907)
!955 = !DILocation(line: 532, column: 3, scope: !932)
!956 = !DILocation(line: 532, column: 3, scope: !933)
!957 = !DILocation(line: 533, column: 3, scope: !933)
!958 = !DILocation(line: 526, column: 22, scope: !907)
!959 = !DILocation(line: 536, column: 6, scope: !907)
!960 = !DILocation(line: 536, column: 17, scope: !907)
!961 = !DILocation(line: 537, column: 11, scope: !962)
!962 = distinct !DILexicalBlock(scope: !907, file: !3, line: 537, column: 6)
!963 = !{!964, !237, i64 9}
!964 = !{!"iphdr", !237, i64 0, !237, i64 0, !237, i64 1, !244, i64 2, !244, i64 4, !244, i64 6, !237, i64 8, !237, i64 9, !244, i64 10, !243, i64 12, !243, i64 16}
!965 = !DILocation(line: 537, column: 20, scope: !962)
!966 = !DILocation(line: 537, column: 6, scope: !907)
!967 = !DILocation(line: 538, column: 7, scope: !968)
!968 = distinct !DILexicalBlock(scope: !962, file: !3, line: 537, column: 37)
!969 = !DILocation(line: 538, column: 19, scope: !968)
!970 = !DILocation(line: 539, column: 2, scope: !968)
!971 = !DILocation(line: 541, column: 8, scope: !907)
!972 = !DILocation(line: 542, column: 10, scope: !938)
!973 = !DILocation(line: 542, column: 6, scope: !907)
!974 = !DILocation(line: 543, column: 3, scope: !936)
!975 = !DILocation(line: 543, column: 3, scope: !937)
!976 = !DILocation(line: 544, column: 3, scope: !937)
!977 = !DILocation(line: 548, column: 1, scope: !907)
!978 = distinct !DISubprogram(name: "_ipip_get_tunnel", scope: !3, file: !3, line: 551, type: !217, scopeLine: 552, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !979)
!979 = !{!980, !981, !982, !983, !987}
!980 = !DILocalVariable(name: "skb", arg: 1, scope: !978, file: !3, line: 551, type: !68)
!981 = !DILocalVariable(name: "ret", scope: !978, file: !3, line: 553, type: !52)
!982 = !DILocalVariable(name: "key", scope: !978, file: !3, line: 554, type: !167)
!983 = !DILocalVariable(name: "fmt", scope: !978, file: !3, line: 555, type: !984)
!984 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 128, elements: !985)
!985 = !{!986}
!986 = !DISubrange(count: 16)
!987 = !DILocalVariable(name: "fmt", scope: !988, file: !3, line: 559, type: !227)
!988 = distinct !DILexicalBlock(scope: !989, file: !3, line: 559, column: 3)
!989 = distinct !DILexicalBlock(scope: !990, file: !3, line: 558, column: 15)
!990 = distinct !DILexicalBlock(scope: !978, file: !3, line: 558, column: 6)
!991 = !DILocation(line: 0, scope: !978)
!992 = !DILocation(line: 554, column: 2, scope: !978)
!993 = !DILocation(line: 554, column: 24, scope: !978)
!994 = !DILocation(line: 555, column: 2, scope: !978)
!995 = !DILocation(line: 555, column: 7, scope: !978)
!996 = !DILocation(line: 557, column: 8, scope: !978)
!997 = !DILocation(line: 558, column: 10, scope: !990)
!998 = !DILocation(line: 558, column: 6, scope: !978)
!999 = !DILocation(line: 559, column: 3, scope: !988)
!1000 = !DILocation(line: 559, column: 3, scope: !989)
!1001 = !DILocation(line: 560, column: 3, scope: !989)
!1002 = !DILocation(line: 563, column: 41, scope: !978)
!1003 = !DILocation(line: 563, column: 2, scope: !978)
!1004 = !DILocation(line: 564, column: 2, scope: !978)
!1005 = !DILocation(line: 565, column: 1, scope: !978)
!1006 = distinct !DISubprogram(name: "_ipip6_set_tunnel", scope: !3, file: !3, line: 568, type: !217, scopeLine: 569, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1007)
!1007 = !{!1008, !1009, !1010, !1011, !1012, !1013, !1014, !1018}
!1008 = !DILocalVariable(name: "skb", arg: 1, scope: !1006, file: !3, line: 568, type: !68)
!1009 = !DILocalVariable(name: "key", scope: !1006, file: !3, line: 570, type: !167)
!1010 = !DILocalVariable(name: "data", scope: !1006, file: !3, line: 571, type: !53)
!1011 = !DILocalVariable(name: "iph", scope: !1006, file: !3, line: 572, type: !913)
!1012 = !DILocalVariable(name: "data_end", scope: !1006, file: !3, line: 573, type: !53)
!1013 = !DILocalVariable(name: "ret", scope: !1006, file: !3, line: 574, type: !52)
!1014 = !DILocalVariable(name: "fmt", scope: !1015, file: !3, line: 578, type: !227)
!1015 = distinct !DILexicalBlock(scope: !1016, file: !3, line: 578, column: 3)
!1016 = distinct !DILexicalBlock(scope: !1017, file: !3, line: 577, column: 38)
!1017 = distinct !DILexicalBlock(scope: !1006, file: !3, line: 577, column: 6)
!1018 = !DILocalVariable(name: "fmt", scope: !1019, file: !3, line: 591, type: !227)
!1019 = distinct !DILexicalBlock(scope: !1020, file: !3, line: 591, column: 3)
!1020 = distinct !DILexicalBlock(scope: !1021, file: !3, line: 590, column: 15)
!1021 = distinct !DILexicalBlock(scope: !1006, file: !3, line: 590, column: 6)
!1022 = !DILocation(line: 0, scope: !1006)
!1023 = !DILocation(line: 570, column: 2, scope: !1006)
!1024 = !DILocation(line: 570, column: 24, scope: !1006)
!1025 = !DILocation(line: 571, column: 34, scope: !1006)
!1026 = !DILocation(line: 571, column: 23, scope: !1006)
!1027 = !DILocation(line: 571, column: 15, scope: !1006)
!1028 = !DILocation(line: 573, column: 38, scope: !1006)
!1029 = !DILocation(line: 573, column: 27, scope: !1006)
!1030 = !DILocation(line: 573, column: 19, scope: !1006)
!1031 = !DILocation(line: 577, column: 11, scope: !1017)
!1032 = !DILocation(line: 577, column: 26, scope: !1017)
!1033 = !DILocation(line: 577, column: 6, scope: !1006)
!1034 = !DILocation(line: 578, column: 3, scope: !1015)
!1035 = !DILocation(line: 578, column: 3, scope: !1016)
!1036 = !DILocation(line: 579, column: 3, scope: !1016)
!1037 = !DILocation(line: 572, column: 22, scope: !1006)
!1038 = !DILocation(line: 582, column: 2, scope: !1006)
!1039 = !DILocation(line: 583, column: 6, scope: !1006)
!1040 = !DILocation(line: 583, column: 17, scope: !1006)
!1041 = !DILocation(line: 584, column: 11, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1006, file: !3, line: 584, column: 6)
!1043 = !DILocation(line: 584, column: 20, scope: !1042)
!1044 = !DILocation(line: 584, column: 6, scope: !1006)
!1045 = !DILocation(line: 585, column: 3, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1042, file: !3, line: 584, column: 37)
!1047 = !DILocation(line: 585, column: 22, scope: !1046)
!1048 = !DILocation(line: 586, column: 2, scope: !1046)
!1049 = !DILocation(line: 588, column: 8, scope: !1006)
!1050 = !DILocation(line: 590, column: 10, scope: !1021)
!1051 = !DILocation(line: 590, column: 6, scope: !1006)
!1052 = !DILocation(line: 591, column: 3, scope: !1019)
!1053 = !DILocation(line: 591, column: 3, scope: !1020)
!1054 = !DILocation(line: 592, column: 3, scope: !1020)
!1055 = !DILocation(line: 596, column: 1, scope: !1006)
!1056 = distinct !DISubprogram(name: "_ipip6_get_tunnel", scope: !3, file: !3, line: 599, type: !217, scopeLine: 600, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1057)
!1057 = !{!1058, !1059, !1060, !1061, !1065}
!1058 = !DILocalVariable(name: "skb", arg: 1, scope: !1056, file: !3, line: 599, type: !68)
!1059 = !DILocalVariable(name: "ret", scope: !1056, file: !3, line: 601, type: !52)
!1060 = !DILocalVariable(name: "key", scope: !1056, file: !3, line: 602, type: !167)
!1061 = !DILocalVariable(name: "fmt", scope: !1056, file: !3, line: 603, type: !1062)
!1062 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 152, elements: !1063)
!1063 = !{!1064}
!1064 = !DISubrange(count: 19)
!1065 = !DILocalVariable(name: "fmt", scope: !1066, file: !3, line: 608, type: !227)
!1066 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 608, column: 3)
!1067 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 607, column: 15)
!1068 = distinct !DILexicalBlock(scope: !1056, file: !3, line: 607, column: 6)
!1069 = !DILocation(line: 0, scope: !1056)
!1070 = !DILocation(line: 602, column: 2, scope: !1056)
!1071 = !DILocation(line: 602, column: 24, scope: !1056)
!1072 = !DILocation(line: 603, column: 2, scope: !1056)
!1073 = !DILocation(line: 603, column: 7, scope: !1056)
!1074 = !DILocation(line: 605, column: 8, scope: !1056)
!1075 = !DILocation(line: 607, column: 10, scope: !1068)
!1076 = !DILocation(line: 607, column: 6, scope: !1056)
!1077 = !DILocation(line: 608, column: 3, scope: !1066)
!1078 = !DILocation(line: 608, column: 3, scope: !1067)
!1079 = !DILocation(line: 609, column: 3, scope: !1067)
!1080 = !DILocation(line: 612, column: 37, scope: !1056)
!1081 = !DILocation(line: 613, column: 5, scope: !1056)
!1082 = !DILocation(line: 612, column: 2, scope: !1056)
!1083 = !DILocation(line: 614, column: 2, scope: !1056)
!1084 = !DILocation(line: 615, column: 1, scope: !1056)
!1085 = distinct !DISubprogram(name: "_ip6ip6_set_tunnel", scope: !3, file: !3, line: 618, type: !217, scopeLine: 619, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1086)
!1086 = !{!1087, !1088, !1089, !1090, !1125, !1126, !1127, !1131}
!1087 = !DILocalVariable(name: "skb", arg: 1, scope: !1085, file: !3, line: 618, type: !68)
!1088 = !DILocalVariable(name: "key", scope: !1085, file: !3, line: 620, type: !167)
!1089 = !DILocalVariable(name: "data", scope: !1085, file: !3, line: 621, type: !53)
!1090 = !DILocalVariable(name: "iph", scope: !1085, file: !3, line: 622, type: !1091)
!1091 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1092, size: 64)
!1092 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !1093, line: 117, size: 320, elements: !1094)
!1093 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!1094 = !{!1095, !1096, !1097, !1101, !1102, !1103, !1104, !1124}
!1095 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !1092, file: !1093, line: 119, baseType: !112, size: 4, flags: DIFlagBitField, extraData: i64 0)
!1096 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !1092, file: !1093, line: 120, baseType: !112, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!1097 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !1092, file: !1093, line: 127, baseType: !1098, size: 24, offset: 8)
!1098 = !DICompositeType(tag: DW_TAG_array_type, baseType: !112, size: 24, elements: !1099)
!1099 = !{!1100}
!1100 = !DISubrange(count: 3)
!1101 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !1092, file: !1093, line: 129, baseType: !118, size: 16, offset: 32)
!1102 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !1092, file: !1093, line: 130, baseType: !112, size: 8, offset: 48)
!1103 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !1092, file: !1093, line: 131, baseType: !112, size: 8, offset: 56)
!1104 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !1092, file: !1093, line: 133, baseType: !1105, size: 128, offset: 64)
!1105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !16, line: 216, size: 128, elements: !1106)
!1106 = !{!1107}
!1107 = !DIDerivedType(tag: DW_TAG_member, name: "__in6_u", scope: !1105, file: !16, line: 223, baseType: !1108, size: 128)
!1108 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1105, file: !16, line: 218, size: 128, elements: !1109)
!1109 = !{!1110, !1116, !1120}
!1110 = !DIDerivedType(tag: DW_TAG_member, name: "__u6_addr8", scope: !1108, file: !16, line: 220, baseType: !1111, size: 128)
!1111 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1112, size: 128, elements: !985)
!1112 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !1113, line: 24, baseType: !1114)
!1113 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "")
!1114 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !1115, line: 38, baseType: !113)
!1115 = !DIFile(filename: "/usr/include/bits/types.h", directory: "")
!1116 = !DIDerivedType(tag: DW_TAG_member, name: "__u6_addr16", scope: !1108, file: !16, line: 221, baseType: !1117, size: 128)
!1117 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1118, size: 128, elements: !733)
!1118 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !1113, line: 25, baseType: !1119)
!1119 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !1115, line: 40, baseType: !50)
!1120 = !DIDerivedType(tag: DW_TAG_member, name: "__u6_addr32", scope: !1108, file: !16, line: 222, baseType: !1121, size: 128)
!1121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1122, size: 128, elements: !60)
!1122 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !1113, line: 26, baseType: !1123)
!1123 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !1115, line: 42, baseType: !7)
!1124 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !1092, file: !1093, line: 134, baseType: !1105, size: 128, offset: 192)
!1125 = !DILocalVariable(name: "data_end", scope: !1085, file: !3, line: 623, type: !53)
!1126 = !DILocalVariable(name: "ret", scope: !1085, file: !3, line: 624, type: !52)
!1127 = !DILocalVariable(name: "fmt", scope: !1128, file: !3, line: 628, type: !227)
!1128 = distinct !DILexicalBlock(scope: !1129, file: !3, line: 628, column: 3)
!1129 = distinct !DILexicalBlock(scope: !1130, file: !3, line: 627, column: 38)
!1130 = distinct !DILexicalBlock(scope: !1085, file: !3, line: 627, column: 6)
!1131 = !DILocalVariable(name: "fmt", scope: !1132, file: !3, line: 640, type: !227)
!1132 = distinct !DILexicalBlock(scope: !1133, file: !3, line: 640, column: 3)
!1133 = distinct !DILexicalBlock(scope: !1134, file: !3, line: 639, column: 15)
!1134 = distinct !DILexicalBlock(scope: !1085, file: !3, line: 639, column: 6)
!1135 = !DILocation(line: 0, scope: !1085)
!1136 = !DILocation(line: 620, column: 2, scope: !1085)
!1137 = !DILocation(line: 620, column: 24, scope: !1085)
!1138 = !DILocation(line: 621, column: 34, scope: !1085)
!1139 = !DILocation(line: 621, column: 23, scope: !1085)
!1140 = !DILocation(line: 621, column: 15, scope: !1085)
!1141 = !DILocation(line: 623, column: 38, scope: !1085)
!1142 = !DILocation(line: 623, column: 27, scope: !1085)
!1143 = !DILocation(line: 623, column: 19, scope: !1085)
!1144 = !DILocation(line: 627, column: 11, scope: !1130)
!1145 = !DILocation(line: 627, column: 26, scope: !1130)
!1146 = !DILocation(line: 627, column: 6, scope: !1085)
!1147 = !DILocation(line: 628, column: 3, scope: !1128)
!1148 = !DILocation(line: 628, column: 3, scope: !1129)
!1149 = !DILocation(line: 629, column: 3, scope: !1129)
!1150 = !DILocation(line: 622, column: 24, scope: !1085)
!1151 = !DILocation(line: 632, column: 6, scope: !1085)
!1152 = !DILocation(line: 632, column: 17, scope: !1085)
!1153 = !DILocation(line: 633, column: 11, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1085, file: !3, line: 633, column: 6)
!1155 = !{!1156, !237, i64 6}
!1156 = !{!"ipv6hdr", !237, i64 0, !237, i64 0, !237, i64 1, !244, i64 4, !237, i64 6, !237, i64 7, !1157, i64 8, !1157, i64 24}
!1157 = !{!"in6_addr", !237, i64 0}
!1158 = !DILocation(line: 633, column: 19, scope: !1154)
!1159 = !DILocation(line: 633, column: 6, scope: !1085)
!1160 = !DILocation(line: 634, column: 3, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1154, file: !3, line: 633, column: 45)
!1162 = !DILocation(line: 634, column: 22, scope: !1161)
!1163 = !DILocation(line: 635, column: 2, scope: !1161)
!1164 = !DILocation(line: 637, column: 8, scope: !1085)
!1165 = !DILocation(line: 639, column: 10, scope: !1134)
!1166 = !DILocation(line: 639, column: 6, scope: !1085)
!1167 = !DILocation(line: 640, column: 3, scope: !1132)
!1168 = !DILocation(line: 640, column: 3, scope: !1133)
!1169 = !DILocation(line: 641, column: 3, scope: !1133)
!1170 = !DILocation(line: 645, column: 1, scope: !1085)
!1171 = distinct !DISubprogram(name: "_ip6ip6_get_tunnel", scope: !3, file: !3, line: 648, type: !217, scopeLine: 649, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1172)
!1172 = !{!1173, !1174, !1175, !1176, !1177}
!1173 = !DILocalVariable(name: "skb", arg: 1, scope: !1171, file: !3, line: 648, type: !68)
!1174 = !DILocalVariable(name: "ret", scope: !1171, file: !3, line: 650, type: !52)
!1175 = !DILocalVariable(name: "key", scope: !1171, file: !3, line: 651, type: !167)
!1176 = !DILocalVariable(name: "fmt", scope: !1171, file: !3, line: 652, type: !1062)
!1177 = !DILocalVariable(name: "fmt", scope: !1178, file: !3, line: 657, type: !227)
!1178 = distinct !DILexicalBlock(scope: !1179, file: !3, line: 657, column: 3)
!1179 = distinct !DILexicalBlock(scope: !1180, file: !3, line: 656, column: 15)
!1180 = distinct !DILexicalBlock(scope: !1171, file: !3, line: 656, column: 6)
!1181 = !DILocation(line: 0, scope: !1171)
!1182 = !DILocation(line: 651, column: 2, scope: !1171)
!1183 = !DILocation(line: 651, column: 24, scope: !1171)
!1184 = !DILocation(line: 652, column: 2, scope: !1171)
!1185 = !DILocation(line: 652, column: 7, scope: !1171)
!1186 = !DILocation(line: 654, column: 8, scope: !1171)
!1187 = !DILocation(line: 656, column: 10, scope: !1180)
!1188 = !DILocation(line: 656, column: 6, scope: !1171)
!1189 = !DILocation(line: 657, column: 3, scope: !1178)
!1190 = !DILocation(line: 657, column: 3, scope: !1179)
!1191 = !DILocation(line: 658, column: 3, scope: !1179)
!1192 = !DILocation(line: 661, column: 37, scope: !1171)
!1193 = !DILocation(line: 662, column: 5, scope: !1171)
!1194 = !DILocation(line: 661, column: 2, scope: !1171)
!1195 = !DILocation(line: 663, column: 2, scope: !1171)
!1196 = !DILocation(line: 664, column: 1, scope: !1171)
!1197 = distinct !DISubprogram(name: "_xfrm_get_state", scope: !3, file: !3, line: 667, type: !217, scopeLine: 668, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1198)
!1198 = !{!1199, !1200, !1201, !1205}
!1199 = !DILocalVariable(name: "skb", arg: 1, scope: !1197, file: !3, line: 667, type: !68)
!1200 = !DILocalVariable(name: "x", scope: !1197, file: !3, line: 669, type: !201)
!1201 = !DILocalVariable(name: "fmt", scope: !1197, file: !3, line: 670, type: !1202)
!1202 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 272, elements: !1203)
!1203 = !{!1204}
!1204 = !DISubrange(count: 34)
!1205 = !DILocalVariable(name: "ret", scope: !1197, file: !3, line: 671, type: !52)
!1206 = !DILocation(line: 0, scope: !1197)
!1207 = !DILocation(line: 669, column: 2, scope: !1197)
!1208 = !DILocation(line: 669, column: 24, scope: !1197)
!1209 = !DILocation(line: 670, column: 2, scope: !1197)
!1210 = !DILocation(line: 670, column: 7, scope: !1197)
!1211 = !DILocation(line: 673, column: 8, scope: !1197)
!1212 = !DILocation(line: 674, column: 10, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1197, file: !3, line: 674, column: 6)
!1214 = !DILocation(line: 674, column: 6, scope: !1197)
!1215 = !DILocation(line: 677, column: 39, scope: !1197)
!1216 = !{!1217, !243, i64 0}
!1217 = !{!"bpf_xfrm_state", !243, i64 0, !243, i64 4, !244, i64 8, !244, i64 10, !237, i64 12}
!1218 = !DILocation(line: 677, column: 46, scope: !1197)
!1219 = !{!1217, !243, i64 4}
!1220 = !DILocation(line: 678, column: 5, scope: !1197)
!1221 = !DILocation(line: 677, column: 2, scope: !1197)
!1222 = !DILocation(line: 679, column: 2, scope: !1197)
!1223 = !DILocation(line: 680, column: 1, scope: !1197)
