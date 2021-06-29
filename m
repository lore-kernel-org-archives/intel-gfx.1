Return-Path: <SRS0=NZj8=LX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476A2C11F64
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 00:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF16461C72
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 00:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF16461C72
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6FF6E5B2;
	Tue, 29 Jun 2021 00:12:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FE8C6E5A3;
 Tue, 29 Jun 2021 00:12:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0694EA47E9;
 Tue, 29 Jun 2021 00:12:56 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Madhumitha Tolakanahalli Pradeep"
 <madhumitha.tolakanahalli.pradeep@intel.com>
Date: Tue, 29 Jun 2021 00:12:55 -0000
Message-ID: <162492557599.9053.11694563205682302907@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210628235054.694581-1-madhumitha.tolakanahalli.pradeep@intel.com>
In-Reply-To: <20210628235054.694581-1-madhumitha.tolakanahalli.pradeep@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/display/tgl=3A_Implement_Wa=5F14013120569?=
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

Series: drm/i915/display/tgl: Implement Wa_14013120569
URL   : https://patchwork.freedesktop.org/series/91987/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
7b3735152a04 drm/i915/display/tgl: Implement Wa_14013120569
-:20: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#20: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:6388:
+    struct drm_i915_private *dev_priv = i915;$

-:21: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#21: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:6389:
+    u32 val;$

-:67: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#67: FILE: drivers/gpu/drm/i915/display/intel_hotplug.c:302:
+			}
+			else if (connector->base.status == connector_status_disconnected) {

total: 1 errors, 2 warnings, 0 checks, 51 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
