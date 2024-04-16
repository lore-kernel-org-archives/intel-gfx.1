Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBE6C4345F
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Apr 2024 12:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA643112C1D;
	Tue, 16 Apr 2024 12:19:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DFA112C1D;
 Tue, 16 Apr 2024 12:19:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Add_support_for_part?=
 =?utf-8?q?ial_mapping_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 16 Apr 2024 12:19:10 -0000
Message-ID: <171326995089.1443400.10649069040065046911@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412004808.288130-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240412004808.288130-1-andi.shyti@linux.intel.com>
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

Series: Add support for partial mapping (rev7)
URL   : https://patchwork.freedesktop.org/series/131817/
State : warning

== Summary ==

Error: dim checkpatch failed
46a97a93cbcf drm/i915/gem: Increment vma offset when mapping fb objects
840915d2ed48 drm/i915/gem: Do not look for the exact address in node
fb4ef24830b4 drm/i915/gem: Calculate object page offset for partial memory mapping
-:67: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#67: FILE: drivers/gpu/drm/i915/gem/i915_gem_mman.c:411:
+			       area->vm_start + ((vma->gtt_view.partial.offset - obj_offset) << PAGE_SHIFT),

total: 0 errors, 1 warnings, 0 checks, 82 lines checked


