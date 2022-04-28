Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB51C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Apr 2022 00:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7202210E0A4;
	Thu, 28 Apr 2022 00:42:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 163BA10E098;
 Thu, 28 Apr 2022 00:42:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1572BA7DFB;
 Thu, 28 Apr 2022 00:42:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 28 Apr 2022 00:42:24 -0000
Message-ID: <165110654408.29090.1011988323113311668@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220427230747.906625-1-matthew.d.roper@intel.com>
In-Reply-To: <20220427230747.906625-1-matthew.d.roper@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_i915=3A_SSEU_handling_updates_=28rev2=29?=
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

Series: i915: SSEU handling updates (rev2)
URL   : https://patchwork.freedesktop.org/series/103244/
State : warning

== Summary ==

Error: dim checkpatch failed
721ef81dbce9 drm/i915/sseu: Don't try to store EU mask internally in UAPI format
91b82b1f6352 drm/i915/xehp: Drop GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK
b1d7cb90b2f3 drm/i915/xehp: Use separate sseu init function
24f87a81e92f drm/i915/sseu: Simplify gen11+ SSEU handling
0a3eeddf1db0 drm/i915/sseu: Disassociate internal subslice mask representation from uapi
-:485: WARNING:NEW_TYPEDEFS: do not add new typedefs
#485: FILE: drivers/gpu/drm/i915/gt/intel_sseu.h:62:
+typedef struct {

total: 0 errors, 1 warnings, 0 checks, 690 lines checked


