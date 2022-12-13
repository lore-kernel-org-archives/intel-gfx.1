Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B803C4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Dec 2022 09:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE3C10E2F2;
	Tue, 13 Dec 2022 09:56:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2C8810E2F2;
 Tue, 13 Dec 2022 09:55:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6B27DA7E03;
 Tue, 13 Dec 2022 09:55:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Date: Tue, 13 Dec 2022 09:55:59 -0000
Message-ID: <167092535940.25538.5924934636084824297@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20221207173630.973662-1-andrzej.hajda@intel.com>
In-Reply-To: <20221207173630.973662-1-andrzej.hajda@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkRPQ1M6IHdhcm5pbmcgZm9yIHNl?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/i915=3A_fix_TLB_invalidation_f?=
 =?utf-8?q?or_Gen12=2E50_video_and_compute_engines_=28rev3=29?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] drm/i915: fix TLB invalidation for Gen12.50 video and compute engines (rev3)
URL   : https://patchwork.freedesktop.org/series/111744/
State : warning

== Summary ==

Error: make htmldocs had i915 warnings
./drivers/gpu/drm/i915/display/intel_dsb.c:201: warning: Excess function parameter 'crtc_state' description in 'intel_dsb_reg_write'
./drivers/gpu/drm/i915/display/intel_dsb.c:201: warning: Function parameter or member 'dsb' not described in 'intel_dsb_reg_write'
./drivers/gpu/drm/i915/display/intel_dsb.c:201: warning: Excess function parameter 'crtc_state' description in 'intel_dsb_reg_write'


