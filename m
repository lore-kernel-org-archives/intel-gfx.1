Return-Path: <SRS0=Sdza=PK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512F0C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 02:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 098346112D
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 02:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 098346112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D4B6E546;
	Fri, 22 Oct 2021 02:47:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C91F26E546;
 Fri, 22 Oct 2021 02:47:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B8F6EA363C;
 Fri, 22 Oct 2021 02:47:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 22 Oct 2021 02:47:51 -0000
Message-ID: <163487087172.14704.13903122644807163393@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211021230409.938844-1-oak.zeng@intel.com>
In-Reply-To: <20211021230409.938844-1-oak.zeng@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/selftests=3A_print_exact_error_code?=
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

Series: drm/i915/selftests: print exact error code
URL   : https://patchwork.freedesktop.org/series/96159/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
2995fc2faf1e drm/i915/selftests: print exact error code
-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c:94:
+			pr_err("Failed to populated %d contexts with error %d\n",
+				nctx, err);

total: 0 errors, 0 warnings, 1 checks, 15 lines checked


