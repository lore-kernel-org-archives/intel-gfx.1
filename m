Return-Path: <SRS0=K65z=IY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8DFC433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 21:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D824F61974
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 21:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D824F61974
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599CE6F48C;
	Fri, 26 Mar 2021 21:03:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E27C6F489;
 Fri, 26 Mar 2021 21:03:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DB826A01BB;
 Fri, 26 Mar 2021 21:03:54 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lyude Paul" <lyude@redhat.com>
Date: Fri, 26 Mar 2021 21:03:54 -0000
Message-ID: <161679263486.10687.9743406129459929194@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210326203807.105754-1-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-1-lyude@redhat.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm=3A_Use_new_DRM_printk_funcs_=28like_drm=5Fdbg=5F*=28=29?=
 =?utf-8?q?=29_in_DP_helpers_=28rev3=29?=
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm: Use new DRM printk funcs (like drm_dbg_*()) in DP helpers (rev3)
URL   : https://patchwork.freedesktop.org/series/87242/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
0fa59ff4dbac drm/dp: Fixup kernel docs for struct drm_dp_aux
e5b211145259 drm/tegra: Don't register DP AUX channels before connectors
7c88b7808d84 drm/bridge/cdns-mhdp8546: Register DP aux channel with userspace
2dfefec80949 drm/nouveau/kms/nv50-: Move AUX adapter reg to connector late register/early unregister
58c50c356f92 drm/dp: Add backpointer to drm_device in drm_dp_aux
5e2e0bdc1f63 drm/dp: Clarify DP AUX registration time
618c5f0980b8 drm/print: Fixup DRM_DEBUG_KMS_RATELIMITED()
ecff1efa6edc drm/dp: Pass drm_dp_aux to drm_dp_link_train_clock_recovery_delay()
ee690943af24 drm/dp: Pass drm_dp_aux to drm_dp*_link_train_channel_eq_delay()
c8f171451ef2 drm/dp: Always print aux channel name in logs
1ac2bba3323f drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_detect()
5b5f15710623 drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_set_tmds_output()
a0a55d6c24d3 drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_max_tmds_clock()
511100ab2bac drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_get_tmds_output()
305de2390da1 drm/dp_dual_mode: Pass drm_device to drm_lspcon_(get|set)_mode()
e6c68efe1df9 drm/dp_mst: Pass drm_dp_mst_topology_mgr to drm_dp_get_vc_payload_bw()
-:56: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#56: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:74:
+									       crtc_state->port_clock,

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
fb3e3ab3dd3a drm/dp: Convert drm_dp_helper.c to using drm_err/drm_dbg_*()
c3615ff14e87 drm/dp_dual_mode: Convert drm_dp_dual_mode_helper.c to using drm_err/drm_dbg_kms()
edbf4e8c8f9c drm/dp_mst: Drop DRM_ERROR() on kzalloc() fail in drm_dp_mst_handle_up_req()
1aeac5ad99e3 drm/dp_mst: Convert drm_dp_mst_topology.c to drm_err()/drm_dbg*()


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
