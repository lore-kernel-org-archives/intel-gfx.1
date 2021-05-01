Return-Path: <SRS0=9yl+=J4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB115C433ED
	for <intel-gfx@archiver.kernel.org>; Sat,  1 May 2021 06:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FEC6121D
	for <intel-gfx@archiver.kernel.org>; Sat,  1 May 2021 06:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FEC6121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2512F6F8A1;
	Sat,  1 May 2021 06:56:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA146F89F;
 Sat,  1 May 2021 06:56:24 +0000 (UTC)
IronPort-SDR: eA/cbPPRM3sKQ3GUve7pQQnv5ApNOQ8PKnOVipCF5ST9Q6W2U2kkweJR7Yep3Ty5l0YBCpKNYg
 DreEqNM0xHWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="197003038"
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="197003038"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 23:56:22 -0700
IronPort-SDR: iISgZrEM8tXwt1gfsgqditnkkFTdoqYx1XwRNOPohiNz/ulOQE6KO8aqavxxQuH9TN5a+hBdvC
 PjisaWCbvKFw==
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="467135876"
Received: from rong2-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.36.10])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 23:56:22 -0700
Date: Fri, 30 Apr 2021 23:56:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20210501065621.72pronn43ruwd6ex@ldmartin-desk2>
References: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
 <20210429091254.855248-3-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429091254.855248-3-tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915/debugfs: Expose read mask in
 i915_wa_registers
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 10:12:50AM +0100, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>In order to stop conflating the validation via readback with the
>workaround mask I need to expose the read mask separately so
>gem_workarounds IGT can continue operating correctly.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/i915_debugfs.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
>index 8dd374691102..b9c81376a413 100644
>--- a/drivers/gpu/drm/i915/i915_debugfs.c
>+++ b/drivers/gpu/drm/i915/i915_debugfs.c
>@@ -757,9 +757,9 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
> 			   engine->name, count);
>
> 		for (wa = wal->list; count--; wa++)
>-			seq_printf(m, "0x%X: 0x%08X, mask: 0x%08X\n",
>+			seq_printf(m, "0x%X: 0x%08X, mask: 0x%08X, read: 0x%08X\n",
> 				   i915_mmio_reg_offset(wa->reg),
>-				   wa->set, wa->clr);
>+				   wa->set, wa->clr, wa->read);
>
> 		seq_printf(m, "\n");
> 	}
>-- 
>2.30.2
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
