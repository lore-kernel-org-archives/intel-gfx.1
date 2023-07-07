Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97415EB64D9
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Jul 2023 16:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACDE10E03F;
	Fri,  7 Jul 2023 16:00:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DE7210E03F;
 Fri,  7 Jul 2023 16:00:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F1924A0078;
 Fri,  7 Jul 2023 16:00:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Fri, 07 Jul 2023 16:00:45 -0000
Message-ID: <168874564595.14758.7869851154596379455@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_fdinfo_memory_stats_=28rev4=29?=
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

Series: fdinfo memory stats (rev4)
URL   : https://patchwork.freedesktop.org/series/119082/
State : warning

== Summary ==

Error: dim checkpatch failed
74f7de01301b drm/i915: Add ability for tracking buffer objects per client
6edf495b8d56 drm/i915: Record which client owns a VM
8b5016e3c255 drm/i915: Track page table backing store usage
287b4b723d0e drm/i915: Account ring buffer and context state storage
edb9d2dc6dcb drm/i915: Implement fdinfo memory stats printing
-:88: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#88: FILE: drivers/gpu/drm/i915/i915_drm_client.c:107:
+	idr_for_each_entry (&file->object_idr, obj, id)

total: 0 errors, 1 warnings, 0 checks, 97 lines checked


