Return-Path: <SRS0=4MRd=OT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C303C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 18:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0117D613A6
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 18:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0117D613A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451C26EAD2;
	Wed, 29 Sep 2021 18:43:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A466A6EAD1;
 Wed, 29 Sep 2021 18:43:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 919EEA0BCB;
 Wed, 29 Sep 2021 18:43:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 29 Sep 2021 18:43:49 -0000
Message-ID: <163294102956.27097.1292571394590062547@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
In-Reply-To: <20210929183357.1490204-1-lucas.demarchi@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Rename_IS=5FACTIVE=28=29_and_move_to_kconfig=2Eh?=
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

Series: Rename IS_ACTIVE() and move to kconfig.h
URL   : https://patchwork.freedesktop.org/series/95229/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
700a1ad38302 drm/i915: rename IS_ACTIVE
74e2f2ef0ee5 drm/i915/utils: do not depend on config being defined
-:29: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#29: 
  52021    1070     232   53323    d04b drivers/gpu/drm/i915/gem/i915_gem_context.o.new

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'config' - possible side-effects?
#51: FILE: drivers/gpu/drm/i915/i915_utils.h:473:
+#define IS_CONFIG_NONZERO(config) (						\
+	(__stringify_1(config)[0] > '0' && __stringify_1(config)[0] < '9') ||	\
+	__stringify_1(config)[0] == '-'						\
+)

total: 0 errors, 1 warnings, 1 checks, 17 lines checked
c3464f46082b Move IS_CONFIG_NONZERO() to kconfig.h
-:11: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#11: 
babaab2f4738 ("drm/i915: Encapsulate kconfig constant values inside boolean predicates")

-:85: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'config' - possible side-effects?
#85: FILE: include/linux/kconfig.h:82:
+#define IS_CONFIG_NONZERO(config) (						\
+	(__stringify_1(config)[0] > '0' && __stringify_1(config)[0] < '9') ||	\
+	__stringify_1(config)[0] == '-'						\
+)

total: 0 errors, 1 warnings, 1 checks, 59 lines checked


