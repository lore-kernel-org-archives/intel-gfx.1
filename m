Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975A9CED25F
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Oct 2024 03:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C6E10E0C0;
	Tue,  8 Oct 2024 03:43:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F86910E0C0;
 Tue,  8 Oct 2024 03:43:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/dg2=3A_enab?=
 =?utf-8?q?le_G8_with_a_workaround?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 08 Oct 2024 03:43:25 -0000
Message-ID: <172835900504.1201522.7664917440227917884@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007122424.642796-1-raag.jadav@intel.com>
In-Reply-To: <20241007122424.642796-1-raag.jadav@intel.com>
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

Series: drm/i915/dg2: enable G8 with a workaround
URL   : https://patchwork.freedesktop.org/series/139628/
State : warning

== Summary ==

Error: dim checkpatch failed
3502ee93c20a drm/i915/dg2: enable G8 with a workaround
-:52: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#52: FILE: drivers/gpu/drm/i915/gt/intel_workarounds.c:1792:
+#define DG2_G8_WA_RANGE_1		0x56A0 ... 0x56AF

-:53: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#53: FILE: drivers/gpu/drm/i915/gt/intel_workarounds.c:1793:
+#define DG2_G8_WA_RANGE_2		0x56B0 ... 0x56B9

total: 2 errors, 0 warnings, 0 checks, 70 lines checked


