Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7DBE77188
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Jan 2025 15:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA25310F111;
	Fri, 10 Jan 2025 15:41:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BA710F110;
 Fri, 10 Jan 2025 15:41:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_treewide=3A_const_qu?=
 =?utf-8?q?alify_ctl=5Ftables_where_applicable_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Granados" <joel.granados@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 10 Jan 2025 15:41:03 -0000
Message-ID: <173652366306.1994997.10396543175013851173@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
In-Reply-To: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
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

Series: treewide: const qualify ctl_tables where applicable (rev2)
URL   : https://patchwork.freedesktop.org/series/143332/
State : warning

== Summary ==

Error: dim checkpatch failed
cbf4e96c8900 treewide: const qualify ctl_tables where applicable
-:27: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#27: 
    identifier table_name != {watchdog_hardlockup_sysctl,iwcm_ctl_table,ucma_ctl_table,memory_allocation_profiling_sysctls,loadpin_sysctl_table};

-:424: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#424: FILE: drivers/misc/sgi-xp/xpc_main.c:114:
 };
+static const struct ctl_table xpc_sys_xpc[] = {

-:1204: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#1204: FILE: kernel/stackleak.c:47:
 }
+static const struct ctl_table stackleak_sysctls[] = {

total: 0 errors, 1 warnings, 2 checks, 920 lines checked


