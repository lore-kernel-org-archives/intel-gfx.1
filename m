Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDC4C54E64
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Mar 2024 01:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6138610EBEC;
	Tue, 26 Mar 2024 01:00:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D649F10EBEB;
 Tue, 26 Mar 2024 00:59:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/gem=3A_Calc?=
 =?utf-8?q?ulate_object_page_offset_for_partial_memory_mapping?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 26 Mar 2024 00:59:59 -0000
Message-ID: <171141479987.1038646.1022486657517944830@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325134033.287913-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240325134033.287913-1-andi.shyti@linux.intel.com>
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

Series: drm/i915/gem: Calculate object page offset for partial memory mapping
URL   : https://patchwork.freedesktop.org/series/131582/
State : warning

== Summary ==

Error: dim checkpatch failed
54dc7dc5eb50 drm/i915/gem: Calculate object page offset for partial memory mapping
-:56: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#56: FILE: drivers/gpu/drm/i915/gem/i915_gem_mman.c:409:
+			       area->vm_start + ((vma->gtt_view.partial.offset - obj_offset) << PAGE_SHIFT),

total: 0 errors, 1 warnings, 0 checks, 71 lines checked


