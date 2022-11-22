Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED7FC433FE
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Nov 2022 20:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90D410E462;
	Tue, 22 Nov 2022 20:16:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD41310E1D9;
 Tue, 22 Nov 2022 20:16:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C81A2A47DF;
 Tue, 22 Nov 2022 20:16:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: yang.yang29@zte.com.cn
Date: Tue, 22 Nov 2022 20:16:01 -0000
Message-ID: <166914816179.2185.5109822078913484222@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <202211222007593082125@zte.com.cn>
In-Reply-To: <202211222007593082125@zte.com.cn>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/gvt=3A_use_sysfs=5Fstreq=28=29_instead_of_strncmp?=
 =?utf-8?b?KCk=?=
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

Series: drm/i915/gvt: use sysfs_streq() instead of strncmp()
URL   : https://patchwork.freedesktop.org/series/111212/
State : warning

== Summary ==

Error: dim checkpatch failed
78ecf723a966 drm/i915/gvt: use sysfs_streq() instead of strncmp()
-:22: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#22: FILE: drivers/gpu/drm/i915/gvt/cmd_parser.c:921:
+	if (sysfs_streq(cmd, "srm") ||
+			sysfs_streq(cmd, "lrm")) {

-:33: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#33: FILE: drivers/gpu/drm/i915/gvt/cmd_parser.c:935:
+	if (sysfs_streq(cmd, "lrr-src") ||
+			sysfs_streq(cmd, "lrr-dst")) {

total: 0 errors, 0 warnings, 2 checks, 42 lines checked


