Return-Path: <SRS0=5qC0=PQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691DFC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Oct 2021 21:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30487610A4
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Oct 2021 21:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30487610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA446E82D;
	Thu, 28 Oct 2021 21:13:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B98996E82D;
 Thu, 28 Oct 2021 21:13:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B611BA7525;
 Thu, 28 Oct 2021 21:13:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 28 Oct 2021 21:13:05 -0000
Message-ID: <163545558574.4339.12886343551704670493@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211028173518.9107-1-jani.nikula@intel.com>
In-Reply-To: <20211028173518.9107-1-jani.nikula@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv2=2C1/6=5D_drm/i915/audio=3A_group?=
 =?utf-8?q?_audio_under_anonymous_struct_in_drm=5Fi915=5Fprivate?=
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

Series: series starting with [v2,1/6] drm/i915/audio: group audio under anonymous struct in drm_i915_private
URL   : https://patchwork.freedesktop.org/series/96399/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
99ae5429914a drm/i915/audio: group audio under anonymous struct in drm_i915_private
a782cd9b4623 drm/i915/audio: name the audio sub-struct in drm_i915_private
-:322: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "audio.lpe.platdev"
#322: FILE: drivers/gpu/drm/i915/display/intel_audio.c:1371:
+	if ((dev_priv)->audio.lpe.platdev != NULL)

-:335: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "audio.lpe.platdev"
#335: FILE: drivers/gpu/drm/i915/display/intel_lpe_audio.c:77:
+#define HAS_LPE_AUDIO(dev_priv) ((dev_priv)->audio.lpe.platdev != NULL)

-:344: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#344: FILE: drivers/gpu/drm/i915/display/intel_lpe_audio.c:99:
+	rsc[0].start    = rsc[0].end = dev_priv->audio.lpe.irq;

total: 0 errors, 0 warnings, 3 checks, 438 lines checked
54360d96b9b3 drm/i915/audio: define the audio struct separately from drm_i915_private
b8d059680c73 drm/i915/audio: move intel_audio_funcs internal to intel_audio.c
cb77ff6f4e63 drm/i915/audio: clean up LPE audio init/cleanup calls
d4f0b49238d0 drm/i915/audio: rename intel_init_audio_hooks to intel_audio_hooks_init


