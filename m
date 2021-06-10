Return-Path: <SRS0=5Iya=LE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC17C47094
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 06:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A58386141D
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 06:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A58386141D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2490A6E479;
	Thu, 10 Jun 2021 06:24:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF056E479
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Jun 2021 06:24:26 +0000 (UTC)
IronPort-SDR: cHLbE+9ABXVYMO/tKyDYhW1YnxpOdV5NgCEzKdKZDjazL/EOcz8cSMgSS5b7KfMe2OYSSHNTss
 iebBCkvpi3OQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203386520"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="203386520"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 23:24:06 -0700
IronPort-SDR: bCwnXb9/LtUNMIZZ4PAv47IkeNPQWt58JMfZRmyw99reD4FIeqv9zZb/EcHmfI2v81YGXTDbFj
 MfDw7DmJ/H+g==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="477216768"
Received: from lfbrown-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.4.44])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 23:24:05 -0700
Date: Wed, 9 Jun 2021 23:24:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20210610062404.4vdwkdebvfsms2ti@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210604190128.24151-1-anusha.srivatsa@intel.com>
 <20210604190128.24151-4-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604190128.24151-4-anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [CI 3/4] drm/i915/adl_p: Pipe B DMC Support
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 12:01:27PM -0700, Anusha Srivatsa wrote:
>ADLP requires us to load both Pipe A and Pipe B.
>Plug Pipe B loading support.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 ++
> drivers/gpu/drm/i915/display/intel_dmc.h             | 1 +
> 2 files changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>index 2a1c39a0e56e..db38891a9ef0 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>@@ -546,6 +546,8 @@ static int i915_dmc_info(struct seq_file *m, void *unused)
> 	seq_printf(m, "path: %s\n", dmc->fw_path);
> 	seq_printf(m, "Pipe A fw support: %s\n", yesno(INTEL_GEN(dev_priv) >= 12));
> 	seq_printf(m, "Pipe A fw loaded: %s\n", yesno(dmc->dmc_info[DMC_FW_PIPEA].payload));
>+	seq_printf(m, "Pipe B fw support: %s\n", yesno(IS_ALDERLAKE_P(dev_priv)));

this is smelling lots of updates down the road :(. Anyway,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

but this depends on the previous patch being changed.


Lucas De Marchi


>+	seq_printf(m, "Pipe B fw loaded: %s\n", yesno(dmc->dmc_info[DMC_FW_PIPEB].payload));
>
> 	if (!intel_dmc_has_payload(dev_priv))
> 		goto out;
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc.h b/drivers/gpu/drm/i915/display/intel_dmc.h
>index 007a284b0ef0..c3c00ff03869 100644
>--- a/drivers/gpu/drm/i915/display/intel_dmc.h
>+++ b/drivers/gpu/drm/i915/display/intel_dmc.h
>@@ -19,6 +19,7 @@ struct drm_i915_private;
> enum {
> 	DMC_FW_MAIN = 0,
> 	DMC_FW_PIPEA,
>+	DMC_FW_PIPEB,
> 	DMC_FW_MAX
> };
>
>-- 
>2.25.0
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
