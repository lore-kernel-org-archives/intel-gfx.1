Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B681CC79F99
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Sep 2026 05:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9CB10E2E5;
	Sun,  6 Sep 2026 05:52:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A33710E16C;
 Sun,  6 Sep 2026 05:52:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/dp=3A_enable_DSC?=
 =?utf-8?q?_passthrough_for_HDMI_2=2E1_PCON_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sun, 06 Sep 2026 05:52:45 -0000
Message-ID: <178867396503.126685.18024218023201774606@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260906054239.854844-1-xiaolu.xie@intel.com>
In-Reply-To: <20260906054239.854844-1-xiaolu.xie@intel.com>
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

== Series Details ==

Series: drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices
URL   : https://patchwork.freedesktop.org/series/173452/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  CC [M]  drivers/gpu/drm/i915/display/intel_dp.o
drivers/gpu/drm/i915/display/intel_dp.c: In function ‘intel_dp_dsc_compute_config’:
drivers/gpu/drm/i915/display/intel_dp.c:2418:34: error: ‘struct <anonymous>’ has no member named ‘slice_count’; did you mean ‘slice_config’?
 2418 |                 pipe_config->dsc.slice_count = pt_slice_count;
      |                                  ^~~~~~~~~~~
      |                                  slice_config
drivers/gpu/drm/i915/display/intel_dp.c: In function ‘intel_dp_pcon_passthrough_dsc_slice_count’:
drivers/gpu/drm/i915/display/intel_dp.c:4415:52: error: passing argument 1 of ‘intel_hdmi_dsc_get_num_slices’ from incompatible pointer type [-Werror=incompatible-pointer-types]
 4415 |         num_slices = intel_hdmi_dsc_get_num_slices(crtc_state,
      |                                                    ^~~~~~~~~~
      |                                                    |
      |                                                    const struct intel_crtc_state *
In file included from drivers/gpu/drm/i915/display/intel_dp.c:84:
drivers/gpu/drm/i915/display/intel_hdmi.h:60:66: note: expected ‘const struct drm_display_mode *’ but argument is of type ‘const struct intel_crtc_state *’
   60 | int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
      |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
drivers/gpu/drm/i915/display/intel_dp.c:4415:22: error: too few arguments to function ‘intel_hdmi_dsc_get_num_slices’
 4415 |         num_slices = intel_hdmi_dsc_get_num_slices(crtc_state,
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_hdmi.h:60:5: note: declared here
   60 | int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:290: drivers/gpu/drm/i915/display/intel_dp.o] Error 1
make[5]: *** [scripts/Makefile.build:551: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:551: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:551: drivers] Error 2
make[1]: *** [/home/kbuild/kernel/Makefile:2229: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


