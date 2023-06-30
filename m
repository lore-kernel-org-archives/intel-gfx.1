Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A62EEB64DA
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Jun 2023 21:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E05810E4F7;
	Fri, 30 Jun 2023 21:02:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C888310E4F5;
 Fri, 30 Jun 2023 21:02:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 73B09AADE8;
 Fri, 30 Jun 2023 21:02:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 30 Jun 2023 21:02:02 -0000
Message-ID: <168815892243.24875.11815669391358422609@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230630203509.1635216-1-lucas.demarchi@intel.com>
In-Reply-To: <20230630203509.1635216-1-lucas.demarchi@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Fix_ctx_workarounds_for_non-masked_regs_=28rev3=29?=
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

Series: Fix ctx workarounds for non-masked regs (rev3)
URL   : https://patchwork.freedesktop.org/series/119826/
State : warning

== Summary ==

Error: dim checkpatch failed
f9ace84612b8 drm/i915/gt: Move wal_get_fw_for_rmw()
98981921388c drm/i915/gt: Clear all bits from GEN12_FF_MODE2
eb7d4114d6aa drm/i915/gt: Fix context workarounds with non-masked regs
8f8c8e52b8f1 drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL workaround
37b65fa3e839 drm/i915/gt: Enable read back on XEHP_FF_MODE2
f51f5bbbc763 drm/i915/gt: Remove bogus comment on IVB_FBC_RT_BASE_UPPER
9ed2964f40d6 drm/i915/gt: Also check set bits in clr_set()
-:6: WARNING:TYPO_SPELLING: 'succesfully' may be misspelled - perhaps 'successfully'?
#6: 
When checking if the workarounds were applied succesfully, the read-back
                                              ^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


