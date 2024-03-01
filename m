Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849D6C5475B
	for <intel-gfx@archiver.kernel.org>; Fri,  1 Mar 2024 17:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAF910E676;
	Fri,  1 Mar 2024 17:03:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1DA10E676;
 Fri,  1 Mar 2024 17:03:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Enable_Adaptive_Sync_SDP_?=
 =?utf-8?q?Support_for_DP_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 01 Mar 2024 17:03:20 -0000
Message-ID: <170931260019.436087.10330415159444448552@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable Adaptive Sync SDP Support for DP (rev15)
URL   : https://patchwork.freedesktop.org/series/126829/
State : failure

== Summary ==

Error: make failed
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/i915/display/intel_dp.o
drivers/gpu/drm/i915/display/intel_dp.c: In function ‘intel_dp_compute_as_sdp’:
drivers/gpu/drm/i915/display/intel_dp.c:2630:6: error: unused variable ‘vrefresh’ [-Werror=unused-variable]
 2630 |  int vrefresh = drm_mode_vrefresh(adjusted_mode);
      |      ^~~~~~~~
drivers/gpu/drm/i915/display/intel_dp.c:2627:26: error: unused variable ‘connector’ [-Werror=unused-variable]
 2627 |  struct intel_connector *connector = intel_dp->attached_connector;
      |                          ^~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:243: drivers/gpu/drm/i915/display/intel_dp.o] Error 1
make[5]: *** [scripts/Makefile.build:481: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:481: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:481: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:481: drivers] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:1921: .] Error 2
make: *** [Makefile:240: __sub-make] Error 2
Build failed, no error log produced


