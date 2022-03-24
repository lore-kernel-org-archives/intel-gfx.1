Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012C8C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Mar 2022 08:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B46C10E866;
	Thu, 24 Mar 2022 08:49:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CFCC10E865;
 Thu, 24 Mar 2022 08:49:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0A166AAA91;
 Thu, 24 Mar 2022 08:49:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Date: Thu, 24 Mar 2022 08:49:28 -0000
Message-ID: <164811176800.18591.5258423966014873326@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220324074300.21294-1-animesh.manna@intel.com>
In-Reply-To: <20220324074300.21294-1-animesh.manna@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/dsb=3A_modified_to_drm=5Finfo_in_dsb=5Fprepare=28?=
 =?utf-8?q?=29?=
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

Series: drm/i915/dsb: modified to drm_info in dsb_prepare()
URL   : https://patchwork.freedesktop.org/series/101723/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
d7c0e5b3bf10 drm/i915/dsb: modified to drm_info in dsb_prepare()
-:28: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#28: FILE: drivers/gpu/drm/i915/display/intel_dsb.c:278:
 	if (!dsb) {
+		drm_info(&i915->drm, "DSB object creation failed\n");

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


