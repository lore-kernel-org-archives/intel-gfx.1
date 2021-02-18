Return-Path: <SRS0=Vblo=HU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E544C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Feb 2021 06:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6C264E3E
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Feb 2021 06:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC6C264E3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134AC6E2B8;
	Thu, 18 Feb 2021 06:40:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFECC6E23B;
 Thu, 18 Feb 2021 06:40:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AFE81A47EA;
 Thu, 18 Feb 2021 06:40:17 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lee Shawn C" <shawn.c.lee@intel.com>
Date: Thu, 18 Feb 2021 06:40:17 -0000
Message-ID: <161363041768.23764.13055405272439905080@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210201150228.10001-1-shawn.c.lee@intel.com>
In-Reply-To: <20210201150228.10001-1-shawn.c.lee@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/vbt=3A_update_DP_max_link_rate_table_=28rev4=29?=
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

Series: drm/i915/vbt: update DP max link rate table (rev4)
URL   : https://patchwork.freedesktop.org/series/86539/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
3d1daa4bfb5d drm/i915/vbt: update DP max link rate table
-:94: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#94: FILE: drivers/gpu/drm/i915/display/intel_bios.c:1926:
+			info->dp_max_link_rate = parse_bdb_230_dp_max_link_rate(child->dp_max_link_rate);

-:96: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#96: FILE: drivers/gpu/drm/i915/display/intel_bios.c:1928:
+			info->dp_max_link_rate = parse_bdb_216_dp_max_link_rate(child->dp_max_link_rate);

total: 0 errors, 2 warnings, 0 checks, 105 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
