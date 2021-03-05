Return-Path: <SRS0=4j6q=ID=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B196DC433E0
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Mar 2021 16:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB136508B
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Mar 2021 16:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB136508B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49EC6E1B4;
	Fri,  5 Mar 2021 16:22:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AB106E1B4;
 Fri,  5 Mar 2021 16:22:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 43B43A73C9;
 Fri,  5 Mar 2021 16:22:25 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Fri, 05 Mar 2021 16:22:25 -0000
Message-ID: <161496134525.8411.2632249198201432423@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210305153610.12177-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210305153610.12177-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_More_SAGV_related_fixes/cleanups?=
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

Series: drm/i915: More SAGV related fixes/cleanups
URL   : https://patchwork.freedesktop.org/series/87699/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
5c14f9d5eac8 drm/i915: Fix enabled_planes bitmask
ebc6a3e5fe6d drm/i915: Tighten SAGV constraint for pre-tgl
6316c8608f20 drm/i915: Check SAGV wm min_ddb_alloc rather than plane_res_b
dca8ca1685be drm/i915: Calculate min_ddb_alloc for trans_wm
0531f5094e07 drm/i915: Extract skl_check_wm_level() and skl_check_nv12_wm_level()
42e654ae9c91 drm/i915: s/plane_res_b/blocks/ etc.
-:385: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#385: FILE: drivers/gpu/drm/i915/intel_pm.c:5955:
+				    enast(old_wm->sagv.trans_wm.ignore_lines), old_wm->sagv.trans_wm.lines,

-:396: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#396: FILE: drivers/gpu/drm/i915/intel_pm.c:5966:
+				    enast(new_wm->sagv.trans_wm.ignore_lines), new_wm->sagv.trans_wm.lines);

total: 0 errors, 2 warnings, 0 checks, 402 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
