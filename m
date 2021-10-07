Return-Path: <SRS0=q0LQ=O3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65D8C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 23:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86CDB6135E
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 23:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86CDB6135E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018236E44D;
	Thu,  7 Oct 2021 23:29:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D31346E044;
 Thu,  7 Oct 2021 23:29:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CA6C2A47DF;
 Thu,  7 Oct 2021 23:29:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 07 Oct 2021 23:29:57 -0000
Message-ID: <163364939778.5186.17957848708740316194@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211007225547.30997-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20211007225547.30997-1-umesh.nerlige.ramappa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkRPQ1M6IHdhcm5pbmcgZm9yIHNl?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/i915/pmu=3A_Add_a_name_to_the_?=
 =?utf-8?q?execlists_stats?=
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

Series: series starting with [1/2] drm/i915/pmu: Add a name to the execlists stats
URL   : https://patchwork.freedesktop.org/series/95586/
State : warning

== Summary ==

$ make htmldocs 2>&1 > /dev/null | grep i915
./drivers/gpu/drm/i915/gt/uc/intel_guc.h:167: warning: Function parameter or member 'timestamp' not described in 'intel_guc'


