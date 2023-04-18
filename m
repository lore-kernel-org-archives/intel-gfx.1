Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2248FC6FD18
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Apr 2023 22:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CB010E1D5;
	Tue, 18 Apr 2023 22:54:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B41AF10E1D5;
 Tue, 18 Apr 2023 22:54:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A8153AADD5;
 Tue, 18 Apr 2023 22:54:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Date: Tue, 18 Apr 2023 22:54:41 -0000
Message-ID: <168185848165.17887.16172957481597266311@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230418220446.2205509-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20230418220446.2205509-1-radhakrishna.sripada@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_More_MTL_WA_and_powerwell_patches_=28rev3=29?=
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

Series: More MTL WA and powerwell patches (rev3)
URL   : https://patchwork.freedesktop.org/series/115292/
State : warning

== Summary ==

Error: dim checkpatch failed
92386c5cacda drm/i915: Use separate "DC off" power well for ADL-P and DG2
-:68: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#68: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1413:
+I915_DECL_PW_DOMAINS(xehpd_pwdoms_dc_off,
+	XELPD_PW_2_POWER_DOMAINS,

-:79: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#79: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1424:
+		.instances = &I915_PW_INSTANCES(

total: 0 errors, 0 warnings, 2 checks, 71 lines checked
0d43dceba295 drm/i915/mtl: Re-use ADL-P's "DC off" power well
88fc548d256c drm/i915/mtl: Extend Wa_22011802037 to MTL A-step
37ef7912f5a3 drm/i915/mtl: WA to clear RDOP clock gating


