Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6B7CD128A
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Apr 2024 03:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B917E112C9A;
	Wed, 10 Apr 2024 03:26:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BFF112C54;
 Wed, 10 Apr 2024 03:26:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/xe/display=3A_us?=
 =?utf-8?q?e_mul=5Fu32=5Fu32_for_multiplying_operands?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 10 Apr 2024 03:26:26 -0000
Message-ID: <171271958688.1318876.5967490841819228174@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410024810.1707500-1-arun.r.murthy@intel.com>
In-Reply-To: <20240410024810.1707500-1-arun.r.murthy@intel.com>
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

Series: drm/xe/display: use mul_u32_u32 for multiplying operands
URL   : https://patchwork.freedesktop.org/series/132241/
State : warning

== Summary ==

Error: dim checkpatch failed
39c1a67defad drm/xe/display: use mul_u32_u32 for multiplying operands
-:23: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#23: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:32:
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, mul_u32_u32(src_idx, XE_PAGE_SIZE),

-:52: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#52: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:170:
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, mul_u32_u32(src_idx, XE_PAGE_SIZE),

total: 0 errors, 2 warnings, 0 checks, 34 lines checked


