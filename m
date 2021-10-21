Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3949C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 05:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA08D60241
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 05:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA08D60241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AE789C08;
	Thu, 21 Oct 2021 05:32:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DBCB689C08;
 Thu, 21 Oct 2021 05:32:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CFDEDA73C9;
 Thu, 21 Oct 2021 05:32:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 21 Oct 2021 05:32:29 -0000
Message-ID: <163479434982.20179.6247238999765072257@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211021050713.836498-1-khaled.almahallawy@intel.com>
In-Reply-To: <20211021050713.836498-1-khaled.almahallawy@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/dp=3A_Use_DP2=2E0_DPCD_248h_updated_register/field_name?=
 =?utf-8?q?s_for_DP_PHY_CTS?=
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

Series: drm/dp: Use DP2.0 DPCD 248h updated register/field names for DP PHY CTS
URL   : https://patchwork.freedesktop.org/series/96096/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
2bdec9c1bda4 drm/dp: Rename DPCD 248h according to DP 2.0 specs
-:9: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#9: 
DPCD 248h name was changed from “PHY_TEST_PATTERN” in DP 1.4 to “LINK_QUAL_PATTERN_SELECT” in DP 2.0.

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
801e4b2d5433 drm/i915/dp: Use DP 2.0 LINK_QUAL_PATTERN_* Phy test pattern definitions
-:7: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
Update selected phy test pattern names to use the new names/definitions of DPCD 248h in DP2.0/drm_dp_helpers.h

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
d394b46305e2 drm/amd/dc: Use DPCD 248h DP 2.0 new name
0e23aeb9be77 drm/msm/dp: Use DPCD 248h DP 2.0 new names/definitions
-:6: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#6: 
Use DP 2.0 DPCD 248h new name (LINK_QUAL_PATTERN_SELECT) and rename selected phy test patterns to LINK_QUAL_PATTERN_*

-:113: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#113: FILE: drivers/gpu/drm/msm/dp/dp_link.c:578:
+	rlen = drm_dp_dpcd_readb(link->aux, DP_LINK_QUAL_PATTERN_SELECT,
 					&data);

total: 0 errors, 1 warnings, 1 checks, 101 lines checked


