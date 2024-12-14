Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41C1E7717F
	for <intel-gfx@archiver.kernel.org>; Sat, 14 Dec 2024 01:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8483510E25D;
	Sat, 14 Dec 2024 01:31:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6594210E25D;
 Sat, 14 Dec 2024 01:31:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915=3A_Async_fl?=
 =?utf-8?q?ip_+_compression=2C_and_some_plane_cleanups_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 14 Dec 2024 01:31:36 -0000
Message-ID: <173413989640.2339509.3277641631980662230@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202141424.21446-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241202141424.21446-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Async flip + compression, and some plane cleanups (rev5)
URL   : https://patchwork.freedesktop.org/series/139807/
State : warning

== Summary ==

Error: dim checkpatch failed
d1e7d484a028 drm/i915: Allow async flips with render compression on TGL+
c976ae5a3b51 drm/i915: Allow async flips with compression on ICL
6fd228278d97 drm/i915: Introduce plane->can_async_flip()
4ad54e1bff11 drm/i915: Use plane->can_async_flip() for alignment exceptions
4165ece4cbde drm/i915: Reuse vlv_primary_min_alignment() for sprites as well
bc74ac0f21db drm/i915: Disable scanout VT-d workaround for TGL+
a63c460e2ea4 drm/i915: Nuke ADL pre-production Wa_22011186057
3a017fc262b0 drm/i915: Relocate xe AUX hack
-:48: WARNING:IS_ENABLED_CONFIG: IS_ENABLED(I915) is normally used as IS_ENABLED(CONFIG_I915)
#48: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2778:
+	if (!IS_ENABLED(I915) && !HAS_FLAT_CCS(dev_priv))

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
1b2932651f78 drm/i915: Carve up skl_get_plane_caps()


