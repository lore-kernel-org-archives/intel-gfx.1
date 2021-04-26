Return-Path: <SRS0=0znn=JX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F78C433B4
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Apr 2021 18:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD2561104
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Apr 2021 18:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBD2561104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F806E210;
	Mon, 26 Apr 2021 18:48:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 11BD66E1D7;
 Mon, 26 Apr 2021 18:48:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 07409A7DFC;
 Mon, 26 Apr 2021 18:48:29 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Rettberg" <simon.rettberg@rz.uni-freiburg.de>
Date: Mon, 26 Apr 2021 18:48:29 -0000
Message-ID: <161946290902.18668.18226439085881155259@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210426161124.2b7fd708@dellnichtsogutkiste>
In-Reply-To: <20210426161124.2b7fd708@dellnichtsogutkiste>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/gt=3A_Disable_HiZ_Raw_Stall_Optimization_on_broken?=
 =?utf-8?q?_gen7?=
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

Series: drm/i915/gt: Disable HiZ Raw Stall Optimization on broken gen7
URL   : https://patchwork.freedesktop.org/series/89502/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
9afaf45bfe53 drm/i915/gt: Disable HiZ Raw Stall Optimization on broken gen7
-:14: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '520d05a77b28', maybe rebased or not pulled?
#14: 
Fixes: 520d05a77b28 ("drm/i915/gt: Clear CACHE_MODE prior to clearing residuals")

-:18: WARNING:BAD_SIGN_OFF: 'Reviewed-by:' is the preferred signature form
#18: 
Reviewed-By: Manuel Bentele <development@manuel-bentele.de>

total: 0 errors, 2 warnings, 0 checks, 11 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
