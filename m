Return-Path: <SRS0=nd+/=JY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16FEC433ED
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 23:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C5F0610FC
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 23:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C5F0610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ECE6EA3A;
	Tue, 27 Apr 2021 23:55:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A40E6EA3A;
 Tue, 27 Apr 2021 23:55:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 41272A363D;
 Tue, 27 Apr 2021 23:55:56 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Tue, 27 Apr 2021 23:55:56 -0000
Message-ID: <161956775623.17486.2337275518518328948@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210427215339.47191-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20210427215339.47191-1-umesh.nerlige.ramappa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkRPQ1M6IHdhcm5pbmcgZm9yIEFk?=
 =?utf-8?q?d_support_for_querying_engine_cycles?=
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

Series: Add support for querying engine cycles
URL   : https://patchwork.freedesktop.org/series/89561/
State : warning

== Summary ==

$ make htmldocs 2>&1 > /dev/null | grep i915
./include/uapi/drm/i915_drm.h:2234: warning: Incorrect use of kernel-doc format:          * Query Command Streamer timestamp register.
./include/uapi/drm/i915_drm.h:2420: warning: Incorrect use of kernel-doc format:          * Command streamer cycles as read from the command streamer
./include/uapi/drm/i915_drm.h:2429: warning: Incorrect use of kernel-doc format:          * CPU timestamps in ns. cpu_timestamp[0] is captured before reading the
./include/uapi/drm/i915_drm.h:2437: warning: Incorrect use of kernel-doc format:          * Reference clock id for CPU timestamp. For definition, see
./include/uapi/drm/i915_drm.h:2446: warning: Function parameter or member 'engine' not described in 'drm_i915_query_cs_cycles'
./include/uapi/drm/i915_drm.h:2446: warning: Function parameter or member 'flags' not described in 'drm_i915_query_cs_cycles'
./include/uapi/drm/i915_drm.h:2446: warning: Function parameter or member 'cs_cycles' not described in 'drm_i915_query_cs_cycles'
./include/uapi/drm/i915_drm.h:2446: warning: Function parameter or member 'cs_frequency' not described in 'drm_i915_query_cs_cycles'
./include/uapi/drm/i915_drm.h:2446: warning: Function parameter or member 'cpu_timestamp' not described in 'drm_i915_query_cs_cycles'
./include/uapi/drm/i915_drm.h:2446: warning: Function parameter or member 'clockid' not described in 'drm_i915_query_cs_cycles'
./include/uapi/drm/i915_drm.h:2446: warning: Function parameter or member 'rsvd' not described in 'drm_i915_query_cs_cycles'


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
