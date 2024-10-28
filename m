Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD18D33990
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Oct 2024 15:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2876610E4F8;
	Mon, 28 Oct 2024 15:39:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743F410E120;
 Mon, 28 Oct 2024 15:39:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/xe=3A_Fix_races_?=
 =?utf-8?q?on_fdinfo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 28 Oct 2024 15:39:45 -0000
Message-ID: <173012998547.1355414.14155017002878472175@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241026062658.28060-1-lucas.demarchi@intel.com>
In-Reply-To: <20241026062658.28060-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix races on fdinfo
URL   : https://patchwork.freedesktop.org/series/140538/
State : warning

== Summary ==

Error: dim checkpatch failed
be111ababfbe drm/xe: Add trace to lrc timestamp update
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:87: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#87: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:24:
+	    TP_STRUCT__entry(

-:95: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#95: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:32:
+	    TP_fast_assign(

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:113: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#113: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:50:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 7 checks, 82 lines checked
d88c0ee83457 drm/xe: Accumulate exec queue timestamp on destroy
8a635cead973 drm/xe: Stop accumulating LRC timestamp on job_free


