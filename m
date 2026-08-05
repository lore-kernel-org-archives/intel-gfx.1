Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C0AC55174
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2026 08:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EFF10ED8B;
	Wed,  5 Aug 2026 08:44:23 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E694910ED88;
 Wed,  5 Aug 2026 08:44:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1093491168852360054=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_drm/=7Bi915=2C_xe=7D/dis?=
 =?utf-8?q?play=3A_add_core_workaround_query_to_display_parent_interface_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 05 Aug 2026 08:44:22 -0000
Message-ID: <178591946289.20501.2367318511177371151@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803115417.1760484-1-jani.nikula@intel.com>
In-Reply-To: <20260803115417.1760484-1-jani.nikula@intel.com>
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
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1093491168852360054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}/display: add core workaround query to display parent interface (rev4)
URL   : https://patchwork.freedesktop.org/series/171200/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18943_full -> Patchwork_171200v4_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in Patchwork_171200v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][1] ([i915#9323])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][2] ([i915#280])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#3281]) +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          ([PASS][4], [PASS][5]) -> [ABORT][6] ([i915#15542] / [i915#7975]) +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#4860])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][8] ([i915#4613])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          NOTRUN -> [SKIP][9] ([i915#4613])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk2/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_pread@display:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#3282]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@gem_pread@display.html

  * igt@gem_pread@exhaustion:
    - shard-glk10:        NOTRUN -> [WARN][11] ([i915#2658])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@gem_pread@exhaustion.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#15656])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#3297])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#3297])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#3297] / [i915#3323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#2856])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#2527])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#8399])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][19] +87 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu-1:       NOTRUN -> [SKIP][20] ([i915#16079])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][21] ([i915#4817] / [i915#7443])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][22] ([i915#16182] / [i915#4817])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk11/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [FAIL][23] ([i915#14888]) +2 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         ([PASS][24], [PASS][25]) -> [FAIL][26] ([i915#15662]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#5286]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         ([PASS][28], [PASS][29]) -> [FAIL][30] ([i915#15733] / [i915#5138]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#5286]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4538] / [i915#5190])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][33] ([i915#6095]) +14 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#6095]) +51 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#6095]) +67 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][36] -> [INCOMPLETE][37] ([i915#14694] / [i915#15582])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#14098] / [i915#6095]) +31 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#6095]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#10307] / [i915#6095]) +26 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#11151] / [i915#7828]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#11151] / [i915#7828]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#15330] / [i915#3116])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3555]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#13049]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         ([PASS][47], [PASS][48]) -> [FAIL][49] ([i915#13566]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][50] -> [FAIL][51] ([i915#13566]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          NOTRUN -> [FAIL][52] ([i915#13566]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#4103])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][54] ([i915#13691])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#16361]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][56] ([i915#16361])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@vrr:
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#16600])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#9934])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg1:          ([PASS][59], [PASS][60]) -> [DMESG-WARN][61] ([i915#4423])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-15/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-16/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          ([PASS][62], [PASS][63]) -> [FAIL][64] ([i915#13027]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-glk:          ([PASS][65], [PASS][66]) -> [FAIL][67] ([i915#13027]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][68] -> [INCOMPLETE][69] ([i915#16276] / [i915#6113])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][70] ([i915#16276] / [i915#6113])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#15643]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#15989]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#15989]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#15989]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          [PASS][75] -> [SKIP][76] ([i915#15989]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#15102]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk10:        NOTRUN -> [SKIP][78] +185 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][79] ([i915#15102]) +12 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#15990])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][81] +24 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#9766])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#1825]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#15990] / [i915#8708])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#15102] / [i915#3023]) +6 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#15102]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][87] +17 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#16644] / [i915#3555] / [i915#8228])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#15458])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#15458])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][91] ([i915#12756] / [i915#13409] / [i915#13476])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][92] ([i915#13409] / [i915#13476])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#14712])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#15709]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#13958])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#14259])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#9685])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-glk11:        NOTRUN -> [SKIP][98] +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk11/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [PASS][99] -> [DMESG-WARN][100] ([i915#4423]) +2 other tests dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-12/igt@kms_pm_rpm@i2c.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-18/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][101] -> [SKIP][102] ([i915#15073])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#11520]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#11520]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][105] ([i915#11520])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][106] ([i915#11520]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#11520]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#9683])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#9732]) +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#1072] / [i915#9732]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#3555])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#3555] / [i915#9906])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#9906])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf_pmu@module-unload:
    - shard-tglu-1:       NOTRUN -> [ABORT][114] ([i915#13029] / [i915#15778])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@perf_pmu@module-unload.html
    - shard-glk10:        NOTRUN -> [ABORT][115] ([i915#15778])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          ([PASS][116], [PASS][117]) -> [INCOMPLETE][118] ([i915#13520])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@perf_pmu@rc6-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@perf_pmu@rc6-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#8516])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#8516])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt0.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - shard-dg2:          ([PASS][121], [SKIP][122]) ([i915#1849] / [i915#2582]) -> [PASS][123]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@fbdev@info.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@fbdev@info.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@fbdev@info.html

  * igt@fbdev@read:
    - shard-dg2:          ([SKIP][124], [PASS][125]) ([i915#2582]) -> [PASS][126]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@fbdev@read.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@fbdev@read.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@fbdev@read.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          ([INCOMPLETE][127], [INCOMPLETE][128]) ([i915#13356] / [i915#16348]) -> [PASS][129]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@gem_ccs@suspend-resume.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          ([PASS][130], [INCOMPLETE][131]) ([i915#13356] / [i915#16348]) -> [PASS][132]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][133] ([i915#13356] / [i915#16348]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          ([PASS][135], [DMESG-WARN][136]) ([i915#4391] / [i915#4423]) -> [PASS][137]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@gem_eio@hibernate.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@gem_eio@hibernate.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-13/igt@gem_eio@hibernate.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [INCOMPLETE][138] ([i915#13356]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_workarounds@suspend-resume.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_workarounds@suspend-resume.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          ([INCOMPLETE][140], [INCOMPLETE][141]) ([i915#4817]) -> [PASS][142]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          ([PASS][143], [INCOMPLETE][144]) ([i915#4817]) -> [PASS][145]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_suspend@sysfs-reader.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         ([FAIL][146], [PASS][147]) ([i915#15662]) -> [PASS][148] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         ([DMESG-WARN][149], [PASS][150]) ([i915#12935]) -> [PASS][151]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-mtlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          ([INCOMPLETE][152], [PASS][153]) ([i915#15582]) -> [PASS][154]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_color@ctm-max:
    - shard-dg2:          ([SKIP][155], [PASS][156]) ([i915#12655]) -> [PASS][157] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_color@ctm-max.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_color@ctm-max.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_color@ctm-max.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4:
    - shard-dg2:          ([SKIP][158], [PASS][159]) ([i915#15529]) -> [PASS][160] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          ([PASS][161], [FAIL][162]) ([i915#13566]) -> [PASS][163] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-dg2:          ([SKIP][164], [PASS][165]) ([i915#11190] / [i915#16707]) -> [PASS][166]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2:          ([PASS][167], [SKIP][168]) -> [PASS][169]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_fb_coherency@memset-crc.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_fb_coherency@memset-crc.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          ([SKIP][170], [PASS][171]) ([i915#1849]) -> [PASS][172]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_fbcon_fbt@fbc.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg1:          ([PASS][173], [FAIL][174]) ([i915#13027]) -> [PASS][175]
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-tglu:         ([FAIL][176], [FAIL][177]) ([i915#13027]) -> [PASS][178]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-tglu:         ([FAIL][179], [PASS][180]) ([i915#13027]) -> [PASS][181] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - shard-dg2:          ([SKIP][182], [PASS][183]) ([i915#5354]) -> [PASS][184] +4 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_flip@flip-vs-modeset-vs-hang.html

  * igt@kms_flip_event_leak@basic:
    - shard-dg1:          ([DMESG-WARN][185], [PASS][186]) ([i915#4423]) -> [PASS][187] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-18/igt@kms_flip_event_leak@basic.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt@kms_flip_event_leak@basic.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-19/igt@kms_flip_event_leak@basic.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          ([SKIP][188], [PASS][189]) ([i915#3555] / [i915#8813]) -> [PASS][190] +6 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         ([PASS][191], [SKIP][192]) ([i915#15672]) -> [PASS][193]
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-5/igt@kms_force_connector_basic@prune-stale-modes.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          ([PASS][194], [SKIP][195]) ([i915#16708] / [i915#5354]) -> [PASS][196] +3 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-rkl:          ([SKIP][197], [SKIP][198]) ([i915#15989]) -> [PASS][199]
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          ([PASS][200], [SKIP][201]) ([i915#15989]) -> [PASS][202] +2 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt:
    - shard-glk:          [SKIP][203] -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-dg2:          ([PASS][205], [SKIP][206]) ([i915#16746] / [i915#3555]) -> [PASS][207] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_invalid_mode@int-max-clock.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_invalid_mode@int-max-clock.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_plane@pixel-format-linear-modifier:
    - shard-dg2:          ([PASS][208], [SKIP][209]) ([i915#8825]) -> [PASS][210] +2 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane@pixel-format-linear-modifier.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2:          ([SKIP][211], [PASS][212]) ([i915#15329] / [i915#9423]) -> [PASS][213] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          ([SKIP][214], [PASS][215]) ([i915#15329] / [i915#3555] / [i915#9423]) -> [PASS][216]
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          ([PASS][217], [SKIP][218]) ([i915#15329] / [i915#3555] / [i915#6953] / [i915#9423]) -> [PASS][219] +2 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - shard-dg2:          ([SKIP][220], [PASS][221]) ([i915#15329]) -> [PASS][222] +23 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          ([PASS][223], [SKIP][224]) ([i915#15073]) -> [PASS][225] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          ([PASS][226], [SKIP][227]) ([i915#15073]) -> [PASS][228]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-dg1:          ([SKIP][229], [SKIP][230]) ([i915#15073]) -> [PASS][231]
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          ([SKIP][232], [SKIP][233]) ([i915#15073]) -> [PASS][234] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          ([PASS][235], [SKIP][236]) ([i915#15073]) -> [PASS][237] +2 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-dg2:          ([PASS][238], [SKIP][239]) ([i915#15347]) -> [PASS][240]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_properties@colorop-properties-legacy.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_properties@colorop-properties-legacy.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          ([SKIP][241], [PASS][242]) ([i915#16707]) -> [PASS][243] +54 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@fbdev@unaligned-read:
    - shard-dg2:          ([SKIP][244], [PASS][245]) ([i915#2582]) -> [SKIP][246] ([i915#2582]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@fbdev@unaligned-read.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@fbdev@unaligned-read.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@fbdev@unaligned-read.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          ([SKIP][247], [SKIP][248]) ([i915#6335]) -> [SKIP][249] ([i915#14544] / [i915#6335])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          ([PASS][250], [INCOMPLETE][251]) ([i915#13356]) -> [INCOMPLETE][252] ([i915#13356]) +1 other test incomplete
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          ([SKIP][253], [SKIP][254]) ([i915#14544] / [i915#280]) -> [SKIP][255] ([i915#280])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          ([SKIP][256], [SKIP][257]) ([i915#14544] / [i915#4525]) -> [SKIP][258] ([i915#4525])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          ([SKIP][259], [SKIP][260]) ([i915#14544] / [i915#3281]) -> [SKIP][261] ([i915#3281]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          ([SKIP][262], [SKIP][263]) ([i915#14544] / [i915#4613]) -> [SKIP][264] ([i915#4613]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-rkl:          ([SKIP][265], [SKIP][266]) ([i915#14544] / [i915#2527]) -> [SKIP][267] ([i915#2527])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gen9_exec_parse@bb-start-cmd.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          ([PASS][268], [INCOMPLETE][269]) ([i915#4817]) -> [INCOMPLETE][270] ([i915#4817])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          ([PASS][271], [INCOMPLETE][272]) ([i915#16182] / [i915#4817]) -> [INCOMPLETE][273] ([i915#16182] / [i915#4817])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk6/igt@i915_suspend@fence-restore-untiled.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk5/igt@i915_suspend@fence-restore-untiled.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk6/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          ([SKIP][274], [SKIP][275]) ([i915#14544] / [i915#7707]) -> [SKIP][276] ([i915#7707])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@intel_hwmon@hwmon-write.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg2:          ([FAIL][277], [SKIP][278]) ([i915#14888] / [i915#16707]) -> [SKIP][279] ([i915#16707])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          ([SKIP][280], [SKIP][281]) ([i915#16707] / [i915#9531]) -> [SKIP][282] ([i915#9531])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg1:          ([SKIP][283], [SKIP][284]) ([i915#4538] / [i915#5286]) -> [SKIP][285] ([i915#4423] / [i915#4538] / [i915#5286])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          ([SKIP][286], [SKIP][287]) ([i915#14544] / [i915#5286]) -> [SKIP][288] ([i915#5286]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2:          ([SKIP][289], [SKIP][290]) ([i915#16707] / [i915#3828]) -> [SKIP][291] ([i915#3828]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-rkl:          ([SKIP][292], [SKIP][293]) ([i915#14544] / [i915#3828]) -> [SKIP][294] ([i915#3828])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2:          ([SKIP][295], [SKIP][296]) ([i915#16707] / [i915#3828]) -> [SKIP][297] ([i915#16707])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2:          ([SKIP][298], [SKIP][299]) ([i915#16707]) -> [SKIP][300] +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          ([SKIP][301], [SKIP][302]) ([i915#14544] / [i915#3638]) -> [SKIP][303] ([i915#3638])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2:          ([SKIP][304], [SKIP][305]) ([i915#16707] / [i915#4538] / [i915#5190]) -> [SKIP][306] ([i915#4538] / [i915#5190]) +11 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          ([SKIP][307], [SKIP][308]) ([i915#16707] / [i915#4538] / [i915#5190]) -> [SKIP][309] ([i915#16707] / [i915#5190]) +8 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          ([SKIP][310], [SKIP][311]) ([i915#10307] / [i915#16707] / [i915#6095]) -> [SKIP][312] ([i915#16707]) +10 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          ([SKIP][313], [SKIP][314]) ([i915#10307] / [i915#16707] / [i915#6095]) -> [SKIP][315] ([i915#10307] / [i915#6095]) +10 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
    - shard-rkl:          ([SKIP][316], [SKIP][317]) ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][318] ([i915#14098] / [i915#6095]) +6 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          ([SKIP][319], [SKIP][320]) ([i915#14544] / [i915#6095]) -> [SKIP][321] ([i915#6095]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          ([SKIP][322], [SKIP][323]) ([i915#12313] / [i915#16707]) -> [SKIP][324] ([i915#16707]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          ([SKIP][325], [SKIP][326]) ([i915#12805] / [i915#16707]) -> [SKIP][327] ([i915#12805])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2:          ([SKIP][328], [SKIP][329]) ([i915#16707] / [i915#6095]) -> [SKIP][330] ([i915#6095]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          ([SKIP][331], [SKIP][332]) ([i915#16707] / [i915#6095]) -> [SKIP][333] ([i915#16707])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg2:          ([SKIP][334], [SKIP][335]) ([i915#13783] / [i915#16707]) -> [SKIP][336] ([i915#16707])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cdclk@plane-scaling.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cdclk@plane-scaling.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          ([SKIP][337], [SKIP][338]) ([i915#14544] / [i915#16471]) -> [SKIP][339] ([i915#16471])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          ([SKIP][340], [SKIP][341]) ([i915#16471]) -> [SKIP][342] ([i915#14544] / [i915#16471])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          ([SKIP][343], [SKIP][344]) ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][345] ([i915#11151] / [i915#7828]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          ([SKIP][346], [SKIP][347]) ([i915#15865] / [i915#16707]) -> [SKIP][348] ([i915#15865]) +3 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          ([SKIP][349], [SKIP][350]) ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][351] ([i915#15330] / [i915#3116])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          ([SKIP][352], [SKIP][353]) ([i915#15330] / [i915#16707]) -> [SKIP][354] ([i915#16707]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          ([SKIP][355], [SKIP][356]) ([i915#14544] / [i915#15865]) -> [SKIP][357] ([i915#15865])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_content_protection@lic-type-1.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_content_protection@lic-type-1.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          ([SKIP][358], [SKIP][359]) ([i915#15865] / [i915#9433]) -> [SKIP][360] ([i915#9433])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_content_protection@mei-interface.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          ([SKIP][361], [SKIP][362]) ([i915#15865] / [i915#16707]) -> [SKIP][363] ([i915#16707]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@srm.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_content_protection@srm.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          ([SKIP][364], [SKIP][365]) ([i915#13049] / [i915#16707]) -> [SKIP][366] ([i915#16707])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          ([SKIP][367], [SKIP][368]) ([i915#16707] / [i915#3555]) -> [SKIP][369] ([i915#3555]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2:          ([SKIP][370], [SKIP][371]) ([i915#16707] / [i915#3555]) -> [SKIP][372] ([i915#16707]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_cursor_crc@cursor-random-max-size.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-random-max-size.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          ([SKIP][373], [SKIP][374]) ([i915#13049] / [i915#16707]) -> [SKIP][375] ([i915#13049]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          ([SKIP][376], [SKIP][377]) ([i915#11190] / [i915#16707] / [i915#4103]) -> [SKIP][378] ([i915#11190] / [i915#16707])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2:          ([SKIP][379], [SKIP][380]) ([i915#16707] / [i915#4103]) -> [SKIP][381] ([i915#16707])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          ([SKIP][382], [SKIP][383]) ([i915#13046] / [i915#16707] / [i915#5354]) -> [SKIP][384] ([i915#13046] / [i915#5354]) +3 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          ([SKIP][385], [SKIP][386]) ([i915#13046] / [i915#16707] / [i915#5354]) -> [SKIP][387] ([i915#16707]) +3 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          ([SKIP][388], [SKIP][389]) ([i915#16707] / [i915#4103]) -> [SKIP][390] ([i915#4103]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          ([SKIP][391], [SKIP][392]) ([i915#14544] / [i915#4103]) -> [SKIP][393] ([i915#4103])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          ([SKIP][394], [SKIP][395]) ([i915#13749] / [i915#16707]) -> [SKIP][396] ([i915#13749])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-mst.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          ([SKIP][397], [SKIP][398]) ([i915#13748] / [i915#14544]) -> [SKIP][399] ([i915#13748])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2:          ([SKIP][400], [SKIP][401]) ([i915#13748] / [i915#16707]) -> [SKIP][402] ([i915#13748])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dp_link_training@uhbr-sst.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_dp_link_training@uhbr-sst.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          ([SKIP][403], [SKIP][404]) ([i915#16361] / [i915#16707]) -> [SKIP][405] ([i915#16707]) +3 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_dsc@dsc-with-bpc-formats.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          ([SKIP][406], [SKIP][407]) ([i915#16361] / [i915#16707]) -> [SKIP][408] ([i915#16361]) +3 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          ([SKIP][409], [SKIP][410]) ([i915#14544] / [i915#16081]) -> [SKIP][411] ([i915#16081])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@display-4x.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          ([SKIP][412], [SKIP][413]) ([i915#14544] / [i915#16600]) -> [SKIP][414] ([i915#16600])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@vrr.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_feature_discovery@vrr.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-rkl:          ([SKIP][415], [SKIP][416]) ([i915#14544] / [i915#9934]) -> [SKIP][417] ([i915#9934]) +4 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-rkl:          ([SKIP][418], [SKIP][419]) ([i915#9934]) -> [SKIP][420] ([i915#14544] / [i915#9934])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg2:          ([SKIP][421], [PASS][422]) ([i915#5354]) -> [SKIP][423] ([i915#5354]) +6 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip@basic-flip-vs-dpms.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_flip@basic-flip-vs-dpms.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2:          ([PASS][424], [SKIP][425]) ([i915#3555] / [i915#8813]) -> [SKIP][426] ([i915#3555] / [i915#8813]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          ([SKIP][427], [SKIP][428]) ([i915#14544] / [i915#15643]) -> [SKIP][429] ([i915#15643]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2:          ([PASS][430], [SKIP][431]) ([i915#3555]) -> [SKIP][432] ([i915#3555])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_flip_tiling@flip-change-tiling.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_tiling@flip-change-tiling.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          ([SKIP][433], [PASS][434]) ([i915#16708]) -> [SKIP][435] ([i915#16708]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          ([PASS][436], [SKIP][437]) ([i915#16708] / [i915#5354]) -> [SKIP][438] ([i915#16708] / [i915#5354]) +5 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][439], [SKIP][440]) ([i915#15990] / [i915#16708] / [i915#5354] / [i915#8708]) -> [SKIP][441] ([i915#16708] / [i915#5354]) +9 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          ([SKIP][442], [PASS][443]) ([i915#15989]) -> [SKIP][444] ([i915#15989]) +13 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          ([SKIP][445], [SKIP][446]) -> [SKIP][447] ([i915#14544]) +2 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-rte:
    - shard-rkl:          ([SKIP][448], [SKIP][449]) ([i915#14544]) -> [SKIP][450] +40 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][451], [SKIP][452]) ([i915#15990] / [i915#16708]) -> [SKIP][453] ([i915#16708]) +16 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          ([SKIP][454], [SKIP][455]) ([i915#15989] / [i915#16708]) -> [SKIP][456] ([i915#16708]) +15 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-glk:          ([PASS][457], [SKIP][458]) -> [SKIP][459] +4 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][460], [SKIP][461]) ([i915#15104] / [i915#15990] / [i915#16708]) -> [SKIP][462] ([i915#16708]) +2 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          ([SKIP][463], [SKIP][464]) ([i915#15102] / [i915#16708]) -> [SKIP][465] ([i915#16708]) +19 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][466], [SKIP][467]) ([i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][468] ([i915#16708] / [i915#5354]) +14 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-dg1:          ([SKIP][469], [SKIP][470]) ([i915#15102] / [i915#4423]) -> [SKIP][471] ([i915#15102])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          ([SKIP][472], [SKIP][473]) ([i915#15990] / [i915#16708] / [i915#5354] / [i915#8708]) -> [SKIP][474] ([i915#15990] / [i915#8708]) +12 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          ([SKIP][475], [SKIP][476]) ([i915#15991] / [i915#16708] / [i915#5354]) -> [SKIP][477] ([i915#15991] / [i915#5354]) +26 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          ([SKIP][478], [SKIP][479]) ([i915#14544] / [i915#1825]) -> [SKIP][480] ([i915#1825])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2:          ([SKIP][481], [SKIP][482]) ([i915#15102]) -> [SKIP][483] ([i915#10433] / [i915#15102]) +3 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          ([SKIP][484], [SKIP][485]) ([i915#14544] / [i915#15102]) -> [SKIP][486] ([i915#15102]) +10 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][487], [SKIP][488]) ([i915#15990] / [i915#16708]) -> [SKIP][489] ([i915#15990]) +21 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][490], [SKIP][491]) ([i915#15989] / [i915#16708]) -> [SKIP][492] ([i915#15989]) +18 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][493], [SKIP][494]) ([i915#15104] / [i915#15990] / [i915#16708]) -> [SKIP][495] ([i915#15104] / [i915#15990]) +2 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][496], [SKIP][497]) ([i915#10433] / [i915#15102]) -> [SKIP][498] ([i915#15102]) +1 other test skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          ([SKIP][499], [SKIP][500]) ([i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][501] ([i915#15102]) +16 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          ([SKIP][502], [SKIP][503]) ([i915#10433] / [i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][504] ([i915#16708] / [i915#5354]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          ([SKIP][505], [SKIP][506]) ([i915#15991] / [i915#16708] / [i915#5354]) -> [SKIP][507] ([i915#16708] / [i915#5354]) +29 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          ([SKIP][508], [SKIP][509]) ([i915#1825]) -> [SKIP][510] ([i915#14544] / [i915#1825])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          ([SKIP][511], [SKIP][512]) ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][513] ([i915#15102] / [i915#3023]) +7 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-suspend.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          ([SKIP][514], [SKIP][515]) ([i915#15991] / [i915#16708]) -> [SKIP][516] ([i915#15991]) +33 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2:          ([SKIP][517], [SKIP][518]) ([i915#15991] / [i915#16708]) -> [SKIP][519] ([i915#16708]) +37 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite:
    - shard-rkl:          ([SKIP][520], [SKIP][521]) ([i915#15102]) -> [SKIP][522] ([i915#14544] / [i915#15102])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-suspend:
    - shard-dg2:          ([SKIP][523], [SKIP][524]) ([i915#15102] / [i915#16708]) -> [SKIP][525] ([i915#15102]) +19 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-suspend.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-suspend.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-suspend.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          ([SKIP][526], [SKIP][527]) ([i915#16518] / [i915#16707] / [i915#3555] / [i915#8228]) -> [SKIP][528] ([i915#16707])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_hdr@bpc-switch.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          ([SKIP][529], [PASS][530]) ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][531] ([i915#16644] / [i915#3555] / [i915#8228])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_hdr@static-toggle.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_hdr@static-toggle.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          ([SKIP][532], [SKIP][533]) ([i915#16518] / [i915#16707] / [i915#3555] / [i915#8228]) -> [SKIP][534] ([i915#16518] / [i915#3555] / [i915#8228])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-dg2:          ([SKIP][535], [PASS][536]) ([i915#16746] / [i915#3555]) -> [SKIP][537] ([i915#16746] / [i915#3555]) +2 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_invalid_mode@zero-hdisplay.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          ([SKIP][538], [SKIP][539]) ([i915#16707] / [i915#6301]) -> [SKIP][540] ([i915#6301])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-dg2:          ([PASS][541], [SKIP][542]) ([i915#11190] / [i915#16707]) -> [SKIP][543] ([i915#11190] / [i915#16707]) +2 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          ([PASS][544], [DMESG-FAIL][545]) ([i915#118]) -> [DMESG-WARN][546] ([i915#118])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          ([SKIP][547], [PASS][548]) ([i915#8825]) -> [SKIP][549] ([i915#8825]) +3 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-dg2:          ([PASS][550], [SKIP][551]) ([i915#16753]) -> [SKIP][552] ([i915#16753])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane@planar-pixel-format-settings.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          ([SKIP][553], [SKIP][554]) ([i915#13958] / [i915#16707]) -> [SKIP][555] ([i915#13958])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-4.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-4.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          ([SKIP][556], [SKIP][557]) ([i915#13958] / [i915#16707]) -> [SKIP][558] ([i915#16707]) +1 other test skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-none.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-none.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          ([SKIP][559], [SKIP][560]) ([i915#14259] / [i915#16707]) -> [SKIP][561] ([i915#14259])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_multiple@tiling-y.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-dg2:          ([SKIP][562], [PASS][563]) ([i915#15329] / [i915#9423]) -> [SKIP][564] ([i915#15329] / [i915#9423]) +3 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - shard-dg2:          ([SKIP][565], [PASS][566]) ([i915#15329]) -> [SKIP][567] ([i915#15329]) +19 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-dg2:          ([PASS][568], [SKIP][569]) ([i915#15329] / [i915#6953] / [i915#9423]) -> [SKIP][570] ([i915#15329] / [i915#6953] / [i915#9423])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-rkl:          ([SKIP][571], [SKIP][572]) ([i915#14544] / [i915#9685]) -> [SKIP][573] ([i915#9685])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_pm_dc@dc5-pageflip-negative.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][574] ([i915#15128]) -> [SKIP][575] ([i915#15739])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          ([SKIP][576], [SKIP][577]) ([i915#3828] / [i915#9340]) -> [SKIP][578] ([i915#9340])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          ([SKIP][579], [SKIP][580]) ([i915#3828] / [i915#9340]) -> [SKIP][581] ([i915#9340])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          ([SKIP][582], [PASS][583]) ([i915#15073]) -> [SKIP][584] ([i915#15073])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg1:          ([SKIP][585], [PASS][586]) ([i915#15073]) -> [SKIP][587] ([i915#15073]) +3 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          ([PASS][588], [SKIP][589]) ([i915#3547]) -> [SKIP][590] ([i915#3547])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@drm-resources-equal.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          ([PASS][591], [SKIP][592]) ([i915#15073]) -> [SKIP][593] ([i915#15073]) +2 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          ([SKIP][594], [SKIP][595]) ([i915#11520] / [i915#14544]) -> [SKIP][596] ([i915#11520]) +2 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-rkl:          ([SKIP][597], [SKIP][598]) ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][599] ([i915#1072] / [i915#9732]) +7 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr@pr-cursor-mmap-cpu.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          ([SKIP][600], [SKIP][601]) ([i915#14544] / [i915#15949]) -> [SKIP][602] ([i915#15949])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          ([SKIP][603], [SKIP][604]) ([i915#16707] / [i915#4235]) -> [SKIP][605] ([i915#4235])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_rotation_crc@exhaust-fences.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          ([SKIP][606], [SKIP][607]) ([i915#12755] / [i915#15867] / [i915#16707]) -> [SKIP][608] ([i915#16707])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-90.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          ([SKIP][609], [SKIP][610]) ([i915#12755] / [i915#15867] / [i915#16707] / [i915#5190]) -> [SKIP][611] ([i915#16707] / [i915#5190]) +1 other test skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          ([SKIP][612], [SKIP][613]) ([i915#12755] / [i915#15867] / [i915#16707]) -> [SKIP][614] ([i915#12755] / [i915#15867])
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          ([SKIP][615], [SKIP][616]) ([i915#16707] / [i915#8623]) -> [SKIP][617] ([i915#16707])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          ([SKIP][618], [PASS][619]) ([i915#16707]) -> [SKIP][620] ([i915#16707]) +54 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vblank@ts-continuation-modeset.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_vblank@ts-continuation-modeset.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_vblank@ts-continuation-modeset.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          ([SKIP][621], [SKIP][622]) ([i915#16707] / [i915#9906]) -> [SKIP][623] ([i915#9906])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-basic-fastset.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          ([SKIP][624], [SKIP][625]) ([i915#15243] / [i915#16707] / [i915#3555]) -> [SKIP][626] ([i915#16707])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-dpms.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_vrr@flip-dpms.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          ([SKIP][627], [SKIP][628]) ([i915#16707] / [i915#9906]) -> [SKIP][629] ([i915#16707]) +1 other test skip
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@max-min.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_vrr@max-min.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          ([SKIP][630], [SKIP][631]) ([i915#14544] / [i915#9906]) -> [SKIP][632] ([i915#9906])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          ([SKIP][633], [SKIP][634]) ([i915#14544] / [i915#2435]) -> [SKIP][635] ([i915#2435])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         ([FAIL][636], [PASS][637]) ([i915#4349]) -> [FAIL][638] ([i915#4349])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          ([SKIP][639], [SKIP][640]) ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][641] ([i915#3291] / [i915#3708])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@prime_vgem@basic-read.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@prime_vgem@basic-read.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          ([SKIP][642], [SKIP][643]) ([i915#14544] / [i915#9917]) -> [SKIP][644] ([i915#9917])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@sriov_basic@bind-unbind-vf.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@sriov_basic@bind-unbind-vf.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12935]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12935
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15347]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16753]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16753
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_18943 -> Patchwork_171200v4

  CI-20190529: 20190529
  CI_DRM_18943: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9036: 9036
  Patchwork_171200v4: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/index.html

--===============1093491168852360054==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/{i915, xe}/display: add core workaround =
query to display parent interface (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171200/">https://patchwork.freedesktop.org/series/171200/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171200v4/index.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171200v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18943_full -&gt; Patchwork_171200v=
4_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171200v4_full that come from kno=
wn issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_ccs@suspend-resume.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-w=
c-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-1=
/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542">i915#15542</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#=
7975</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@gem_fence_thrash@bo-copy.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@gem_lmem_swapping@heavy-v=
erify-multi-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk2/igt@gem_lmem_swapping@parallel-=
multi.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@gem_pread@display.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@gem_pread@exhaustion.html"=
>WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_tiled_pread_basic@basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_userptr_blits@coherenc=
y-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@gem_userptr_blits@dmabuf-s=
ync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_userptr_blits@dmabuf-s=
ync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@gen9_exec_parse@cmd-crossi=
ng-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@gen9_exec_parse@cmd-crossi=
ng-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@i915_pm_freq_api@freq-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk2/igt@i915_pm_rpm@gem-execbuf-str=
ess-pc8.html">SKIP</a> +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@i915_query@query-topology=
-unsupported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@i915_suspend@basic-s3-wit=
hout-i915.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk11/igt@i915_suspend@fence-restore=
-tiled2untiled.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_async_flips@alternate-=
sync-async-flip-atomic@pipe-c-hdmi-a-2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-tra=
nsition@pipe-a-hdmi-a-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-tglu-6/igt@kms_atomic_transition@plane-=
all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-4/igt@k=
ms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5662">i915#15662</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rota=
te-0-hflip.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171200v4/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw=
-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_big_fb@yf-tiled-8bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_ccs@bad-rotation-90-y=
-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +51 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg1-15/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +67 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs@pipe-b-hdmi-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_ccs@crc-primary-su=
spend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +31 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-4/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer=
-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer=
-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_chamelium_edid@dp-edid=
-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_chamelium_edid@vga-ed=
id-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_content_protection@dp-=
mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_cursor_crc@cursor-offs=
creen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_cursor_crc@cursor-off=
screen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/s=
hard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#1=
3566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-h=
dmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171200v4/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x=
85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_cursor_crc@cursor-rand=
om-64x21.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_cursor_legacy@basic-bu=
sy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_display_modes@extende=
d-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_dsc@dsc-fractional-bp=
p-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_feature_discovery@vrr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-=
on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-17/igt@kms_flip@flip-vs-blocking-wf-vblank.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg1-15/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard=
-dg1-16/igt@kms_flip@flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#44=
23</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_18943/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"=
>PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171200v4/shard-rkl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13027">i915#13027</a>) +1 other test fail</li>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">P=
ASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171200v4/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/sha=
rd-rkl-7/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i=
915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_flip@flip-vs-suspend@a=
-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16276">i915#16276</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_flip_scaled_crc@flip-p=
010-4tile-to-p016-4tile.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@f=
bchdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171200v4/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-li=
near.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@f=
bcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +185 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@h=
dr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
ipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8=
708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_frontbuffer_tracking@p=
sr-farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu=
:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
srhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
srhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> +17 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_hdr@static-toggle-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_joiner@basic-force-ult=
ra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_joiner@basic-force-ult=
ra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_pipe_crc_basic@suspend=
-read-crc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_pipe_crc_basic@suspend=
-read-crc@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_pipe_stress@stress-xr=
gb8888-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_plane@pixel-format-4-t=
iled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_plane_multiple@2x-tili=
ng-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_plane_multiple@tiling=
-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_pm_dc@dc5-pageflip-ne=
gative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk11/igt@kms_pm_lpsp@screens-disabl=
ed.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg1-12/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-1=
8/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +2 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/=
shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-plane-m=
ove-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-plane-m=
ove-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@kms_psr2_sf@pr-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-=
plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_psr2_su@page_flip-nv1=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_psr@fbc-psr-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_psr@fbc-psr-primary-pa=
ge-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_setmode@invalid-clone=
-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@kms_vrr@negative-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/igt@kms_vrr@seamless-rr-switch=
-virtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-tglu-1/igt@perf_pmu@module-unload.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15778">i915#15778</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-glk10/igt@perf_pmu@module-unload.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@perf_pmu@rc6-suspend.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@p=
erf_pmu@rc6-suspend.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@perf_pmu@rc6-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-8/igt@perf_pmu@rc6@other-idle-gt=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8516">i915#8516</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@fbdev@info.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@fbdev@info=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@fbdev@info.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@fbdev@read.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@fbdev@read=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2582">i915#2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@fbdev@read.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2=
-4/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16=
348</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171200v4/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-com=
pfmt0-smem-lmem0.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compre=
ssed-compfmt0-smem-lmem0.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171=
200v4/shard-dg2-8/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-sme=
m-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-comp=
fmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shar=
d-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@gem_eio@hibernate.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@=
gem_eio@hibernate.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard=
-dg1-13/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-3/igt@gem_workarounds@suspend-resume.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171200v4/shard-rkl-7/igt@gem_workarounds@suspend-resume.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html">INC=
OMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">=
i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171200v4/shard-rkl-8/igt@i915_suspend@fence-restore-untiled.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@sysfs-reader.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/=
igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-r=
kl-7/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-tra=
nsition-fencing.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-tglu-3/igt@kms_atomic_transition@plane-all-mode=
set-transition-fencing.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-10/igt@=
kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rota=
te-0-hflip-async-flip.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-h=
w-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12935">i915#12935</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/=
shard-mtlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-asyn=
c-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc=
-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/sh=
ard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-=
a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_color@ctm-max.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@k=
ms_color@ctm-max.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12655">i915#12655</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_colo=
r@ctm-max.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915=
#15529</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171200v4/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171200v4/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-flip-after-cursor-v=
arying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@basic-flip-after-cursor=
-varying-size.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6=
/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_fb_coherency@memset-crc.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
10/igt@kms_fb_coherency@memset-crc.html">SKIP</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_fb=
_coherency@memset-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@k=
ms_fbcon_fbt@fbc.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/1849">i915#1849</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_fbcon_=
fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_18943/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank-interruptible.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171200v4/shard-dg1-18/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible.html">PASS</a></li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171200v4/shard-tglu-6/igt@kms_flip@flip-vs-expired-v=
blank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@c-hdmi-a1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interr=
uptible@c-hdmi-a1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-tglu-6/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_flip@flip-vs-modeset-vs-hang.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-dg2-7/igt@kms_flip@flip-vs-modeset-vs-hang.html">PASS</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v=
4/shard-dg2-3/igt@kms_flip@flip-vs-modeset-vs-hang.html">PASS</a> +4 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-18/igt@kms_flip_event_leak@basic.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-dg1-17/igt@kms_flip_event_leak@basic.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard=
-dg1-19/igt@kms_flip_event_leak@basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32b=
pp-4tiledg2rcccs-upscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i9=
15#8813</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171200v4/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bp=
p-4tiledg2rcccs-upscaling.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-mtlp-5/igt@kms_force_connector_basic@prune-stale-modes=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15672">i915#15672</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171200v4/shard-mtlp-4/igt@kms_force_connector_basic@prune=
-stale-modes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri=
-indfb-draw-render.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200=
v4/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-=
render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dr=
aw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-=
draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-1/igt@kms_frontbuf=
fer_tracking@fbchdr-rgb101010-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur=
-indfb-draw-blt.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-prims=
crn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@km=
s_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> +2=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb=
-plflip-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171200v4/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p=
-primscrn-indfb-plflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_invalid_mode@int-max-clock.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-d=
g2-10/igt@kms_invalid_mode@int-max-clock.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171200v4/shard-dg2-3/igt@kms_invalid_mode@int-max-clock.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-10/igt@kms_plane@pixel-format-linear-modifier.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i91=
5#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171200v4/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html">=
PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-=
75-with-pixel-format.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-75-with-pixel-format.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1712=
00v4/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pix=
el-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clippin=
g-clamping-pixel-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scal=
er-with-clipping-clamping-pixel-formats.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-pixel-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard=
-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">PASS</a> +2 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-2=
5@pipe-d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25=
@pipe-d.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_plane_scaling=
@planes-upscale-factor-0-25@pipe-d.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt=
@kms_pm_rpm@dpms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg1-15/igt@km=
s_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-r=
kl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/s=
hard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4=
/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i91=
5#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171200v4/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-d=
g2-5/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_properties@colorop-properties-legacy.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-dg2-10/igt@kms_properties@colorop-properties-legacy.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347=
">i915#15347</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_171200v4/shard-dg2-6/igt@kms_properties@colorop-properties-legac=
y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-dg2-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171200v4/shard-dg2-6/igt@kms_vblank@ts-continuation-dpms-suspend.h=
tml">PASS</a> +54 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@fbdev@unaligned-read.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@=
fbdev@unaligned-read.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@fbdev=
@unaligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2582">i915#2582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-chec=
k.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_18943/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171200v4/shard-rkl-6/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171200v4/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/=
igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4=
/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_171200v4/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl=
-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#328=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171200v4/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#32=
81</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@gem_lmem_swapping@parallel=
-random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl=
-3/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#252=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171200v4/shard-rkl-8/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#25=
27</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@i915_suspend@fence-restore-tiled2untiled.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLET=
E</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171200v4/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2unt=
iled.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk6/igt@i915_suspend@fence-restore-untiled.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-glk5/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16=
182</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171200v4/shard-glk6/igt@i915_suspend@fence-restore-untiled.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@intel_hwmon@hwmon-write.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/ig=
t@intel_hwmon@hwmon-write.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/s=
hard-rkl-3/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip-at=
omic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_18943/shard-dg2-10/igt@kms_async_flips@alternate-sync-async-flip-atomi=
c.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14888">i915#14888</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_as=
ync_flips@alternate-sync-async-flip-atomic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpo=
s.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_18943/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_atomic@plan=
e-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rota=
te-0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71200v4/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hf=
lip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3=
/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">=
i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotat=
e-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rot=
ate-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1=
/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i=
915#3828</a>) +1 other test skip</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate=
-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rota=
te-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/ig=
t@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915=
#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate=
-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotat=
e-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@=
kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16=
707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-dg2-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171=
200v4/shard-dg2-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotat=
e-0-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bp=
p-rotate-0-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#519=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171200v4/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-as=
ync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +11 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4=
538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs=
-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-dg2-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1=
0/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16=
707</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-c=
cs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_18943/shard-dg2-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt=
@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095=
">i915#6095</a>) +10 other tests skip</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-cc=
s.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_18943/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@=
kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-=
hdmi-a-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-=
hdmi-a-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@km=
s_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-ln=
l-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_18943/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-cc=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12805">i915#12805</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_ccs@crc-prima=
ry-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-m=
c-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_18943/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-cc=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_ccs@c=
rc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-r=
c-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@km=
s_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_cdclk@plane-scaling.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/i=
gt@kms_cdclk@plane-scaling.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v=
4/shard-dg2-10/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm=
3x4-lut1d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18943/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ct=
m3x4-lut1d.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-8/ig=
t@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915=
#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-pos=
t-ctm3x4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pos=
t-ctm3x4.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@kms_chamelium_co=
lor_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16=
471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/i=
gt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">=
i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171200v4/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i9=
15#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-dg2-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#158=
65</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_content_protection@atomic-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-7/igt@kms_conten=
t_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-hdcp14=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_content_prot=
ection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_content_protection@lic-type-1.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-rkl-6/igt@kms_content_protection@lic-type-1.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1586=
5">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171200v4/shard-rkl-3/igt@kms_content_protection@lic-type-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@kms_content_protection@mei-interface.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#=
15865</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9433">i915#9433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171200v4/shard-dg1-13/igt@kms_content_protection@mei-inte=
rface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@srm.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
3/igt@kms_content_protection@srm.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171200v4/shard-dg2-10/igt@kms_content_protection@srm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i9=
15#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cursor_crc@cursor-onsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171200v4/shard-dg2-3/igt@kms_cursor_crc@cursor-onscr=
een-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_cursor_crc@cursor-random-max-size.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg2-10/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915=
#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cursor_crc@cursor-random-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915=
#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cu=
rsor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-=
cursor-atomic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200=
v4/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cur=
sor-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor-varying-size.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/s=
hard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8943/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/130=
46">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18=
943/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/130=
46">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cu=
rsor-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legac=
y@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_cursor_legacy@shor=
t-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i91=
5#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cur=
sor-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-c=
ursor-toggle.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/ig=
t@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915=
#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-dg2-10/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
07">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171200v4/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rk=
l-3/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171200v4/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i=
915#13748</a>)</li>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-d=
g2-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915=
#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171200v4/shard-dg2-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">=
i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg=
2-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_171200v4/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-dg2-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171200v4/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@display-4x.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081"=
>i915#16081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171200v4/shard-rkl-7/igt@kms_feature_discovery@display-4x.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@vrr.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/=
igt@kms_feature_discovery@vrr.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1712=
00v4/shard-rkl-3/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
rkl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i9=
15#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171200v4/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934=
">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-rkl-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71200v4/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2=
-3/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg=
2-10/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bp=
p-4tile-upscaling.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/s=
hard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscali=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8813">i915#8813</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32b=
pp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-32bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#156=
43</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171200v4/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_flip_tiling@flip-change-tiling.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-dg2-10/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71200v4/shard-dg2-10/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-p=
ri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-render.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2=
-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16708">i915#16708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur=
-indfb-draw-pwrite.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-cur-indfb-draw-pwrite.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200=
v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw=
-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/53=
54">i915#5354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915=
#5354</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-=
cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-pr=
imscrn-cur-indfb-onoff.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@km=
s_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i9=
15#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-=
pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr=
-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@kms_fr=
ontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-rte:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171200v4/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html"=
>SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-=
pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#=
16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +16 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dr=
aw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15989">i915#15989</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@km=
s_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708<=
/a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-mmap-wc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18943/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dr=
aw-mmap-wc.html">SKIP</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171200v4/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr=
-rgb101010-draw-mmap-wc.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen=
-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc=
psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i91=
5#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen=
-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-sh=
rfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16708">i915#16708</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
cur-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i91=
5#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5=
354</a>) +14 other tests skip</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn=
-cur-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i91=
5#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171200v4/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
pri-shrfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i91=
5#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5354">i915#5354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_frontbuffer_=
tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8708">i915#8708</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-=
cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-sc=
ndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5=
354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171200v4/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +26 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-=
pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcps=
r-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#18=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171200v4/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaled=
primary.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledp=
rimary.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primsc=
rn-spr-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102=
">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_171200v4/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-p=
rimscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndsc=
rn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708"=
>i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171200v4/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-sc=
ndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri=
-shrfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p=
-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#167=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171200v4/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrf=
b-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15989">i915#15989</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p=
-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur=
-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171200v4/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
b-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur=
-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn=
-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1712=
00v4/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pr=
i-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-prim=
scrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i91=
5#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pr=
i-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354=
">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +29 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri=
-indfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-=
6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-rkl-3/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@kms_frontbuffer_tr=
acking@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb=
-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-in=
dfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-3=
/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">=
i915#15991</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn=
-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhd=
r-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16=
708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171200v4/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-=
pwrite.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pw=
rite.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-6/igt@kms_frontbuffer_trac=
king@psrhdr-rgb565-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-suspend:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-suspend.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-suspend.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">=
i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_frontbuffer_tracking@=
psrhdr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@bpc-switch.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@k=
ms_hdr@bpc-switch.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171200v4/shard-dg2-10/igt@kms_hdr@bpc-switch.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_hdr@static-toggle.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@=
kms_hdr@static-toggle.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#822=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171200v4/shard-rkl-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-6/igt@kms_hdr@static-toggle=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16518">i915#16518</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
dg2-4/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171200v4/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746=
">i915#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-dg2-10/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301"=
>i915#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171200v4/shard-dg2-3/igt@kms_panel_fitting@atomic-fastset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-x=
r24.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-dg2-10/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_pipe=
_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915=
#16707</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG-FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i=
915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171200v4/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-c=
c-modifier-source-clamping.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane@pixel-format-4-t=
iled-dg2-rc-ccs-cc-modifier-source-clamping.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4=
/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-sou=
rce-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8825">i915#8825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_plane@planar-pixel-format-settings.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16753">i9=
15#16753</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_171200v4/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16753">i915#16753</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
dg2-8/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_171200v4/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1395=
8">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-none.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-dg2-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
07">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171200v4/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-none.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
10/igt@kms_plane_multiple@tiling-y.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171200v4/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#1=
4259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-=
modifiers.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-=
modifiers.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@=
kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15=
329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-=
rotation@pipe-d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20=
-with-rotation@pipe-d.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@km=
s_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i91=
5#15329</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downs=
cale-factor-0-75.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-75.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915=
#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171200v4/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i9=
15#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171200v4/shard-rkl-3/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685=
">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#151=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171200v4/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@k=
ms_pm_lpsp@kms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl=
-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt=
@kms_pm_lpsp@kms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-d=
g1-16/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@=
kms_pm_rpm@dpms-lpsp.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms=
_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15=
073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171200v4/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/150=
73">i915#15073</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-d=
g2-10/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547">i915#3547</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/sh=
ard-dg2-10/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547">i915#3547</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/ig=
t@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-4/igt=
@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-co=
ntinuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update=
-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-=
3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520=
">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3=
/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732=
">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171200v4/shard-rkl-8/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"=
>i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-rkl-3/igt@km=
s_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#159=
49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-dg2-8/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i=
915#4235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_171200v4/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/423=
5">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg2-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#1=
2755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15867">i915#15867</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_rotation_c=
rc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-=
90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_18943/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15867">i915#15867</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4=
/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
07">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#1=
2755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15867">i915#15867</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-1/igt@kms_rotation_cr=
c@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171200v4/shard-dg2-10/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vblank@ts-continuation-modeset.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-dg2-6/igt@kms_vblank@ts-continuation-modeset.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171200v4/shard-dg2-10/igt@kms_vblank@ts-continuation-modeset.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707=
">i915#16707</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71200v4/shard-dg2-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-dpms.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@k=
ms_vrr@flip-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71200v4/shard-dg2-10/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@max-min.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_v=
rr@max-min.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4/shard-dg2-10/igt=
@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-r=
kl-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915=
#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171200v4/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i=
915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/24=
35">i915#2435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171200v4/shard-rkl-3/igt@perf@per-context-mode-unprivileged.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171200v4=
/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349=
</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@prime_vgem@basic-read.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@=
prime_vgem@basic-read.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#370=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171200v4/shard-rkl-3/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">=
i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3=
/igt@sriov_basic@bind-unbind-vf.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1712=
00v4/shard-rkl-3/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>=
)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18943 -&gt; Patchwork_171200v4</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18943: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGT_9036: 9036<br />
  Patchwork_171200v4: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anon=
git.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1093491168852360054==--
