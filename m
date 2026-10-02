Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4ADCA5FDD
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2026 20:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CD110FA05;
	Fri,  2 Oct 2026 20:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=rodier.me header.i=@rodier.me header.b="CkBABBWW";
	dkim-atps=neutral
X-Greylist: delayed 527 seconds by postgrey-1.36 at gabe;
 Fri, 02 Oct 2026 17:48:22 UTC
Received: from smtp.rodier.me (smtp.rodier.me [45.63.101.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8147410E661;
 Fri,  2 Oct 2026 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rodier.me;
 s=pigment-2026; t=1790962773;
 bh=OMNWxvcLPLrCp47YMourg4MDTxDlYsId2cyTrdKBEoQ=;
 h=Subject:From:To:Date:From;
 b=CkBABBWW/C4vtTCMc/jvCn6Y798qaUYTawfBNZ8BhELfkqNCekaGjKjeVAq1tpv7F
 emDuWJK75gADO+Bp2nlWUMUdV1Liyf9eAkLHOaDakwzaOvJ+YCW5Jnwii3mEReVsbh
 sbxygHCNf6kij9plQs75mdOHWmj35b0oDE83ofrJL+/JMBmPyjf8GzpxO00/+JEJmk
 y5AJQkAAdsm8XwGwpe6W4ErKkpyMrk4JIHytJI4DSXPeEA005mCIx8yUxVEVLyHZ4c
 7RMVe36dUNKNtolLIy3yPqYWi4NNS53Z2QTJdGljksBCnj5ktEsIxCa02FImy1Wx5c
 +J2nbKPja90RQ==
Authentication-Results: smtp.rodier.me;
 auth=pass smtp.auth=andre smtp.mailfrom=andre@rodier.me
Message-ID: <7bdded2ad711c4c4bb5c80aea2aed3f546fd4065.camel@rodier.me>
Subject: i915: WARNING in intel_modeset_verify_crtc: mismatch in
 set_context_latency (expected 0, found 63616), 7.0.13
From: =?ISO-8859-1?Q?Andr=E9?= Rodier <andre@rodier.me>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 02 Oct 2026 19:39:31 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:45:17 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hello,

I am forwarding a i915 driver crash, I hope it can be useful.


~~~
Oct 02 19:09:20 rubin kernel: ------------[ cut here ]------------
Oct 02 19:09:20 rubin kernel: i915 0000:00:02.0: [drm] pipe state doesn't m=
atch!
Oct 02 19:09:20 rubin kernel: WARNING: drivers/gpu/drm/i915/display/intel_m=
odeset_verify.c:225 at intel_modeset_verify_crtc+0x325/0x550 [i915], CPU#4:=
 KMS thread/2938
Oct 02 19:09:20 rubin kernel: Modules linked in: uinput vhost_net vhost vho=
st_iotlb tap tun sd_mod scsi_mod scsi_common snd_seq_dummy snd_hrtimer snd_=
seq snd_seq_device nft_reject_ipv4 act_csum
cls_u32 sch_htb nft_chain_nat nf_nat ccm algif_aead des3_ede_x86_64 des_gen=
eric libdes rfcomm cmac md4 algif_skcipher algif_hash bnep af_alg binfmt_mi=
sc snd_soc_skl_hda_dsp
snd_soc_intel_sof_board_helpers snd_sof_probes snd_soc_intel_hda_dsp_common=
 wireguard libcurve25519 libchacha20poly1305 libchacha libpoly1305 ip6_udp_=
tunnel udp_tunnel snd_hda_codec_intelhdmi
snd_hda_codec_hdmi snd_hda_codec_alc269 snd_hda_codec_realtek_lib snd_hda_s=
codec_component snd_soc_rt700 snd_hda_codec_generic regmap_sdw snd_soc_dmic=
 snd_hda_intel snd_sof_pci_intel_tgl
snd_sof_pci_intel_cnl nls_ascii snd_sof_intel_hda_generic nls_cp437 vfat so=
undwire_intel fat snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_so=
c_hdac_hda snd_sof_intel_hda_mlink
snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof =
snd_sof_utils snd_soc_acpi_intel_match
Oct 02 19:09:20 rubin kernel:  snd_soc_acpi_intel_sdca_quirks soundwire_gen=
eric_allocation snd_soc_sdw_utils bridge snd_soc_acpi crc8 intel_uncore_fre=
quency soundwire_bus intel_uncore_frequency_common
stp snd_soc_sdca x86_pkg_temp_thermal llc iwlmvm intel_powerclamp snd_soc_a=
vs coretemp snd_soc_hda_codec snd_hda_ext_core mac80211 snd_hda_codec mei_h=
dcp mei_pxp kvm_intel snd_hda_core intel_rapl_msr
snd_intel_dspcfg snd_intel_sdw_acpi libarc4 btusb kvm snd_hwdep uvcvideo bt=
mtk snd_soc_core btrtl irqbypass videobuf2_vmalloc uvc snd_compress btbcm r=
apl videobuf2_memops iwlwifi intel_cstate
snd_pcm_dmaengine processor_thermal_device_pci_legacy btintel snd_pcm video=
buf2_v4l2 wmi_bmof processor_thermal_device videodev snd_timer processor_th=
ermal_wt_hint bluetooth intel_uncore cfg80211
platform_temperature_control videobuf2_common snd processor_thermal_soc_sli=
der pcspkr mc ecdh_generic platform_profile soundcore processor_thermal_rfi=
m mei_me rfkill processor_thermal_rapl mei
nft_reject_inet intel_rapl_common mxc4005 nf_reject_ipv4
Oct 02 19:09:20 rubin kernel:  processor_thermal_wt_req nf_reject_ipv6 indu=
strialio_triggered_buffer processor_thermal_power_floor kfifo_buf nft_rejec=
t processor_thermal_mbox intel_soc_dts_iosf
igen6_edac industrialio nft_limit int3403_thermal ac int340x_thermal_zone i=
ntel_pmc_core pmt_telemetry pmt_discovery nft_ct intel_hid pmt_class int340=
0_thermal intel_pmc_ssram_telemetry sparse_keymap
acpi_thermal_rel acpi_tad acpi_pad nf_conntrack cdc_mbim nf_defrag_ipv6 joy=
dev cdc_wdm nf_defrag_ipv4 evdev nf_log_syslog nft_log pkcs8_key_parser msr=
 i2c_dev parport_pc nf_tables ppdev lp parport
efi_pstore nfnetlink zram lz4hc_compress lz4_compress efivarfs ip_tables x_=
tables autofs4 ext4 crc16 mbcache jbd2 crc32c_cryptoapi btrfs libblake2b xo=
r raid6_pq dm_crypt dm_mod hid_logitech_hidpp
hid_logitech_dj cdc_ncm cdc_ether usbnet mii xe drm_gpuvm configfs drm_gpus=
vm_helper gpu_sched drm_ttm_helper drm_exec drm_suballoc_helper usbhid i915=
 drm_buddy ttm i2c_algo_bit drm_display_helper
spi_pxa2xx_platform hid_multitouch dw_dmac cec hid_generic xhci_pci
Oct 02 19:09:20 rubin kernel:  dw_dmac_core nvme xhci_hcd iTCO_wdt spi_pxa2=
xx_core rc_core i2c_hid_acpi nvme_core intel_pmc_bxt i2c_hid drm_client_lib=
 watchdog usbcore nvme_keyring hid intel_lpss_pci
drm_kms_helper r8169 video i2c_i801 nvme_auth ghash_clmulni_intel intel_lps=
s drm thunderbolt aesni_intel realtek i2c_smbus usb_common idma64 intel_vse=
c hkdf wmi battery button
Oct 02 19:09:20 rubin kernel: CPU: 4 UID: 1000 PID: 2938 Comm: KMS thread T=
ainted: G     U  W           7.0.13+deb13-amd64 #1 PREEMPT(lazy)  Debian 7.=
0.13-1~bpo13+1
Oct 02 19:09:20 rubin kernel: Tainted: [U]=3DUSER, [W]=3DWARN
Oct 02 19:09:20 rubin kernel: Hardware name: GPD G1621-02/G1621-02, BIOS 2.=
04 09/01/2022
Oct 02 19:09:20 rubin kernel: RIP: 0010:intel_modeset_verify_crtc+0x328/0x5=
50 [i915]
Oct 02 19:09:20 rubin kernel: Code: d9 0e 00 48 85 ff 74 04 48 8b 7f 08 48 =
8b 5f 50 48 85 db 75 03 48 8b 1f e8 05 4f fd ca 48 89 c6 48 8d 3d 5b a0 d2 =
ff 48 89 da <67> 48 0f b9 3a 31 f6 4c 89 f7 48 c7
c2 6f 25 e9 c0 e8 c2 20 f9 ff
Oct 02 19:09:20 rubin kernel: RSP: 0018:ffffd3c6c9cfb6f0 EFLAGS: 00010282
Oct 02 19:09:20 rubin kernel: RAX: ffffffffc0e8a177 RBX: ffff8a99829d1c20 R=
CX: 0000000000000000
Oct 02 19:09:20 rubin kernel: RDX: ffff8a99829d1c20 RSI: ffffffffc0e8a177 R=
DI: ffffffffc0881e40
Oct 02 19:09:20 rubin kernel: RBP: ffff8a998b9d6000 R08: 0000000000000000 R=
09: 0000000000000000
Oct 02 19:09:20 rubin kernel: R10: ffff8a9989e18cd0 R11: fefefefefefefeff R=
12: ffff8a99d8035800
Oct 02 19:09:20 rubin kernel: R13: ffff8a998f17e000 R14: ffff8a99e05ec000 R=
15: ffff8a99b7f3c000
Oct 02 19:09:20 rubin kernel: FS:  00007f82cc8a96c0(0000) GS:ffff8a9d920200=
00(0000) knlGS:0000000000000000
Oct 02 19:09:20 rubin kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Oct 02 19:09:20 rubin kernel: CR2: 00007f3284feecc8 CR3: 0000000180e6e005 C=
R4: 0000000000f72ef0
Oct 02 19:09:20 rubin kernel: PKRU: 55555554
Oct 02 19:09:20 rubin kernel: Call Trace:
Oct 02 19:09:20 rubin kernel:  <TASK>
Oct 02 19:09:20 rubin kernel:  intel_atomic_commit_tail+0x10fa/0x1990 [i915=
]
Oct 02 19:09:20 rubin kernel:  intel_atomic_commit+0x23d/0x280 [i915]
Oct 02 19:09:20 rubin kernel:  drm_atomic_commit+0xb1/0xe0 [drm]
Oct 02 19:09:20 rubin kernel:  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
Oct 02 19:09:20 rubin kernel:  drm_mode_atomic_ioctl+0xac9/0xd00 [drm]
Oct 02 19:09:20 rubin kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10 [drm=
]
Oct 02 19:09:20 rubin kernel:  drm_ioctl_kernel+0xae/0x100 [drm]
Oct 02 19:09:20 rubin kernel:  drm_ioctl+0x28f/0x520 [drm]
Oct 02 19:09:20 rubin kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10 [drm=
]
Oct 02 19:09:20 rubin kernel:  __x64_sys_ioctl+0x96/0xe0
Oct 02 19:09:20 rubin kernel:  do_syscall_64+0xcd/0x15f0
Oct 02 19:09:20 rubin kernel:  ? __x64_sys_ioctl+0xb0/0xe0
Oct 02 19:09:20 rubin kernel:  ? do_syscall_64+0x10a/0x15f0
Oct 02 19:09:20 rubin kernel:  ? __pfx_drm_mode_addfb2_ioctl+0x10/0x10 [drm=
]
Oct 02 19:09:20 rubin kernel:  ? __x64_sys_ioctl+0xb0/0xe0
Oct 02 19:09:20 rubin kernel:  ? do_syscall_64+0x10a/0x15f0
Oct 02 19:09:20 rubin kernel:  ? vm_normal_page+0x37/0x100
Oct 02 19:09:20 rubin kernel:  ? ptep_set_access_flags+0x32/0x40
Oct 02 19:09:20 rubin kernel:  ? wp_page_reuse+0x8d/0xa0
Oct 02 19:09:20 rubin kernel:  ? do_wp_page+0x963/0x1010
Oct 02 19:09:20 rubin kernel:  ? __x64_sys_ioctl+0xb0/0xe0
Oct 02 19:09:20 rubin kernel:  ? __handle_mm_fault+0xa6d/0xf70
Oct 02 19:09:20 rubin kernel:  ? count_memcg_events+0xeb/0x1b0
Oct 02 19:09:20 rubin kernel:  ? handle_mm_fault+0x212/0x320
Oct 02 19:09:20 rubin kernel:  ? do_user_addr_fault+0x2c3/0x7f0
Oct 02 19:09:20 rubin kernel:  ? irqentry_exit+0x85/0x6a0
Oct 02 19:09:20 rubin kernel:  ? clear_bhb_loop+0x30/0x80
Oct 02 19:09:20 rubin kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Oct 02 19:09:20 rubin kernel: RIP: 0033:0x7f82d531865b
Oct 02 19:09:20 rubin kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 =
c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 =
00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44
24 18 64 48 2b 04 25 28 00 00
Oct 02 19:09:20 rubin kernel: RSP: 002b:00007f82cc8a8250 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000010
Oct 02 19:09:20 rubin kernel: RAX: ffffffffffffffda RBX: 00005568d73cd080 R=
CX: 00007f82d531865b
Oct 02 19:09:20 rubin kernel: RDX: 00007f82cc8a82f0 RSI: 00000000c03864bc R=
DI: 000000000000000c
Oct 02 19:09:20 rubin kernel: RBP: 00007f82cc8a82f0 R08: 0000000000000001 R=
09: 0000000000000001
Oct 02 19:09:20 rubin kernel: R10: 0000000000000027 R11: 0000000000000246 R=
12: 00000000c03864bc
Oct 02 19:09:20 rubin kernel: R13: 000000000000000c R14: 00007f82a41ca360 R=
15: 00005568d2ef3890
Oct 02 19:09:20 rubin kernel:  </TASK>
Oct 02 19:09:20 rubin kernel: ---[ end trace 0000000000000000 ]---
~~~

~~~
lspci -nnk | grep -A3 VGA
00:02.0 VGA compatible controller [0300]: Intel Corporation TigerLake-LP GT=
2 [Iris Xe Graphics] [8086:9a49] (rev 03)
        DeviceName: Onboard - Video
        Kernel driver in use: i915
        Kernel modules: i915, xe
~~~


Kind regards,
Andr=C3=A9 Rodier
