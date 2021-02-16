Return-Path: <SRS0=t69m=HT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0311DC433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 11:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8291364E02
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Feb 2021 11:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8291364E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83EC6E4C5;
	Wed, 17 Feb 2021 11:25:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705876E993;
 Tue, 16 Feb 2021 21:30:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F211264D99;
 Tue, 16 Feb 2021 21:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613511031;
 bh=uwBWkNHGck9kFBqA0+H8/eT9Jc5XAGfEFx3Kba3gL4k=;
 h=From:To:Cc:Subject:Date:From;
 b=Ru/chHN9ndSQZRU6kcPNpf0W0XEdZm3ESkkB7+Rme8xma3/EdjnB48g/YGdMRuH26
 j41sevdpq56S6D1FcUiqUe587rJeGLNYIRpBkq4hqxMWjaE9Nl1B+l8gqbJf5Dbv0Y
 X5Cf2Gi7bJ+i1AgZ8b3eEwH9ubV/XjpHQMoCQLmsGilr1moNIaV1RqMOQ9aL356hxi
 0pjTYRxkZjXDSEi9ko3Lp3vor5250L1ucr7rx9ykXonMGZ3PI+0x62A99qUdTQ2rmA
 ypMWNh9Rtv/fIIaqI0hdt3a5ykleMBdQDvnHOFA1H0amz8tCtnF0fJldfMnmomP8oI
 qIzSMOFmaTXVw==
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue, 16 Feb 2021 14:29:54 -0700
Message-Id: <20210216212953.24458-1-nathan@kernel.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Wed, 17 Feb 2021 11:25:35 +0000
Subject: [Intel-gfx] [PATCH] drm/i915: Enable -Wuninitialized
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
Cc: Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

-Wunintialized was disabled in commit c5627461490e ("drm/i915: Disable
-Wuninitialized") because there were two warnings that were false
positives. The first was due to DECLARE_WAIT_QUEUE_HEAD_ONSTACK, which
was fixed in LLVM 9.0.0. The second was in busywait_stop, which was
fixed in LLVM 10.0.0 (issue 415). The kernel's minimum version for LLVM
is 10.0.1 so this warning can be safely enabled, where it has already
caught a couple bugs.

Link: https://github.com/ClangBuiltLinux/linux/issues/220
Link: https://github.com/ClangBuiltLinux/linux/issues/415
Link: https://github.com/ClangBuiltLinux/linux/issues/499
Link: https://github.com/llvm/llvm-project/commit/2e040398f8d691cc378c1abb098824ff49f3f28f
Link: https://github.com/llvm/llvm-project/commit/c667cdc850c2aa821ffeedbc08c24bc985c59edd
Fixes: c5627461490e ("drm/i915: Disable -Wuninitialized")
References: 2ea4a7ba9bf6 ("drm/i915/gt: Avoid uninitialized use of rpcurupei in frequency_show")
References: 2034c2129bc4 ("drm/i915/display: Ensure that ret is always initialized in icl_combo_phy_verify_state")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/i915/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 6d9e81ea67f4..60b60204004f 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -21,7 +21,6 @@ subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
 subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
 subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
-subdir-ccflags-y += $(call cc-disable-warning, uninitialized)
 subdir-ccflags-y += $(call cc-disable-warning, frame-address)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 

base-commit: f40ddce88593482919761f74910f42f4b84c004b
-- 
2.30.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
