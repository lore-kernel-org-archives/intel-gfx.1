Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A124C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 12:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCB32310E
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 12:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BCB32310E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5541F6E2C0;
	Tue, 19 Jan 2021 12:33:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59CF46E243;
 Tue, 19 Jan 2021 12:33:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 50145A7DFC;
 Tue, 19 Jan 2021 12:33:39 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Tue, 19 Jan 2021 12:33:39 -0000
Message-ID: <161105961929.4867.13555490864173639147@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210119074320.28768-1-sean.z.huang@intel.com>
In-Reply-To: <20210119074320.28768-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Introduce_Intel_PXP_component_-_Mesa_single_session_=28rev2?=
 =?utf-8?q?3=29?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Introduce Intel PXP component - Mesa single session (rev23)
URL   : https://patchwork.freedesktop.org/series/84620/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
ca9c47130ec2 drm/i915/pxp: Introduce Intel PXP component
-:123: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#123: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 193 lines checked
187fcb952b02 drm/i915/pxp: set KCR reg init during the boot time
bdb7c62200bd drm/i915/pxp: Implement funcs to create the TEE channel
-:89: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#89: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 245 lines checked
ad259427e624 drm/i915/pxp: Create the arbitrary session after boot
-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 271 lines checked
59fdff6af707 drm/i915/pxp: Func to send hardware session termination
-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 188 lines checked
fa19c26fe841 drm/i915/pxp: Enable PXP irq worker and callback stub
b3ff2db1b43a drm/i915/pxp: Destroy arb session upon teardown
34248533ecd5 drm/i915/pxp: Enable PXP power management
-:78: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#78: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 148 lines checked
e9e96872b7b3 drm/i915/pxp: Expose session state for display protection flip
339c726f3313 mei: pxp: export pavp client to me client bus
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 277 lines checked
bce23b9235c4 drm/i915/uapi: introduce drm_i915_gem_create_ext
-:109: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#109: FILE: include/uapi/drm/i915_drm.h:395:
+#define DRM_IOCTL_I915_GEM_CREATE_EXT   DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE, struct drm_i915_gem_create_ext)

total: 0 errors, 1 warnings, 0 checks, 135 lines checked
35f7c19a2c16 drm/i915/pxp: User interface for Protected buffer
9df9f88c8a7b drm/i915/pxp: Add plane decryption support


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
