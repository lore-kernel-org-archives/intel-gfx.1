Return-Path: <SRS0=r3jS=N6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA12C433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 10:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED90760F70
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 10:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED90760F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE8D6E17E;
	Wed,  8 Sep 2021 10:32:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 317BF6E0A6;
 Wed,  8 Sep 2021 10:32:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 29D70A7DFC;
 Wed,  8 Sep 2021 10:32:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 08 Sep 2021 10:32:03 -0000
Message-ID: <163109712316.22224.3720104125068705462@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210908091544.13772-1-animesh.manna@intel.com>
In-Reply-To: <20210908091544.13772-1-animesh.manna@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Panel_replay_phase1_implementation?=
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

Series: Panel replay phase1 implementation
URL   : https://patchwork.freedesktop.org/series/94470/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
c7704eae2ab0 drm/i915/panelreplay: update plane selective fetch register definition
-:8: WARNING:TYPO_SPELLING: 'difinition' may be misspelled - perhaps 'definition'?
#8: 
so updated the plane selective fetch register difinition accordingly.
                                              ^^^^^^^^^^

-:78: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#78: FILE: drivers/gpu/drm/i915/i915_reg.h:7494:
+#define PLANE_SEL_FETCH_CTL(dev_priv, pipe, plane) _MMIO(_SEL_FETCH_PLANE_BASE(dev_priv, pipe, plane) + \

-:87: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/i915_reg.h:7500:
+#define PLANE_SEL_FETCH_POS(dev_priv, pipe, plane) _MMIO(_SEL_FETCH_PLANE_BASE(dev_priv, pipe, plane) + \

-:95: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#95: FILE: drivers/gpu/drm/i915/i915_reg.h:7505:
+#define PLANE_SEL_FETCH_SIZE(dev_priv, pipe, plane) _MMIO(_SEL_FETCH_PLANE_BASE(dev_priv, pipe, plane) + \

-:103: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#103: FILE: drivers/gpu/drm/i915/i915_reg.h:7510:
+#define PLANE_SEL_FETCH_OFFSET(dev_priv, pipe, plane) _MMIO(_SEL_FETCH_PLANE_BASE(dev_priv, pipe, plane) + \

total: 0 errors, 5 warnings, 0 checks, 85 lines checked
03948896e7b6 drm/i915/panelreplay: Feature flag added for panel replay
7d7858afd7c3 drm/i915/panelreplay: Initializaton and compute config for panel replay
9432d1630bf8 drm/i915/panelreplay: enable/disable panel replay
959cdcb164d3 drm/i915/panelreplay: Added state checker for panel replay state


