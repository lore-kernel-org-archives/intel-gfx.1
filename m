Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDC6C54E67
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Mar 2024 07:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F20D11234B;
	Thu, 28 Mar 2024 07:57:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAA411234B;
 Thu, 28 Mar 2024 07:57:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/gem=3A_Repl?=
 =?utf-8?q?ace_dev=5Fpriv_with_i915?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 28 Mar 2024 07:57:13 -0000
Message-ID: <171161263325.1061727.15890230861449299523@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328071833.664001-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240328071833.664001-1-andi.shyti@linux.intel.com>
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

Series: drm/i915/gem: Replace dev_priv with i915
URL   : https://patchwork.freedesktop.org/series/131736/
State : warning

== Summary ==

Error: dim checkpatch failed
377e6b1d48e2 drm/i915/gem: Replace dev_priv with i915
-:38: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#38: FILE: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2467:
+			get_random_u32_below(i915->engine_uabi_class_count[I915_ENGINE_CLASS_VIDEO]);

total: 0 errors, 1 warnings, 0 checks, 173 lines checked


