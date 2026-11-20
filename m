Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A10606A320
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Nov 2026 05:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909A310F0EA;
	Fri, 20 Nov 2026 05:44:01 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D57F10F0EA;
 Fri, 20 Nov 2026 05:44:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/dp=3A_Add_suppor?=
 =?utf-8?q?t_for_the_DP_symbol_based_timing_generator_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 20 Nov 2026 05:44:00 -0000
Message-ID: <179515344063.56921.10937045967900207342@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120-vlk-64036-dp-symbol-tg-v5-0-bf8f78b32709@intel.com>
In-Reply-To: <20261120-vlk-64036-dp-symbol-tg-v5-0-bf8f78b32709@intel.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/dp: Add support for the DP symbol based timing generator (rev5)
URL   : https://patchwork.freedesktop.org/series/177002/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/177002/revisions/5/mbox/ not applied
Applying: drm/i915/dp: Factor out the DSC slice count and link bpp lookup
Applying: drm/i915/display: Add the DP link layer symbol timing generator registers
Applying: drm/i915/display: Add the DP symbol timing generator crtc state
Applying: drm/i915/display: Add HAS_DP_SYMBOL_TG()
Applying: drm/dp: Add the DPCD definitions of the Rx minimum Hblank
Applying: drm/i915/dp: Compute the DP symbol based timing generator parameters
Applying: drm/i915/display: Program the DP symbol based timing generator
error: invalid object 100644 7caf5bee8718729667376b487b0584b47891f05a for 'drivers/gpu/drm/i915/display/intel_display.c'
error: Repository lacks necessary blobs to fall back on 3-way merge.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0007 drm/i915/display: Program the DP symbol based timing generator
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


