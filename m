Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3B3C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 11:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E55DA61205
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 11:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E55DA61205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910466EA10;
	Thu, 21 Oct 2021 11:01:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81B516EA9F;
 Thu, 21 Oct 2021 11:01:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 79A6CA00FD;
 Thu, 21 Oct 2021 11:01:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 21 Oct 2021 11:01:28 -0000
Message-ID: <163481408846.20178.5562995246131377346@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkRPQ1M6IHdhcm5pbmcgZm9yIHNl?=
 =?utf-8?q?ries_starting_with_=5B01/28=5D_drm/i915=3A_Fix_i915=5Frequest_f?=
 =?utf-8?q?ence_wait_semantics?=
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

Series: series starting with [01/28] drm/i915: Fix i915_request fence wait semantics
URL   : https://patchwork.freedesktop.org/series/96115/
State : warning

== Summary ==

$ make htmldocs 2>&1 > /dev/null | grep i915
./drivers/gpu/drm/i915/i915_gem_evict.c:110: warning: Function parameter or member 'ww' not described in 'i915_gem_evict_something'
./drivers/gpu/drm/i915/i915_gem_evict.c:281: warning: Function parameter or member 'ww' not described in 'i915_gem_evict_for_node'
./drivers/gpu/drm/i915/i915_gem_evict.c:393: warning: Function parameter or member 'ww' not described in 'i915_gem_evict_vm'
./drivers/gpu/drm/i915/i915_gem_gtt.c:100: warning: Function parameter or member 'ww' not described in 'i915_gem_gtt_reserve'
./drivers/gpu/drm/i915/i915_gem_gtt.c:192: warning: Function parameter or member 'ww' not described in 'i915_gem_gtt_insert'


