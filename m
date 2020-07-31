Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB922C433DF
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 15:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A745821744
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 15:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A745821744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513596EAF0;
	Fri, 31 Jul 2020 15:04:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4922D6EAD2;
 Fri, 31 Jul 2020 15:04:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3A7D9A8169;
 Fri, 31 Jul 2020 15:04:08 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Fri, 31 Jul 2020 15:04:08 -0000
Message-ID: <159620784821.10473.438569190375975120@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200731144643.32364-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200731144643.32364-1-umesh.nerlige.ramappa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Allow_privileged_user_to_map_the_OA_buffer?=
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

Series: Allow privileged user to map the OA buffer
URL   : https://patchwork.freedesktop.org/series/80148/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
5b0cda02e636 drm/i915/perf: Ensure observation logic is not clock gated
c203e309db25 drm/i915/perf: Whitelist OA report trigger registers
d6cb11d40b08 drm/i915/perf: Whitelist OA counter and buffer registers
e7339aa045d6 drm/i915/perf: Map OA buffer to user space for gen12 performance query
-:142: ERROR:CODE_INDENT: code indent should use tabs where possible
#142: FILE: drivers/gpu/drm/i915/i915_perf.c:3278:
+^I^I^I^I   ^I   unsigned int cmd,$

-:142: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#142: FILE: drivers/gpu/drm/i915/i915_perf.c:3278:
+^I^I^I^I   ^I   unsigned int cmd,$

-:142: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#142: FILE: drivers/gpu/drm/i915/i915_perf.c:3278:
+static int i915_perf_oa_buffer_info_locked(struct i915_perf_stream *stream,
+				   	   unsigned int cmd,

-:323: ERROR:TRAILING_WHITESPACE: trailing whitespace
#323: FILE: include/uapi/drm/i915_drm.h:2070:
+ *   read-only mmapping is allowed. $

-:326: ERROR:TRAILING_WHITESPACE: trailing whitespace
#326: FILE: include/uapi/drm/i915_drm.h:2073:
+ *   format as specified by user config. The buffer provides reports that have $

total: 3 errors, 1 warnings, 1 checks, 225 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
