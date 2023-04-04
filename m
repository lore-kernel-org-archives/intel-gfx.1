Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B00AC76188
	for <intel-gfx@archiver.kernel.org>; Tue,  4 Apr 2023 23:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6884510E061;
	Tue,  4 Apr 2023 23:13:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E24E910E061;
 Tue,  4 Apr 2023 23:13:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4EBB4AADDD;
 Tue,  4 Apr 2023 23:13:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 04 Apr 2023 23:13:18 -0000
Message-ID: <168064999828.18898.13571635050110586170@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/ttm=3A_Small_fixes_/_cleanups_in_prep_for_shrinking_=28?=
 =?utf-8?q?rev3=29?=
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

Series: drm/ttm: Small fixes / cleanups in prep for shrinking (rev3)
URL   : https://patchwork.freedesktop.org/series/114774/
State : warning

== Summary ==

Error: dim checkpatch failed
20b987c8b612 drm/ttm/pool: Fix ttm_pool_alloc error path
48e572a2078c drm/ttm: Reduce the number of used allocation orders for TTM pages
-:38: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#38: FILE: drivers/gpu/drm/ttm/ttm_pool.c:53:
+#define TTM_DIM_ORDER (__TTM_DIM_ORDER <= MAX_ORDER ? __TTM_DIM_ORDER : MAX_ORDER)

total: 0 errors, 1 warnings, 0 checks, 91 lines checked
ae0dffefba8a drm/ttm: Make the call to ttm_tt_populate() interruptible when faulting


