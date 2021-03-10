Return-Path: <SRS0=3135=II=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54455C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 08:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B12464FE3
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 08:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B12464FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7FD6E9D7;
	Wed, 10 Mar 2021 08:27:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52BAC6E9D7;
 Wed, 10 Mar 2021 08:27:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4B221A66C9;
 Wed, 10 Mar 2021 08:27:10 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 10 Mar 2021 08:27:10 -0000
Message-ID: <161536483027.2311.13570076298591509943@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <cover.1615297748.git.jani.nikula@intel.com>
In-Reply-To: <cover.1615297748.git.jani.nikula@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/edid=3A_overhaul_displayid_iterator?=
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

Series: drm/edid: overhaul displayid iterator
URL   : https://patchwork.freedesktop.org/series/87802/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
3dfb9f5009ca drm/edid: make a number of functions, parameters and variables const
02e11a7ac9cc drm/displayid: add separate drm_displayid.c
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 175 lines checked
3a553321e322 drm/displayid: add new displayid section/block iterators
-:141: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#141: FILE: include/drm/drm_displayid.h:125:
+#define displayid_iter_for_each(__block, __iter) \
+	while (((__block) = __displayid_iter_next(__iter)))

total: 1 errors, 0 warnings, 0 checks, 99 lines checked
8eeaa063fba8 drm/edid: use the new displayid iterator for detailed modes
56ed12e086fa drm/edid: use the new displayid iterator for finding CEA extension
53e35494caf9 drm/edid: use the new displayid iterator for tile info


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
