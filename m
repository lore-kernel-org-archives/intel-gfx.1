Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49BEC27C77
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Jun 2024 15:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7DE10E07E;
	Tue, 11 Jun 2024 15:24:05 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FC710E07E;
 Tue, 11 Jun 2024 15:24:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Promote_GuC_ABI_head?=
 =?utf-8?q?ers_to_shared_location?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 11 Jun 2024 15:24:02 -0000
Message-ID: <171811944241.67160.5779472917425779143@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611143008.1900-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240611143008.1900-1-michal.wajdeczko@intel.com>
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

Series: Promote GuC ABI headers to shared location
URL   : https://patchwork.freedesktop.org/series/134723/
State : warning

== Summary ==

Error: dim checkpatch failed
daf8e761d0ce drm/xe/guc: Promote GuC ABI headers to shared location
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
rename from drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h

total: 0 errors, 1 warnings, 0 checks, 39 lines checked
d20f8e8a1e64 Documentation/gpu: Separate GuC ABI section
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
44557f659c18 Documentation/gpu: Switch to shared GuC ABI definitions
4d74c7194dcc drm/intel/guc: Update CTB communication ABI
173158d609ed drm/intel/guc: Add new KLV definitions
3786bf54d5e5 drm/i915: Use shared GuC ABI definitions
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
d2152c7632d4 drm/xe: Promote SR-IOV GuC ABI definitions to shared location
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
rename from drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


