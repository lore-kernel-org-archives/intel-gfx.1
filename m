Return-Path: <SRS0=vghI=FG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B42C64E90
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Dec 2020 00:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C32E20679
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Dec 2020 00:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C32E20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28146E996;
	Wed,  2 Dec 2020 00:18:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E51AF6E993;
 Wed,  2 Dec 2020 00:18:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DD033A0009;
 Wed,  2 Dec 2020 00:18:57 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Huang, Sean Z" <sean.z.huang@intel.com>
Date: Wed, 02 Dec 2020 00:18:57 -0000
Message-ID: <160686833788.4089.1593509706058939436@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201201235747.26017-1-sean.z.huang@intel.com>
In-Reply-To: <20201201235747.26017-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Introduce_Intel_PXP_component_=28rev3=29?=
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

Series: Introduce Intel PXP component (rev3)
URL   : https://patchwork.freedesktop.org/series/84136/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
9a5d8af908af drm/i915/pxp: Introduce Intel PXP component
-:108: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#108: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 125 lines checked
e76458295026 drm/i915/pxp: Enable PXP irq worker and callback stub
207c2ab536f6 drm/i915/pxp: Add PXP context for logical hardware states.
-:106: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#106: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 165 lines checked
502781bb247f drm/i915/pxp: set KCR reg init during the boot time
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 102 lines checked
a92dc1eecb57 drm/i915/pxp: Implement ioctl action to set the user space context
-:109: WARNING:PREFER_PACKED: __packed is preferred over __attribute__((packed))
#109: FILE: drivers/gpu/drm/i915/pxp/intel_pxp.h:40:
+} __attribute__((packed));

total: 0 errors, 1 warnings, 0 checks, 147 lines checked
82c8c6ffcfde drm/i915/pxp: Add PXP-related registers into allowlist
40dfea10f6eb drm/i915/pxp: Read register to check hardware session state
-:19: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#19: FILE: drivers/gpu/drm/i915/pxp/intel_pxp.h:15:
+#define pxp_session_list(i915, session_type) (((session_type) == SESSION_TYPE_TYPE0) ? \
+	&(i915)->pxp.ctx->active_pxp_type0_sessions : &(i915)->pxp.ctx->active_pxp_type1_sessions)

total: 0 errors, 0 warnings, 1 checks, 255 lines checked
3d2a9b3fe991 drm/i915/pxp: Implement funcs to get/set PXP tag
de1fa18ac54d drm/i915/pxp: Implement ioctl action to reserve session slot
82abf04c1c90 drm/i915/pxp: Implement ioctl action to set session in play
fec46c3feb3a drm/i915/pxp: Func to send hardware session termination
a186a1cf0606 drm/i915/pxp: Implement ioctl action to terminate the session
dcd6babb3ad0 drm/i915/pxp: Enable ioctl action to query PXP tag
52f58641d883 drm/i915/pxp: Destroy all type0 sessions upon teardown
d3ba4faedc76 drm/i915/pxp: Termiante the session upon app crash
10673f769fdf drm/i915/pxp: Enable PXP power management
-:67: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#67: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 142 lines checked
7bcd0a050a79 drm/i915/pxp: Implement funcs to create the TEE channel
-:87: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#87: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 244 lines checked
87ae0e821c19 drm/i915/pxp: Implement ioctl action to send TEE commands
e94ca0a06781 drm/i915/pxp: Create the arbitrary session after boot
238e0ba78e55 drm/i915/pxp: Add i915 trace logs for PXP operations
-:11: WARNING:TYPO_SPELLING: 'trun' may be misspelled - perhaps 'turn'?
#11: 
To trun on this feature, we need to set

-:29: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#29: FILE: drivers/gpu/drm/i915/i915_trace.h:1038:
+	    TP_STRUCT__entry(

-:36: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#36: FILE: drivers/gpu/drm/i915/i915_trace.h:1045:
+	    TP_fast_assign(

total: 0 errors, 1 warnings, 2 checks, 80 lines checked
58c13fd7fa7e drm/i915/pxp: Expose session state for display protection flip
9234896f9459 mei: pxp: export pavp client to me client bus
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 277 lines checked
6ab0923220aa drm/i915/uapi: introduce drm_i915_gem_create_ext
-:12: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Joonas Lahtinen joonas.lahtinen@linux.intel.com'
#12: 
Cc: Joonas Lahtinen joonas.lahtinen@linux.intel.com

-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Matthew Auld matthew.auld@intel.com'
#13: 
Cc: Matthew Auld matthew.auld@intel.com

-:46: ERROR:CODE_INDENT: code indent should use tabs where possible
#46: FILE: drivers/gpu/drm/i915/i915_gem.c:265:
+        struct drm_i915_private *i915;$

-:46: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#46: FILE: drivers/gpu/drm/i915/i915_gem.c:265:
+        struct drm_i915_private *i915;$

-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/i915/i915_gem.c:269:
+static int __create_setparam(struct drm_i915_gem_object_param *args,
+							struct create_ext *ext_data)

-:95: CHECK:LINE_SPACING: Please don't use multiple blank lines
#95: FILE: drivers/gpu/drm/i915/i915_gem.c:317:
+
+

-:107: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#107: FILE: include/uapi/drm/i915_drm.h:394:
+#define DRM_IOCTL_I915_GEM_CREATE_EXT   DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE, struct drm_i915_gem_create_ext)

-:155: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#155: FILE: include/uapi/drm/i915_drm.h:1735:
+#define I915_OBJECT_PARAM  (1ull<<32)
                                 ^

total: 3 errors, 2 warnings, 3 checks, 136 lines checked
8dce7e4a0d14 drm/i915/pxp: User interface for Protected buffer
c628ce58ddad drm/i915/pxp: Add plane decryption support
2ad13facf755 drm/i915/pxp: Enable the PXP ioctl for protected session
-:9: WARNING:TYPO_SPELLING: 'destory' may be misspelled - perhaps 'destroy'?
#9: 
destory the protected session via this ioctl.

-:100: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#100: FILE: include/uapi/drm/i915_drm.h:427:
+#define DRM_IOCTL_I915_PXP_OPS		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_PXP_OPS, struct drm_i915_pxp_ops)

total: 0 errors, 2 warnings, 0 checks, 154 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
