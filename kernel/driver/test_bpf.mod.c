#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/elfnote-lto.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;
BUILD_LTO_INFO;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0xf704969, "module_layout" },
	{ 0xf247fba3, "param_ops_int" },
	{ 0xa11a85dc, "param_array_ops" },
	{ 0x60abed74, "param_ops_string" },
	{ 0x9106a75f, "kfree_skb_list" },
	{ 0x5cc79ffd, "skb_segment" },
	{ 0x356feb17, "bpf_prog_destroy" },
	{ 0xf1d88e16, "bpf_prog_free" },
	{ 0x4d7272e4, "migrate_enable" },
	{ 0x53569707, "this_cpu_off" },
	{ 0x3a26ed11, "sched_clock" },
	{ 0xf84bd6ee, "bpf_stats_enabled_key" },
	{ 0xb43f9365, "ktime_get" },
	{ 0x49608959, "migrate_disable" },
	{ 0x7cd8d75e, "page_offset_base" },
	{ 0x97651e6c, "vmemmap_base" },
	{ 0xa21071e2, "init_net" },
	{ 0x37a0cba, "kfree" },
	{ 0x691624fa, "bpf_prog_select_runtime" },
	{ 0xaf195b6e, "bpf_prog_alloc" },
	{ 0xac1cd91d, "bpf_prog_create" },
	{ 0x670ecece, "__x86_indirect_thunk_rbx" },
	{ 0x800473f, "__cond_resched" },
	{ 0xdd64e639, "strscpy" },
	{ 0xcbd4898c, "fortify_panic" },
	{ 0xa916b694, "strnlen" },
	{ 0x92997ed8, "_printk" },
	{ 0xe2d5255a, "strcmp" },
	{ 0x656e4a6e, "snprintf" },
	{ 0x65487097, "__x86_indirect_thunk_rax" },
	{ 0x4c236f6f, "__x86_indirect_thunk_r15" },
	{ 0x31549b2a, "__x86_indirect_thunk_r10" },
	{ 0x7c797b6, "kmem_cache_alloc_trace" },
	{ 0xd731cdd9, "kmalloc_caches" },
	{ 0x1a9a433c, "prandom_u32_state" },
	{ 0xd58e70dd, "net_rand_noise" },
	{ 0xb8b9f817, "kmalloc_order_trace" },
	{ 0x87a21cb3, "__ubsan_handle_out_of_bounds" },
	{ 0xeb233a45, "__kmalloc" },
	{ 0xa648e561, "__ubsan_handle_shift_out_of_bounds" },
	{ 0xdf69be0e, "skb_add_rx_frag" },
	{ 0xf97fec25, "__free_pages" },
	{ 0x408bdc34, "__netdev_alloc_skb" },
	{ 0x57264a21, "alloc_pages" },
	{ 0x5a1f8d90, "skb_put" },
	{ 0xdbd16536, "kfree_skb_reason" },
	{ 0xd8a85e15, "__alloc_skb" },
	{ 0xd0da656b, "__stack_chk_fail" },
	{ 0x5b8239ca, "__x86_return_thunk" },
	{ 0xbdfb6dbb, "__fentry__" },
};

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "10C856A3620842ACECEADBA");
